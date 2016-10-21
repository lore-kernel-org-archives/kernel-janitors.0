From: Theodore Ts'o <tytso@mit.edu>
Date: Fri, 21 Oct 2016 17:53:17 +0000
Subject: Re: Hexagon-setup: Combine four seq_printf() calls into one call in show_cpuinfo()
Message-Id: <20161021175317.nnb2keq7m3phwgbv@thunk.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c19c69d5-600c-f08b-f448-0420e677db63@users.sourceforge.net>
 <alpine.DEB.2.10.1610210918420.3212@hadrien>
 <e9daa136-c6ab-2f96-3d20-6e143fa1170b@users.sourceforge.net>
 <20161021154624.maiwbgjmzlzhin2l@thunk.org>
 <48d54097-6be3-d39d-2af9-d4ad90c3c417@users.sourceforge.net>
In-Reply-To: <48d54097-6be3-d39d-2af9-d4ad90c3c417@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-hexagon@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Richard Kuo <rkuo@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Fri, Oct 21, 2016 at 07:33:30PM +0200, SF Markus Elfring wrote:
> 
> > but (a) this isn't performance critical,
> 
> This can be.

In this case, no, it really can't possibly be performance critical.
If you can't see why, you have no business trying to send patches.

> > and (b) the number of bytes saved is really tiny.
> 
> I imagine that the corresponding code and data size reduction could
> be occasionally useful, couldn't it?

Note that in some cases, attempts to shirnk the code by tiny amounts
can actually, paradoxically, cause the code to actually *expand*.  In
any case, shrinking the kernel by 0.00015% really won't matter, since
for no other reason, we round memory used to 4k pages.

So keeping the code easily readible is aslo a consideration that needs
to be taken into acconut.

> > But at least if the compiler was doing the work, it would at least deal with
> > it everywhere.
> 
> I would find such an optimisation possibility also nice.
> 
> Can it become acceptable to achieve a similar effect by the application
> of scripts for the semantic patch language in the meantime?

The problem with scripts like this is that they very clearly don't
have any human judgement.  And when the person using the scripts also
doesn't seem to have good judgement, it's a real problem.

When the author of the semantic patch language is telling you to stand
down, and you still want to try to argue for blind application of
patches, we have a really big problem.  Especially when some of your
patches have actually introduced bugs.

					- Ted
