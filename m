From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Date: Mon, 30 Nov 2020 15:53:14 +0000
Subject: Re: [PATCH] printk: remove obsolete dead assignment
Message-Id: <X8UVamNsa+8fwnAL@jagdpanzerIV.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201130124915.7573-1-lukas.bulwahn@gmail.com>
 <X8URvRhAB2AE4DZT@alley>
In-Reply-To: <X8URvRhAB2AE4DZT@alley>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Petr Mladek <pmladek@suse.com>
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-safety@lists.elisa.tech

On (20/11/30 16:37), Petr Mladek wrote:
> On Mon 2020-11-30 13:49:15, Lukas Bulwahn wrote:
[..]
> > diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
> > index f279d4fbd9dd..6e4e38b7cd91 100644
> > --- a/kernel/printk/printk.c
> > +++ b/kernel/printk/printk.c
> > @@ -741,7 +741,6 @@ static ssize_t devkmsg_write(struct kiocb *iocb, struct iov_iter *from)
> >  			if (LOG_FACILITY(u) != 0)
> >  				facility = LOG_FACILITY(u);
> >  			endp++;
> > -			len -= endp - line;
> >  			line = endp;
> >  		}
> >  	}
> 
> Yup, it was used to write the trailing '\0'. But it is done earlier
> now. So, it is not longer needed.
> 
> Reviewed-by: Petr Mladek <pmladek@suse.com>
> 
> Best Regards,
> Petr
> 
> PS: I'll give it few days just in case anyone else would want to
> review it. I'll push it then unless anyone complains.

FWIW, looks good to me
Reviewed-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>

	-ss
