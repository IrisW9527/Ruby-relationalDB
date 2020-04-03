# GroupUser.destroy_all

User.all.each do |u|
	u.groups.clear
end

User.destroy_all
Group.destroy_all
Photo.destroy_all



users = User.create! [
	{username: 'patate', password: 'qwe123'},
	{username: 'doja123', password: '123123'},
	{username: 'dogandcat', password: '234wer'}
]

Profile.create! [
	{firstname: 'iris', lastname: 'wang',bio: 'hello world', user_id: users[0].id },
	{firstname: 'coco', lastname: 'chanel',bio: 'im a singer', user_id: users[1].id },
	{firstname: 'tom', lastname: 'jerry',bio: 'i like cartoons', user_id: users[2].id }
]

groups = Group.create! [
	{name: 'shoes' },
	{name: 'vintage' },
	{name: 'skincare'},
	{name: 'hiphop'},
	{name: 'crafts'},
	{name: 'fashion'},
	{name: 'travel'}
]
users[0].groups = [groups[0],groups[4]]
users[1].groups = [groups[1]]
users[2].groups = [groups[2], groups[3],groups[4],groups[5]]


Photo.create! [
	{title: 'image1', image: 'placeholder1', user_id: users[0].id},
	{title: 'image2', image: 'placeholder2', user_id: users[1].id},
	{title: 'image3', image: 'placeholder3', user_id: users[2].id}
]


cmt = Photo.find_by title: 'image1'
cmt.comments.create! [
	{description: 'all covid19 mistakes'}
]

cmt = Photo.find_by title: 'image2'
cmt.comments.create! [
	{description: 'going to italy wish me luck'}
]

cmt = Photo.find_by title: 'image3'
cmt.comments.create! [
	{description: 'im out of school'}
]
