From: Zach Brown <zab@zabbo.net>
Date: Thu, 26 Feb 2004 22:59:05 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <403E7A39.7020703@zabbo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> Can someone tell me when I do need multiple spinlocks variables instead
> of one global one?

Sometimes it makes more sense to think of the locking as protecting data
instead of paths through code that uses the data.  This can get very
complicated depending on the access patterns, of course, but it's a good
way to approach the problem.  Look at what promises need to be made to
code that accesses data and see if there is a natural association of
locks with data that will make those promises.

- z
(sorry I don't have specific hints for the serial path)

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
