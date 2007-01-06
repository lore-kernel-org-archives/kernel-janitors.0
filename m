From: "Ahmed S. Darwish" <darwish.07@gmail.com>
Date: Sat, 06 Jan 2007 06:31:59 +0000
Subject: Re: [KJ] proper casting (if any) in copy_to_user() calls?
Message-Id: <20070106063159.GA4189@Ahmed>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701050850140.1045@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

On Fri, Jan 05, 2007 at 08:54:28AM -0500, Robert P. J. Day wrote:
> you'll notice that numerous calls to copy_to_user() insist on casting
> the pointer type of the first argument, despite the fact that that
> first pointer is declared as being of type "void __user *" for the
> routine itself, so it would seem no pointer is casting is required.
> 
>   and yet, you can see that calls to copy_to_user() are casting the
> first argument to (among other types) "char *" and "char __user *" and
> "void *" and "void __user *" and "unsigned long *" and ... well, you
> get the idea.  (the same can be said for the second argument to
> copy_from_user().)
> 
>   what is the proper rule for casting in this situation?  one would
> think most of those casts are totally superfluous, no?

I've written a patch to remove 30 unneeded copy_to_user casts in the infinband 
subsystem (drivers/infiniband/core) and the result ?. I got 30 warning from 
gcc while compiling :(.

The reason of the warnings was that the first argument of copy_to_user is
unsigned long and not a pointer. so I get the infamous warning:
 warning: passing argument 1 of ‘copy_to_user’ makes pointer from integer 
 without a cast

So Janitors, I think it's better to remove the casts _only_ when the given 
argument is a pointer and not an unsigned long (why do people use unsigned 
long and not void* in the beginning anyway ?).

Regards
-- 
Ahmed S. Darwish
http://darwish-07.blogspot.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
