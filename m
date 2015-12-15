From: Joe Perches <joe@perches.com>
Date: Tue, 15 Dec 2015 15:02:31 +0000
Subject: Re: [PATCH 1/7] staging: lustre: Delete unnecessary goto statements in six functions
Message-Id: <1450191751.3551.14.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
	 <566D7733.1030102@users.sourceforge.net>
	 <566D7830.9060000@users.sourceforge.net>
	 <1450189676.3551.1.camel@perches.com> <20151215144133.GC5284@mwanda>
In-Reply-To: <20151215144133.GC5284@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: SF Markus Elfring <elfring@users.sourceforge.net>, Andreas Dilger <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Oleg Drokin <oleg.drokin@intel.com>, lustre-devel@lists.lustre.org, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Tue, 2015-12-15 at 17:41 +0300, Dan Carpenter wrote:
> On Tue, Dec 15, 2015 at 06:27:56AM -0800, Joe Perches wrote:
> > On Sun, 2015-12-13 at 14:52 +0100, SF Markus Elfring wrote:
> > > From: Markus Elfring <elfring@users.sourceforge.net>
> > > Date: Sun, 13 Dec 2015 09:30:47 +0100
> > > 
> > > Six goto statements referred to a source code position directly behind them.
> > > Thus omit such unnecessary jumps.
> > 
> > I suggest you leave a blank line instead
> > of deleting the goto.
> > 
> 
> What is the point of the little bunny hop?
> 
> regards,
> dan carpenter
> 

-ENOPARSE little bunny hop
(though I could have said "just leave a blank line)

I think that code blocks are more obvious to read.

This is the original code:

	result = foo();
	if (result)
		goto label;

	result = bar();
	if (result)
		goto label;

	result = baz();
	if (result)
		goto label;

label:
	go on...

He proposes:

	result = foo();
	if (result)
		goto label;

	result = bar();
	if (result)
		goto label;

	result = baz();
label:
	go on...


I don't find the test->goto label; label: use offensive,
but if he does, I think keeping a blank line in place of
the test->goto might be better.

	result = foo();
	if (result)
		goto label;

	result = bar();
	if (result)
		goto label;

	result = baz();

label:
	go on...

