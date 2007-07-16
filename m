From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 16 Jul 2007 17:48:46 +0000
Subject: Re: [KJ] [third][PATCH 3/4][2.6 drivers/net/skfp/smt.c:]replace SIZE
Message-Id: <20070716174846.GN13826@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070716141818.30653.70760.sendpatchset@shcherbakov.homelinux.net>
In-Reply-To: <20070716141818.30653.70760.sendpatchset@shcherbakov.homelinux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Jul 16, 2007 at 05:33:10PM +0000, Cripps wrote:
> I just assumed that the original maintainer of the code had a good reason
> for writing the loop in the way he did. and cleaned up the piece that
> pertained to my project. The way it is now still compiles with no errors, so
> it must not be *entirely* broken (if at all).
> Thanks for the comments. If the piece of code in question can actually use
> some cleaning up, maybe you should get in contact with the maintainer and
> talk it out ... as I've learned from previous attempts though, that change
> is beyond the scope of this patch, and as such shouldn't be touched in this
> patch. :)

Absolutely right.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
_______________________________________________
REMINDER: this mailing list moved to vger.kernel.org and current one will be discontinued soon.
To resubscribe, send email to majordomo@vger.kernel.org with
&quot;subscribe kernel-janitors&quot; in message body and follow instructions.

Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
