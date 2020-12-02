From: Mark Brown <broonie@kernel.org>
Date: Wed, 02 Dec 2020 17:19:24 +0000
Subject: Re: [PATCH] ASoC: codecs: lpass-va-macro: remove some dead code
Message-Id: <160692956495.33960.17489548804315513103.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X8c5gjZO7YN/CFsq@mwanda>
In-Reply-To: <X8c5gjZO7YN/CFsq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Takashi Iwai <tiwai@suse.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

On Wed, 2 Dec 2020 09:51:46 +0300, Dan Carpenter wrote:
> The "decimator" variable is in the 0-7 range and it's unsigned so there
> is no need to check for negative values.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: lpass-va-macro: remove some dead code
      commit: 4d638b9cc79eff11bad13fb3715c0ef38a9edaec

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
