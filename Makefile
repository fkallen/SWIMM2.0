ICC?=icx

COPT_AVX512 = -xCore-AVX512 -qopt-zmm-usage=high

SRC = arguments.c sequences.c swimm.c utils.c

AVX512BW:
	$(ICC) -o swimm2 -O3 $(COPT_AVX512) -fopenmp $(SRC) charSubmat.c AVX-512BWsearch.c -D AVX512BW  -D MEMALIGN=64 -D VECTOR_LENGTH=64 -D DB_SEQ_LEN_MULT=3 -D QUERY_SEQ_LEN_MULT=4

# AVX2: 
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) charSubmat.c AVX2search.c -D AVX2 -D MEMALIGN=32 -D VECTOR_LENGTH=32 -D DB_SEQ_LEN_MULT=3 -D QUERY_SEQ_LEN_MULT=4

# SSE41: 
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) charSubmat.c SSE41search.c -D SSE41 -D MEMALIGN=16 -D VECTOR_LENGTH=16 -D DB_SEQ_LEN_MULT=3 -D QUERY_SEQ_LEN_MULT=4

# AVX512F:
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) intSubmat.c AVX-512Fsearch.c -D AVX512F  -D MEMALIGN=64 -D VECTOR_LENGTH=16 -D DB_SEQ_LEN_MULT=8 -D QUERY_SEQ_LEN_MULT=2 

# AVX512BW:
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) charSubmat.c AVX-512BWsearch.c -D AVX512BW  -D MEMALIGN=64 -D VECTOR_LENGTH=64 -D DB_SEQ_LEN_MULT=3 -D QUERY_SEQ_LEN_MULT=4

# KNL_AVX2: 
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) charSubmat.c AVX2search.c -D AVX2 -D KNL  -D MEMALIGN=64 -D VECTOR_LENGTH=32 -D DB_SEQ_LEN_MULT=3 -D QUERY_SEQ_LEN_MULT=4

# KNL_AVX512F:
# 	$(ICC) -o swimm2 -O3 -qopenmp $(SRC) intSubmat.c AVX-512Fsearch.c -D AVX512F -D KNL -D MEMALIGN=64 -D VECTOR_LENGTH=16 -D DB_SEQ_LEN_MULT=8 -D QUERY_SEQ_LEN_MULT=2 

clean: 
	rm -rf swimm2 .swimm2_*_tuning
