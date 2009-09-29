From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 29 Sep 2009 09:17:06 +0000
Subject: Re: [PATCH] trivial fix of a very frequent spelling mistake
Message-Id: <alpine.LSU.2.00.0909291115110.9280@wotan.suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090929014357.GA3597@bombadil.infradead.org>
In-Reply-To: <20090929014357.GA3597@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dirk Hohndel <hohndel@infradead.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 28 Sep 2009, Dirk Hohndel wrote:

> something-bility is spelled as something-blity
> so a grep for 'blit' would find these lines
> 
> this is so trivial that I didn't split it by subsystem / copy 
> additional maintainers - all changes are to comments
> The only purpose is to get fewer false positives when grepping
> around the kernel sources.

I will split out the drivers/staging part and forward it to Greg (*) and 
apply the rest to trivial queue.

(*) I try to avoid merging the trivial changes to staging drivers, as 
these are usually being changed/rewritten quite heavily and we'd get a lot 
of unnecessary conflicts in -next.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
