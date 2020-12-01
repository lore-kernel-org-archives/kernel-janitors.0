From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Dec 2020 13:57:56 +0000
Subject: Re: [PATCH] ASoC: tlv320adcx140: Fix a typo in a comment
Message-Id: <160683107674.35139.8370464905366539450.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201002192801.639743-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20201002192801.639743-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robh@kernel.org, lgirdwood@gmail.com, grandmaster@al2klimov.de, perex@perex.cz, dmurphy@ti.com, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tiwai@suse.com
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 2 Oct 2020 21:28:01 +0200, Christophe JAILLET wrote:
> It is likely that this header file is about the TLV320ADCX140. (0 and 4
> swapped)
> While at it fix a missing "H" in a comment related to the include guard.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: tlv320adcx140: Fix a typo in a comment
      (no commit info)

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
