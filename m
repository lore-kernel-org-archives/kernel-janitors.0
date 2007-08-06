From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 06 Aug 2007 22:59:06 +0000
Subject: Re: A change of approach
Message-Id: <20070806225906.GA9732@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070731220505.GT21219@parisc-linux.org>
In-Reply-To: <20070731220505.GT21219@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Aug 06, 2007 at 07:20:00PM +0200, Andi Drebes wrote:
> Hi Darren,
> > I was just wondering about finding an unmaintained driver. Should we
> > just look for
> > stuff marked as Orphan in the MAINTAINERS file or is there
> > another/better list/way
> > to find an un-maintained driver that we shuld be made aware of?

Better is to find drivers with no entry in the MAINTAINERS file at all
... though that's hard to do reliably.  If you announce to K-J that you
intend to take on a driver, someone with a bit more experience such as
Randy or myself can probably let you know if that driver has a maintainer.

> I don't think that the driver definitely has to be unmaintained in order to be 
> chosen by a kernel janitor. If you pick a driver that is currently 
> maintained, you could do the janitorial work and send a series of patches to 
> the maintainer and to the list. I think a maintainer would appreciate this 
> because somebody does the "dirty work".

That's going to vary by maintainer -- people are funny that way.
Definitely have a thick skin if you're going to do this.  I know how
frustrating it is if you've put in a lot of work cleaning up a driver,
only to have the maintainer reject it because "this driver has to work
on $otheros too, and they don't have a $foo".

I'm glad you two have taken my frustrated comment in such a positive
way.  Thanks.

-- 
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
