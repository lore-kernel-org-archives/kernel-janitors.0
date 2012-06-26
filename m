From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Jun 2012 08:40:38 +0000
Subject: [patch] [media] drxk: fix a '&' vs '|' bug
Message-Id: <20120626084038.GB8946@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20443.26804.127414.204912@morden.metzler>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: Oliver Endriss <o.endriss@gmx.de>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org, Ralph Metzler <rjkm@metzlerbros.de>

IQM_AF_CLKNEG_CLKNEGDATA__M is 0x2 and
IQM_AF_CLKNEG_CLKNEGDATA_CLK_ADC_DATA_POS is 0.  (clkNeg | 0x2) is never
equal to zero so the condition can never be true.

I consulted with Ralph Metzler and the '|' should be changed to a '&'.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
CC: Ralph Metzler <rjkm@metzlerbros.de>

diff --git a/drivers/media/dvb/frontends/drxk_hard.c b/drivers/media/dvb/frontends/drxk_hard.c
index 60b868f..7f6a7b5 100644
--- a/drivers/media/dvb/frontends/drxk_hard.c
+++ b/drivers/media/dvb/frontends/drxk_hard.c
@@ -2977,7 +2977,7 @@ static int ADCSynchronization(struct drxk_state *state)
 		status = read16(state, IQM_AF_CLKNEG__A, &clkNeg);
 		if (status < 0)
 			goto error;
-		if ((clkNeg | IQM_AF_CLKNEG_CLKNEGDATA__M) =
+		if ((clkNeg & IQM_AF_CLKNEG_CLKNEGDATA__M) =
 			IQM_AF_CLKNEG_CLKNEGDATA_CLK_ADC_DATA_POS) {
 			clkNeg &= (~(IQM_AF_CLKNEG_CLKNEGDATA__M));
 			clkNeg |