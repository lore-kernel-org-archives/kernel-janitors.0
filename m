From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 May 2014 08:19:58 +0000
Subject: Re: [patch] module: static checker complains about negative values
Message-Id: <20140520081957.GD15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140519203626.GC5671@mwanda>
 <87y4xxi5nn.fsf@rustcorp.com.au>
In-Reply-To: <87y4xxi5nn.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, May 20, 2014 at 11:16:04AM +0930, Rusty Russell wrote:
> Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> > We cap "stat.size" at INT_MAX but we don't check for negative values so
> > my static checker complains.  At this point, you already have control of
> > the kernel and if you start passing negative values here then you
> > deserve what happens next.
> >
> > On 64 bit systems the vmalloc() will definitely fail.  On 32 bit systems
> > we truncate the upper 32 bits away so that could succeed.  I haven't
> > followed it further than that.
> >
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> If vfs_getattr() returns a negative stat.size, we have worse problems.
> 
> I'd rather see you sprinkle assertions like that into the code, so we
> can make sure that can't happen for any fs's getattr().

Yeah.  I was lazy.  Sorry.  I can just hand edit my database to say that
i_size_read() returns a reasonable number...

regards,
dan carpenter

