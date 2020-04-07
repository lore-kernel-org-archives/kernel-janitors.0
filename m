From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Tue, 07 Apr 2020 14:43:23 +0000
Subject: Re: [bug report] bus: mhi: core: Add support for data transfer
Message-Id: <20200407143123.GG2442@Mani-XPS-13-9360>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407135608.GA109647@mwanda>
In-Reply-To: <20200407135608.GA109647@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Apr 07, 2020 at 04:56:08PM +0300, Dan Carpenter wrote:
> Hello Manivannan Sadhasivam,
> 
> The patch 189ff97cca53: "bus: mhi: core: Add support for data
> transfer" from Feb 20, 2020, leads to the following static checker
> warning:
> 
> 	drivers/bus/mhi/core/main.c:1093 mhi_gen_tre()
> 	warn: bitwise AND condition is false here
> 
> drivers/bus/mhi/core/main.c
>   1088  
>   1089          ret = mhi_cntrl->map_single(mhi_cntrl, buf_info);
>   1090          if (ret)
>   1091                  return ret;
>   1092  
>   1093          eob = !!(flags & MHI_EOB);
>                                  ^^^^^^^
> This is zero.  Was BIT(0) intended?
>

Darn. The `enum mhi_flags` is supposed to start with 1. I'll fix it
with your Reported-by tag.

Btw, which static checker you are using? I did try sparse and W=2.

Thanks,
Mani
 
>   1094          eot = !!(flags & MHI_EOT);
>   1095          chain = !!(flags & MHI_CHAIN);
>   1096          bei = !!(mhi_chan->intmod);
>   1097  
>   1098          mhi_tre = tre_ring->wp;
>   1099          mhi_tre->ptr = MHI_TRE_DATA_PTR(buf_info->p_addr);
> 
> regards,
> dan carpenter
