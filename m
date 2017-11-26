From: Logan Gunthorpe <logang@deltatee.com>
Date: Sun, 26 Nov 2017 17:38:55 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
 <alpine.DEB.2.20.1711260648130.2387@hadrien>
 <1511676085.20482.18.camel@perches.com>
In-Reply-To: <1511676085.20482.18.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On 25/11/17 11:01 PM, Joe Perches wrote:
> It doesn't really work.

That's rather hyperbolic and I don't appreciate the tone.

> Many of the messages aren't missing newlines.
> 
> I only looked a the first few dozen instances, but many of
> them aren't really missing newlines, but are now missing a
> KERN_CONT annotation.

True, and I mentioned that. However, these instances are still incorrect
and deserve a warning. I don't see how any tool (even one written in
Coccinelle) could determine whether the programmer intended to have a
new line or intended for the next line to be a continuation. But if the
developer gets a warning they'd at least look at it. Given that
KERN_CONT usage is discouraged, I think warning that a new line is
required is acceptable.

> Most of that commit message is BS, but the net effect is
> that now printks must have a KERN_<LEVEL> marker or a
> newline is inserted before the format.

Yes, that just means that all the instances that should be using
KERN_CONT are now *actually* broken. It's also part of what created the
mess in the first place as it makes the final new line seem to not be
required. As a result, there are now plenty of places in the kernel that
are inconsistent. That's why this patch is needed.

> Also, this patch logic will be very confused by patch
> blocks and not files.

No, it's not. (With the exception of the false positives I noted due to
KERN_CONTs not making it into the patch context.) I've tested this. I
even created some pathological tests[1] to ensure crossing hunk
boundaries and other weirdness works correctly. There may also be false
negatives in extreme cases if the entire call site doesn't fit in the
patch context but it's still better than nothing and will catch all
newly added calls. So if you're going to make such statements I suggest
you back it up with evidence.

Logan

[1]
https://github.com/lsgunth/checkpatch-tests/blob/master/examples/test2.patch

