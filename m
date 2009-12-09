From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:23:30 +0000
Subject: [PATCH 4/12] drivers/media/radio: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092023100.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mauro Carvalho Chehab <mchehab@infradead.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/radio/radio-tea5764.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -u -p a/drivers/media/radio/radio-tea5764.c b/drivers/media/radio/radio-tea5764.c
--- a/drivers/media/radio/radio-tea5764.c
+++ b/drivers/media/radio/radio-tea5764.c
@@ -314,7 +314,7 @@ static int vidioc_g_tuner(struct file *f
 	if (v->index > 0)
 		return -EINVAL;
 
-	memset(v, 0, sizeof(v));
+	memset(v, 0, sizeof(*v));
 	strcpy(v->name, "FM");
 	v->type = V4L2_TUNER_RADIO;
 	tea5764_i2c_read(radio);
@@ -371,7 +371,7 @@ static int vidioc_g_frequency(struct fil
 	struct tea5764_regs *r = &radio->regs;
 
 	tea5764_i2c_read(radio);
-	memset(f, 0, sizeof(f));
+	memset(f, 0, sizeof(*f));
 	f->type = V4L2_TUNER_RADIO;
 	if (r->tnctrl & TEA5764_TNCTRL_PUPD0)
 		f->frequency = (tea5764_get_freq(radio) * 2) / 125;
