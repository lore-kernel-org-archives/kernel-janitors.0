From: Mark Brown <broonie@kernel.org>
Date: Mon, 08 Jun 2020 12:46:09 +0000
Subject: Re: [PATCH] ASoC: meson: fix memory leak of links if allocation of ldata fails
Message-Id: <159162036934.23368.2440967052610831030.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200604171216.60043-1-colin.king@canonical.com>
In-Reply-To: <20200604171216.60043-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Colin King <colin.king@canonical.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 4 Jun 2020 18:12:16 +0100, Colin King wrote:
> Currently if the allocation of ldata fails the error return path
> does not kfree the allocated links object.  Fix this by adding
> an error exit return path that performs the necessary kfree'ing.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: meson: fix memory leak of links if allocation of ldata fails
      commit: 6e801dc411329aff592fbd48fb116183d0acdb00

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
