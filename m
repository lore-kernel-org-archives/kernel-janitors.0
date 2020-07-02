From: Mark Brown <broonie@kernel.org>
Date: Thu, 02 Jul 2020 15:47:07 +0000
Subject: Re: [PATCH][next] regulator: fix null pointer check on regmap
Message-Id: <159370481231.5599.12177973052182986447.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200702115659.38208-1-colin.king@canonical.com>
In-Reply-To: <20200702115659.38208-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Gross <agross@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Wesley Cheng <wcheng@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2 Jul 2020 12:56:59 +0100, Colin King wrote:
> The null pointer check on regmap that checks for a dev_get_regmap failure
> is currently returning -ENOENT if the regmap succeeded. Fix this by adding
> in the missing ! operator.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fix null pointer check on regmap
      commit: 94462138f368a5e079d53d578509276e4366d0c1

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
