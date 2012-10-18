From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 18 Oct 2012 23:22:27 +0000
Subject: Re: a dedicated list for build error reports?
Message-Id: <20121018232227.GA29599@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018130146.GA11433@localhost>
In-Reply-To: <20121018130146.GA11433@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi David,

> I find them super annoying, and these reports are extremely sub-optimal
> as is.
> 
> The amount of time spent composing these reports could equally be spent

The reports are machine composed which will save human time in the
long run. On the other hand, it does make the error reports less
amiable to human beings..

> condensing the error down to a small, self contained, set of text
> explaining the exact build failure and an initial root-cause estimate.
> And sending it to the correct maintainer's list.
> 
> Heck, in the same amount of time, you could even implement the damn
> fix!

That's right at large and we'll head for that direction. At the
initial stage, first priority has been to catch errors as much and
early as possible. I don't think there are anything wrong with that
as a first-step goal, and how things should work as stated by you
in the long run.

In the past months I've been focusing on improving the build system
and generate good error reports out of the box. It's more messy than
one would expect, and due to my limited skills it kept me busy for
ever write/rewriting features and fixing loads of bugs in the build
system.

As the build system goes mature and stable, we'll be able to pay more
attention to the errors themselves (instead of thinking/verifying how
to effectively catch errors, auto locate them down to the right commit
and detect whether they've already been fixed/reported somewhere).

In fact we have started to send ready apply-able fixes these days.

Thanks,
Fengguang
