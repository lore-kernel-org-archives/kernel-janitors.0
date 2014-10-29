From: "Nelson, Shannon" <shannon.nelson@intel.com>
Date: Wed, 29 Oct 2014 16:40:42 +0000
Subject: RE: [patch] i40e: precedence bug in i40e_get_pfc_delay()
Message-Id: <FC41C24E35F18A40888AACA1A36F3E418AD7C35A@fmsmsx115.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141029161028.GE5290@mwanda>
In-Reply-To: <20141029161028.GE5290@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Dan Carpenter [mailto:dan.carpenter@oracle.com]
> Sent: Wednesday, October 29, 2014 9:10 AM
> To: Kirsher, Jeffrey T; Nelson, Shannon
> Cc: Brandeburg, Jesse; Allan, Bruce W; Wyborny, Carolyn; Skidmore,
> Donald C; Rose, Gregory V; Vick, Matthew; Ronciak, John; Williams, Mitch
> A; Linux NICS; Joe Perches; e1000-devel@lists.sourceforge.net; kernel-
> janitors@vger.kernel.org
> Subject: [patch] i40e: precedence bug in i40e_get_pfc_delay()
> 
> The ">>" operation has higher precedence than the "&" operation.  Also
> the casting is not needed.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is static checker work and I haven't tested it on real hardware.
> 
> diff --git a/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
> b/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
> index 00bc0cd..db9f9d3 100644
> --- a/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
> +++ b/drivers/net/ethernet/intel/i40e/i40e_dcb_nl.c
> @@ -40,8 +40,8 @@ static void i40e_get_pfc_delay(struct i40e_hw *hw, u16
> *delay)
>  	u32 val;
> 
>  	val = rd32(hw, I40E_PRTDCB_GENC);
> -	*delay = (u16)(val & I40E_PRTDCB_GENC_PFCLDA_MASK >>
> -		       I40E_PRTDCB_GENC_PFCLDA_SHIFT);
> +	*delay = (val & I40E_PRTDCB_GENC_PFCLDA_MASK) >>
> +		       I40E_PRTDCB_GENC_PFCLDA_SHIFT;
>  }
> 
>  /**

Thanks.  We had just recently caught this internally, as well.  We'll have Jeff add this to our tree.

sln


