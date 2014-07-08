From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Jul 2014 10:54:23 +0000
Subject: [patch] staging: rtl8188eu: use GFP_ATOMIC under spinlock
Message-Id: <20140708105423.GA19737@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

We're holding a spinlock here so we can't do sleeping allocations.
The call tree is:
  rtw_sta_flush() <-- takes spin_lock_bh(&pstapriv->asoc_list_lock);
  --> ap_free_sta()
      --> rtw_clearstakey_cmd()

Originally these calls were rtw_zmalloc() and then we switched them to
kzalloc() in fadbe0cd5292 ('staging: rtl8188eu:Remove rtw_zmalloc(),
wrapper for kzalloc()') and that made the bugs show up for my static
checker.  The original code was buggy as well but my static checker
couldn't parse it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/rtl8188eu/core/rtw_cmd.c b/drivers/staging/rtl8188eu/core/rtw_cmd.c
index aeaa873..1222b9b 100644
--- a/drivers/staging/rtl8188eu/core/rtw_cmd.c
+++ b/drivers/staging/rtl8188eu/core/rtw_cmd.c
@@ -1106,20 +1106,20 @@ u8 rtw_clearstakey_cmd(struct adapter *padapter, u8 *psta, u8 entry, u8 enqueue)
 	if (!enqueue) {
 		clear_cam_entry(padapter, entry);
 	} else {
-		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_KERNEL);
+		ph2c = kzalloc(sizeof(struct cmd_obj), GFP_ATOMIC);
 		if (ph2c = NULL) {
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_KERNEL);
+		psetstakey_para = kzalloc(sizeof(struct set_stakey_parm), GFP_ATOMIC);
 		if (psetstakey_para = NULL) {
 			kfree(ph2c);
 			res = _FAIL;
 			goto exit;
 		}
 
-		psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_KERNEL);
+		psetstakey_rsp = kzalloc(sizeof(struct set_stakey_rsp), GFP_ATOMIC);
 		if (psetstakey_rsp = NULL) {
 			kfree(ph2c);
 			kfree(psetstakey_para);
