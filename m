From: Mark Brown <broonie@kernel.org>
Date: Wed, 29 Apr 2020 17:52:24 +0000
Subject: Re: [PATCH -next] spi: spi-amd: Fix a NULL vs IS_ERR() check in amd_spi_probe()
Message-Id: <158818274449.17408.17312221145865344653.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200429025426.167664-1-weiyongjun1@huawei.com>
In-Reply-To: <20200429025426.167664-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Sanjay R Mehta <sanju.mehta@amd.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org

On Wed, 29 Apr 2020 02:54:26 +0000, Wei Yongjun wrote:
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
> 
> Fixes: bbb336f39efc ("spi: spi-amd: Add AMD SPI controller driver support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: spi-amd: Fix a NULL vs IS_ERR() check in amd_spi_probe()
      commit: f84b604dbaf242d17135f527dbe81093a41226b3

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
