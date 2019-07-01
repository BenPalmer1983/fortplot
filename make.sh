mpif90 -g \
-fopenmp \
-fbounds-check \
-mtune=native \
kinds.f90 \
plot.f90 \
main.f90 \
-o test.x \
&& export OMP_NUM_THREADS=4 \
&& mpirun -n 1 test.x
