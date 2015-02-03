From: Tejun Heo <tj@kernel.org>
Date: Tue, 03 Feb 2015 12:57:57 +0000
Subject: Re: [PATCH 2/2] sata_mv: More error handling for phy_power_off() in mv_platform_remove()
Message-Id: <20150203125757.GF19463@htj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54D08871.6030304@users.sourceforge.net>
In-Reply-To: <54D08871.6030304@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 03, 2015 at 07:48:14AM -0500, Tejun Heo wrote:
> That's too anal to be helpful and too spurious to become even remotely

Let me clarify the "too anal" part a bit.  Let's say people push this
like crazy and we successfully mark all places to either check the
return value or have (void) in front.  It's not difficult to realize
that that would be the exact same situation as right now just with
more visual clutter.  That's the problem when these things become
obsessive - they become indisciminate and thus meaningless.  Annotate
the exceptionals, not the other way around.

Thanks.

-- 
tejun
