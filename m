From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 03 Nov 2012 10:58:35 +0000
Subject: [PATCH 14/16] drivers/ssb/main.c: use WARN
Message-Id: <1351940317-14812-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1351940317-14812-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Buesch <m@bues.ch>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Julia Lawall <Julia.Lawall@lip6.fr>

Use WARN rather than printk followed by WARN_ON(1), for conciseness.

A simplified version of the semantic patch that makes this transformation
is as follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression list es;
@@

-printk(
+WARN(1,
  es);
-WARN_ON(1);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/ssb/main.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ssb/main.c b/drivers/ssb/main.c
index df0f145..519688d 100644
--- a/drivers/ssb/main.c
+++ b/drivers/ssb/main.c
@@ -1118,8 +1118,7 @@ static u32 ssb_tmslow_reject_bitmask(struct ssb_device *dev)
 	case SSB_IDLOW_SSBREV_27:     /* same here */
 		return SSB_TMSLOW_REJECT;	/* this is a guess */
 	default:
-		printk(KERN_INFO "ssb: Backplane Revision 0x%.8X\n", rev);
-		WARN_ON(1);
+		WARN(1, KERN_INFO "ssb: Backplane Revision 0x%.8X\n", rev);
 	}
 	return (SSB_TMSLOW_REJECT | SSB_TMSLOW_REJECT_23);
 }

