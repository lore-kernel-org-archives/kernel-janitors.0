From: Mark Brown <broonie@kernel.org>
Date: Tue, 12 May 2020 16:44:56 +0000
Subject: Re: [PATCH] ASoC: ux500: mop500: Fix some refcounted resources issues
Message-Id: <158930188456.55827.11720310632308061350.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200512100705.246349-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200512100705.246349-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lee.jones@linaro.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linus.walleij@linaro.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 12 May 2020 12:07:05 +0200, Christophe JAILLET wrote:
> There are 2 issues here:
>    - if one of the 'of_parse_phandle' fails, calling 'mop500_of_node_put()'
>      is a no-op because the 'mop500_dai_links' structure has not been
>      initialized yet, so the referenced are not decremented
>    - The reference stored in 'mop500_dai_links[i].codecs' is refcounted
>      only once in the probe and must be decremented only once.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: ux500: mop500: Fix some refcounted resources issues
      commit: 4e8748fcaeec073e3ba794871ce86c545e4f961f

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
