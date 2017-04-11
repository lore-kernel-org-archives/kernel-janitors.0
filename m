From: Colin King <colin.king@canonical.com>
Date: Tue, 11 Apr 2017 13:31:20 +0000
Subject: [PATCH] staging: rtl8723bs: fix spelling mistakes in RT_TRACE messages
Message-Id: <20170411133120.20908-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170411131708.20268-1-colin.king@canonical.com>
In-Reply-To: <20170411131708.20268-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, Hans de Goede <hdegoede@redhat.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Fix a few spelling mistakes in RT_TRACE messages and split up
wide lines to span multiple lines

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 4 +++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 4 +++-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c    | 3 ++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 073b0875fdca..e0793f8d329d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -622,7 +622,9 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 		break;
 	}
 
-	RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_info_, ("rtw_set_802_11_add_wep:befor memcpy, wep->KeyLength = 0x%x wep->KeyIndex = 0x%x  keyid =%x\n", wep->KeyLength, wep->KeyIndex, keyid));
+	RT_TRACE(_module_rtl871x_ioctl_set_c_, _drv_info_,
+		 ("rtw_set_802_11_add_wep:before memcpy, wep->KeyLength = 0x%x wep->KeyIndex = 0x%x  keyid =%x\n",
+		  wep->KeyLength, wep->KeyIndex, keyid));
 
 	memcpy(&(psecuritypriv->dot11DefKey[keyid].skey[0]), &(wep->KeyMaterial), wep->KeyLength);
 
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 18e78d5198c3..0de56ec9ecc9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -6677,7 +6677,9 @@ u8 mlme_evt_hdl(struct adapter *padapter, unsigned char *pbuf)
 	#ifdef CHECK_EVENT_SEQ
 	/*  checking event sequence... */
 	if (evt_seq != (atomic_read(&pevt_priv->event_seq) & 0x7f)) {
-		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_, ("Evetn Seq Error! %d vs %d\n", (evt_seq & 0x7f), (atomic_read(&pevt_priv->event_seq) & 0x7f)));
+		RT_TRACE(_module_rtl871x_cmd_c_, _drv_info_,
+			 ("Event Seq Error! %d vs %d\n", (evt_seq & 0x7f),
+			  (atomic_read(&pevt_priv->event_seq) & 0x7f)));
 
 		pevt_priv->event_seq = (evt_seq+1)&0x7f;
 
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 843be2cc6c10..f83cfc76505c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1275,7 +1275,8 @@ void rtw_dev_unload(struct adapter *padapter)
 			}
 			padapter->bSurpriseRemoved = true;
 		}
-		RT_TRACE(_module_hci_intfs_c_, _drv_notice_, ("@ %s: deinit hal complelt!\n", __func__));
+		RT_TRACE(_module_hci_intfs_c_, _drv_notice_,
+			 ("@ %s: deinit hal complete!\n", __func__));
 
 		padapter->bup = false;
 
-- 
2.11.0

