From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2017 10:41:04 +0000
Subject: [bug report] lib: update LZ4 compressor module
Message-Id: <20170131104104.GA27172@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Sven Schmidt,

This is a semi-automatic email about new static checker warnings.

The patch e355e356f87b: "lib: update LZ4 compressor module" from Jan 
25, 2017, leads to the following Smatch complaint:

lib/lz4/lz4_compress.c:890 lz4_compress()
	 warn: variable dereferenced before check 'dst_len' (see line 880)

lib/lz4/lz4_compress.c
   879		size_t *dst_len, void *wrkmem) {
   880		*dst_len = LZ4_compress_default(src, dst, (int)src_len,
                 ^^^^^^^
Dereference.

   881			(int)((size_t)dst_len), wrkmem);
   882	
   883		/*
   884		 * Prior lz4_compress will return -1 in case of error
   885		 * and 0 on success
   886		 * while new LZ4_compress_fast/default
   887		 * returns 0 in case of error
   888		 * and the output length on success
   889		 */
   890		if (!dst_len)
                     ^^^^^^^
Checked too late.  Can this test just be deleted?

   891			return -1;
   892		else

regards,
dan carpenter
