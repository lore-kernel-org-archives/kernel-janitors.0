From: Julia Lawall <julia@diku.dk>
Date: Sat, 19 Sep 2009 19:48:17 +0000
Subject: [PATCH 1/5] drivers/media/video: remove duplicate structure field
Message-Id: <Pine.LNX.4.64.0909192147490.27171@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mchehab@infradead.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

The definition of tvaudio_tuner_ops initializes the s_tuner field twice.
It appears that the second case should initialize the g_tuner field.

The semantic match that finds this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
identifier I, s, fld;
position p0,p;
expression E;
@@

struct I s =@p0 { ... .fld@p = E, ...};

@s@
identifier I, s, r.fld;
position r.p0,p;
expression E;
@@

struct I s =@p0 { ... .fld@p = E, ...};

@script:python@
p0 << r.p0;
fld << r.fld;
ps << s.p;
pr << r.p;
@@

if int(ps[0].line)!=int(pr[0].line) or int(ps[0].column)!=int(pr[0].column):
  cocci.print_main(fld,p0)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/media/video/tvaudio.c       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/media/video/tvaudio.c b/drivers/media/video/tvaudio.c
index 0869baf..800fc1b 100644
--- a/drivers/media/video/tvaudio.c
+++ b/drivers/media/video/tvaudio.c
@@ -1919,7 +1919,7 @@ static const struct v4l2_subdev_tuner_ops tvaudio_tuner_ops = {
 	.s_radio = tvaudio_s_radio,
 	.s_frequency = tvaudio_s_frequency,
 	.s_tuner = tvaudio_s_tuner,
-	.s_tuner = tvaudio_g_tuner,
+	.g_tuner = tvaudio_g_tuner,
 };
 
 static const struct v4l2_subdev_audio_ops tvaudio_audio_ops = {
