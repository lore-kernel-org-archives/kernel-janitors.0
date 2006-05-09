From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 09 May 2006 19:44:12 +0000
Subject: Re: [KJ] [PATCH] linux-2.6.17-rc3-git13 fs/proc/array.c
Message-Id: <20060509194411.GC7237@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8358841662875548=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <445EDBCA.9080702@gmail.com>
In-Reply-To: <445EDBCA.9080702@gmail.com>
To: kernel-janitors@vger.kernel.org

--===============8358841662875548==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 08, 2006 at 01:48:58AM -0400, Anne Thrax wrote:
> do_task_stat() was using too much stack
> from make checkstack:
> 0x080eae08 do_task_stat:                                1752

Here it takes 10 times less stack.

	$ make checkstack | grep do_task_stat
	0xc0167add do_task_stat:                                172
	0xc01675b9 do_task_stat:                                152
	0xc0167af0 do_task_stat:                                152

I don't understand where such huge amount of space is wasted. Probably
"tcomm" is the biggest stack consumer of do_task_stat(). Others are just
longs and pointers. Is checkstack script is buggy?

> +/* do_task_stat() from fs/proc/array.c uses *WAY* too much stack
> + * I'll just make a struct containing all the variables in there
> + * and dynamicaly allocate it
> + * this is a quick hack, and someone should probably really do
> + * something about it
> + */
> +
> +struct do_task_stat_vars {
> +       unsigned long vsize, eip, esp, wchan, cmin_flt, cmaj_flt,
> +       min_flt, maj_flt, rsslim;
> +       unsigned long long start_time;
> +       long priority, nice;
> +       int tty_pgrp, tty_nr, res, num_threads;
> +       pid_t ppid, pgid, sid;
> +       sigset_t sigign, sigcatch;
> +       cputime_t cutime, cstime, utime, stime;
> +};

Well, this is ugly regardless.


--===============8358841662875548==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8358841662875548==--
