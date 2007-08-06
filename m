From: Andi Drebes <lists-receive@programmierforen.de>
Date: Mon, 06 Aug 2007 17:20:00 +0000
Subject: Re: A change of approach
Message-Id: <200708061920.00504.lists-receive@programmierforen.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070731220505.GT21219@parisc-linux.org>
In-Reply-To: <20070731220505.GT21219@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Darren,

> > A better approach for the janitors to take would be to claim *a driver*,
> > and do everything on the todo list to it (as a series of patches,
> > obviously).  And fix up things that aren't on the todo list too, when
> > you notice them.
> 
> I was just wondering about finding an unmaintained driver. Should we
> just look for
> stuff marked as Orphan in the MAINTAINERS file or is there
> another/better list/way
> to find an un-maintained driver that we shuld be made aware of?

I don't think that the driver definitely has to be unmaintained in order to be 
chosen by a kernel janitor. If you pick a driver that is currently 
maintained, you could do the janitorial work and send a series of patches to 
the maintainer and to the list. I think a maintainer would appreciate this 
because somebody does the "dirty work".

	Andi
