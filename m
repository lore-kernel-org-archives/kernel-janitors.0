From: =?ISO-8859-1?Q?Andr=E9_Lopes?= <andre.neo.net@gmail.com>
Date: Fri, 22 May 2009 13:27:45 +0000
Subject: [PATCH] oss: Remove void casts
Message-Id: <5c43c2d40905220627g4036fd80n6f0ef8469e48aa1f@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, askulysh@image.kiev.ua

This trivial patch just remove void cats from sound/oss/sh_dac_audio.c

Signed-off-by: Andr=E9 Lopes <andre.neo.net@gmail.com>

---
 sound/oss/sh_dac_audio.c |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/oss/sh_dac_audio.c b/sound/oss/sh_dac_audio.c
index 78cfb66..7247ea1 100755
--- a/sound/oss/sh_dac_audio.c
+++ b/sound/oss/sh_dac_audio.c
@@ -200,21 +200,21 @@ static ssize_t dac_audio_write(struct file
*file, const char *buf, size_t count,
 	if (count > free)
 		count =3D free;
 	if (buffer_begin > buffer_end) {
-		if (copy_from_user((void *)buffer_end, buf, count))
+		if (copy_from_user(buffer_end, buf, count))
 			return -EFAULT;

 		buffer_end +=3D count;
 	} else {
 		nbytes =3D data_buffer + BUFFER_SIZE - buffer_end;
 		if (nbytes > count) {
-			if (copy_from_user((void *)buffer_end, buf, count))
+			if (copy_from_user(buffer_end, buf, count))
 				return -EFAULT;
 			buffer_end +=3D count;
 		} else {
-			if (copy_from_user((void *)buffer_end, buf, nbytes))
+			if (copy_from_user(buffer_end, buf, nbytes))
 				return -EFAULT;
 			if (copy_from_user
-			    ((void *)data_buffer, buf + nbytes, count - nbytes))
+			    (data_buffer, buf + nbytes, count - nbytes))
 				return -EFAULT;
 			buffer_end =3D data_buffer + count - nbytes;
 		}
@@ -322,7 +322,7 @@ static void __exit dac_audio_exit(void)
 	free_irq(TIMER1_IRQ, 0);

 	unregister_sound_dsp(device_major);
-	kfree((void *)data_buffer);
+	kfree(data_buffer);
 }

 module_init(dac_audio_init);
--=20
1.5.6.5
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
