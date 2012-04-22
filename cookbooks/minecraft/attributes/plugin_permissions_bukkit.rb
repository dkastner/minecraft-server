default.minecraft.plugins.permissions_bukkit.version = '1.6'

default.minecraft.plugins.permissions_bukkit['groups'] = {
  'default' => { 
    'permissions' => {
      'permissions.build' => false,
      #essentials
      'essentials.spawn' => true,
      'essentials.rules' => true,
      'essentials.motd' => true,
      'essentials.list' => true,
      'essentials.helpop' => true,
      'essentials.help' => true,
    }
  },
  'builder' => {
    'permissions' => {
      'permissions.build' => true,

      'essentials.afk' => true,
      'essentials.back' => true,
      'essentials.back.ondeath' => true,
      'essentials.balance' => true,
      'essentials.balance.others' => true,
      'essentials.balancetop' => true,
      'essentials.chat.color' => true,
      'essentials.chat.shout' => true,
      'essentials.chat.question' => true,
      'essentials.compass' => true,
      'essentials.depth' => true,
      'essentials.home' => true,
      'essentials.ignore' => true,
      'essentials.kit' => true,
      'essentials.kit.tools' => true,
      'essentials.mail' => true,
      'essentials.mail.send' => true,
      'essentials.me' => true,
      'essentials.msg' => true,
      'essentials.nick' => true,
      'essentials.pay' => true,
      'essentials.ping' => true,            
      'essentials.powertool' => true,
      'essentials.protect' => true,
      'essentials.sethome' => true,
      'essentials.signs.use.*' => true,
      'essentials.signs.create.disposal' => true,
      'essentials.signs.create.mail' => true,
      'essentials.signs.create.protection' => true,
      'essentials.signs.create.trade' => true,
      'essentials.signs.break.disposal' => true,
      'essentials.signs.break.mail' => true,
      'essentials.signs.break.protection' => true,
      'essentials.signs.break.trade' => true,
      'essentials.suicide' => true,
      'essentials.time' => true,
      'essentials.tpa' => true,
      'essentials.tpaccept' => true,
      'essentials.tpahere' => true,
      'essentials.tpdeny' => true,
      'essentials.warp' => true,
      'essentials.warp.list' => true,
      'essentials.worth' =>true
    },
    :inheritance => ['default']
  },

  'moderator' => {
    :permissions => {
	  'factions.kit.mod' => true,
	  'essentials.ban' => true,
      'essentials.ban.notify' => true,
      'essentials.banip' => true,
      'essentials.broadcast' => true,
      'essentials.clearinventory' => true,
      'essentials.delwarp' => true,
      'essentials.eco.loan' => true,
      'essentials.ext' => true,
      'essentials.getpos' => true,
      'essentials.helpop.recieve' => true,
      'essentials.home.others' => true,
      'essentials.invsee' => true,
      'essentials.jails' => true,
      'essentials.jump' => true,
      'essentials.kick' => true,
      'essentials.kick.notify' => true,
      'essentials.kill' => true,
      'essentials.mute' => true,
      'essentials.nick.others' => true,
      'essentials.realname' => true,
      'essentials.setwarp' => true,
      'essentials.signs.create.*' => true,
      'essentials.signs.break.*' => true,
      'essentials.spawner' => true,
      'essentials.thunder' => true,
      'essentials.time' => true,
      'essentials.time.set' => true,
      'essentials.protect.alerts' => true,
      'essentials.protect.admin' => true,
      'essentials.protect.ownerinfo' => true,
      'essentials.ptime'=> true,
      'essentials.ptime.others' => true,
      'essentials.togglejail' => true,
      'essentials.top' => true,
      'essentials.tp' => true,
      'essentials.tphere' => true,
      'essentials.tppos' => true,
      'essentials.tptoggle' => true,
      'essentials.unban' => true,
      'essentials.unbanip' => true,
      'essentials.weather' => true,
      'essentials.whois' => true,
      'essentials.world' => true
    },
    :inheritance => ['builder' ]
	},
  'rolo of the polos' => {
    :permissions => {
	  'factions.kit.mod' => true,
      'essentials.ban' => false,
      'essentials.ban.notify' => false,
      'essentials.banip' => false,
      'essentials.broadcast' => true,
      'essentials.clearinventory' => true,
      'essentials.delwarp' => true,
      'essentials.eco.loan' => true,
      'essentials.ext' => true,
      'essentials.getpos' => true,
      'essentials.helpop.recieve' => true,
      'essentials.home.others' => true,
      'essentials.invsee' => true,
      'essentials.jails' => true,
      'essentials.jump' => true,
      'essentials.kick' => true,
      'essentials.kick.notify' => true,
      'essentials.kill' => false,
      'essentials.mute' => true,
      'essentials.nick.others' => true,
      'essentials.realname' => true,
      'essentials.setwarp' => true,
      'essentials.signs.create.*' => true,
      'essentials.signs.break.*' => true,
      'essentials.spawner' => true,
      'essentials.thunder' => true,
      'essentials.time' => true,
      'essentials.time.set' => true,
      'essentials.protect.alerts' => true,
      'essentials.protect.admin' => true,
      'essentials.protect.ownerinfo' => true,
      'essentials.ptime'=> true,
      'essentials.ptime.others' => true,
      'essentials.togglejail' => true,
      'essentials.top' => true,
      'essentials.tp' => true,
      'essentials.tphere' => true,
      'essentials.tppos' => true,
      'essentials.tptoggle' => true,
      'essentials.unban' => true,
      'essentials.unbanip' => true,
      'essentials.weather' => true,
      'essentials.whois' => true,
      'essentials.world' => true
    },
    :inheritance => ['builder' ]
  },
  'admin' => {
    'permissions' => {
	   'permissions.*' => true,
      # Since we use essentials.* permission here, we can still disable commands like this
      # This is only available for essentials permissions
      'factions.kit.admin' => true,
      '-essentials.backup' => true,
      '-essentials.essentials' => true,
      '-essentials.setspawn' => true,
      '-essentials.reloadall' => true,
      'essentials.*' => true
    },
    'inheritance' => ['moderator']
  },
  'owner' => {
    'permissions' => {
      # Double negation
      '-essentials.backup' => true,
      '-essentials.essentials' => true,
      '-essentials.setspawn' => true,
      '-essentials.reloadall' => true,
    },
    'inheritance' => ['admin']
  },
  'turtley awesome' => { 'inheritance' => ['owner']
  },
  'crazy wolf' => { 'inheritance' => ['owner']
  },
  'co-owner' => { 'inheritance' => ['owner'] },
  'derek' => {'inheritance' => ['default']}
}

default.minecraft.plugins.permissions_bukkit.debug = false

default.minecraft.plugins.permissions_bukkit.messages = {
  'build' => '&cYou cannot build in this area FOOL!!!'
}


