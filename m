From: a.othieno@bluewin.ch (Arthur Othieno)
Date: Sun, 09 Oct 2005 13:22:48 +0000
Subject: Re: [KJ] [PATCH] printk : kernel/softirq.c
Message-Id: <20051009132248.GA3710@mars>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============41480337576104809=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <03ca01c5cb00$c020f0f0$5f051aac@pcp42831>
In-Reply-To: <03ca01c5cb00$c020f0f0$5f051aac@pcp42831>
To: kernel-janitors@vger.kernel.org

--===============41480337576104809==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 07, 2005 at 11:04:12AM +0530, Milind A Choudhary(Patni) wrote:
> Description:
> printk() calls should include appropriate KERN_* constant.
> 
> Signed-off-by: Milind A Choudhary <milind.choudhary@patni.com>
> 
> The patch
> Index: linux-2.6.14-rc3/kernel/softirq.c
> ===================================================================
> --- linux-2.6.14-rc3.orig/kernel/softirq.c	2005-10-06 15:30:37.000000000 +0530
> +++ linux-2.6.14-rc3/kernel/softirq.c	2005-10-06 18:59:24.000000000 +0530
> @@ -328,7 +328,7 @@ EXPORT_SYMBOL(tasklet_init);
>  void tasklet_kill(struct tasklet_struct *t)
>  {
>  	if (in_interrupt())
> -		printk("Attempt to kill tasklet from interrupt\n");
> +		printk(KERN_ERR "Attempt to kill tasklet from interrupt\n");

KERN_ERR is usually on the error path, which isn't the case here. As
this is just a warning, KERN_WARNING would be more appropriate here, no?

>  	while (test_and_set_bit(TASKLET_STATE_SCHED, &t->state)) {
>  		do
> @@ -458,7 +458,7 @@ static int __devinit cpu_callback(struct
>  		BUG_ON(per_cpu(tasklet_hi_vec, hotcpu).list);
>  		p = kthread_create(ksoftirqd, hcpu, "ksoftirqd/%d", hotcpu);
>  		if (IS_ERR(p)) {
> -			printk("ksoftirqd for %i failed\n", hotcpu);
> +			printk(KERN_ERR "ksoftirqd for %i failed\n", hotcpu);
>  			return NOTIFY_BAD;
>  		}
>  		kthread_bind(p, hotcpu);
> 

--===============41480337576104809==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============41480337576104809==--
