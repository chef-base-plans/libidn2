title 'Tests to confirm libidn2 binary works as expected'

base_dir = input("base_dir", value: "bin")
plan_origin = ENV['HAB_ORIGIN']
plan_name = input("plan_name", value: "libidn2")
plan_ident = "#{plan_origin}/#{plan_name}"

control 'core-plans-libidn2' do
  impact 1.0
  title 'Ensure libidn2 binary is working as expected'
  desc '
  We first check that the idn2 binary we expect is present and then run version checks on both to verify that it is excecutable.
  '

  hab_pkg_path = command("hab pkg path #{plan_ident}")
  describe hab_pkg_path do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end

  target_dir = File.join(hab_pkg_path.stdout.strip, base_dir)

  idn2_exists = command("ls #{File.join(target_dir, "idn2")}")
  describe idn2_exists do
    its('stdout') { should match /libidn2/ }
    its('stderr') { should be_empty }
    its('exit_status') { should eq 0 }
  end

  idn2_works = command("#{File.join(target_dir, "idn2")} --version")
  describe idn2_works do
    its('stdout') { should match /idn2 \(libidn2\) [0-9]+.[0-9]+.[0-9]+/ }
    its('stderr') { should be_empty }
    its('exit_status') { should eq 0 }
  end
end
