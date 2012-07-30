From: "Nicholas A. Bellinger" <nab@linux-iscsi.org>
Date: Mon, 30 Jul 2012 22:24:20 +0000
Subject: Re: [target:for-linus 1/1] drivers/vhost/tcm_vhost.c:537:23-29: ERROR: allocation function on line 5
Message-Id: <1343687060.22538.553.camel@haakon2.linux-iscsi.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120728102033.GA10759@localhost>
In-Reply-To: <20120728102033.GA10759@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, 2012-07-28 at 18:20 +0800, Fengguang Wu wrote:
> Hi Nicholas,
> 
> There are new coccinelle warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git for-linus
> head:   fd682824bcdab8cbb3d078f9f59ba531e3e41484
> commit: fd682824bcdab8cbb3d078f9f59ba531e3e41484 [1/1] tcm_vhost: Initial merge for vhost level target fabric driver
> 
> All coccinelle warnings:
> 
> drivers/vhost/tcm_vhost.c:537:23-29: ERROR: allocation function on line 533 returns NULL not ERR_PTR on failure
> 
> vim +537 drivers/vhost/tcm_vhost.c
>    534		if (!sg)
>    535			return -ENOMEM;
>    536		pr_debug("%s sg %p sgl_count %u is_err %ld\n", __func__,
>  > 537		       sg, sgl_count, IS_ERR(sg));
>    538		sg_init_table(sg, sgl_count);
>    539	
>    540		tv_cmd->tvc_sgl = sg;
> 
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation

I've included this fix into a post-merge series for tcm-vhost.

Also FYI, I changed this patch slightly to use %d as it was still
generating a format spec warning.. 

Thanks WU!

