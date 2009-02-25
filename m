From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 21:29:29 +0000
Subject: [PATCH 6/7] sound/oss: fix sparse warnings: different signedness
Message-Id: <20090225212924.9226.68460.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Change signature of 'set_volume_stereo' and 'set_volume_mono'.

Fix this sparse warnings:
  sound/oss/pss.c:545:42: warning: incorrect type in argument 2 (different signedness)
  sound/oss/pss.c:546:42: warning: incorrect type in argument 3 (different signedness)
  sound/oss/pss.c:554:59: warning: incorrect type in argument 2 (different signedness)
  sound/oss/pss.c:560:59: warning: incorrect type in argument 2 (different signedness)
  sound/oss/pss.c:566:59: warning: incorrect type in argument 2 (different signedness)

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/oss/pss.c |   12 ++++++------
 1 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/oss/pss.c b/sound/oss/pss.c
index 902b39e..83f5ee2 100644
--- a/sound/oss/pss.c
+++ b/sound/oss/pss.c
@@ -457,10 +457,9 @@ static void pss_mixer_reset(pss_confdata *devc)
 	}
 }
 
-static int set_volume_mono(unsigned __user *p, int *aleft)
+static int set_volume_mono(unsigned __user *p, unsigned int *aleft)
 {
-	int left;
-	unsigned volume;
+	unsigned int left, volume;
 	if (get_user(volume, p))
 		return -EFAULT;
 	
@@ -471,10 +470,11 @@ static int set_volume_mono(unsigned __user *p, int *aleft)
 	return 0;
 }
 
-static int set_volume_stereo(unsigned __user *p, int *aleft, int *aright)
+static int set_volume_stereo(unsigned __user *p,
+			     unsigned int *aleft,
+			     unsigned int *aright)
 {
-	int left, right;
-	unsigned volume;
+	unsigned int left, right, volume;
 	if (get_user(volume, p))
 		return -EFAULT;
 

