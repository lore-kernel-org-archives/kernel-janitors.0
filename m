From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Mon, 16 Apr 2007 09:07:30 +0000
Subject: Re: [KJ] [PATCH]sch_atm.c-kzalloc
Message-Id: <b6fcc0a0704160207t74d39d1cl1bae5e8c0018071a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1176703544.13066.13.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/16/07, vignesh.babu@wipro.com <vignesh.babu@wipro.com> wrote:
> Replacing kmalloc/memset combination with kzalloc.

> --- a/net/sched/sch_atm.c
> +++ b/net/sched/sch_atm.c
> @@ -308,13 +308,12 @@ static int atm_tc_change(struct Qdisc *sch, u32
> classid, u32 parent,
>  		}
>  	}
>  	DPRINTK("atm_tc_change: new id %x\n",classid);
> -	flow = kmalloc(sizeof(struct atm_flow_data)+hdr_len,GFP_KERNEL);
> +	flow = kzalloc(sizeof(struct atm_flow_data)+hdr_len,GFP_KERNEL);
>  	DPRINTK("atm_tc_change: flow %p\n",flow);
>  	if (!flow) {
>  		error = -ENOBUFS;
>  		goto err_out;
>  	}
> -	memset(flow,0,sizeof(*flow));

A change which change runtime behaviour.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
