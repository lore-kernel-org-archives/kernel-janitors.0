From: Debian User <h.vanberkum@chello.nl>
Date: Wed, 25 Feb 2004 23:51:20 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <403D34F8.7040809@chello.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Zach Brown wrote:

> Sometimes it makes more sense to think of the locking as protecting data
> instead of paths through code that uses the data.  This can get very
> complicated depending on the access patterns, of course, but it's a good
> way to approach the problem.

So if I lock data I should use a lock for every single data variable 
which is at risk for a race condition. If I use a global one like I did 
here then all data structures are locked at once, which is not very good 
in a SMP system since an other processor could access an other data 
structure which now is also locked by the global lock.
Am I right here?

Richard
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
