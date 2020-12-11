From: Mark Brown <broonie@kernel.org>
Date: Fri, 11 Dec 2020 17:49:41 +0000
Subject: Re: [PATCH] ASoC: mediatek: mt8183: delete some unreachable code
Message-Id: <160770898112.26354.4365158422154864954.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X9NFg3KVm16Gx6Io@mwanda>
In-Reply-To: <X9NFg3KVm16Gx6Io@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>, Tzung-Bi Shih <tzungbi@google.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Fri, 11 Dec 2020 13:10:11 +0300, Dan Carpenter wrote:
> This has a goto followed by an unreachable return statement.  The goto
> is correct because it cleans up so the current runtime behavior is fine.
> Let's delete the unreachable return statement.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8183: delete some unreachable code
      commit: 1688dbe7a730e1c1ed05b9dde497288494d75ad4

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
