module.exports = {
    apps : [{
      name: 'station-radio-interface',
      script: 'npm start',
      cwd: '/home/ctt/ctt/station-radio-interface',
      instances: 1,
      autorestart: true,
      watch: false,
      time: true,
      max_memory_restart: '500M',
      env: {
        NODE_ENV: 'development'
      },
      env_production: {
        NODE_ENV: 'production'
      }
    },{
      name: 'station-hardware-server',
      script: 'npm start',
      cwd: '/home/ctt/ctt/station-hardware-server',
      instances: 1,
      autorestart: true,
      watch: false,
      time: true,
      max_memory_restart: '100M',
      env: {
        NODE_ENV: 'development'
      },
      env_production: {
        NODE_ENV: 'production'
      }
    },{
      name: 'station-lcd-interface',
      script: 'npm start',
      cwd: '/home/ctt/ctt/station-lcd-interface',
      instances: 1,
      autorestart: true,
      watch: false,
      time: true,
      max_memory_restart: '100M',
      env: {
        NODE_ENV: 'development'
      },
      env_production: {
        NODE_ENV: 'production'
      }
    },{
      name: 'station-interface',
      script: 'npm start',
      cwd: '/home/ctt/ctt/station-interface',
      instances: 1,
      autorestart: true,
      watch: false,
      time: true,
      max_memory_restart: '500M',
      env: {
        NODE_ENV: 'development'
      },
      env_production: {
        NODE_ENV: 'production'
      }
    }]
  };
