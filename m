From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 12 Sep 2018 02:50:52 +0000
Subject: [PATCH -next] scsi: bnx2fc: Remove set but not used variable 'oxid'
Message-Id: <1536720652-106193-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fixes gcc '-Wunused-but-set-variable' warning:

drivers/scsi/bnx2fc/bnx2fc_fcoe.c: In function 'bnx2fc_rcv':
drivers/scsi/bnx2fc/bnx2fc_fcoe.c:435:17: warning:
 variable 'oxid' set but not used [-Wunused-but-set-variable]

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/scsi/bnx2fc/bnx2fc_fcoe.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
index 27c8d6b..cd160f2 100644
--- a/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
+++ b/drivers/scsi/bnx2fc/bnx2fc_fcoe.c
@@ -432,7 +432,6 @@ static int bnx2fc_rcv(struct sk_buff *skb, struct net_device *dev,
 	struct fcoe_rcv_info *fr;
 	struct fcoe_percpu_s *bg;
 	struct sk_buff *tmp_skb;
-	unsigned short oxid;
 
 	interface = container_of(ptype, struct bnx2fc_interface,
 				 fcoe_packet_type);
@@ -466,8 +465,6 @@ static int bnx2fc_rcv(struct sk_buff *skb, struct net_device *dev,
 	skb_set_transport_header(skb, sizeof(struct fcoe_hdr));
 	fh = (struct fc_frame_header *) skb_transport_header(skb);
 
-	oxid = ntohs(fh->fh_ox_id);
-
 	fr = fcoe_dev_from_skb(skb);
 	fr->fr_dev = lport;
