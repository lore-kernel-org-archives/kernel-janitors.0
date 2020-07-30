From: Mark Brown <broonie@kernel.org>
Date: Thu, 30 Jul 2020 22:28:36 +0000
Subject: Re: [PATCH 0/7] drop unnecessary list_empty
Message-Id: <159614804536.1473.16638498246526574558.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1595761112-11003-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-rdma@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-wireless@vger.kernel.org, alsa-devel@alsa-project.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org

On Sun, 26 Jul 2020 12:58:25 +0200, Julia Lawall wrote:
> The various list iterators are able to handle an empty list.
> The only effect of avoiding the loop is not initializing some
> index variables.
> Drop list_empty tests in cases where these variables are not
> used.
> 
> The semantic patch that makes these changes is as follows:
> (http://coccinelle.lip6.fr/)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: drop unnecessary list_empty
      commit: a383308e50244a28fe927b9c1acbe0a963bf186b

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
