Statistic.delete_all
Link.delete_all
User.delete_all
puts("Elementos borrados")

user1 = User.create(email:"testuno@mail.com", username:"testuno", password:"asdfg")
user2 = User.create(email:"testdos@mail.com", username:"testdos", password:"asdfg")
user3 = User.create(email:"testvacio@mail.com", username:"testvacio", password:"asdfg")

linkunoreg = Link.create(name:"LinkUnoReg", url:"https://www.facebook.com/", type:"Regular", user_id:user1.id)
linkunopriv = Link.create(name:"LinkUnoPriv", rl:"https://www.facebook.com/", type:"Private", user_id:user1.id, password:"asdfg123!")
linkunotemp = Link.create(name:"LinkUnoTemp", url:"https://www.facebook.com/", type:"Temporal", user_id:user1.id, expires_at: DateTime.now+10)
linkunoephem = Link.create(name:"LinkUnoEphem", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id)
linkunoephemInact = Link.create(name:"LinkUnoEphemInactivo", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id, remaining_accesses: 0)

linkdosreg = Link.create(name:"LinkDosReg", url:"https://www.facebook.com/", type:"Regular", user_id:user2.id)
linkdospriv = Link.create(name:"LinkDosPriv", url:"https://www.facebook.com/", type:"Private", user_id:user2.id, password:"asdfg123!")
linkdostemp = Link.create(name:"LinkDosTemp", url:"https://www.facebook.com/", type:"Temporal", user_id:user2.id, expires_at: DateTime.now+10)
linkdosephem = Link.create(name:"LinkDosEphem", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id, remaining_accesses: 2)
linkdosephemInact = Link.create(name:"LinkDosEphemInactivo", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id, remaining_accesses: 0)

Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-5, ip_address: "227.0.0.2")
Statistic.create(link_id: linkunoreg.id, date: DateTime.now-5, ip_address: "227.0.0.2")
puts("Elementos creados")