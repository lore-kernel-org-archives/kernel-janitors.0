From: <Tudor.Ambarus@microchip.com>
Date: Mon, 23 Mar 2020 17:57:00 +0000
Subject: Re: [PATCH] MAINTAINERS: update entry after SPI NOR controller move
Message-Id: <22897927.UjJTgWM9OM@192.168.0.120>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200321064217.6179-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200321064217.6179-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: lukas.bulwahn@gmail.com
Cc: vigneshr@ti.com, bbrezillon@kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, vz@mleia.com, linux-mtd@lists.infradead.org, joe@perches.com, linux-arm-kernel@lists.infradead.org

On Saturday, March 21, 2020 8:42:17 AM EET Lukas Bulwahn wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> content is safe
> 
> Commit a0900d0195d2 ("mtd: spi-nor: Prepare core / manufacturer code
> split") moved all SPI NOR controller drivers to a controllers/
> sub-directory. However, the moved nxp-spifi.c file was referenced in the
> ARM/LPC18XX ARCHITECTURE entry in MAINTAINERS.
> 
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/mtd/spi-nor/nxp-spifi.c
> 
> Update the file entry in MAINTAINERS to its new location.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on next-20200320
> Boris, Tudor, please pick this trivial patch. Not urgent.
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to spi-nor/next, thanks.
ta
