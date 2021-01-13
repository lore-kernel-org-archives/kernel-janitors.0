From: Mark Brown <broonie@kernel.org>
Date: Wed, 13 Jan 2021 15:26:43 +0000
Subject: Re: [PATCH] ASoC: cs42l56: fix up error handling in probe
Message-Id: <161055160365.21623.3967340008515664713.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NE/9nK9/TuxuL+@mwanda>
In-Reply-To: <X9NE/9nK9/TuxuL+@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian Austin <brian.austin@cirrus.com>, Dan Carpenter <dan.carpenter@oracle.com>, James Schulman <james.schulman@cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>

On Fri, 11 Dec 2020 13:07:59 +0300, Dan Carpenter wrote:
> There are two issues with this code.  The first error path forgot to set
> the error code and instead returns success.  The second error path
> doesn't clean up.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs42l56: fix up error handling in probe
      commit: 856fe64da84c95a1d415564b981ae3908eea2a76

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
