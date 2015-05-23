From: Joe Perches <joe@perches.com>
Date: Sat, 23 May 2015 17:26:52 +0000
Subject: Re: [PATCH] checkpatch: Categorize some long line length checks
Message-Id: <1432402012.29657.52.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1432237849-53947-1-git-send-email-shuey@purdue.edu>
	 <1432237849-53947-11-git-send-email-shuey@purdue.edu>
	 <1432242004.20840.68.camel@perches.com>
	 <1432362494.29657.40.camel@perches.com>
	 <alpine.DEB.2.10.1505231331050.2554@hadrien>
In-Reply-To: <alpine.DEB.2.10.1505231331050.2554@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Andrew Morton <akpm@linux-foundation.org>, oleg.drokin@intel.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, HPDD-discuss@ml01.01.org, lustre-deve@lists.lustre.org, Dan Carpenter <dan.carpenter@oracle.com>, Mike Shuey <shuey@purdue.edu>

On Sat, 2015-05-23 at 13:32 +0200, Julia Lawall wrote:
> On Fri, 22 May 2015, Joe Perches wrote:
> > Many lines of code extend beyond the maximum line length.
> > Some of these are possibly justified by use type.
> >
> > For instance:
> >
> > structure definitions where comments are added per member like
> >
> > struct foo {
> > 	type member;		/* some long description */
> 
> I'm not super fond of the comment one.  Perhaps people could express
> themselves more concisely, or put the details elsewhere?

Concision is good, straining for brevity or bad
formatting isn't.

I've seen a lot of ugly patches lately to "fix"
code like this by making it worse.

By default, there is still a long_line warning for
this style.  It arguably could be appropriate to
keep some lines like this and this makes it easy
to tell people "add --ignore=<type>".

This patch shouldn't be applied right now anyway.

I think the idea is OK, but this implementation
could be improved and clarified by moving the
current exclusions before the classifications.

Anyone else have an opinion?

I'll send a V2 later unless there are more comments.



