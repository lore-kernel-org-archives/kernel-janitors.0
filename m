From: Andrey Utkin <andrey.krieger.utkin@gmail.com>
Date: Wed, 07 Jan 2015 11:00:51 +0000
Subject: Re: lustre/lnet/lnet/lib-move.c: memcpy with (struct iovec*)->iov_base, which is __user
Message-Id: <CANZNk82zWJRNFi_pgSpy-1Ts+5tbRUd9q7ST6VYT83cf8d-JDg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CANZNk80SoQZU994psVKuuGRGGHnGgO7bcFpPBQoGyg=CjW77xw@mail.gmail.com>
	<20150107083654.GK15033@mwanda>
In-Reply-To: <20150107083654.GK15033@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: oleg.drokin@intel.com, andreas.dilger@intel.com, HPDD-discuss@ml01.01.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, OSUOSL Drivers <devel@driverdev.osuosl.org>, kernel-janitors@vger.kernel.org

2015-01-07 10:36 GMT+02:00 Dan Carpenter <dan.carpenter@oracle.com>:
> Didn't Al change these to kvec instead of iovec?  You have to look at
> the callers to figure out if it's actually a user space pointer or a
> kernel pointer.

I am looking at current linux-next checkout.

-- 
Andrey Utkin
