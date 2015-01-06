From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Tue, 06 Jan 2015 22:48:15 +0000
Subject: lustre/lnet/lnet/lib-move.c: memcpy with (struct iovec*)->iov_base, which is __user
Message-Id: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: oleg.drokin@intel.com, andreas.dilger@intel.com, HPDD-discuss@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-janitors@vger.kernel.org

Dear maintainers of LustreFS and other experienced kernel developers!

I am working on fixing some sparse warnings as a task of Eudyptula Challenge.
There's a thing that look suspiciously to me (or I just don't
understand it). This looks same both in upstream kernel code in
drivers/staging/ and in https://github.com/Xyratex/lustre-stable.git
(it doesn't fetch from http://git.whamcloud.com/fs/lustre-release.git,
but I guess it is similar with Xyratex repo).

In lnet/lnet/lib-move.c, in lnet_copy_iov2iov(), at line 209, there is

                memcpy((char *)diov->iov_base + doffset,
                        (char *)siov->iov_base + soffset, this_nob);

diov and siov are struct iovec *, and iov_base in it is void __user *.
Are diov and siov really used semantically correctly here, holding
userspace addresses in iov_base?
Is it semantically correct to use memcpy to copy bytes from one
userspace address to another?

How to treat the comment "/* NB diov, siov are READ-ONLY */" at line
177 in the same procedure? Is it adequate?

This above-mentioned memcpy operation causes sparse warnings "warning:
cast removes address space of expression" for both first and second
line. When i change it to

                memcpy((void __user *)((char __user *)diov->iov_base + doffset),
                        (void __user *)((char __user *)siov->iov_base
+ soffset), this_nob);

It gives other sparse warnings:
drivers/staging/lustre/lnet/lnet/lib-move.c:208:25: warning: incorrect
type in argument 1 (different address spaces)
drivers/staging/lustre/lnet/lnet/lib-move.c:208:25:    expected void *to
drivers/staging/lustre/lnet/lnet/lib-move.c:208:25:    got void
[noderef] <asn:1>*<noident>
drivers/staging/lustre/lnet/lnet/lib-move.c:209:26: warning: incorrect
type in argument 2 (different address spaces)
drivers/staging/lustre/lnet/lnet/lib-move.c:209:26:    expected void const *from
drivers/staging/lustre/lnet/lnet/lib-move.c:209:26:    got void
[noderef] <asn:1>*<noident>

What is supposed way to avoid warnings in this case?

Thanks.

-- 
Andrey Utkin
