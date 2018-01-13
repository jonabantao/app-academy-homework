document.addEventListener("DOMContentLoaded", function(){
  const canvas = document.getElementById('mycanvas');
  canvas.height = 500;
  canvas.width = 500;

  const ctx = canvas.getContext('2d');
  ctx.fillStyle = 'red';
  ctx.fillRect(100, 100, 300, 300);
  
  ctx.beginPath();
  ctx.arc(130, 250, 100, 0.2 * Math.PI, 1.8 * Math.PI);
  ctx.lineTo(130, 250);
  ctx.closePath();
  ctx.strokeStyle = '#000';
  ctx.lineWidth = 3;
  ctx.stroke();
  ctx.fillStyle = 'rgb(255, 255, 0)';
  ctx.fill();

  ctx.beginPath();
  ctx.arc(280, 250, 30, 0, 2 * Math.PI);
  ctx.strokeStyle = 'rgba(255, 220, 20, 0.36)';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();
});
