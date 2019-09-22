From: Colin King <colin.king@canonical.com>
Date: Sun, 22 Sep 2019 11:42:16 +0000
Subject: [PATCH] atm: he: clean up an indentation issue
Message-Id: <20190922114216.10158-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a statement that is indented one level too many, remove
the extraneous tab.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/he.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/atm/he.c b/drivers/atm/he.c
index 70b00ae4ec38..8af793f5e811 100644
--- a/drivers/atm/he.c
+++ b/drivers/atm/he.c
@@ -1690,7 +1690,7 @@ he_service_rbrq(struct he_dev *he_dev, int group)
 
 		if (RBRQ_HBUF_ERR(he_dev->rbrq_head)) {
 			hprintk("HBUF_ERR!  (cid 0x%x)\n", cid);
-				atomic_inc(&vcc->stats->rx_drop);
+			atomic_inc(&vcc->stats->rx_drop);
 			goto return_host_buffers;
 		}
 
-- 
2.20.1
