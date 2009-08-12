From: Arjan van de Ven <arjan@infradead.org>
Date: Wed, 12 Aug 2009 04:28:42 +0000
Subject: Re: [PATCH][RFC] security: constify seq_operations
Message-Id: <20090811212842.4291eba0@infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LRH.2.00.0908112337450.21218@tundra.namei.org>
	<20090811143643.GA15096@us.ibm.com>
In-Reply-To: <20090811143643.GA15096@us.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Serge E. Hallyn" <serue@us.ibm.com>
Cc: James Morris <jmorris@namei.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, kernel-janitors@vger.kernel.org

On Tue, 11 Aug 2009 09:36:43 -0500
"Serge E. Hallyn" <serue@us.ibm.com> wrote:

> Quoting James Morris (jmorris@namei.org):
> > I think it'd be a good idea to constify more of the various
> > operations structs in the kernel -- our coverage of this is spotty.
> > 
> > The patch below should provide coverage for all of the eligible 
> > seq_operations structs in the kernel.  It's derived from the
> > grsecurity patch (which I was reading and noticed how many of these
> > we're missing).
> > 
> > It's possible something's been missed, or that there are problems
> > in code which I can't test.  Please review/comment/test.
> > 
> > If it looks ok, I suggest pushing this via -mm.
> > 
> > Note that there are quite a few other similar ops to be constified,
> > such as file_operations, so if anyone would like to pitch in,
> > please do so.
> > 
> > ---
> > 
> > Subject: [PATCH 1/1] security: constify seq_operations
> > 
> > Make all seq_operations structs const, to help mitigate
> > against revectoring user-triggerable function pointers.
> > 
> > This is derived from the grsecurity patch, although generated
> > from scratch because it's simpler than extracting the changes
> > from there.
> > 
> > Signed-off-by: James Morris <jmorris@namei.org>
> 
> I think it's a good idea.
> 
> I suppose we could add a script to check for any new
> seq_ops structs not constified...  something as simple as
> find . -type f -print0 | xargs -0 grep 'struct seq_operations' | grep
> -v const Though what you have here hits all of those and more.
> 
that's what checkpatch.pl is for
(afaik it does that already for file_operations)


-- 
Arjan van de Ven 	Intel Open Source Technology Centre
For development, discussion and tips for power savings, 
visit http://www.lesswatts.org
