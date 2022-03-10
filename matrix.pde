PVector matmul(PVector inp, float[][] mat) {
  PVector out = new PVector(0,0,0);
  out.x = inp.x*mat[0][0] + inp.y*mat[0][1] + inp.z*mat[0][2];
  out.y = inp.x*mat[1][0] + inp.y*mat[1][1] + inp.z*mat[1][2];
  if (mat.length == 3) {
    out.z = inp.x*mat[2][0] + inp.y*mat[2][1] + inp.z*mat[2][2];
  }
  return out;
}
