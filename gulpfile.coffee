require('coffee-script/register')
gulp = require('gulp')
$ = require('gulp-load-plugins')()
browserSync = require('browser-sync')

gulp.task 'html', ->
    gulp.src(['offer.html'])
        .pipe(browserSync.reload({stream: true}))

gulp.task 'stylus', ->
    gulp.src(['css/**/*.styl', '!css/**/_*.styl'])
        .pipe($.plumber())
        .pipe($.sourcemaps.init())
        .pipe($.stylus())
        .pipe($.autoprefixer('last 5 version'))
        # .pipe($.sourcemaps.write('.'))
        .pipe(gulp.dest('css'))
        .pipe(browserSync.reload({stream: true}))

gulp.task 'server', ->
    browserSync({
        server: {
            baseDir: '.'
        }
    })

gulp.task 'watch', ->
    gulp.watch('css/**/*.styl', ['stylus'])
    gulp.watch(['index.html', 'img/*'], ['html'])

gulp.task 'default', ['server', 'stylus', 'watch']