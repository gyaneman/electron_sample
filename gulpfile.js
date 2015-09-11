var gulp = require('gulp')
var coffee = require('gulp-coffee')
var jade = require('gulp-jade')

var coffeeFiles = 'src/*.coffee'
var jadeFiles = 'templates/*.jade'

gulp.task('coffee', function(){
  gulp.src([coffeeFiles])
    .pipe(coffee())
    .pipe(gulp.dest('dest'));
});

gulp.task('jade', function() {
  gulp.src([jadeFiles])
    .pipe(jade())
    .pipe(gulp.dest('dest'))
});

gulp.task('watch', function() {
  gulp.watch(coffeeFiles, ['coffee'])
  gulp.watch(jadeFiles, ['jade'])
});

gulp.task('default',['coffee', 'jade'], function(){
  console.log('done')
});
