From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 24 Jun 2015 14:32:54 +0000
Subject: [patch -next] renesas: missing unlock on error path
Message-Id: <20150624143254.GG1702@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Masaru Nagai <masaru.nagai.vx@renesas.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

We need to unlock before returning here.

Fixes: a0d2f20650e8 ('Renesas Ethernet AVB PTP clock driver')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/ethernet/renesas/ravb_ptp.c b/drivers/net/ethernet/renesas/ravb_ptp.c
index 42656da..7a8ce92 100644
--- a/drivers/net/ethernet/renesas/ravb_ptp.c
+++ b/drivers/net/ethernet/renesas/ravb_ptp.c
@@ -116,8 +116,10 @@ static int ravb_ptp_adjfreq(struct ptp_clock_info *ptp, s32 ppb)
 	priv->ptp.current_addend = addend;
 
 	gccr = ravb_read(ndev, GCCR);
-	if (gccr & GCCR_LTI)
+	if (gccr & GCCR_LTI) {
+		spin_unlock_irqrestore(&priv->lock, flags);
 		return -EBUSY;
+	}
 	ravb_write(ndev, addend & GTI_TIV, GTI);
 	ravb_write(ndev, gccr | GCCR_LTI, GCCR);
 
