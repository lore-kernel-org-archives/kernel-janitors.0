From: Thomas Meyer <thomas@m3y3r.de>
Date: Tue, 02 Aug 2011 19:34:14 +0000
Subject: Re: [PATCH] Use kstrdup rather than duplicating its implementation
Message-Id: <1312313657.2629.20.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312302089.2629.15.camel@localhost.localdomain>
	 <20110802180537.GB3839@shale.localdomain>
In-Reply-To: <20110802180537.GB3839@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Am Dienstag, den 02.08.2011, 21:05 +0300 schrieb Dan Carpenter:
> On Tue, Aug 02, 2011 at 06:21:26PM +0200, Thomas Meyer wrote:
> >  The semantic patch that makes this output is available
> >  in scripts/coccinelle/api/kstrdup.cocci.
> > 
> >  More information about semantic patching is available at
> >  http://coccinelle.lip6.fr/
> > 
> 
> These should be sent individually, because the chunks need to go into
> a bunch of separate trees before they get merged into the official
> kernel.  (One change per file basically on this).
> 

Does somebody maybe have a script for doing this split of an mbox file?
maybe this script could also call get_maintainer.pl and change the To:
field accordingly?

Just asking...




