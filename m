From: Mark Brown <broonie@kernel.org>
Date: Thu, 21 Jan 2021 00:05:34 +0000
Subject: Re: [PATCH] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
Message-Id: <161118753484.45718.1419483152294927470.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAf+8QZoOv+ct526@mwanda>
In-Reply-To: <YAf+8QZoOv+ct526@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Wed, 20 Jan 2021 12:59:13 +0300, Dan Carpenter wrote:
> The allocation uses sizeof(u32) when it should use sizeof(unsigned long)
> so it leads to memory corruption later in the function when the data is
> initialized.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
      commit: 543466ef3571069b8eb13a8ff7c7cfc8d8a75c43

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
