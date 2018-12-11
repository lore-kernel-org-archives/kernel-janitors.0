From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 11 Dec 2018 08:11:33 +0000
Subject: [PATCH -next] scsi: bnx2fc: Remove set but not used variable 'fh'
Message-Id: <1544515893-193130-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536720652-106193-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536720652-106193-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/bnx2fc/bnx2fc_fcoe.c: In function 'bnx2fc_rcv':
drivers/scsi/bnx2fc/bnx2fc_fcoe.c:431:26: warning:
 variable 'fh' set but not used [-Wunused-but-set-variable]
  struct fc_frame_header *fh;
                          ^

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index bcd30e2..fa6a09a 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -428,7 +428,6 @@ static int bnx2fc_rcv(struct sk_buff *skb, struct net_device *dev,
 	struct fc_lport *lport;
 	struct bnx2fc_interface *interface;
 	struct fcoe_ctlr *ctlr;
-	struct fc_frame_header *fh;
 	struct fcoe_rcv_info *fr;
 	struct fcoe_percpu_s *bg;
 	struct sk_buff *tmp_skb;
@@ -463,7 +462,6 @@ static int bnx2fc_rcv(struct sk_buff *skb, struct net_device *dev,
 		goto err;
 
 	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
-	fh = (struct fc_frame_header *) skb_transport_header(skb);
 
 	fr = fcoe_dev_from_skb(skb);
 	fr->fr_dev = lport;
