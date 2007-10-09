From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Tue, 09 Oct 2007 19:32:38 +0000
Subject: Re: [KJ] [PATCH-RESUBMIT] net/netfilter/x_tables.c unnecessary casts
Message-Id: <20071009193238.GC11579@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ed55890709110649n29c98a10j7f1479aeda368f11@mail.gmail.com>
In-Reply-To: <3ed55890709110649n29c98a10j7f1479aeda368f11@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Sep 19, 2007 at 09:32:56AM +0200, Liran Tal wrote:
> 
> The patch removes an unnecessary cast in accordance to the rest of
> the code. Kernel version is 2.6.22 with latest patches.
> 
> The spaces that appeared before have been replaced with tabs,
> hopefully this version of the patch is compliant.
> 
> Signed-off-by: Liran Tal <liran.tal@gmail.com>
> 
> --- linux/net/netfilter/x_tables.c.orig	2007-09-11 11:21:44.000000000 +0300
> +++ linux/net/netfilter/x_tables.c	2007-09-11 11:22:11.000000000 +0300
> @@ -691,7 +691,7 @@ static struct list_head *type2list(u_int
>  
>  static void *xt_tgt_seq_start(struct seq_file *seq, loff_t *pos)
>  {
> -	struct proc_dir_entry *pde = (struct proc_dir_entry *) seq->private;
> +	struct proc_dir_entry *pde = seq->private;
>  	u_int16_t af = (unsigned long)pde->data & 0xffff;
>  	u_int16_t type = (unsigned long)pde->data >> 16;
>  	struct list_head *list;
> 

Patch was applied with no problems. Just some minor notes:
1- a "---" string below the Signed-off-by line
2- Take care that most of the sentences above the signed-off-by line are
   written in the git logs. so don't put unwanted text.
3- you can write any info that's not appropriate for the logs under the 
   "---" line and before the patch (like the kernel version).

That's all :).

Regards,

-- 
Ahmed S. Darwish
HomePage: http://darwish.07.googlepages.com
Blog: http://darwish-07.blogspot.com
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
