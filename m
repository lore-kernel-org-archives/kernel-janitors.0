From: Vicente Feito <vicente.feito@gmail.com>
Date: Fri, 04 Feb 2005 11:44:11 +0000
Subject: [KJ][PATCH]sound/drivers/opl3/opl3_midi.c:replace [const]char *s=""
Message-Id: <200502041144.11496.vicente.feito@gmail.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12621497733682085=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============12621497733682085==
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7BIT
Content-disposition: inline

Hi,
Please consider applying.
Thank you.

Description: Replaces char *str = "" with char str[] = "".

Signed-off-by: Vicente Feito <vicente.feito@gmail.com>

--- linux-2.6.10-orig/sound/drivers/opl3/opl3_midi.c    2005-02-04 02:09:23.000000000 +0000
+++ linux-2.6.10/sound/drivers/opl3/opl3_midi.c 2005-02-04 02:17:51.000000000 +0000
@@ -123,7 +123,7 @@ static void snd_opl3_calc_pitch(unsigned
 #ifdef DEBUG_ALLOC
 static void debug_alloc(opl3_t *opl3, char *s, int voice) {
        int i;
-       char *str = "x.24";
+       char str[] = "x.24";

        printk("time %.5i: %s [%.2i]: ", opl3->use_time, s, voice);
        for (i = 0; i < opl3->max_voices; i++)

--===============12621497733682085==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12621497733682085==--
