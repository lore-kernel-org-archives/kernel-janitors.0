From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Tue, 17 May 2016 14:38:43 +0000
Subject: [PATCH 4/7] staging: wilc1000: fix typo
Message-Id: <1463495926-13728-5-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1463495926-13728-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johnny Kim <johnny.kim@atmel.com>
Cc: kernel-janitors@vger.kernel.org, Austin Shin <austin.shin@atmel.com>, Chris Park <chris.park@atmel.com>, Tony Cho <tony.cho@atmel.com>, Glen Lee <glen.lee@atmel.com>, Leo Kim <leo.kim@atmel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

firmare -> firmware

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/staging/wilc1000/linux_wlan.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/wilc1000/linux_wlan.c b/drivers/staging/wilc1000/linux_wlan.c
index 4f93c11..274c390 100644
--- a/drivers/staging/wilc1000/linux_wlan.c
+++ b/drivers/staging/wilc1000/linux_wlan.c
@@ -362,7 +362,7 @@ int wilc_wlan_get_firmware(struct net_device *dev)
 		goto _fail_;
 
 	if (request_firmware(&wilc_firmware, firmware, wilc->dev) != 0) {
-		netdev_err(dev, "%s - firmare not available\n", firmware);
+		netdev_err(dev, "%s - firmware not available\n", firmware);
 		ret = -1;
 		goto _fail_;
 	}

