From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 12:18:53 +0000
Subject: [PATCH 2/3] drivers/char/dsp56k.c: drop check for negativity of unsigned parameter
Message-Id: <1405599533-11374-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dcb314@hotmail.com, arnd@arndb.de, gregkh@linuxfoundation.org, Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/char/dsp56k.c:386]: (style) Checking if unsigned
variable 'arg' is less than zero.

Source code is

            if (arg > 31 || arg < 0)
                return -EINVAL;

But

static long dsp56k_ioctl(struct file *file, unsigned int cmd,
             unsigned long arg)

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80411
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/char/dsp56k.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/dsp56k.c b/drivers/char/dsp56k.c
index 01a5ca7..8bf70e8 100644
--- a/drivers/char/dsp56k.c
+++ b/drivers/char/dsp56k.c
@@ -383,7 +383,7 @@ static long dsp56k_ioctl(struct file *file, unsigned in=
t cmd,
 			return put_user(status, &hf->status);
 		}
 		case DSP56K_HOST_CMD:
-			if (arg > 31 || arg < 0)
+			if (arg > 31)
 				return -EINVAL;
 			mutex_lock(&dsp56k_mutex);
 			dsp56k_host_interface.cvr =3D (u_char)((arg & DSP56K_CVR_HV_MASK) |
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
