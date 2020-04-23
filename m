From: Mark Brown <broonie@kernel.org>
Date: Thu, 23 Apr 2020 14:45:53 +0000
Subject: Re: [PATCH][next] ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"
Message-Id: <158765314784.33774.8027671793681805498.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200423083922.8159-1-colin.king@canonical.com>
In-Reply-To: <20200423083922.8159-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Timur Tabi <timur@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 23 Apr 2020 09:39:22 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in a deb_dbg message, fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  sound/soc/fsl/fsl_easrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.8

Thanks!

[1/1] ASoC: fsl_easrc: fix spelling mistake "prefitler" -> "prefilter"
      commit: 76ec4aea9fd8117f064caa63ee6f7fbcb70eeb2c

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
