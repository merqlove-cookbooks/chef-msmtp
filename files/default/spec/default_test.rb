describe_recipe 'msmtp:default' do
  it 'installs msmtp' do
    package("msmtp").must_be_installed
  end

  it 'should create msmtprc' do
    file("/etc/msmtprc").must_exist.with(:owner, "root").and(:group, "mail").and(:mode, 0640)
  end
end
