From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Apr 2020 13:08:13 +0000
Subject: Re: [PATCH -next v2] spi: spi-fsl-qspi: Fix return value check of devm_ioremap() in probe
Message-Id: <158756089381.21648.5729614569863821840.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200421093908.48213-1-weiyongjun1@huawei.com> <20200422014543.111070-1-weiyongjun1@huawei.com>
In-Reply-To: <20200422014543.111070-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Ashish Kumar <Ashish.Kumar@nxp.com>, Han Xu <han.xu@nxp.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org

On Wed, 22 Apr 2020 01:45:43 +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap() returns NULL pointer not
> ERR_PTR(). The IS_ERR() test in the return value check should be
> replaced with NULL test.
> 
> Fixes: 858e26a515c2 ("spi: spi-fsl-qspi: Reduce devm_ioremap size to 4 times AHB buffer size")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> Reviewed-by: Ashish Kumar <Ashish.Kumar@nxp.com>
> Acked-by: Han Xu <han.xu@nxp.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: spi-fsl-qspi: Fix return value check of devm_ioremap() in probe
      commit: f58dcab68aa57e74c12c9bec7ff1bb73e0b35143

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
