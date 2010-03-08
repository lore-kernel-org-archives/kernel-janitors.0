From: Dan Carpenter <error27@gmail.com>
Date: Mon, 08 Mar 2010 13:39:24 +0000
Subject: [patch] rt2860: off by one errors
Message-Id: <20100308133923.GA18477@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The code is trying to say that if the offset is higher than the max it 
should be set to the max, but there is an off by one bug and it sets it 
one passed the end of the array.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/rt2860/sta_ioctl.c b/drivers/staging/rt2860/sta_ioctl.c
index de4b627..33a6939 100644
--- a/drivers/staging/rt2860/sta_ioctl.c
+++ b/drivers/staging/rt2860/sta_ioctl.c
@@ -1047,8 +1047,7 @@ int rt_ioctl_giwscan(struct net_device *dev,
 			if (tmpRate = 0x6c
 			    && pAdapter->ScanTab.BssEntry[i].HtCapabilityLen >
 			    0) {
-				int rate_count -				    sizeof(ralinkrate) / sizeof(__s32);
+				int rate_count = ARRAY_SIZE(ralinkrate);
 				struct rt_ht_cap_info capInfo  				    pAdapter->ScanTab.BssEntry[i].HtCapability.
 				    HtCapInfo;
@@ -1061,10 +1060,11 @@ int rt_ioctl_giwscan(struct net_device *dev,
 				int rate_index  				    12 + ((u8)capInfo.ChannelWidth * 24) +
 				    ((u8)shortGI * 48) + ((u8)maxMCS);
+
 				if (rate_index < 0)
 					rate_index = 0;
-				if (rate_index > rate_count)
-					rate_index = rate_count;
+				if (rate_index >= rate_count)
+					rate_index = rate_count - 1;
 				iwe.u.bitrate.value  				    ralinkrate[rate_index] * 500000;
 			}
@@ -2338,7 +2338,7 @@ int rt_ioctl_giwrate(struct net_device *dev,
 */
 	GET_PAD_FROM_NET_DEV(pAd, dev);
 
-	rate_count = sizeof(ralinkrate) / sizeof(__s32);
+	rate_count = ARRAY_SIZE(ralinkrate);
 	/*check if the interface is down */
 	if (!RTMP_TEST_FLAG(pAd, fRTMP_ADAPTER_INTERRUPT_IN_USE)) {
 		DBGPRINT(RT_DEBUG_TRACE, ("INFO::Network is down!\n"));
@@ -2369,8 +2369,8 @@ int rt_ioctl_giwrate(struct net_device *dev,
 	if (rate_index < 0)
 		rate_index = 0;
 
-	if (rate_index > rate_count)
-		rate_index = rate_count;
+	if (rate_index >= rate_count)
+		rate_index = rate_count - 1;
 
 	wrqu->bitrate.value = ralinkrate[rate_index] * 500000;
 	wrqu->bitrate.disabled = 0;
