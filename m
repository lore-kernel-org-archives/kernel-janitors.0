From: Mark Brown <broonie@kernel.org>
Date: Mon, 26 Oct 2020 23:47:14 +0000
Subject: Re: [PATCH] regulator: lp872x: make a const array static, makes object smaller
Message-Id: <160375603445.32304.3851545649708481770.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201016222235.686981-1-colin.king@canonical.com>
In-Reply-To: <20201016222235.686981-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Colin King <colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 16 Oct 2020 23:22:35 +0100, Colin King wrote:
> Don't populate const array lp872x_num_regulators  on the stack but
> instead make it static. Makes the object code smaller by 29 bytes.
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   18441	   4624	     64	  23129	   5a59	drivers/regulator/lp872x.o
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[1/1] regulator: lp872x: make a const array static, makes object smaller
      commit: 390d828f56a602c9201601bff1170d9d2bf5801c

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
