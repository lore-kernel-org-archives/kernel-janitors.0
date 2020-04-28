From: Mark Brown <broonie@kernel.org>
Date: Tue, 28 Apr 2020 15:41:13 +0000
Subject: Re: [PATCH -next] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
Message-Id: <158808847385.38342.17859489811900791487.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428110742.110335-1-weiyongjun1@huawei.com>
In-Reply-To: <20200428110742.110335-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jonathan Hunter <jonathanh@nvidia.com>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Wei Yongjun <weiyongjun1@huawei.com>, Thierry Reding <thierry.reding@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Tue, 28 Apr 2020 11:07:42 +0000, Wei Yongjun wrote:
> Using devm_snd_soc_register_card() can make the code
> shorter and cleaner.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/tegra/tegra_wm8903.c | 14 ++------------
>  1 file changed, 2 insertions(+), 12 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: tegra: tegra_wm8903: Use devm_snd_soc_register_card()
      commit: ac3367442d9e5971e32014c6fea41ca1662c0e2d

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
