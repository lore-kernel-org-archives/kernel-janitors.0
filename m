From: Mark Brown <broonie@kernel.org>
Date: Thu, 16 Apr 2020 15:45:01 +0000
Subject: Re: [PATCH] spi: remove redundant assignment to variable ms
Message-Id: <158705187474.53607.10568254080085770802.b4-ty@kernel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410122315.17523-1-colin.king@canonical.com>
In-Reply-To: <20200410122315.17523-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, linux-spi@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 10 Apr 2020 13:23:15 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable ms is being initialized with a value that is never read
> and it is being updated later with a new value.  The initialization is
> redundant and can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Addresses-Coverity: ("Unused value")
> 
> [...]

Applied, thanks!

[1/1] spi: remove redundant assignment to variable ms
      commit: 49686df5b874e5ed6249bc622b73ad9a9e71cd99

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
