From: Rusty Russell <rusty@rustcorp.com.au>
Date: Tue, 20 May 2014 01:58:04 +0000
Subject: Re: [patch] module: static checker complains about negative values
Message-Id: <87y4xxi5nn.fsf@rustcorp.com.au>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140519203626.GC5671@mwanda>
In-Reply-To: <20140519203626.GC5671@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> writes:

> We cap "stat.size" at INT_MAX but we don't check for negative values so
> my static checker complains.  At this point, you already have control of
> the kernel and if you start passing negative values here then you
> deserve what happens next.
>
> On 64 bit systems the vmalloc() will definitely fail.  On 32 bit systems
> we truncate the upper 32 bits away so that could succeed.  I haven't
> followed it further than that.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

If vfs_getattr() returns a negative stat.size, we have worse problems.

I'd rather see you sprinkle assertions like that into the code, so we
can make sure that can't happen for any fs's getattr().

Cheers,
Rusty.
