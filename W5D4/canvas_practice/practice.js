// document.addEventListener("DOMContentLoaded", function(){
//   let canvas = document.getElementById('mycanvas');
//   canvas.height =  500;
//   canvas.width = 500;
//   let ctx = canvas.getContext('2d');
//   // above provides object of CanvasRenderingContext interface that provides
//   //2D rendering context for drawing surface ofa a canvas element.
//
//   // ctx.fillStyle = 'rgb(200,0,0)';
//   ctx.fillStyle = 'red';
//   ctx.fillRect(10, 10, 55, 50);
//
//
//
// });

document.addEventListener("DOMContentLoaded", function(){
  let canvas = document.getElementById('mycanvas');
  // canvas.height =  500;
  // canvas.width = 500;
  let ctx = canvas.getContext('2d');

  ctx.beginPath();
  ctx.strokeStyle = 'blue';
  ctx.arc(75, 75, 50, 0, 2 * Math.PI);
  ctx.linewidth = 30;
  ctx.stroke();


});
