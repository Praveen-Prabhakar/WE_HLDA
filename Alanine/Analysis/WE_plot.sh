#!/bin/bash
w_ipa -ao
w_pdist
plothist average -o hist.pdf pdist.h5 0
plothist evolution -o ev.pdf --plot-contour --energy pdist.h5 0
