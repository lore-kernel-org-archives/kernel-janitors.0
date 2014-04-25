From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Fri, 25 Apr 2014 21:34:14 +0000
Subject: Re: Clarification needed on use of put_user inside a loop
Message-Id: <20140425213414.GC18016@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <535A88D5.3030008@gmail.com>
In-Reply-To: <535A88D5.3030008@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kumar Gaurav <kumargauravgupta3@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Greg KH <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org

On Fri, Apr 25, 2014 at 09:39:57PM +0530, Kumar Gaurav wrote:

> I have  found some codes in the driver which use put_user() in loop.
> Can we avoid the overhead of checking the same memory area( where
> put_user() writes) again n again using __put_user() in side loop and
> checking permission using access_ok before entering the loop?

>                         if (put_user(type, dst) ||
>                             put_user(chs_bytes, dst + 1))
>                                 return -EFAULT;
>                         dst += 2;
			  ^^^^^^^^^
Note that increment.  It's *not* "the same memory area" next time
around.  Sure, you can check the whole range once before the loop
and switch the stuff inside to __put_user()/__copy_to_user(), but
it's not guaranteed to buy you any speedup.

BTW, you might be a bit confused about the work done by access_ok() - e.g.
on an architectures with separate kernel and userland MMU contexts it might
very well be a no-op (always return true).  It's *not* checking if user has
permissions of some sort.
