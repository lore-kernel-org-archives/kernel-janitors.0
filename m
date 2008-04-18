From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 18 Apr 2008 19:07:29 +0000
Subject: Re: [PATCH] Removal of debug code containing deprecated calls to cli()/sti()
Message-Id: <20080418190729.GE20637@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200804181455.m3IEtje2032231@cmf.nrl.navy.mil> <1208543806-9127-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1208543806-9127-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: kernel-janitors@vger.kernel.org, chas@cmf.nrl.navy.mil, netdev@vger.kernel.org, asselsm@gmail.com

On Fri, Apr 18, 2008 at 02:36:46PM -0400, Mark Asselstine wrote:
> -   ns_grab_res_lock(card, flags);
> +   spin_lock_irqsave(&(card)->res_lock,(flags));

We generally prefer the form:

	spin_lock_irqsave(&card->res_lock, flags);

The brackets aren't needed and since they aren't used elsewhere in the
kernel, breaking the pattern makes it look like these are somehow
different (which they aren't).

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
