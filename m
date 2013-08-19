From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 19 Aug 2013 21:22:02 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <alpine.LNX.2.00.1308192315000.21654@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376944033.2016.13.camel@joe-AO722>  <alpine.LNX.2.00.1308192229360.21654@pobox.suse.cz> <1376946644.2016.35.camel@joe-AO722>
In-Reply-To: <1376946644.2016.35.camel@joe-AO722>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Mon, 19 Aug 2013, Joe Perches wrote:

> This is a 7 line patch that corrects logging defects that has had no 
> reply from you for the last month.
> 
> https://patchwork.kernel.org/patch/2833648/

This hasn't missed any Linus' major release, as it has been submitted post 
3.11 merge, right? (hint, that was Jul 4th).

If this would miss *next* major Linus' release, I would accept your 
complaints. But this is definitely not the case.

Joe, patience is a virtue. Especially when it comes to lower-priority 
stuff.

> I think that's overly long a time frame (any patch series will bitrot) 
> and too opaque for trivial patch submitters to have any idea what's 
> going on.

Again, only large, corss-subsystem series with a lot of maintainers CCed 
are generally delayed.

> Also, if you're concerned that the trivial tree wouldn't merge well in 
> next, 

That's not my concern. My concern is

- avoid work duplication
- avoid git history pollution (again, especially by trivial stuff)
- avoid unecessary stepping on maintainer's toes by something that has 
  such a low importance as trivial.git

Thanks for taking care,

-- 
Jiri Kosina
SUSE Labs
