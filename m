From: Mark Brown <broonie@kernel.org>
Date: Mon, 29 Jun 2020 18:15:28 +0000
Subject: Re: [PATCH] MAINTAINERS: remove obsolete entry after file renaming
Message-Id: <159345452820.54333.17324184729359258423.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200628180229.5068-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200628180229.5068-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Seth Forshee <seth.forshee@canonical.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Support Opensource <support.opensource@diasemi.com>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>

On Sun, 28 Jun 2020 20:02:29 +0200, Lukas Bulwahn wrote:
> Commit f16861b12fa0 ("regulator: rename da903x to da903x-regulator") missed
> to adjust the DIALOG SEMICONDUCTOR DRIVERS section in MAINTAINERS.
> 
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
> 
>   warning: no file matches    F:    drivers/regulator/da903x.c
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] MAINTAINERS: remove obsolete entry after file renaming
      commit: 412847fb47336c58885ac6231a5f34ac7ac862a0

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
