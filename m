From: Zach Brown <zab@zabbo.net>
Date: Fri, 27 Feb 2004 00:32:03 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <403E9003.8060900@zabbo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> So if I lock data I should use a lock for every single data variable
> which is at risk for a race condition. If I use a global one like I did
> here then all data structures are locked at once, which is not very good
> in a SMP system since an other processor could access an other data
> structure which now is also locked by the global lock.
> Am I right here?

Yeah, you have the idea.  It's always a trade-off between complexity and
concurrency.  It's good practice to only go down the complexity road
when it has been proven that concurrency is strongly desired.

I'm pretty sure that's why Matthew questioned the patch :)  Code changes
are always risky, and simple replacing cli with _irqsave spinlocks
doesn't increase the concurrency and I strongly suspect that no one has
shown that concurrency matters in these crufty old paths.

- z
(too wordy?  I'm new here.)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
