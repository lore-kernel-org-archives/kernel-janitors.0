From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Wed, 23 Jul 2014 10:47:33 +0000
Subject: [PATCH] drivers/staging/bcm/Misc.c: fix a check
Message-Id: <1406112453-2393-1-git-send-email-andrey.krieger.utkin@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: standby24x7@gmail.com, lisa@xenapiadmin.com, sulamiification@gmail.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, dcb314@hotmail.com, Andrey Utkin <andrey.krieger.utkin@gmail.com>

The issue was reported by static analysis.
The value holding flags was &-ed with 0x02, being compared to 0x01
(TRUE) after that. Such comparsion is always false.

Resolution: drop the comparsion to TRUE in the condition.

&-ing with 0x02 is right, according to result variable name
(reporting_mode) and description in drivers/staging/bcm/target_params.h
("bit 1 =3D 1: CINR reporting in Idlemode Msg").

Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=80801
Reported-by: David Binderman <dcb314@hotmail.com>
Signed-off-by: Andrey Utkin <andrey.krieger.utkin@gmail.com>
---
 drivers/staging/bcm/Misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/bcm/Misc.c b/drivers/staging/bcm/Misc.c
index a1c833c..883f739 100644
--- a/drivers/staging/bcm/Misc.c
+++ b/drivers/staging/bcm/Misc.c
@@ -1154,7 +1154,7 @@ static void doPowerAutoCorrection(struct bcm_mini_ada=
pter *psAdapter)
 	reporting_mode =3D ntohl(psAdapter->pstargetparams->m_u32PowerSavingModeO=
ptions) & 0x02;
 	psAdapter->bIsAutoCorrectEnabled =3D !((char)(psAdapter->ulPowerSaveMode =
>> 3) & 0x1);
=20
-	if (reporting_mode =3D TRUE) {
+	if (reporting_mode) {
 		BCM_DEBUG_PRINT(psAdapter, DBG_TYPE_INITEXIT, MP_INIT, DBG_LVL_ALL, "can=
't do suspen/resume as reporting mode is enable");
 		psAdapter->bDoSuspend =3D false;
 	}
--=20
1.8.5.5

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
