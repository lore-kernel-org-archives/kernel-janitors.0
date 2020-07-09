From: Mark Brown <broonie@kernel.org>
Date: Thu, 09 Jul 2020 22:00:49 +0000
Subject: Re: [PATCH][next] spi: atmel: remove redundant label out_free
Message-Id: <159433204447.479.12927777803570869971.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709101203.1374117-1-colin.king@canonical.com>
In-Reply-To: <20200709101203.1374117-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Ludovic Desroches <ludovic.desroches@microchip.com>, Colin King <colin.king@canonical.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-spi@vger.kernel.org, Tudor Ambarus <tudor.ambarus@microchip.com>, linux-arm-kernel@lists.infradead.org, Peng Fan <fanpeng@loongson.cn>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 9 Jul 2020 11:12:03 +0100, Colin King wrote:
> The error exit label out_free is no longer being used, it is redundant
> and can be removed.
> 
> Cleans up warning:
> drivers/spi/spi-atmel.c:1680:1: warning: label ‘out_free’ defined but not used [-Wunused-label]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: atmel: remove redundant label out_free
      commit: 50f06cb1dd82f13a1d3897a327dcd7963ea75707

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
