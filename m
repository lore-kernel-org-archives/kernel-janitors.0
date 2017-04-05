From: Bart Van Assche <Bart.VanAssche@sandisk.com>
Date: Wed, 05 Apr 2017 15:10:14 +0000
Subject: Re: [PATCH 5/5] IB/qib: Adjust two size determinations in qib_init_pportdata()
Message-Id: <1491405013.2787.3.camel@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c16b18ac-287f-5faf-b79a-c86e2adfa22c@users.sourceforge.net>
         <b5bc4160-aace-b919-7fe2-a4742d03c4ba@users.sourceforge.net>
In-Reply-To: <b5bc4160-aace-b919-7fe2-a4742d03c4ba-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <infinipath-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Wed, 2017-04-05 at 15:55 +0200, SF Markus Elfring wrote:
> -	size = sizeof(struct ib_cc_congestion_setting_attr);
> -	ppd->congestion_entries_shadow = kzalloc(size, GFP_KERNEL);
> +	ppd->congestion_entries_shadow = kzalloc(sizeof(*ppd
> +							->congestion_entries_shadow),
> +						 GFP_KERNEL);

The way how the above line has been split looks really weird. Please
move the entire kzalloc() call to the next line such that "*ppd" and
"->congestion_entries_shadow" appear on the same line.

Thanks,

Bart.