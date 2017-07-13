From: Colin King <colin.king@canonical.com>
Date: Thu, 13 Jul 2017 12:00:20 +0000
Subject: [PATCH] [media] dib0090: make const array dib0090_tuning_table_cband_7090e_aci static
Message-Id: <20170713120020.32712-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't populate array dib0090_tuning_table_cband_7090e_aci on the stack but
instead make it static. Makes the object code smaller by over 180 bytes:

Before:
   text	   data	    bss	    dec	    hex	filename
  40052	   7320	    192	  47564	   b9cc dib0090.o

After:
   text	   data	    bss	    dec	    hex	filename
  39780	   7408	    192	  47380	   b914	dib0090.o

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/dvb-frontends/dib0090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/dib0090.c b/drivers/media/dvb-frontends/dib0090.c
index 33af14df27bd..ae53a199b7af 100644
--- a/drivers/media/dvb-frontends/dib0090.c
+++ b/drivers/media/dvb-frontends/dib0090.c
@@ -2052,7 +2052,7 @@ int dib0090_update_tuning_table_7090(struct dvb_frontend *fe,
 	struct dib0090_state *state = fe->tuner_priv;
 	const struct dib0090_tuning *tune  		dib0090_tuning_table_cband_7090e_sensitivity;
-	const struct dib0090_tuning dib0090_tuning_table_cband_7090e_aci[] = {
+	static const struct dib0090_tuning dib0090_tuning_table_cband_7090e_aci[] = {
 		{ 300000,  0 ,  3,  0x8165, 0x2c0, 0x2d12, 0xb84e, EN_CAB },
 		{ 650000,  0 ,  4,  0x815B, 0x280, 0x2d12, 0xb84e, EN_CAB },
 		{ 860000,  0 ,  5,  0x84EF, 0x280, 0x2d12, 0xb84e, EN_CAB },
-- 
2.11.0

