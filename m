From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 13:08:59 +0000
Subject: [PATCH] gdm72xx: use time_before()
Message-Id: <1401023339-29712-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org
Cc: peter.p.waskiewicz.jr@intel.com, kristina.martsenko@gmail.com, khoroshilov@ispras.ru, arnd@arndb.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_before() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/staging/gdm72xx/gdm_usb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gdm72xx/gdm_usb.c b/drivers/staging/gdm72xx/gd=
m_usb.c
index 20539d8..9ddf8f5 100644
--- a/drivers/staging/gdm72xx/gdm_usb.c
+++ b/drivers/staging/gdm72xx/gdm_usb.c
@@ -730,7 +730,7 @@ static int k_mode_thread(void *arg)
 			spin_unlock_irqrestore(&k_lock, flags2);
=20
 			expire =3D jiffies + K_WAIT_TIME;
-			while (jiffies < expire)
+			while (time_before(jiffies, expire))
 				schedule_timeout(K_WAIT_TIME);
=20
 			spin_lock_irqsave(&rx->lock, flags);
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
