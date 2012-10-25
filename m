From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 25 Oct 2012 12:30:06 +0000
Subject: [patch] staging: r8712u: cleanup pointer type in r8712_setassocsta_cmd()
Message-Id: <20121025123006.GB20595@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This seems like a cut and paste bug.  Smatch complains that we don't
allocate enough memory for a set_stakey_rsp struct.  In fact this is
used as a set_assocsta_rsp struct throughout and that also matches the
name of the function.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
index 659683e..31f31dbf 100644
--- a/drivers/staging/rtl8712/rtl871x_cmd.c
+++ b/drivers/staging/rtl8712/rtl871x_cmd.c
@@ -814,7 +814,7 @@ u8 r8712_setassocsta_cmd(struct _adapter *padapter, u8 *mac_addr)
 	struct cmd_priv			*pcmdpriv = &padapter->cmdpriv;
 	struct cmd_obj			*ph2c;
 	struct set_assocsta_parm	*psetassocsta_para;
-	struct set_stakey_rsp		*psetassocsta_rsp = NULL;
+	struct set_assocsta_rsp		*psetassocsta_rsp = NULL;
 
 	ph2c = (struct cmd_obj *)_malloc(sizeof(struct cmd_obj));
 	if (ph2c = NULL)
@@ -825,7 +825,7 @@ u8 r8712_setassocsta_cmd(struct _adapter *padapter, u8 *mac_addr)
 		kfree((u8 *) ph2c);
 		return _FAIL;
 	}
-	psetassocsta_rsp = (struct set_stakey_rsp *)_malloc(
+	psetassocsta_rsp = (struct set_assocsta_rsp *)_malloc(
 			    sizeof(struct set_assocsta_rsp));
 	if (psetassocsta_rsp = NULL) {
 		kfree((u8 *)ph2c);
