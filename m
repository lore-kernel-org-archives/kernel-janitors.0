From: Hannes Eder <hannes@hanneseder.net>
Date: Wed, 25 Feb 2009 21:26:34 +0000
Subject: [PATCH 0/7] sound: fix sparse warnings
Message-Id: <20090225212551.9226.64699.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

The following series fixes some sparse warnings in sound/.

---

Hannes Eder (7):
      sound/oss: fix sparse warning: symbol shadows an earlier one
      sound/oss: fix sparse warnings: different signedness
      sound/drivers/vx: fix sparse warning: different signedness
      sound/pci/emu10k1: fix sparse warning: different signedness
      sound/pci/hda: fix sparse warning: different signedness
      sound/usb/usx2y: fix sparse warning: do-while statement is not a compound ...
      sound/usb/usx2y: fix sparse warning: Should it be static?


 sound/drivers/vx/vx_uer.c        |    2 +-
 sound/oss/pss.c                  |   12 ++++++------
 sound/oss/sequencer.c            |    3 +--
 sound/pci/emu10k1/emu10k1_main.c |   10 ++++------
 sound/pci/hda/hda_local.h        |    2 +-
 sound/usb/usx2y/usX2Yhwdep.c     |    3 ---
 sound/usb/usx2y/usbusx2y.c       |    4 ++--
 sound/usb/usx2y/usx2yhwdeppcm.h  |    2 ++
 8 files changed, 17 insertions(+), 21 deletions(-)
