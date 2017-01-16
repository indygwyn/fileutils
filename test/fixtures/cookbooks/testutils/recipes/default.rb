user 'u1'
group 'g1'

# hard set mode bits

directory '/u01/make/sub/directories/last' do
  recursive true
end
file '/u01/make/sub/directories/last/leaf' do
end
fileutils '/u01/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode 0555
  file_mode 0640
end

# Set mode bits using +/- mode settings

directory '/u02/make/sub/directories/last' do
  recursive true
end
file '/u02/make/sub/directories/last/leaf' do
  mode 0755
end
fileutils '/u02/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode 'g+w'
  file_mode 'u-w'
end

# Set using a file filter

# Set following symlink
directory '/u03/make/sub/directories/last' do
  recursive true
end
directory '/u04'
link '/u03/make/sub/directories/u04' do
  to '/u04'
end
file '/u03/make/sub/directories/last/leaf' do
end
fileutils '/u03/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode 'g+w'
  file_mode 'o-w'
  follow_symlink true
end

# Set and do not follow symlink
directory '/u05/make/sub/directories/last' do
  recursive true
end
directory '/u06'
link '/u05/make/sub/directories/u06' do
  to '/u06'
end
file '/u05/make/sub/directories/last/leaf' do
end
fileutils '/u05/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode 'g+w'
  file_mode 'o-w'
  follow_symlink false
end

# Set mode using an array of +/- settings
# Set mode only on files
directory '/u07/make/sub/directories/last' do
  recursive true
end
file '/u07/make/sub/directories/last/leaf' do
  mode 0755
end
fileutils '/u07/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode ['g+w', 'u-r']
  file_mode ['u-w', 'go-r']
  only_files true
end

# Set mode only on directories
directory '/u08/make/sub/directories/last' do
  recursive true
end
file '/u08/make/sub/directories/last/leaf' do
  mode 0755
end
fileutils '/u08/make/sub' do
  group 'g1'
  owner 'u1'
  directory_mode ['g+w', 'ou-rx']
  file_mode 'o-w'
  only_directories true
end

# delete a directory tree

directory '/ud1/make/sub/directories/last' do
  recursive true
end
directory '/ud16'
link '/ud1/make/sub/directories/d16' do
  to '/ud16'
end
file '/ud1/make/sub/directories/last/leaf' do
end
fileutils '/ud1/make/sub' do
  action :delete
end

# delete only files

directory '/ud2/make/sub/directories/last' do
  recursive true
end
file '/ud2/make/sub/directories/last/leaf'
file '/ud2/make/sub/directories/last/leaf1'
file '/ud2/make/sub/directories/last/leaf2'
file '/ud2/make/sub/directories/leaf3'
fileutils '/ud2/make/sub' do
  action :delete
  only_files true
  force true
end
