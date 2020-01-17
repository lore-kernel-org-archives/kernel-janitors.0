From: Borislav Petkov <bp@alien8.de>
Date: Fri, 17 Jan 2020 00:35:23 +0000
Subject: Re: [PATCH]  EDAC/sifive: fix return value check in ecc_register()
Message-Id: <20200117003523.GK27148@zn.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200115150303.112627-1-weiyongjun1@huawei.com>
In-Reply-To: <20200115150303.112627-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Yash Shah <yash.shah@sifive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-edac@vger.kernel.org, linux-riscv@lists.infradead.org, kernel-janitors@vger.kernel.org

On Wed, Jan 15, 2020 at 03:03:03PM +0000, Wei Yongjun wrote:
> In case of error, the function edac_device_alloc_ctl_info() returns NULL
> pointer not ERR_PTR(). The IS_ERR() test in the return value check
> should be replaced with NULL test.
> 
> Fixes: 91abaeaaff35 ("EDAC/sifive: Add EDAC platform driver for SiFive SoCs")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/edac/sifive_edac.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/edac/sifive_edac.c b/drivers/edac/sifive_edac.c
> index c0cc72a3b2be..3a3dcb14ed99 100644
> --- a/drivers/edac/sifive_edac.c
> +++ b/drivers/edac/sifive_edac.c
> @@ -54,8 +54,8 @@ static int ecc_register(struct platform_device *pdev)
>  	p->dci = edac_device_alloc_ctl_info(0, "sifive_ecc", 1, "sifive_ecc",
>  					    1, 1, NULL, 0,
>  					    edac_device_alloc_index());
> -	if (IS_ERR(p->dci))
> -		return PTR_ERR(p->dci);
> +	if (!p->dci)
> +		return -ENOMEM;
>  
>  	p->dci->dev = &pdev->dev;
>  	p->dci->mod_name = "Sifive ECC Manager";

Applied, thanks.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
