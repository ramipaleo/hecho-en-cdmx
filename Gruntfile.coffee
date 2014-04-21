module.exports = (grunt) ->

    # Load watch and less plugins
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-watch'

    # Start configuration block
    grunt.initConfig

        # grunt-contrib-watch config
        watch:
            less:
                files: ['less/**/*.less']
                tasks: ['less']

        # grunt-contrib-less config
        less:
            dev:
                options:
                    paths: ['less']
                    sourceMap: true
                files:
                    'less/**/*.less': 'css/main.css'
            prod:
                options:
                    paths: ['less']
                    compress: true
                files:
                    'less/**/*.less': 'css/main.css'

    # Default task is to watch for now
    grunt.registerTask 'default', 'watch'
