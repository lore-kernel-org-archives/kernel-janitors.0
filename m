From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 12 Sep 2007 15:25:00 +0000
Subject: Re: [KJ] [PATCH-RESUBMIT] net/netfilter/x_tables.c unnecessary casts
Message-Id: <20070912082500.39bac670.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <3ed55890709110649n29c98a10j7f1479aeda368f11@mail.gmail.com>
In-Reply-To: <3ed55890709110649n29c98a10j7f1479aeda368f11@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 12 Sep 2007 09:19:52 +0300 liran tal wrote:

> Hey Randy,
> 
> > >
> > > against latest tree, appliable with patch -p1 and no tabs used (could
> > > only be the gmail)
> >
> > The "+" lines has spaces instead of a tab.
> > Yes, gmail is known to do that if you use the web interface.
> > Are you using web interface or an email client + SMTP?
> 
> Yeah, I'm using the gmail web interface.
> I even disabled the "rich formatting" and enabled "plain text" mode.
> 
> Maybe we should try it with "rich formatting" mode and see if that works.
> This is a copy&paste with rich formatting mode enabled:

All of these leading spaces should be tabs.
I'm not aware of anyone getting the gmail web interface to work
for patches, other than by using attachments, which is certainly
not preferred, but may be your only choice, if you are limited
to gmail + web interface.

Also, the Signed-off-by: line should come after the patch description
but before the actual patch.


> --- linux/net/netfilter/x_tables.c.orig 2007-09-11 11:21:44.000000000 +0300
> +++ linux/net/netfilter/x_tables.c      2007-09-11 11:22:11.000000000 +0300
> @@ -691,7 +691,7 @@ static struct list_head *type2list(u_int
> 
>  static void *xt_tgt_seq_start(struct seq_file *seq, loff_t *pos)
>  {
> -       struct proc_dir_entry *pde = (struct proc_dir_entry *) seq->private;
> +       struct proc_dir_entry *pde = seq->private;
>         u_int16_t af = (unsigned long)pde->data & 0xffff;
>         u_int16_t type = (unsigned long)pde->data >> 16;
>         struct list_head *list;
> 
> 
> Signed-off-by: Liran Tal <liran.tal@gmail.com>



---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
