From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 30 Aug 2015 18:05:09 +0000
Subject: [PATCH 0/2] change PTR_ERR argument
Message-Id: <1440957911-7687-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org
Cc: Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org

Apply PTR_ERR to the value that was recently assigned.

---

 var/julia/linuxcopy/drivers/spi/spi-ep93xx.c   |    3 ++-
 var/julia/linuxcopy/sound/soc/qcom/lpass-cpu.c |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)
