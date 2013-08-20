From: Joe Perches <joe@perches.com>
Date: Tue, 20 Aug 2013 22:49:45 +0000
Subject: Re: rfc: trivial patches and slow deaths?
Message-Id: <1377038985.2016.96.camel@joe-AO722>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376944033.2016.13.camel@joe-AO722>
	 <alpine.LNX.2.00.1308192229360.21654@pobox.suse.cz>
	 <1376946644.2016.35.camel@joe-AO722>
	 <alpine.LNX.2.00.1308192315000.21654@pobox.suse.cz>
	 <1376947637.2016.39.camel@joe-AO722> <1377028944.2737.75@driftwood>
	 <1377029650.2016.72.camel@joe-AO722> <1377035369.2737.85@driftwood>
	 <1377036678.2016.88.camel@joe-AO722>
	 <20130820152456.c12dd8f543e2735b6952ae13@linux-foundation.org>
In-Reply-To: <20130820152456.c12dd8f543e2735b6952ae13@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rob Landley <rob@landley.net>, Jiri Kosina <jkosina@suse.cz>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

On Tue, 2013-08-20 at 15:24 -0700, Andrew Morton wrote:
> On Tue, 20 Aug 2013 15:11:18 -0700 Joe Perches <joe@perches.com> wrote:
> 
> > Andrew?  Do you want to handle patches for defects that
> > are both obvious _and_ trivial?
> 
> I look at everything!

Well, I guess I'll have to start cc'ing you on
the trivial in case the eyestrain gets to you.

[]

> I somewhat disagree that even
> https://patchwork.kernel.org/patch/2833648/ was trivial.  It changes
> the format of kernel logs and might have implications for people who
> are parsing those logs.

I think there are _very_ few instances where dmesg
output should be kept constant for scrapers.

The format of an oops is about the only one I can
think of where it's reasonable to do so.

> one needs to read each and every
> conversion and decide on the risk factor.

Enjoy...

