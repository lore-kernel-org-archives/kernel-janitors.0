From: "Desai, Kashyap" <Kashyap.Desai@lsi.com>
Date: Wed, 11 Aug 2010 10:31:45 +0000
Subject: RE: [PATCH 3/5] drivers/message/fusion: Return -ENOMEM on memory
Message-Id: <1C9608B8A4CD534FB19C7C7543CBB249029923A0BD@inbmail02.lsi.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008111211080.8669@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008111211080.8669@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, "Moore, Eric" <Eric.Moore@lsi.com>, "Support, Software" <support@lsi.com>, DL-MPT Fusion Linux <DL-MPTFusionLinux@lsi.com>, linux-scsi@vger.kernel.org



> -----Original Message-----
> From: Julia Lawall [mailto:julia@diku.dk]
> Sent: Wednesday, August 11, 2010 3:41 PM
> To: Moore, Eric; Support, Software; DL-MPT Fusion Linux; linux-
> scsi@vger.kernel.org; linux-kernel@vger.kernel.org; kernel-
> janitors@vger.kernel.org
> Subject: [PATCH 3/5] drivers/message/fusion: Return -ENOMEM on memory
> allocation failure
> 
> From: Julia Lawall <julia@diku.dk>
> 
> In this code, 0 is returned on memory allocation failure, even though
> other
> failures return -ENOMEM or other similar values.
> 
> A simplified version of the semantic match that finds this problem is
> as
> follows: (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression ret;
> expression x,e1,e2,e3;
> @@
> 
> ret = 0
> ... when != ret = e1
> *x = \(kmalloc\|kcalloc\|kzalloc\)(...)
> ... when != ret = e2
> if (x = NULL) { ... when != ret = e3
>   return ret;
> }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/message/fusion/mptbase.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/message/fusion/mptbase.c
> b/drivers/message/fusion/mptbase.c
> index d8c668d..49f8ec1 100644
> --- a/drivers/message/fusion/mptbase.c
> +++ b/drivers/message/fusion/mptbase.c
> @@ -5954,8 +5954,10 @@ mpt_findImVolumes(MPT_ADAPTER *ioc)
>  		goto out;
> 
>  	mem = kmalloc(iocpage2sz, GFP_KERNEL);
> -	if (!mem)
> +	if (!mem) {
> +		rc = -ENOMEM;
>  		goto out;
> +	}

ACKed.

Thanks, Kashyap

> 
>  	memcpy(mem, (u8 *)pIoc2, iocpage2sz);
>  	ioc->raid_data.pIocPg2 = (IOCPage2_t *) mem;
