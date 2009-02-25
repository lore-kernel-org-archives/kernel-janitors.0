From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 21:29:15 +0000
Subject: [PATCH 5/7] sound/drivers/vx: fix sparse warning: different signedness
Message-Id: <20090225212907.9226.10636.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  sound/drivers/vx/vx_uer.c:301:42: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/drivers/vx/vx_uer.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/drivers/vx/vx_uer.c b/sound/drivers/vx/vx_uer.c
index 0e1ba9b..b0560fe 100644
--- a/sound/drivers/vx/vx_uer.c
+++ b/sound/drivers/vx/vx_uer.c
@@ -103,7 +103,7 @@ static void vx_write_one_cbit(struct vx_core *chip, int index, int val)
  * returns the frequency of UER, or 0 if not sync,
  * or a negative error code.
  */
-static int vx_read_uer_status(struct vx_core *chip, int *mode)
+static int vx_read_uer_status(struct vx_core *chip, unsigned int *mode)
 {
 	int val, freq;
 

