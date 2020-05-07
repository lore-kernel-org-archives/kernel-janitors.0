From: Mark Brown <broonie@kernel.org>
Date: Thu, 07 May 2020 12:18:19 +0000
Subject: Re: [PATCH -next] ASoC: rt5677: Use devm_snd_soc_register_component()
Message-Id: <158885389338.38935.14311915230086603146.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200507094335.14302-1-weiyongjun1@huawei.com>
In-Reply-To: <20200507094335.14302-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>, Takashi Iwai <tiwai@suse.com>, Oder Chiou <oder_chiou@realtek.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 7 May 2020 09:43:35 +0000, Wei Yongjun wrote:
> Using devm_snd_soc_register_component() can make the code
> shorter and cleaner.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  sound/soc/codecs/rt5677-spi.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: rt5677: Use devm_snd_soc_register_component()
      commit: 9558ad215509b75c72c84f4f7691f1bd80fda42a

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
