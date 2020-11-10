From: Mark Brown <broonie@kernel.org>
Date: Tue, 10 Nov 2020 21:38:04 +0000
Subject: Re: [PATCH] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
Message-Id: <160504428419.41991.2200034841116895694.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201105125154.GA176426@mwanda>
In-Reply-To: <20201105125154.GA176426@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, Dan Carpenter <dan.carpenter@oracle.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Patrick Lai <plai@codeaurora.org>
Cc: alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>

On Thu, 5 Nov 2020 15:51:54 +0300, Dan Carpenter wrote:
> There are two issues in this function.
> 
> 1) We can't drop the refrences on "cpu", "codec" and "platform" before
>    we take the reference.  This doesn't cause a problem on the first
>    iteration because those pointers start as NULL so the of_node_put()
>    is a no-op.  But on the subsequent iterations, it will lead to a use
>    after free.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
      commit: 4e59dd249cd513a211e2ecce2cb31f4e29a5ce5b

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
