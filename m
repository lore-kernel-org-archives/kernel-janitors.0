From: Andre Haupt <andre@finow14.de>
Date: Fri, 07 Sep 2007 15:10:12 +0000
Subject: Re: large patches
Message-Id: <20070907151012.GA847@ahaupt-debian-vm.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
In-Reply-To: <20070907131821.GA14711@ahaupt-debian-vm.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Sep 07, 2007 at 10:49:02AM -0400, Robert P. J. Day wrote:

> if this patch is limited to a very restricted subsystem for which
> you're personally responsible, you might have a chance to get it in.
I am not responsible for this driver. I just saw some warnings about
unused variables during compilation and decided to have a look. Then i
realised that this driver violates CodingStyle and began some fixing.

> but rather than posting it to any list, it might be better to just
> make it available as a download.
hmmh, chances that actually nobody will have a look are bigger then, no?

> you just have to decide whether that amount of patching is justified
> by the fact that it's all formatting and clean-up.  tough call.
This code is IMO very hard to read even without the style problems. I
have a strong (but not yet substantiated) feeling that this driver could
need some refactoring. Maybe a style cleanup would make future work on
this easier?

regards,

Andre
