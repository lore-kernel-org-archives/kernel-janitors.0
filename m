From: Amelie DELAUNAY <amelie.delaunay@st.com>
Date: Fri, 23 Jun 2017 12:42:07 +0000
Subject: Re: [PATCH][spi-next] spi: stm32: fix range limit checks on div
Message-Id: <1c40b653-2b52-f631-5f54-57e68270d141@st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622154142.22481-1-colin.king@canonical.com>
In-Reply-To: <20170622154142.22481-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org


On 06/22/2017 05:41 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently the check for range limits on div is incorrect and will
> never return -EINVAL. Fix this by replacing && with ||
> 
> Detected by CoverityScan, CID#1446580 ("Structurally dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>   drivers/spi/spi-stm32.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-stm32.c b/drivers/spi/spi-stm32.c
> index 0553f61ab3b7..b75909e7b117 100644
> --- a/drivers/spi/spi-stm32.c
> +++ b/drivers/spi/spi-stm32.c
> @@ -262,7 +262,7 @@ static int stm32_spi_prepare_mbr(struct stm32_spi *spi, u32 speed_hz)
>   	 * no need to check it there.
>   	 * However, we need to ensure the following calculations.
>   	 */
> -	if ((div < SPI_MBR_DIV_MIN) &&
> +	if ((div < SPI_MBR_DIV_MIN) ||
>   	    (div > SPI_MBR_DIV_MAX))
>   		return -EINVAL;
>   
> 

Reviewed-by: Amelie Delaunay <amelie.delaunay@st.com>
