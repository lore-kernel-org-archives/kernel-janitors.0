From: Colin King <colin.king@canonical.com>
Date: Fri, 12 Oct 2018 22:31:37 +0000
Subject: [PATCH] staging: rtl8188eu: fix spelling mistake "EINPROGESS" -> "EINPROGRESS"
Message-Id: <20181012223137.26433-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180926133405.31199-1-colin.king@canonical.com>
In-Reply-To: <20180926133405.31199-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Michael Straube <straube.linux@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in RT_TRACE message text.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
index 43f031d644fd..d6a499692e96 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_ops_linux.c
@@ -606,7 +606,7 @@ static void usb_write_port_complete(struct urb *purb, struct pt_regs *regs)
 		if ((purb->status = -EPIPE) || (purb->status = -EPROTO)) {
 			sreset_set_wifi_error_status(padapter, USB_WRITE_PORT_FAIL);
 		} else if (purb->status = -EINPROGRESS) {
-			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete: EINPROGESS\n"));
+			RT_TRACE(_module_hci_ops_os_c_, _drv_err_, ("usb_write_port_complete: EINPROGRESS\n"));
 			goto check_completion;
 		} else if (purb->status = -ENOENT) {
 			DBG_88E("%s: -ENOENT\n", __func__);
-- 
2.17.1
