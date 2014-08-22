From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 22 Aug 2014 16:25:32 +0000
Subject: Re: [PATCH 0/6] Remove various orphaned header files
Message-Id: <alpine.DEB.2.02.1408221824490.2055@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1403630855-29186-1-git-send-email-linux@rasmusvillemoes.dk>  <1403631263.29061.17.camel@joe-AO725> <8761hksfnf.fsf@rasmusvillemoes.dk> <1408724465.13483.17.camel@joe-AO725>
In-Reply-To: <1408724465.13483.17.camel@joe-AO725>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Fri, 22 Aug 2014, Joe Perches wrote:

> On Fri, 2014-08-22 at 17:33 +0200, Rasmus Villemoes wrote:
> > Joe Perches <joe@perches.com> writes:
> > 
> > > On Tue, 2014-06-24 at 19:27 +0200, Rasmus Villemoes wrote:
> > >> AFAICT, these headers are not used anywhere, and are just accidental
> > >> leftovers from past cleanups.
> > >
> > > Thanks.
> > 
> > Did anyone pick these [1] up? All six files still seem to be present.
> 
> Doesn't look like it.  There is no guaranteed
> mechanism to get these types of patches applied.
> 
> I suggest you resend these to a wider audience.
> 
> Jiri Kosina <trivial@kernel.org> is the maintainer of
> the "trivial" tree, some patches of this type go
> through that tree every once in awhile.
> 
> Andrew Morton <akpm@linux-foundation.org> sometimes
> picks up things like this.
> 
> Also, make sure to send the individual deletions to the
> original maintainers, authors and signers of each file.
> 
> For instance:
> 
> $ ./scripts/get_maintainer.pl -f include/linux/platform_data/tegra_emc.h
> Stephen Warren <swarren@wwwdotorg.org> (supporter:TEGRA ARCHITECTUR...)
> Thierry Reding <thierry.reding@gmail.com> (supporter:TEGRA ARCHITECTUR...)
> linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTUR...)
> 
> $ git log --format="Author: %an <%ae>" include/linux/platform_data/tegra_emc.h
> Author: Olof Johansson <olof@lixom.net>
> 
> Lastly, if none of that works within a couple of
> release cycles, send them directly to Linus.

If the individual patches are independent, I was told to make that 
explicit.  Otherwise, each person thinks someone else should take care of 
it.

julia
