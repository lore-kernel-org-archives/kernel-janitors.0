From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 04 Jan 2015 13:00:22 +0000
Subject: [PATCH 4/13] ALSA: oxygen: Delete an unnecessary check before the function call "snd_pcm_suspend"
Message-Id: <54A93966.7050900@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <54A9355F.4050102@users.sourceforge.net>
In-Reply-To: <54A9355F.4050102@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Clemens Ladisch <clemens@ladisch.de>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
Cc: Julia Lawall <julia.lawall@lip6.fr>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Jan 2015 17:37:28 +0100

The snd_pcm_suspend() function tests whether its argument is NULL and then
returns immediately. Thus the test around the call is not needed.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 sound/pci/oxygen/oxygen_lib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/oxygen/oxygen_lib.c b/sound/pci/oxygen/oxygen_lib.c
index b67e306..61a62c0 100644
--- a/sound/pci/oxygen/oxygen_lib.c
+++ b/sound/pci/oxygen/oxygen_lib.c
@@ -736,8 +736,7 @@ static int oxygen_pci_suspend(struct device *dev)
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
 
 	for (i = 0; i < PCM_COUNT; ++i)
-		if (chip->streams[i])
-			snd_pcm_suspend(chip->streams[i]);
+		snd_pcm_suspend(chip->streams[i]);
 
 	if (chip->model.suspend)
 		chip->model.suspend(chip);
-- 
2.2.1

