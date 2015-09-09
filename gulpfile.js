var gulp = require('gulp')
var coffee = require('gulp-coffee')
var jade = require('gulp-jade')

gulp.task('coffee', function(){
  return gulp.src(['src/*.coffee'])
    .pipe(coffee())
    .pipe(gulp.dest('dest'));
});

gulp.task('jade', function() {
  return gulp.src('templates/*.jade')
    .pipe(jade())
    .pipe(gulp.dest('dest'))
});

gulp.task('default',['coffee', 'jade'], function(){
  console.log('done')
});
