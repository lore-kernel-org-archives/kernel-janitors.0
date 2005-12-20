From: Eric Sesterhenn / snakebyte <snakebyte@gmx.de>
Date: Tue, 20 Dec 2005 08:19:01 +0000
Subject: [KJ] [Patch] Remove MIN/MAX Macro in media/video/msp3400.c
Message-Id: <1135066742.20679.1.camel@alice>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============1343923682896917=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============1343923682896917==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

hi,

every driver should use the linux/kernel.h min/max macros,
so i removed the one in msp3400.c and changed the users.

Signed-of-by: Eric Sesterhenn <snakebyte@gmx.de>

--- linux-2.6.15-rc6/drivers/media/video/msp3400.c.orig	2005-12-20 09:12:50.000000000 +0100
+++ linux-2.6.15-rc6/drivers/media/video/msp3400.c	2005-12-20 09:13:45.000000000 +0100
@@ -147,8 +147,6 @@ struct msp3400c {
 	int                  watch_stereo:1;
 };
 
-#define MIN(a,b) (((a)>(b))?(b):(a))
-#define MAX(a,b) (((a)>(b))?(a):(b))
 #define HAVE_NICAM(msp)   (((msp->rev2>>8) & 0xff) != 00)
 #define HAVE_SIMPLE(msp)  ((msp->rev1      & 0xff) >= 'D'-'@')
 #define HAVE_SIMPLER(msp) ((msp->rev1      & 0xff) >= 'G'-'@')
@@ -1922,8 +1920,8 @@ static int msp_command(struct i2c_client
 
 		if (msp->muted)
 			va->flags |= VIDEO_AUDIO_MUTE;
-		va->volume = MAX(msp->left, msp->right);
-		va->balance = (32768 * MIN(msp->left, msp->right)) /
+		va->volume = max(msp->left, msp->right);
+		va->balance = (32768 * min(msp->left, msp->right)) /
 		    (va->volume ? va->volume : 1);
 		va->balance = (msp->left < msp->right) ?
 		    (65535 - va->balance) : va->balance;
@@ -1942,9 +1940,9 @@ static int msp_command(struct i2c_client
 
 		msp3400_dbg("VIDIOCSAUDIO\n");
 		msp->muted = (va->flags & VIDEO_AUDIO_MUTE);
-		msp->left = (MIN(65536 - va->balance, 32768) *
+		msp->left = (min(65536 - va->balance, 32768) *
 			     va->volume) / 32768;
-		msp->right = (MIN(va->balance, 32768) * va->volume) / 32768;
+		msp->right = (min(va->balance, 32768) * va->volume) / 32768;
 		msp->bass = va->bass;
 		msp->treble = va->treble;
 		msp3400_dbg("VIDIOCSAUDIO setting va->volume to %d\n",



--===============1343923682896917==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============1343923682896917==--
