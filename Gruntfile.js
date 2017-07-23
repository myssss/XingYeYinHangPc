module.exports = function (grunt) {
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        tinypng: {
            options: {
                apiKey: "YJ81EXU-vPCV7PT2FWdzW9jzNqfiS2jK",
                checkSigs: true,
                sigFile: 'file_sigs.json',
                summarize: true,
                showProgress: true,
                stopOnImageError: true
            },
            compress: {
                expand: true,
                src: 'Public/static/images2/*.{jpg,png}',
                dest: 'imgs'
            }
        }
    });
    grunt.loadNpmTasks('grunt-tinypng');
    grunt.registerTask('default', ['tinypng']);
};