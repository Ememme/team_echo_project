Town.destroy_all
DenounceType.destroy_all

Town.create(name: "Poznań")
DenounceType.create(gid: 1, value: 10, gid_desc: 'Display @anonim')
DenounceType.create(gid: 2, value: 30, gid_desc: 'Display nick')
DenounceType.create(gid: 3, value: 50, gid_desc: 'Display full name')
