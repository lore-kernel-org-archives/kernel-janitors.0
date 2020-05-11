From: Mark Brown <broonie@kernel.org>
Date: Mon, 11 May 2020 17:21:58 +0000
Subject: Re: [PATCH -next] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
Message-Id: <158921769453.22432.2365518895564552869.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507115550.139457-1-weiyongjun1@huawei.com>
In-Reply-To: <20200507115550.139457-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sanjay R Mehta <sanju.mehta@amd.com>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: kernel-janitors@vger.kernel.org, linux-spi@vger.kernel.org, Hulk Robot <hulkci@huawei.com>

On Thu, 7 May 2020 11:55:50 +0000, Wei Yongjun wrote:
> The call to spi_master_put() in amd_spi_remove() is redundant and
> may causes user after free since the master have been freed by
> spi_unregister_master(), so remove it.

Applied to

   local tree spi/for-5.7

Thanks!

[1/1] spi: spi-amd: Remove spi_master_put in amd_spi_remove()
      (no commit info)

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
