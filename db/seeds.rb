
User.all.each do |u|
	u.groups.clear
end

User.destroy_all
Group.destroy_all
Photo.destroy_all



users = User.create! [
	{username: 'patate', password: 'qwe123'},
	{username: 'doja123', password: '123123'},
	{username: 'tomnjerry', password: '234wer'}
]

Profile.create! [
	{firstname: 'Iris', lastname: 'Wang',bio: 'hello world', user_id: users[0].id },
	{firstname: 'Coco', lastname: 'Chanel',bio: 'im a singer', user_id: users[1].id },
	{firstname: 'Tom', lastname: 'TheCat',bio: 'i like cartoons', user_id: users[2].id }
]

groups = Group.create! [
	{name: 'shoes' },
	{name: 'vintage' },
	{name: 'food'},
	{name: 'hiphop'},
	{name: 'crafts'},
	{name: 'fashion'},
	{name: 'travel'}
]
users[0].groups = [groups[0]]
users[1].groups = [groups[1],groups[2],groups[6]]
users[2].groups = [groups[0],groups[2], groups[3],groups[4],groups[5]]


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
	{description: 'going to italy wish me luck'},
	{description: 'going back to china actually'}
]

cmt = Photo.find_by title: 'image3'
cmt.comments.create! [
	{description: 'im out of school'},
	{description: 'i wanna go back to school'},
	{description: 'i wanna graduate on time'}
]
