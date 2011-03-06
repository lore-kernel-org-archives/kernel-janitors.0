From: Dan Carpenter <error27@gmail.com>
Date: Sun, 06 Mar 2011 13:41:23 +0000
Subject: [patch 2/2] [media] stv0367: typo in function parameter
Message-Id: <20110306134123.GP3416@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>
Cc: "Igor M. Liplianin" <liplianin@netup.ru>, linux-media@vger.kernel.org, kernel-janitors@vger.kernel.org

The CellsCoeffs arrays are [3][6][5] not [2][6][5].

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/media/dvb/frontends/stv0367.c b/drivers/media/dvb/frontends/stv0367.c
index 7117ce9..ec9de40 100644
--- a/drivers/media/dvb/frontends/stv0367.c
+++ b/drivers/media/dvb/frontends/stv0367.c
@@ -1046,7 +1046,7 @@ static u32 stv0367ter_get_mclk(struct stv0367_state *state, u32 ExtClk_Hz)
 }
 
 static int stv0367ter_filt_coeff_init(struct stv0367_state *state,
-				u16 CellsCoeffs[2][6][5], u32 DemodXtal)
+				u16 CellsCoeffs[3][6][5], u32 DemodXtal)
 {
 	int i, j, k, freq;
 
