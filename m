From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Jul 2012 14:48:32 +0000
Subject: [patch 2/3 -next] tcm_vhost: strlen() doesn't count the terminator
Message-Id: <20120712144831.GE24202@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>, Nicholas Bellinger <nab@linux-iscsi.org>
Cc: kernel-janitors@vger.kernel.org, kvm@vger.kernel.org, virtualization@lists.linux-foundation.org

We do snprintf() from "page" to a buffer with TCM_VHOST_NAMELEN
characters so the current code will silently truncate the last
character.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/vhost/tcm_vhost.c b/drivers/vhost/tcm_vhost.c
index d217bed..57d39c5 100644
--- a/drivers/vhost/tcm_vhost.c
+++ b/drivers/vhost/tcm_vhost.c
@@ -1254,7 +1254,7 @@ static ssize_t tcm_vhost_tpg_store_nexus(
 	 * the fabric protocol_id set in tcm_vhost_make_tport(), and call
 	 * tcm_vhost_make_nexus().
 	 */
-	if (strlen(page) > TCM_VHOST_NAMELEN) {
+	if (strlen(page) >= TCM_VHOST_NAMELEN) {
 		pr_err("Emulated NAA Sas Address: %s, exceeds"
 				" max: %d\n", page, TCM_VHOST_NAMELEN);
 		return -EINVAL;
