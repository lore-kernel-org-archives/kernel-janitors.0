From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 28 Nov 2018 19:23:27 +0000
Subject: Re: [bug report] x86/resctrl: Bring cbm_validate() into the resource structure
Message-Id: <20181128192327.GD3095@unbuntlaptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181128111326.lwlqngnwmdslnbs2@kili.mountain>
In-Reply-To: <20181128111326.lwlqngnwmdslnbs2@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 28, 2018 at 03:21:22PM +0000, Moger, Babu wrote:
> Copying Boris,
> 
> Hi Dan, The following patch should help. Can you please confirm.
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index 286c03bb14a7..5a1b544795cd 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -201,7 +201,7 @@ int parse_cbm(struct rdt_parse_data *data, struct
> rdt_resource *r,
>               struct rdt_domain *d)
>  {
>         struct rdtgroup *rdtgrp = data->rdtgrp;
> -       u32 cbm_val;
> +       u32 cbm_val = 0;
> 
>         if (d->have_new_ctrl) {
>                 rdt_last_cmd_printf("Duplicate domain %d\n", d->id);
> 

That obviously silences the uninitialized variable warning...  You know
the code better than I do, so presumably it is correct as well.  :)

regards,
dan carpenter
