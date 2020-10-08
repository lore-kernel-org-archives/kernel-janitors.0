From: Mark Brown <broonie@kernel.org>
Date: Thu, 08 Oct 2020 22:01:56 +0000
Subject: Re: [PATCH][next] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"
Message-Id: <160219448330.29664.4641489072692300066.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201006152024.542418-1-colin.king@canonical.com>
In-Reply-To: <20201006152024.542418-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Liam Girdwood <lgirdwood@gmail.com>, Colin King <colin.king@canonical.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-arm-kernel@lists.infradead.org, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, alsa-devel@alsa-project.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 6 Oct 2020 16:20:24 +0100, Colin King wrote:
> There is a spelling mistake in a dev_warn message. Fix it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mchp-spdifrx: fix spelling mistake "overrrun" -> "overrun"
      commit: 6db282c8a9edcbf84e699e45ec087baf07be2236

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
