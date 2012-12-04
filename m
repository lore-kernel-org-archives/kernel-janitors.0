From: Cyril Roelandt <tipecaml@gmail.com>
Date: Tue, 04 Dec 2012 20:08:36 +0000
Subject: [PATCH] staging: wlags49_h2: remove unneeded memset() in wireless_get_bssid()
Message-Id: <1354651717-27888-1-git-send-email-tipecaml@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, pe1dnn@amsat.org, gregkh@linuxfoundation.org, jkosina@suse.cz, yongjun_wei@trendmicro.com.cn, standby24x7@gmail.com, viro@zeniv.linux.org.uk, devel@driverdev.osuosl.org, Cyril Roelandt <tipecaml@gmail.com>

A few lines after this call, we memcpy over the same memory area, so the call to
memset is not necessary.

Signed-off-by: Cyril Roelandt <tipecaml@gmail.com>
---
 drivers/staging/wlags49_h2/wl_wext.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/wlags49_h2/wl_wext.c b/drivers/staging/wlags49_h2/wl_wext.c
index f553366..c731ff2 100644
--- a/drivers/staging/wlags49_h2/wl_wext.c
+++ b/drivers/staging/wlags49_h2/wl_wext.c
@@ -796,8 +796,6 @@ static int wireless_get_bssid(struct net_device *dev, struct iw_request_info *in
 
     	wl_act_int_off( lp );
 
-	memset( &ap_addr->sa_data, 0, ETH_ALEN );
-
 	ap_addr->sa_family = ARPHRD_ETHER;
 
 	/* Assume AP mode here, which means the BSSID is our own MAC address. In
-- 
1.7.10.4

