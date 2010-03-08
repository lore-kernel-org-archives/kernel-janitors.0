From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 12:21:57 +0000
Subject: [patch] iscsi: change & to &&
Message-Id: <20100308122157.GI6469@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Christie <michaelc@cs.wisc.edu>
Cc: "James E.J. Bottomley" <James.Bottomley@suse.de>, Andrew Morton <akpm@linux-foundation.org>, Stefani Seibold <stefani@seibold.net>, Andi Kleen <ak@linux.intel.com>, open-iscsi@googlegroups.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

This change is basically a clean up.

datadgst_en is an int which comes from the user.  I didn't see anything
limiting it to 1 and 0 although obviously that's what it's supposed to 
be.  If the user passed in 2 this test would fail.

This same if condition is repeated in another function and it uses && 
there.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/scsi/libiscsi_tcp.c b/drivers/scsi/libiscsi_tcp.c
index 4ad87fd..3794d29 100644
--- a/drivers/scsi/libiscsi_tcp.c
+++ b/drivers/scsi/libiscsi_tcp.c
@@ -420,7 +420,7 @@ iscsi_tcp_data_recv_prep(struct iscsi_tcp_conn *tcp_conn)
 	struct iscsi_conn *conn = tcp_conn->iscsi_conn;
 	struct hash_desc *rx_hash = NULL;
 
-	if (conn->datadgst_en &
+	if (conn->datadgst_en &&
 	    !(conn->session->tt->caps & CAP_DIGEST_OFFLOAD))
 		rx_hash = tcp_conn->rx_hash;
 
