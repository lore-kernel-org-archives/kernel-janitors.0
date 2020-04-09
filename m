From: Joe Perches <joe@perches.com>
Date: Thu, 09 Apr 2020 21:40:40 +0000
Subject: Re: [PATCH] checkpatch: check for missing \n at the end of logging message
Message-Id: <576a57b4c134903e9889cb670ccbb08a47230b6c.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200407204908.10420-1-christophe.jaillet@wanadoo.fr>
         <8617a6b94c0644bce1fd4ca77309d67a612e6300.camel@perches.com>
         <4b7e1cf3-6fa7-60af-a1d3-2457339dbe8a@wanadoo.fr>
         <efb5a518fdc47f0120b94a7e8a95d275c0f4ad43.camel@perches.com>
         <60c732a1-aa4e-afab-d223-894a67713003@wanadoo.fr>
         <bcdfa5ae68b8cb7d9324a89aedf452f6209b570c.camel@perches.com>
         <05379b22-6755-368b-8127-8827fa020189@wanadoo.fr>
         <f212b3ad6c09e595cb91c2f7e8728d71e27f6833.camel@perches.com>
         <59d1ef8f-4fb0-9af2-f761-b52559c8a699@wanadoo.fr>
In-Reply-To: <59d1ef8f-4fb0-9af2-f761-b52559c8a699@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, apw@canonical.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2020-04-09 at 20:52 +0200, Christophe JAILLET wrote:
> In fact, I don't really see the need to modify many files just for some 
> kind of style.
> (same reason why I think that checkpatch is a better place for a test 
> than submitting hundreds of patches based on coccinelle)
> 
> From your point of view, does auditing and fixing these missing \n make 
> sense?

Not all that much no.  Even the existing conversions
of formats missing newlines isn't all that important.

It's only a consideration for relatively unmaintained
old drivers and arches that still use printk without a
KERN_<LEVEL> where a message might either be interleaved
with a pr_<level> style message without a terminating
newline or by old style messages that should actually
instead be coalesced because the printks don't have
any KERN_<LEVEL>.

> Wouldn't it just be a lot of noise for a small benefit?

Much of the noise has already been filtered out by patches
and the ambient noise is already at a relatively low
level.

Quiet is good though and I think the noise reduction
is useful and quite painless.
