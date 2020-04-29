From: Mark Brown <broonie@kernel.org>
Date: Wed, 29 Apr 2020 17:52:32 +0000
Subject: Re: [PATCH -next] spi: uniphier: fix error return code in uniphier_spi_probe()
Message-Id: <158818274449.17408.17250948289514421453.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429075855.104487-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429075855.104487-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org

On Wed, 29 Apr 2020 07:58:55 +0000, Wei Yongjun wrote:
> Fix to return negative error code -EPROBE_DEFER from the DMA probe defer
> error handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/spi/spi-uniphier.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: uniphier: fix error return code in uniphier_spi_probe()
      commit: 18168291aa7dd48e9d9e3cbb1d4cd06e899357ca

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
