module.exports = {
    apps : [{
      name: 'station-radio-interface',
      script: 'npm run start-radio-interface',
      cwd: '/home/ctt/ctt/sensor-station-software',
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
      script: 'npm run start-hardware-server',
      cwd: '/home/ctt/ctt/sensor-station-software',
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
      script: 'npm run start-lcd-interface',
      cwd: '/home/ctt/ctt/sensor-station-software',
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
      script: 'npm run start-web-interface',
      cwd: '/home/ctt/ctt/sensor-station-software',
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
