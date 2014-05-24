From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sat, 24 May 2014 18:47:56 +0000
Subject: [PATCH] msi3103: Use time_before_eq()
Message-Id: <1400957276-13222-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: crope@iki.fi
Cc: m.chehab@samsung.com, gregkh@linuxfoundation.org, linux-media@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_before_eq() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/staging/media/msi3101/sdr-msi3101.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/msi3101/sdr-msi3101.c b/drivers/staging/=
media/msi3101/sdr-msi3101.c
index 65d351f..b52726b 100644
--- a/drivers/staging/media/msi3101/sdr-msi3101.c
+++ b/drivers/staging/media/msi3101/sdr-msi3101.c
@@ -208,7 +208,7 @@ static int msi3101_convert_stream_504(struct msi3101_st=
ate *s, u8 *dst,
 	}
=20
 	/* calculate samping rate and output it in 10 seconds intervals */
-	if ((s->jiffies_next + msecs_to_jiffies(10000)) <=3D jiffies) {
+	if (time_before_eq(s->jiffies_next + 10 * HZ, jiffies)) {
 		unsigned long jiffies_now =3D jiffies;
 		unsigned long msecs =3D jiffies_to_msecs(jiffies_now) - jiffies_to_msecs=
(s->jiffies_next);
 		unsigned int samples =3D sample_num[i_max - 1] - s->sample;
@@ -360,7 +360,7 @@ static int msi3101_convert_stream_384(struct msi3101_st=
ate *s, u8 *dst,
 	}
=20
 	/* calculate samping rate and output it in 10 seconds intervals */
-	if ((s->jiffies_next + msecs_to_jiffies(10000)) <=3D jiffies) {
+	if (time_before_eq(s->jiffies_next + 10 * HZ, jiffies)) {
 		unsigned long jiffies_now =3D jiffies;
 		unsigned long msecs =3D jiffies_to_msecs(jiffies_now) - jiffies_to_msecs=
(s->jiffies_next);
 		unsigned int samples =3D sample_num[i_max - 1] - s->sample;
@@ -425,7 +425,7 @@ static int msi3101_convert_stream_336(struct msi3101_st=
ate *s, u8 *dst,
 	}
=20
 	/* calculate samping rate and output it in 10 seconds intervals */
-	if ((s->jiffies_next + msecs_to_jiffies(10000)) <=3D jiffies) {
+	if (time_before_eq(s->jiffies_next + 10 * HZ, jiffies)) {
 		unsigned long jiffies_now =3D jiffies;
 		unsigned long msecs =3D jiffies_to_msecs(jiffies_now) - jiffies_to_msecs=
(s->jiffies_next);
 		unsigned int samples =3D sample_num[i_max - 1] - s->sample;
@@ -488,7 +488,7 @@ static int msi3101_convert_stream_252(struct msi3101_st=
ate *s, u8 *dst,
 	}
=20
 	/* calculate samping rate and output it in 10 seconds intervals */
-	if ((s->jiffies_next + msecs_to_jiffies(10000)) <=3D jiffies) {
+	if (time_before_eq(s->jiffies_next + 10 * HZ, jiffies)) {
 		unsigned long jiffies_now =3D jiffies;
 		unsigned long msecs =3D jiffies_to_msecs(jiffies_now) - jiffies_to_msecs=
(s->jiffies_next);
 		unsigned int samples =3D sample_num[i_max - 1] - s->sample;
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
