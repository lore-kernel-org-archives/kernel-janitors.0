From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 21:28:45 +0000
Subject: [PATCH 3/7] sound/pci/hda: fix sparse warning: different signedness
Message-Id: <20090225212834.9226.76824.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Fix this sparse warning:
  sound/pci/hda/hda_codec.c:1544:19: warning: incorrect type in assignment (different signedness)
  sound/pci/hda/hda_codec.c:1544:19:    expected unsigned long *vals
  sound/pci/hda/hda_codec.c:1544:19:    got long *<noident>

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 sound/pci/hda/hda_local.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sound/pci/hda/hda_local.h b/sound/pci/hda/hda_local.h
index 4bd82a3..03ee9dd 100644
--- a/sound/pci/hda/hda_local.h
+++ b/sound/pci/hda/hda_local.h
@@ -136,7 +136,7 @@ extern struct hda_ctl_ops snd_hda_bind_sw;	/* for bind-switch */
 
 struct hda_bind_ctls {
 	struct hda_ctl_ops *ops;
-	long values[];
+	unsigned long values[];
 };
 
 int snd_hda_mixer_bind_ctls_info(struct snd_kcontrol *kcontrol,

