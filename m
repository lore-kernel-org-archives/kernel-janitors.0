From: Colin King <colin.king@canonical.com>
Date: Fri, 21 Jul 2017 11:06:35 +0000
Subject: [PATCH][media-next] media: dvb-frontends/stv0910: make various local variables static
Message-Id: <20170721110635.23610-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Scheller <d.scheller.oss@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The list stvlist and arrays padc_lookup, s1_sn_lookup and s2_sn_lookup
do not need to be in global scope, so make them all static.

Cleans up a bunch of smatch warnings:
symbol 'padc_lookup' was not declared. Should it be static?
symbol 's1_sn_lookup' was not declared. Should it be static?
symbol 's2_sn_lookup' was not declared. Should it be static?
symbol 'stvlist' was not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/stv0910.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/stv0910.c b/drivers/media/dvb-frontends/stv0910.c
index 7e8a460449c5..bae1da3fdb2d 100644
--- a/drivers/media/dvb-frontends/stv0910.c
+++ b/drivers/media/dvb-frontends/stv0910.c
@@ -34,7 +34,7 @@
 #define BER_SRC_S    0x20
 #define BER_SRC_S2   0x20
 
-LIST_HEAD(stvlist);
+static LIST_HEAD(stvlist);
 
 enum receive_mode { RCVMODE_NONE, RCVMODE_DVBS, RCVMODE_DVBS2, RCVMODE_AUTO };
 
@@ -207,7 +207,7 @@ static int write_shared_reg(struct stv *state, u16 reg, u8 mask, u8 val)
 	return status;
 }
 
-struct slookup s1_sn_lookup[] = {
+static struct slookup s1_sn_lookup[] = {
 	{   0,    9242  },  /*C/N=  0dB*/
 	{   5,    9105  },  /*C/N=0.5dB*/
 	{  10,    8950  },  /*C/N=1.0dB*/
@@ -264,7 +264,7 @@ struct slookup s1_sn_lookup[] = {
 	{  510,    425  }   /*C/NQ.0dB*/
 };
 
-struct slookup s2_sn_lookup[] = {
+static struct slookup s2_sn_lookup[] = {
 	{  -30,  13950  },  /*C/N=-2.5dB*/
 	{  -25,  13580  },  /*C/N=-2.5dB*/
 	{  -20,  13150  },  /*C/N=-2.0dB*/
@@ -327,7 +327,7 @@ struct slookup s2_sn_lookup[] = {
 	{  510,    463  },  /*C/NQ.0dB*/
 };
 
-struct slookup padc_lookup[] = {
+static struct slookup padc_lookup[] = {
 	{    0,  118000 }, /* PADC=+0dBm  */
 	{ -100,  93600  }, /* PADC=-1dBm  */
 	{ -200,  74500  }, /* PADC=-2dBm  */
-- 
2.11.0

