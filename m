From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Sep 2020 00:06:06 +0000
Subject: Re: [PATCH] regulator: fix indentation issue
Message-Id: <160073316153.6369.11968491435935833807.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200920142454.33352-1-colin.king@canonical.com>
In-Reply-To: <20200920142454.33352-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 20 Sep 2020 15:24:54 +0100, Colin King wrote:
> There is a return statement that is indented with an extra
> space, fix this by removing it.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: fix indentation issue
      commit: be35cc4695aa1b26d00b30bfd1d8408eddd357ec

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
