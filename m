From: walter harms <wharms@bfs.de>
Date: Thu, 04 Aug 2011 07:13:21 +0000
Subject: Re: [PATCH 2/11] drivers/message/fusion/mptsas.c: trivial: use BUG_ON
Message-Id: <4E3A4691.6060009@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312281304-11847-3-git-send-email-julia@diku.dk>
In-Reply-To: <1312281304-11847-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 04.08.2011 08:54, schrieb Nandigama, Nagalakshmi:
> The patch seem to be fine. Please consider this patch as an Acked by me
> 
> Regards,
> Nagalakshmi

Hi Nagalakshmi,

nice try :) when you want to acknowledge a patch you should write:
Acked-by: "Nandigama, Nagalakshmi" <Nagalakshmi.Nandigama@lsi.com>

Otherwise scripts that look for an acknowledge have a hard time.

re,
 wh


> 
> 
> -----Original Message-----
> From: Julia Lawall [mailto:julia@diku.dk] 
> Sent: Tuesday, August 02, 2011 4:05 PM
> To: Moore, Eric; trivial@kernel.org
> Cc: kernel-janitors@vger.kernel.org; Support; DL-MPT Fusion Linux; linux-scsi@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH 2/11] drivers/message/fusion/mptsas.c: trivial: use BUG_ON
> 
> From: Julia Lawall <julia@diku.dk>
> 
> Use BUG_ON(x) rather than if(x) BUG();
> 
> The semantic patch that fixes this problem is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@ identifier x; @@
> -if (x) BUG();
> +BUG_ON(x);
> 
> @@ identifier x; @@
> -if (!x) BUG();
> +BUG_ON(!x);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>
> 
> ---
>  drivers/message/fusion/mptsas.c |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff -u -p a/drivers/message/fusion/mptsas.c b/drivers/message/fusion/mptsas.c
> --- a/drivers/message/fusion/mptsas.c
> +++ b/drivers/message/fusion/mptsas.c
> @@ -3410,8 +3410,7 @@ mptsas_expander_event_add(MPT_ADAPTER *i
>  	__le64 sas_address;
>  
>  	port_info = kzalloc(sizeof(struct mptsas_portinfo), GFP_KERNEL);
> -	if (!port_info)
> -		BUG();
> +	BUG_ON(!port_info);
>  	port_info->num_phys = (expander_data->NumPhys) ?
>  	    expander_data->NumPhys : 1;
>  	port_info->phy_info = kcalloc(port_info->num_phys,
> 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
