From: Julia Lawall <julia@diku.dk>
Date: Sun, 09 Nov 2008 16:56:34 +0000
Subject: [PATCH 7/8] drivers/staging/wlan-ng/p80211wext.c: use ARRAY_SIZE
Message-Id: <Pine.LNX.4.64.0811091756140.32509@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

ARRAY_SIZE is more concise to use when the size of an array is divided by
the size of its type or the size of its first element.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@i@
@@

#include <linux/kernel.h>

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(E[...]))
+ ARRAY_SIZE(E)

@depends on i using "paren.iso"@
type T;
T[] E;
@@

- (sizeof(E)/sizeof(T))
+ ARRAY_SIZE(E)
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/wlan-ng/p80211wext.c           |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211wext.c b/drivers/staging/wlan-ng/p80211wext.c
index 906ba43..b8f83eb 100644
--- a/drivers/staging/wlan-ng/p80211wext.c
+++ b/drivers/staging/wlan-ng/p80211wext.c
@@ -128,7 +128,7 @@ static const long p80211wext_channel_freq[] = {
 	2412, 2417, 2422, 2427, 2432, 2437, 2442,
 	2447, 2452, 2457, 2462, 2467, 2472, 2484
 };
-#define NUM_CHANNELS (sizeof(p80211wext_channel_freq) / sizeof(p80211wext_channel_freq[0]))
+#define NUM_CHANNELS ARRAY_SIZE(p80211wext_channel_freq)
 
 /* steal a spare bit to store the shared/opensystems state. should default to open if not set */
 #define HOSTWEP_SHAREDKEY BIT3
@@ -1852,7 +1852,7 @@ static iw_handler p80211wext_handlers[] =  {
 };
 
 struct iw_handler_def p80211wext_handler_def = {
-	.num_standard = sizeof(p80211wext_handlers) / sizeof(iw_handler),
+	.num_standard = ARRAY_SIZE(p80211wext_handlers),
 	.num_private = 0,
 	.num_private_args = 0,
         .standard = p80211wext_handlers,
