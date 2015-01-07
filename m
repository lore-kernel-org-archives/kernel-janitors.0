From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 07 Jan 2015 08:36:54 +0000
Subject: Re: lustre/lnet/lnet/lib-move.c: memcpy with (struct iovec*)->iov_base, which is __user
Message-Id: <20150107083654.GK15033@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
In-Reply-To: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Cc: oleg.drokin@intel.com, andreas.dilger@intel.com, HPDD-discuss@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-janitors@vger.kernel.org

Didn't Al change these to kvec instead of iovec?  You have to look at
the callers to figure out if it's actually a user space pointer or a
kernel pointer.

regards,
dan carpenter

