Statistic.delete_all
Link.delete_all
User.delete_all
puts("Elementos borrados")

user1 = User.create(email:"testuno@mail.com", username:"testuno", password:"asdfg")
user2 = User.create(email:"testdos@mail.com", username:"testdos", password:"asdfg")
user3 = User.create(email:"testvacio@mail.com", username:"testvacio", password:"asdfg")

linkunoreg = Link.create(name:"LinkUnoReg", slug:"aaaaaaaa", url:"https://www.facebook.com/", type:"Regular", user_id:user1.id)
linkunopriv = Link.create(name:"LinkUnoPriv", slug:"bbbbbbb", url:"https://www.facebook.com/", type:"Private", user_id:user1.id, password:"asdfg")
linkunotemp = Link.create(name:"LinkUnoTemp", slug:"cccccccc", url:"https://www.facebook.com/", type:"Temporal", user_id:user1.id, expires_at: DateTime.now+10)
linkunoephem = Link.create(name:"LinkUnoEphem", slug:"eeeeeeee", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id, remaining_accesses: 2)
linkunoephemInact = Link.create(name:"LinkUnoEphemInactivo", slug:"ffffffff", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id, remaining_accesses: 0)

linkdosreg = Link.create(name:"LinkDosReg", slug:"gggggggg", url:"https://www.facebook.com/", type:"Regular", user_id:user2.id)
linkdospriv = Link.create(name:"LinkDosPriv", slug:"hhhhhhhh", url:"https://www.facebook.com/", type:"Private", user_id:user2.id, password:"asdfg")
linkdostemp = Link.create(name:"LinkDosTemp", slug:"iiiiiiii", url:"https://www.facebook.com/", type:"Temporal", user_id:user2.id, expires_at: DateTime.now+10)
linkdosephem = Link.create(name:"LinkDosEphem", slug:"kkkkkkkk", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id, remaining_accesses: 2)
linkdosephemInact = Link.create(name:"LinkDosEphemInactivo", slug:"llllllll", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id, remaining_accesses: 0)

Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2")
puts("Elementos creados")