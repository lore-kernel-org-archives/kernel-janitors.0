From: Christoph Fritz <chf.fritz@googlemail.com>
Date: Sun, 08 May 2011 09:55:07 +0000
Subject: [PATCH] mfd: WL1273 FM Radio: remove unused variable
Message-Id: <1304848507.2755.4.camel@mars>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

This patch removes an unused variable in wl1273_fm_set_volume().

Signed-off-by: Christoph Fritz <chf.fritz@googlemail.com>
---
 drivers/mfd/wl1273-core.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/mfd/wl1273-core.c b/drivers/mfd/wl1273-core.c
index 04914f2..37af778 100644
--- a/drivers/mfd/wl1273-core.c
+++ b/drivers/mfd/wl1273-core.c
@@ -153,7 +153,6 @@ out:
  */
 static int wl1273_fm_set_volume(struct wl1273_core *core, unsigned int volume)
 {
-	u16 val;
 	int r;
 
 	if (volume > WL1273_MAX_VOLUME)
-- 
1.7.2.3



