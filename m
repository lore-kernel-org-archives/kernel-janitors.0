From: =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>
Date: Sun, 25 May 2014 13:05:24 +0000
Subject: [PATCH] rtl8188eu: use time_before/time_after and change type of ips_deny_time
Message-Id: <1401023124-28732-1-git-send-email-manuel.schoelling@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, =?UTF-8?q?Manuel=20Sch=C3=B6lling?= <manuel.schoelling@gmx.de>

To be future-proof and for better readability the time comparisons are
modified to use time_before/_after() instead of plain, error-prone math.
To suppress compiler warnings the type of ips_deny_time was changed.

Signed-off-by: Manuel Sch=C3=B6lling <manuel.schoelling@gmx.de>
---
 drivers/staging/rtl8188eu/core/rtw_pwrctrl.c    |    9 ++++++---
 drivers/staging/rtl8188eu/include/rtw_pwrctrl.h |    2 +-
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c b/drivers/staging=
/rtl8188eu/core/rtw_pwrctrl.c
index f658373..eaf2630 100644
--- a/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8188eu/core/rtw_pwrctrl.c
@@ -122,7 +122,7 @@ static bool rtw_pwr_unassociated_idle(struct adapter *a=
dapter)
=20
 	bool ret =3D false;
=20
-	if (adapter->pwrctrlpriv.ips_deny_time >=3D jiffies)
+	if (time_after_eq(adapter->pwrctrlpriv.ips_deny_time, jiffies))
 		goto exit;
=20
 	if (check_fwstate(pmlmepriv, WIFI_ASOC_STATE|WIFI_SITE_MONITOR) ||
@@ -523,9 +523,11 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_=
deffer_ms, const char *cal
 {
 	struct pwrctrl_priv *pwrpriv =3D &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv =3D &padapter->mlmepriv;
+	unsigned long expires;
 	int ret =3D _SUCCESS;
=20
-	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
+	expires =3D jiffies + rtw_ms_to_systime(ips_deffer_ms);
+	if (time_before(pwrpriv->ips_deny_time, expires))
 		pwrpriv->ips_deny_time =3D jiffies + rtw_ms_to_systime(ips_deffer_ms);
=20
 {
@@ -580,7 +582,8 @@ int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_d=
effer_ms, const char *cal
 	}
=20
 exit:
-	if (pwrpriv->ips_deny_time < jiffies + rtw_ms_to_systime(ips_deffer_ms))
+	expires =3D jiffies + rtw_ms_to_systime(ips_deffer_ms);
+	if (time_before(pwrpriv->ips_deny_time, expires))
 		pwrpriv->ips_deny_time =3D jiffies + rtw_ms_to_systime(ips_deffer_ms);
 	return ret;
 }
diff --git a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h b/drivers/stag=
ing/rtl8188eu/include/rtw_pwrctrl.h
index 9a42859..4211023 100644
--- a/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/rtl8188eu/include/rtw_pwrctrl.h
@@ -192,7 +192,7 @@ struct pwrctrl_priv {
 	u8	ips_mode_req;	/*  used to accept the mode setting request,
 				 *  will update to ipsmode later */
 	uint bips_processing;
-	u32 ips_deny_time; /* will deny IPS when system time less than this */
+	unsigned long ips_deny_time; /* will deny IPS when system time less than =
this */
 	u8 ps_processing; /* temp used to mark whether in rtw_ps_processor */
=20
 	u8	bLeisurePs;
--=20
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
