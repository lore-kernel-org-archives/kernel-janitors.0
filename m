From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 27 Oct 2018 13:34:41 +0000
Subject: [PATCH 0/3] constify snd_soc_dai_ops structures
Message-Id: <1540647284-26728-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The snd_soc_dai_ops structures are only stored in the ops field of a
snd_soc_dai_driver structure, so make the snd_soc_dai_ops structures
const as well.

Done with the help of Coccinelle.

---

 drivers/soundwire/intel.c        |    4 ++--
 sound/soc/codecs/ak4458.c        |    2 +-
 sound/soc/codecs/ak5558.c        |    2 +-
 sound/soc/codecs/hdac_hda.c      |    2 +-
 sound/soc/codecs/tas6424.c       |    2 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c |    8 ++++----
 6 files changed, 10 insertions(+), 10 deletions(-)
