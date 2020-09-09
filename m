From: Mark Brown <broonie@kernel.org>
Date: Wed, 09 Sep 2020 15:29:01 +0000
Subject: Re: [PATCH] spi: stm32: fix pm_runtime_get_sync() error checking
Message-Id: <159966533166.54485.8003134450461101966.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200909094304.GA420136@mwanda>
In-Reply-To: <20200909094304.GA420136@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amelie Delaunay <amelie.delaunay@st.com>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, kernel-janitors@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>, linux-spi@vger.kernel.org, Alain Volmat <alain.volmat@st.com>

On Wed, 9 Sep 2020 12:43:04 +0300, Dan Carpenter wrote:
> The pm_runtime_get_sync() can return either 0 or 1 on success but this
> code treats 1 as a failure.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: stm32: fix pm_runtime_get_sync() error checking
      commit: c170a5a3b6944ad8e76547c4a1d9fe81c8f23ac8

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
