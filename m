From: Colin King <colin.king@canonical.com>
Date: Tue, 14 Jan 2020 18:16:04 +0000
Subject: [PATCH] staging: wlan-ng: ensure error return is actually returned
Message-Id: <20200114181604.390235-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Currently when the call to prism2sta_ifst fails a netdev_err error
is reported, error return variable result is set to -1 but the
function always returns 0 for success.  Fix this by returning
the error value in variable result rather than 0.

Addresses-Coverity: ("Unused value")
Fixes: 00b3ed168508 ("Staging: add wlan-ng prism2 usb driver")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wlan-ng/prism2mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2mgmt.c b/drivers/staging/wlan-ng/prism2mgmt.c
index 7350fe5d96a3..a8860d2aee68 100644
--- a/drivers/staging/wlan-ng/prism2mgmt.c
+++ b/drivers/staging/wlan-ng/prism2mgmt.c
@@ -959,7 +959,7 @@ int prism2mgmt_flashdl_state(struct wlandevice *wlandev, void *msgp)
 		}
 	}
 
-	return 0;
+	return result;
 }
 
 /*----------------------------------------------------------------
-- 
2.24.0
