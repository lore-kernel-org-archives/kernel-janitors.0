From: Mark Brown <broonie@kernel.org>
Date: Wed, 06 May 2020 14:55:27 +0000
Subject: Re: [PATCH -next] spi: bcm2835: Fix error return code in bcm2835_dma_init()
Message-Id: <158877692139.14713.15107842057895225626.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506125607.90952-1-weiyongjun1@huawei.com>
In-Reply-To: <20200506125607.90952-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, Wei Yongjun <weiyongjun1@huawei.com>, Florian Fainelli <f.fainelli@gmail.com>
Cc: kernel-janitors@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org

On Wed, 6 May 2020 12:56:07 +0000, Wei Yongjun wrote:
> Fix to return negative error code -ENOMEM from the dma mapping error
> handling case instead of 0, as done elsewhere in this function.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/spi/spi-bcm2835.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.8

Thanks!

[1/1] spi: bcm2835: Fix error return code in bcm2835_dma_init()
      commit: dd4441ab1fa1e2787a5f218f92d8ead1aa5ce6b5

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
