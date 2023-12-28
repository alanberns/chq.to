Statistic.delete_all
Link.delete_all
User.delete_all
puts("Elementos borrados")

user1 = User.create(email:"testuno@mail.com", username:"testuno", password:"asdfg")
user2 = User.create(email:"testdos@mail.com", username:"testdos", password:"asdfg")
user3 = User.create(email:"testvacio@mail.com", username:"testvacio", password:"asdfg")

linkunoreg = Link.create(name:"LinkUnoReg", url:"https://www.facebook.com/", type:"Regular", user_id:user1.id)

Link.create([{name:"LinkUnoPriv", url:"https://www.facebook.com/", type:"Private", user_id:user1.id, password:"asdfg123!"},
        {name:"LinkUnoTemp", url:"https://www.facebook.com/", type:"Temporal", user_id:user1.id, expires_at: DateTime.now+10},
        {name:"LinkUnoEphem", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id},
        {name:"LinkUnoEphemInactivo", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user1.id, remaining_accesses: 0},

        {name:"LinkDosReg", url:"https://www.facebook.com/", type:"Regular", user_id:user2.id},
        {name:"LinkDosPriv", url:"https://www.facebook.com/", type:"Private", user_id:user2.id, password:"asdfg123!"},
        {name:"LinkDosTemp", url:"https://www.facebook.com/", type:"Temporal", user_id:user2.id, expires_at: DateTime.now+10},
        {name:"LinkDosEphem", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id},
        {name:"LinkDosEphemInactivo", url:"https://www.facebook.com/", type:"Ephemeral", user_id:user2.id, remaining_accesses: 0}
])

Statistic.create([{link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1"},
            {link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1"},
            {link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1"},
            {link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1"},
            {link_id: linkunoreg.id, date: DateTime.now, ip_address: "127.0.0.1"},
            {link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2"},
            {link_id: linkunoreg.id, date: DateTime.now-10, ip_address: "127.0.0.2"},
            {link_id: linkunoreg.id, date: DateTime.now-5, ip_address: "227.0.0.2"},
            {link_id: linkunoreg.id, date: DateTime.now-5, ip_address: "227.0.0.2"}])
puts("Elementos creados")