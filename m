From: "Dilger, Andreas" <andreas.dilger@intel.com>
Date: Wed, 07 Jan 2015 11:32:59 +0000
Subject: Re: lustre/lnet/lnet/lib-move.c: memcpy with (struct iovec*)->iov_base, which is __user
Message-Id: <D0D2667E.D2C25%andreas.dilger@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
 <20150107083654.GK15033@mwanda>
In-Reply-To: <20150107083654.GK15033@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrey Utkin <andrey.krieger.utkin@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc: "Drokin, Oleg" <oleg.drokin@intel.com>, "HPDD-discuss@ml01.01.org" <HPDD-discuss@ml01.01.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OSUOSL Drivers <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On 2015/01/07, 1:36 AM, "Dan Carpenter" <dan.carpenter@oracle.com> wrote:
> Didn't Al change these to kvec instead of iovec?  You have to look at
> the callers to figure out if it's actually a user space pointer or a
> kernel pointer.

A patch was sent by Al on Dec 2 to replace iovec with kvec, in a thread
titled "[PATCH] staging:lustre:lnet: Incorrect type in assignment".  Greg
replied on Dec 10 in another thread (also fixing this same warning) titled
"[PATCH] staging: lustre: Fix the warning messages about casting without
__user macro" that Al's patch was in the staging tree for 3.19-rc1.

Cheers, Andreas
-- 
Andreas Dilger

Lustre Software Architect
Intel High Performance Data Division


