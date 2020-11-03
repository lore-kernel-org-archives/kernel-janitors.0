From: Mark Brown <broonie@kernel.org>
Date: Tue, 03 Nov 2020 18:14:35 +0000
Subject: Re: [PATCH] ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
Message-Id: <160442726962.14840.1588435496192621655.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201103101853.GD1127762@mwanda>
In-Reply-To: <20201103101853.GD1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>

On Tue, 3 Nov 2020 13:18:53 +0300, Dan Carpenter wrote:
> This code is correct, but it should be indented one more tab.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: sc7180: Fix some indenting in sc7180_lpass_alloc_dma_channel()
      commit: 3d13ea9b8db71515d8f4795ec7a044e75999bd83

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
