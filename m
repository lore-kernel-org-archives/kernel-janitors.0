From: Mark Brown <broonie@kernel.org>
Date: Fri, 03 Jul 2020 17:03:48 +0000
Subject: Re: [PATCH][next] ASoC: Intel: bxt-da7219-max98357a: return -EINVAL on unrecognized speaker amplifie
Message-Id: <159379581380.55795.4909094479360848314.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702114835.37889-1-colin.king@canonical.com>
In-Reply-To: <20200702114835.37889-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>, Colin King <colin.king@canonical.com>, Brent Lu <brent.lu@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2 Jul 2020 12:48:35 +0100, Colin King wrote:
> Currently if the ctx->spkamp is not recognized an error message is
> reported but the code continues to set up the device with uninitialized
> variables such as the number of widgets.  Fix this by returning -EINVAL
> for unrecognized speaker amplifier types.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: bxt-da7219-max98357a: return -EINVAL on unrecognized speaker amplifier
      commit: c950e9fcc79b8fedd3126ede4dcd70add8ea5339

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
