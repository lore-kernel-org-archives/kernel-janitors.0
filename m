From: Mark Brown <broonie@kernel.org>
Date: Mon, 16 Nov 2020 23:33:15 +0000
Subject: Re: [PATCH] ASoC: qcom: sc7180: initialize the "no_headphone" variable
Message-Id: <160556956526.29683.11951945809418219234.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201116125950.GA44063@mwanda>
In-Reply-To: <20201116125950.GA44063@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, xuyuqing <xuyuqing@huaqin.corp-partner.google.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>

On Mon, 16 Nov 2020 15:59:50 +0300, Dan Carpenter wrote:
> The "no_headphone" variable is never set to "false" so it could be
> uninitialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: initialize the "no_headphone" variable
      commit: 7141f25f14e03a0b049ffb2010b12abf652a10f3

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
