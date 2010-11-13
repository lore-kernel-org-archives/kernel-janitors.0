From: Dan Carpenter <error27@gmail.com>
Date: Sat, 13 Nov 2010 08:58:26 +0000
Subject: [patch] Staging: intel_sst: fix memory leak
Message-Id: <20101113085826.GM3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The original code set "str_info->decode_ibuf" to NULL so the kfree() is
no-op.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
This is a static checker thing.  I don't have the hardware to test this
myself so please check it carefully.

diff --git a/drivers/staging/intel_sst/intel_sst_stream_encoded.c b/drivers/staging/intel_sst/intel_sst_stream_encoded.c
index d4e94f1..09993d6 100644
--- a/drivers/staging/intel_sst/intel_sst_stream_encoded.c
+++ b/drivers/staging/intel_sst/intel_sst_stream_encoded.c
@@ -1270,7 +1270,7 @@ finish:
 	dbufs->output_bytes_produced = total_output;
 	str_info->status = str_info->prev;
 	str_info->prev = STREAM_DECODE;
-	str_info->decode_ibuf = NULL;
 	kfree(str_info->decode_ibuf);
+	str_info->decode_ibuf = NULL;
 	return retval;
 }
