From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 06 Nov 2013 16:18:36 +0000
Subject: re: squashfs: enhance parallel I/O
Message-Id: <20131106161836.GN15603@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Minchan Kim,

This is a semi-automatic email about new static checker warnings.

The patch 8ae6a7f5a3a8: "squashfs: enhance parallel I/O" from Oct 28, 
2013, leads to the following Smatch complaint:

fs/squashfs/decompressor_multi.c:124 squashfs_decompressor_destroy()
	 error: we previously assumed 'stream' could be null (see line 111)

fs/squashfs/decompressor_multi.c
   110		struct squashfs_stream *stream = msblk->stream;
   111		if (stream) {
                    ^^^^^^
Patch introduces a check.

   112			struct decomp_stream *decomp_strm;
   113	
   114			while (!list_empty(&stream->strm_list)) {
   115				decomp_strm = list_entry(stream->strm_list.prev,
   116							struct decomp_stream, list);
   117				list_del(&decomp_strm->list);
   118				msblk->decompressor->free(decomp_strm->stream);
   119				kfree(decomp_strm);
   120				stream->avail_decomp--;
   121			}
   122		}
   123	
   124		WARN_ON(stream->avail_decomp);
   125		kfree(stream->comp_opts);
                      ^^^^^^^^^^^^^^^^^
Patch introduces a couple unchecked dereferences.

   126		kfree(stream);

regards,
dan carpenter
