From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Oct 2020 12:40:09 +0000
Subject: Re: [PATCH][next] ASoC: qcom: fix unsigned int bitwidth compared to less than zero
Message-Id: <160397520896.55401.11950538848257876856.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201028115112.109017-1-colin.king@canonical.com>
In-Reply-To: <20201028115112.109017-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick Lai <plai@codeaurora.org>, Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>, V Sujith Kumar Reddy <vsujithk@codeaurora.org>, Takashi Iwai <tiwai@suse.com>, Banajit Goswami <bgoswami@codeaurora.org>, Jaroslav Kysela <perex@perex.cz>, Srinivasa Rao <srivasam@codeaurora.org>, alsa-devel@alsa-project.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, 28 Oct 2020 11:51:12 +0000, Colin King wrote:
> The check for an error return from the call to snd_pcm_format_width
> is never true as the unsigned int bitwidth can never be less than
> zero. Fix this by making bitwidth an int.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: fix unsigned int bitwidth compared to less than zero
      commit: bcc96dc3cf8048c80af7c487af17e19be27ac57d

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
