From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Wed, 11 Mar 2015 16:56:30 +0000
Subject: [PATCH 8/15] libertas_tf: if_usb.c: don't export static symbol
Message-Id: <1426092997-30605-9-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1426092997-30605-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, daniel@iogearbox.net

From: Julia Lawall <Julia.Lawall@lip6.fr>

The semantic patch that fixes this problem is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@r@
type T;
identifier f;
@@

static T f (...) { ... }

@@
identifier r.f;
declarer name EXPORT_SYMBOL_GPL;
@@

-EXPORT_SYMBOL_GPL(f);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/net/wireless/libertas_tf/if_usb.c |    2 --
 1 file changed, 2 deletions(-)

diff -u -p a/drivers/net/wireless/libertas_tf/if_usb.c b/drivers/net/wireless/libertas_tf/if_usb.c
--- a/drivers/net/wireless/libertas_tf/if_usb.c
+++ b/drivers/net/wireless/libertas_tf/if_usb.c
@@ -365,7 +365,6 @@ static int if_usb_reset_device(struct if
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(if_usb_reset_device);
 
 /**
  *  usb_tx_block - transfer data to the device
@@ -907,7 +906,6 @@ restart:
 	lbtf_deb_leave_args(LBTF_DEB_USB, "ret %d", ret);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(if_usb_prog_firmware);
 
 
 #define if_usb_suspend NULL

