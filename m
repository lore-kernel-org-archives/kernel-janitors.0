From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 18 Jan 2007 20:16:06 +0000
Subject: Re: [KJ] question about race condition
Message-Id: <20070118201606.GA5017@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200701181927.l0IJR6TA004900@bingnet2.cc.binghamton.edu>
In-Reply-To: <200701181927.l0IJR6TA004900@bingnet2.cc.binghamton.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 18, 2007 at 02:27:05PM -0500, Shaobo Liu wrote:
> If the above pseudo code is run on a multi-core system, and if one core
> tries "down_interruptible(&mut) "
> in process A,  with  another core trying "down_interruptible(&mut);" in
> process B exactly at the same time, both A and B
> will get the semaphore simultaneously, and then operate on DS.
>
> It seems we have no way to protect the shared resource at all.
> The similar logics also fit in with other locking mechanism such as mutex,
> spinlock, and atomic variables.
>
> Can you tell me my misunderstaning about above scenario.

This scenario is purely theoretical. In real world there is no such
thing as "at the same time". One CPU will be there first.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
