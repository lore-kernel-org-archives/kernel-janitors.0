From: Maximiliano David Bustos <md.bustos90@gmail.com>
Date: Mon, 08 Nov 2010 20:34:57 +0000
Subject: [PATCH 1/2] Staging: wlan-ng: Fix wrong #ifdef #endif sequence
Message-Id: <1289248497-10758-1-git-send-email-md.bustos90@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch fixes bug #13820 from bugzilla.kernel.org. Quote: "If ETHTOOL_GLINK
    is not defined, the end for switch case is not to be found."
Signed-off-by: Maximiliano David Bustos <md.bustos90@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index aa1792c..b7b4a73 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -522,8 +522,8 @@ static int p80211netdev_ethtool(wlandevice_t *wlandev, void __user *useraddr)
 		if (copy_to_user(useraddr, &edata, sizeof(edata)))
 			return -EFAULT;
 		return 0;
-	}
 #endif
+	}
 
 	return -EOPNOTSUPP;
 }
-- 
1.7.1

