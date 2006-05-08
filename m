From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 08 May 2006 15:18:08 +0000
Subject: Re: [KJ] [PATCH] linux-2.6.17-rc3-git13 fs/proc/array.c
Message-Id: <20060508151808.GB7466@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============49694729077709621=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <445EDBCA.9080702@gmail.com>
In-Reply-To: <445EDBCA.9080702@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============49694729077709621==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 08.05.2006 [03:27:10 -0400], Anne Thrax wrote:
> >Signed-off-by, please.
> >
> >And, I must ask, is your name actually Anne Thrax? If not, please use
> >your real name.
> >
> 
> I would rather not use my real name, as I am only 14 years old.

I'm not sure I entirely understand how the one stems from the other, but
I think the spirit of the "personal information" part of the DCO
(Developer's Certificate of Origin, in Documentation/SubmittingPatches)
is something like full disclosure. Also, I wonder how, if at all, the
DCO can be enforced when it involves a minor. I'll defer to Greg on this
one... at least on whatever precedent exists, I don't expect a legal
decision, Greg :)

> >What happens if this kmalloc fails? Can do_task_stat() return ENOMEM?
> >What happens if it does -- will that change userspace in some way
> >(generally unacceptable)?
> 
> I think it's okay to return -ENOMEM...
> It's a static function, that is only used by two other functions in 
> fs/proc/array.c
> I don't know who uses those functions, but I would assume that it
> would not change userspace as it's just used for the proc filesystem.
> I would think that that the proc filesystem just wouldn't work.

Please see who uses those functions. Userspace can see mounted proc
filesystems, right? And more than likely can cat a file (or files) that
somehow exports some of this data, I'd think. If that data can now not
appear, but used to always appear with a large stack, then it's a
userspace regression and unacceptable. Please try and figure out what
this code is used for (hint: /proc/pid/stat would be my first guess),
and make sure everything still works.

> >I'm almost positive that compilation would have complained about
> >declaring a variable in the middle of a block. Did you compile-test?
> 
> I removed res from struct do_task_stat_vars and declared it on the
> stack.  It did get yelly at me about being against C99 standards
> before, it compiles fine now.

<snip>

> +       struct mm_struct *mm;
> +       struct task_struct *t;
> +       char tcomm[sizeof(task->comm)];
> +       char state;
> +       int res;

<snip>

Please just put this at the top of the corresponding block. It's against
accepted CodingStyle (although I'm not sure if it's explicitly so) to
put these declarations in the middle of the block.

<snip>

> +/* do_task_stat() from fs/proc/array.c uses *WAY* too much stack
> + * I'll just make a struct containing all the variables in there
> + * and dynamicaly allocate it
> + * this is a quick hack, and someone should probably really do
> + * something about it
> + */

Generally, we prefer comments of the form

/*
 * text ...
 */

Also, it would be good, probably, to indicate who the "I" is in the
comment -- it's pretty useless unless your name is somewhere in the
file. Or make it imperative ("Just make a  struct ..."), and let git
take care of tracking your name.

> +struct do_task_stat_vars {
> +       unsigned long vsize, eip, esp, wchan, cmin_flt, cmaj_flt,
> +       min_flt, maj_flt, rsslim;
> +       unsigned long long start_time;
> +       long priority, nice;
> +       int tty_pgrp, tty_nr, num_threads;
> +       pid_t ppid, pgid, sid;
> +       sigset_t sigign, sigcatch;
> +       cputime_t cutime, cstime, utime, stime;
> +};

That is one big struct :)

> +
> +

Extraneous newline insertion?

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center

--===============49694729077709621==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============49694729077709621==--
