From: Joe Perches <joe@perches.com>
Date: Mon, 19 Aug 2013 21:27:17 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <1376947637.2016.39.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376944033.2016.13.camel@joe-AO722>
	 <alpine.LNX.2.00.1308192229360.21654@pobox.suse.cz>
	 <1376946644.2016.35.camel@joe-AO722>
	 <alpine.LNX.2.00.1308192315000.21654@pobox.suse.cz>
In-Reply-To: <alpine.LNX.2.00.1308192315000.21654@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jiri Kosina <jkosina@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Mon, 2013-08-19 at 23:22 +0200, Jiri Kosina wrote:
> On Mon, 19 Aug 2013, Joe Perches wrote:
> 
> > This is a 7 line patch that corrects logging defects that has had no 
> > reply from you for the last month.
> > 
> > https://patchwork.kernel.org/patch/2833648/
> 
> This hasn't missed any Linus' major release, as it has been submitted post 
> 3.11 merge, right? (hint, that was Jul 4th).
> 
> If this would miss *next* major Linus' release, I would accept your 
> complaints. But this is definitely not the case.

You're suggesting this patch, which corrects obvious
defects, should miss 3.12 and go into 3.13?

I think that's wrong.

I think it should be in -next now.  It's not.

What should any patch submitter expect about
visibility and/or knowledge of the applicability
of this sort of patch from trivial?


