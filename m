From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 08 May 2006 06:44:12 +0000
Subject: Re: [KJ] [PATCH] linux-2.6.17-rc3-git13 fs/proc/array.c
Message-Id: <20060508064412.GA7466@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44686194517444183=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <445EDBCA.9080702@gmail.com>
In-Reply-To: <445EDBCA.9080702@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============44686194517444183==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.05.2006 [01:48:58 -0400], Anne Thrax wrote:
> do_task_stat() was using too much stack
> from make checkstack:
> 0x080eae08 do_task_stat:                                1752
> 
> So I took almost all the variables used in the function and made a new
> structure do_task_stat_vars, and dynamically allocated it in the
> function.  This is supposed to be a quick hack, and hopefully the
> authors will really do something about it.
> 
> Signed off by: Anne Thrax <foobarfoobarfoobar@gmail.com>

Signed-off-by, please.

And, I must ask, is your name actually Anne Thrax? If not, please use
your real name.

> --- linux-2.6.17-rc3-git13/fs/proc/array.c      2006-05-07 
> 23:01:50.000000000 -0400
> +++ linux-uml/fs/proc/array.c   2006-05-08 01:31:12.000000000 -0400
> @@ -316,7 +316,7 @@

Patch appears to be line-wrapped :(

>  static int do_task_stat(struct task_struct *task, char * buffer, int 
> whole)
>  {
> -       unsigned long vsize, eip, esp, wchan = ~0UL;
> +       /* unsigned long vsize, eip, esp, wchan = ~0UL;
>         long priority, nice;
>         int tty_pgrp = -1, tty_nr = 0;
>         sigset_t sigign, sigcatch;
> @@ -332,35 +332,49 @@
>         unsigned long rsslim = 0;
>         struct task_struct *t;
>         char tcomm[sizeof(task->comm)];
> +       */
> +       struct do_task_stat_vars *vars;
> +       vars = kmalloc(sizeof(struct do_task_stat_vars), GFP_KERNEL);

What happens if this kmalloc fails? Can do_task_stat() return ENOMEM?
What happens if it does -- will that change userspace in some way
(generally unacceptable)?

<snip>

> @@ -459,6 +473,9 @@
>                 task->policy);
>         if(mm)
>                 mmput(mm);
> +
> +       int res = vars->res;

I'm almost positive that compilation would have complained about
declaring a variable in the middle of a block. Did you compile-test?

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center

--===============44686194517444183==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44686194517444183==--
