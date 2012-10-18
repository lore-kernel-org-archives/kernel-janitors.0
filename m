From: David Miller <davem@davemloft.net>
Date: Thu, 18 Oct 2012 19:07:55 +0000
Subject: Re: a dedicated list for build error reports?
Message-Id: <20121018.150755.2248122089507026505.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018130146.GA11433@localhost>
In-Reply-To: <20121018130146.GA11433@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 18 Oct 2012 21:01:46 +0800

> On Thu, Oct 18, 2012 at 03:45:22PM +0300, Dan Carpenter wrote:
>> On Wed, Oct 17, 2012 at 11:10:42AM +0200, Luis G.F wrote:
>> > unsubscribe kernel-janitors
>> 
>> Uh.  Obviously this isn't the right way to unsubscribe.  You have to
>> send the email to majordomo@vger.kernel.org and not to the list.
>> 
>> But I do think we should maybe find another list for Fengguang's
>> emails?  It's sort of a lot higher traffic than before and sort of a
>> different flavour.
> 
> Agreed.. I'm afraid that my report titles are much more messy than
> the normal emails and there could be a dozen of such reports per day.
> 
> It may be more clean to send the build error/warning reports to a
> standalone list.
> 
>> I still will want to subscribe to the emails, but it would be better
>> to use a different list.  Apparently Dave Miller didn't like the
>> idea of creating a special list for it because he didn't like the
>> emails in the first place.  But now I think everyone likes them a
>> lot.  It might be worth asking again.
> 
> CC Dave Miller for possible new inputs.

I find them super annoying, and these reports are extremely sub-optimal
as is.

The amount of time spent composing these reports could equally be spent
condensing the error down to a small, self contained, set of text
explaining the exact build failure and an initial root-cause estimate.
And sending it to the correct maintainer's list.

Heck, in the same amount of time, you could even implement the damn
fix!

I'm not adding a list for this noise.
