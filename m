From: Zach Brown <zach.brown@oracle.com>
Date: Sat, 25 Feb 2006 00:07:20 +0000
Subject: Re: [KJ] [Patch] fs/ kzalloc conversions
Message-Id: <43FF9FB8.9030808@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140772454.22453.1.camel@alice> <20060224111755.GA7801@mipter.zuzino.mipt.ru> <20060224152628.GO28587@parisc-linux.org>
In-Reply-To: <20060224152628.GO28587@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, Eric Sesterhenn <snakebyte@gmx.de>, kernel-janitors@lists.osdl.org, linux-fsdevel@vger.kernel.org


> So the test isn't useless and we should use kcalloc here, otherwise an
> unthinking sysadmin can increment the aio_max_nr sysctl value to, let's
> say, 0x7fffffff.  On a 32-bit machine, the multiplication will wrap,
> maybe turn into a small positive number, and we'll gleefully walk off
> the end of the array, corrupting data as we go.

nr_events isn't just limited by aio_max_nr, it's also clamped (oddly) by:

        /* Prevent overflows */
        if ((nr_events > (0x10000000U / sizeof(struct io_event))) ||
            (nr_events > (0x10000000U / sizeof(struct kiocb)))) {
                pr_debug("ENOMEM: nr_events too high\n");
                return ERR_PTR(-EINVAL);
        }

Does that put your mind at ease?  (Barring reasonable unease at the
existence of confusing code :))

> And we should set the .extra1 and .extra2 values in the FS_AIO_MAX_NR
> clause of kernel/sysctl.c anyway.  Does anyone have thoughts on what the 
> *useful* range of this variable is?

Well, the tunable exists to cap the amount of kernel memory pinned in
event buffers.  So some relation to the number of pages in the machine
wouldn't surprise me.  I don't know what default portion would be
considered reasonable, though..

- z
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
