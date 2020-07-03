From: Mark Brown <broonie@kernel.org>
Date: Fri, 03 Jul 2020 17:03:59 +0000
Subject: Re: [PATCH -next] ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()
Message-Id: <159379581381.55795.18016494611644548015.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200703030910.75047-1-weiyongjun1@huawei.com>
In-Reply-To: <20200703030910.75047-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Jaroslav Kysela <perex@perex.cz>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Hulk Robot <hulkci@huawei.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 3 Jul 2020 03:09:10 +0000, Wei Yongjun wrote:
> Add the missing unlock before return from function j721e_audio_hw_params()
> in the error handling case.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ti: j721e-evm: Fix missing unlock on error in j721e_audio_hw_params()
      commit: 59b44649a8f2380dfbf282db9922ef863c8812a6

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
