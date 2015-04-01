From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 01 Apr 2015 08:13:03 +0000
Subject: [patch 2/2] staging: lustre: prevent underflows in lnet_parse_reply()
Message-Id: <20150401081303.GB21130@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I don't know if "hdr->payload_length;" can really be negative, but if so
then we shouldn't allow it.  Do the comparison as an unsigned.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/lustre/lnet/lnet/lib-move.c b/drivers/staging/lustre/lnet/lnet/lib-move.c
index ed6eec9..9fe0c64 100644
--- a/drivers/staging/lustre/lnet/lnet/lib-move.c
+++ b/drivers/staging/lustre/lnet/lnet/lib-move.c
@@ -1530,7 +1530,7 @@ lnet_parse_reply(lnet_ni_t *ni, lnet_msg_t *msg)
 	LASSERT(md->md_offset = 0);
 
 	rlength = hdr->payload_length;
-	mlength = min_t(int, rlength, md->md_length);
+	mlength = min_t(uint, rlength, md->md_length);
 
 	if (mlength < rlength &&
 	    (md->md_options & LNET_MD_TRUNCATE) = 0) {
