From: Mark Brown <broonie@kernel.org>
Date: Tue, 18 Aug 2020 16:57:10 +0000
Subject: Re: [PATCH] spi: a3700: Remove a useless memset
Message-Id: <159776983046.56565.184336045961597730.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200802175007.703995-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200802175007.703995-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2 Aug 2020 19:50:07 +0200, Christophe JAILLET wrote:
> Memory allocated by 'spi_alloc_master()' is already zeroed.
> Remove a redundant memset.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: a3700: Remove a useless memset
      commit: 2494174e04e7f4e58d1363adb13c0ae23b64d37c

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
