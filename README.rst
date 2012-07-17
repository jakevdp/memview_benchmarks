memview_benchmarks
==================

Benchmarks of various ways of handling contiguous typed data arrays in cython

The code snippets here each perform a simple loop over over an input matrix,
computing the dot-product of each combination of rows (and doing nothing with
the result)

This requires cython 0.16+.  To compile in-place, type

   % make

To run the comparisons, type
 
   % python runme.py
