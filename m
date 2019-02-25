From: Sagi Grimberg <sagi@grimberg.me>
Date: Mon, 25 Feb 2019 21:27:59 +0000
Subject: Re: [PATCH] IB/iser: Fix some error handling in iser_fast_reg_fmr()
Message-Id: <26367653-425e-b74e-818e-9972b82688cc@grimberg.me>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190220054041.GB25196@kadam>
In-Reply-To: <20190220054041.GB25196@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org


> but the below fix is the correct one for future code as well 
> (ib_dma_map_sg returns int and not unsigned int):
> 
> diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h 
> b/drivers/infiniband/ulp/iser/iscsi_iser.h
> index 0bf8512..def8cfe 100644
> --- a/drivers/infiniband/ulp/iser/iscsi_iser.h
> +++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
> @@ -205,7 +205,7 @@ struct iser_data_buf {
>      struct scatterlist *sg;
>      int                size;
>      unsigned long      data_len;
> -   unsigned int       dma_nents;
> +   int                dma_nents;
>   };
> 
> 
> thoughts ?

That's fine as well, care to send a patch?
