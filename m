From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Wed, 21 May 2014 17:16:36 +0000
Subject: [PATCH] lustre: Use time_before()
Message-Id: <1400692596-13875-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org
Cc: bergwolf@gmail.com, andreas.dilger@intel.com, manuel.schoelling@gmx.de, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

To be future-proof and for better readability the time comparisons are modi=
fied
to use time_before() instead of plain, error-prone math.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/staging/lustre/lustre/include/linux/obd.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/lustre/lustre/include/linux/obd.h b/drivers/st=
aging/lustre/lustre/include/linux/obd.h
index dc36f75e..518e48a 100644
--- a/drivers/staging/lustre/lustre/include/linux/obd.h
+++ b/drivers/staging/lustre/lustre/include/linux/obd.h
@@ -80,8 +80,8 @@ static inline void __client_obd_list_lock(client_obd_lock=
_t *lock,
 			break;
 		}
=20
-		if ((jiffies - cur > 5 * HZ) &&
-		    (jiffies - lock->time > 5 * HZ)) {
+		if (time_before(cur + 5 * HZ, jiffies) &&
+		    time_before(lock->time + 5 * HZ, jiffies)) {
 			struct task_struct *task =3D lock->task;
=20
 			if (task =3D NULL)
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
