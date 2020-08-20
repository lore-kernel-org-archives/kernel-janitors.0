From: Mark Brown <broonie@kernel.org>
Date: Thu, 20 Aug 2020 21:48:12 +0000
Subject: Re: [PATCH][next] ASoC: qcom: add missing out of memory check on drvdata->clks allocation
Message-Id: <159796008815.44152.14467897806901945440.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200819160103.164893-1-colin.king@canonical.com>
In-Reply-To: <20200819160103.164893-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, alsa-devel@alsa-project.org, Colin King <colin.king@canonical.com>, Jaroslav Kysela <perex@perex.cz>, Banajit Goswami <bgoswami@codeaurora.org>, Takashi Iwai <tiwai@suse.com>, Ajit Pandey <ajitp@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Rohit kumar <rohitkr@codeaurora.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 19 Aug 2020 17:01:03 +0100, Colin King wrote:
> Currently drvdata->clks is not being checked for an allocation failure,
> leading to potential null pointer dereferencing. Fix this by adding a
> check and returning -ENOMEM if an error occurred.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: add missing out of memory check on drvdata->clks allocation
      commit: a467f2f8ad5f9a21f92b3fa6ad2aac90fa7054fe

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
