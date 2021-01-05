From: Mark Brown <broonie@kernel.org>
Date: Tue, 05 Jan 2021 16:07:17 +0000
Subject: Re: [PATCH] regmap: debugfs: Fix a reversed if statement in regmap_debugfs_init()
Message-Id: <160986283724.50112.3615715959178419195.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <X/RQpfAwRdLg0GqQ@mwanda>
In-Reply-To: <X/RQpfAwRdLg0GqQ@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xiaolei Wang <xiaolei.wang@windriver.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>

On Tue, 5 Jan 2021 14:42:29 +0300, Dan Carpenter wrote:
> This code will leak "map->debugfs_name" because the if statement is
> reversed so it only frees NULL pointers instead of non-NULL.  In
> fact the if statement is not required and should just be removed
> because kfree() accepts NULL pointers.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: debugfs: Fix a reversed if statement in regmap_debugfs_init()
      commit: f6bcb4c7f366905b66ce8ffca7190118244bb642

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
