From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 28 Feb 2014 23:18:57 +0000
Subject: [patch] hsr: off by one sanity check in hsr_register_frame_in()
Message-Id: <20140228231857.GD22115@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arvid Brodin <arvid.brodin@alten.se>
Cc: "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

This is a sanity check and we never pass invalid values so this patch
doesn't change anything.  However the node->time_in[] array has
HSR_MAX_SLAVE (2) elements and not HSR_MAX_DEV (3).

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/net/hsr/hsr_framereg.c b/net/hsr/hsr_framereg.c
index 3d0100f0bae3..83e58449366a 100644
--- a/net/hsr/hsr_framereg.c
+++ b/net/hsr/hsr_framereg.c
@@ -297,7 +297,7 @@ static bool seq_nr_after(u16 a, u16 b)
 
 void hsr_register_frame_in(struct node_entry *node, enum hsr_dev_idx dev_idx)
 {
-	if ((dev_idx < 0) || (dev_idx >= HSR_MAX_DEV)) {
+	if ((dev_idx < 0) || (dev_idx >= HSR_MAX_SLAVE)) {
 		WARN_ONCE(1, "%s: Invalid dev_idx (%d)\n", __func__, dev_idx);
 		return;
 	}
