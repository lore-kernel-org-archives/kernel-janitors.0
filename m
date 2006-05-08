From: walter harms <wharms@bfs.de>
Date: Mon, 08 May 2006 07:26:02 +0000
Subject: Re: [KJ] [PATCH] linux-2.6.17-rc3-git13
Message-Id: <445EF28A.1010601@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Anne Thrax wrote:
> do_task_stat() was using too much stack
> from make checkstack:
> 0x080eae08 do_task_stat:                                1752
> 
> So I took almost all the variables used in the function and made a new 
> structure do_task_stat_vars, and dynamically allocated it in the function.
> This is supposed to be a quick hack, and hopefully the authors will 
> really do something about it.
> 
> Signed off by: Anne Thrax <foobarfoobarfoobar@gmail.com>
> 
> --- linux-2.6.17-rc3-git13/fs/proc/array.c      2006-05-07 
> 23:01:50.000000000 -0400
> +++ linux-uml/fs/proc/array.c   2006-05-08 01:31:12.000000000 -0400
> @@ -316,7 +316,7 @@
> 
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
> +       vars->vsize = vars->eip = vars->esp = vars->wchan = ~0UL;
> +       vars->tty_pgrp = -1;
> +       vars->tty_nr = 0;
> +       vars->pgid = -1;
> +       vars->sid = -1;
> +       vars->num_threads = 0;
> +       vars->cmin_flt = vars->cmaj_flt = vars->min_flt = vars->maj_flt 

i am missing a check that kmalloc succeded. i agree with nish that
defining vars outside the header is bad style (but possible for C99, 
unfortunaly).

happy hacking,
  wh
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
