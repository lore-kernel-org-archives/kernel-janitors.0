From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Thu, 17 Jul 2014 13:54:35 +0000
Subject: [PATCH 2/4] drivers/message/i2o/i2o_block.c: drop negativity check of unsigned long arg
Message-Id: <1405605275-13608-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Andrey Utkin <andrey.krieger.utkin@gmail.com>

[linux-3.16-rc5/drivers/message/i2o/i2o_block.c:674]: (style) Checking if
unsigned variable 'arg' is less than zero.

Source code is

        if (arg < 0 || arg > CACHE_SMARTFETCH)
            break;
but

static int i2o_block_ioctl(struct block_device *bdev, fmode_t mode,
               unsigned int cmd, unsigned long arg)

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80451
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/message/i2o/i2o_block.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/message/i2o/i2o_block.c b/drivers/message/i2o/i2o_bloc=
k.c
index 6fc3866..2b684ec 100644
--- a/drivers/message/i2o/i2o_block.c
+++ b/drivers/message/i2o/i2o_block.c
@@ -671,7 +671,7 @@ static int i2o_block_ioctl(struct block_device *bdev, f=
mode_t mode,
 		break;
 	case BLKI2OSRSTRAT:
 		ret =3D -EINVAL;
-		if (arg < 0 || arg > CACHE_SMARTFETCH)
+		if (arg > CACHE_SMARTFETCH)
 			break;
 		dev->rcache =3D arg;
 		ret =3D 0;
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
