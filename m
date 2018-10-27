From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 11:46:11 +0000
Subject: [PATCH] media: mxl5xx: constify dvb_frontend_ops structure
Message-Id: <1540640771-25478-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org

The dvb_frontend_ops structure is only copied into the ops field
of a dvb_frontend structure, so it can be const.

Done with the help of Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/media/dvb-frontends/mxl5xx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/mxl5xx.c b/drivers/media/dvb-frontends/mxl5xx.c
index 6191315f5970..290b9eab099f 100644
--- a/drivers/media/dvb-frontends/mxl5xx.c
+++ b/drivers/media/dvb-frontends/mxl5xx.c
@@ -781,7 +781,7 @@ static int set_input(struct dvb_frontend *fe, int input)
 	return 0;
 }
 
-static struct dvb_frontend_ops mxl_ops = {
+static const struct dvb_frontend_ops mxl_ops = {
 	.delsys = { SYS_DVBS, SYS_DVBS2, SYS_DSS },
 	.info = {
 		.name			= "MaxLinear MxL5xx DVB-S/S2 tuner-demodulator",
