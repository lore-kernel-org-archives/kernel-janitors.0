From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 02 Mar 2012 19:00:43 +0000
Subject: [patch] block, sx8: fix pointer math issue getting fw version
Message-Id: <20120302190042.GB3951@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Tejun Heo <tj@kernel.org>, Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

"mem" is type u8.  We need parenthesis here or it screws up the pointer
math probably leading to an oops.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
index e7472f5..3fb6ab4 100644
--- a/drivers/block/sx8.c
+++ b/drivers/block/sx8.c
@@ -1120,7 +1120,7 @@ static inline void carm_handle_resp(struct carm_host *host,
 			break;
 		case MISC_GET_FW_VER: {
 			struct carm_fw_ver *ver = (struct carm_fw_ver *)
-				mem + sizeof(struct carm_msg_get_fw_ver);
+				(mem + sizeof(struct carm_msg_get_fw_ver));
 			if (!error) {
 				host->fw_ver = le32_to_cpu(ver->version);
 				host->flags |= (ver->features & FL_FW_VER_MASK);
