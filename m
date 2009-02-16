From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Mon, 16 Feb 2009 16:13:10 +0000
Subject: Re: [PATCH] Remove errors caught by checkpatch.pl in
Message-Id: <20090216161310.GV28946@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902151034s5444efabw455c1dac1b875086@mail.gmail.com> <20090215184752.GA4970@uranus.ravnborg.org> <4999650C.6030700@s5r6.in-berlin.de> <20090216132822.GC17996@elte.hu> <4999717F.7090205@s5r6.in-berlin.de> <20090216141917.GA8981@elte.hu> <499984C1.6020004@s5r6.in-berlin.de> <20090216155023.GA4422@elte.hu>
In-Reply-To: <20090216155023.GA4422@elte.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: Stefan Richter <stefanr@s5r6.in-berlin.de>, Sam Ravnborg <sam@ravnborg.org>, Manish Katiyar <mkatiyar@gmail.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Feb 16, 2009 at 04:50:23PM +0100, Ingo Molnar wrote:
> 
> * Stefan Richter <stefanr@s5r6.in-berlin.de> wrote:
> 
> > Ingo Molnar wrote:
> > > We routinely mention Sparse, lockdep, Coverity, Coccinelle, kmemleak, 
> > > ftrace, kmemcheck and other tools as well when it motives to fix a bug 
> > > or uncleanliness. [...] It is absolutely fine to
> > > mention checkpatch when it catches uncleanliness in code that already 
> > > got merged. I dont understand your point.
> > 
> > I wrote "don't mention checkpatch" but I really meant "think about what
> > the effect of the patch is and describe this".
> 
> Are you arguing that in all those other cases the tools should not be 
> mentioned either? I dont think that position is tenable.

Hell, yes.  I'm sick and tired of "$DRIVER: fix sparse warnings <something
far off-screen when looking at it in mutt on xterm>" kind of subjects,
while we are at it.  Mention the tool when that adds information useful for
understanding commit message and patch; otherwise you are just adding noise.
