From: Mark Brown <broonie@kernel.org>
Date: Mon, 14 Sep 2020 14:51:58 +0000
Subject: Re: [PATCH] spi: qup: remove redundant assignment to variable ret
Message-Id: <160009511676.5702.4493764455278443968.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200910150410.750959-1-colin.king@canonical.com>
In-Reply-To: <20200910150410.750959-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org, Colin King <colin.king@canonical.com>, Andy Gross <agross@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 10 Sep 2020 16:04:10 +0100, Colin King wrote:
> The variable ret is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: qup: remove redundant assignment to variable ret
      commit: 4a6c7d6f940107d6383291e2cb450039790b752d

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
