From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 27 Nov 2017 20:49:09 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <alpine.DEB.2.20.1711272146310.2405@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com> <alpine.DEB.2.20.1711260648130.2387@hadrien> <1511676085.20482.18.camel@perches.com> <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com> <1511735382.20482.27.camel@perches.com>
 <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com> <alpine.DEB.2.20.1711270709390.2369@hadrien> <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com> <alpine.DEB.2.20.1711270732550.2369@hadrien> <86f3f594-79f7-c2ce-2cc6-f641bd6f55ae@deltatee.com>
 <1511771322.32426.1.camel@perches.com> <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com> <1511803686.32426.54.camel@perches.com> <322acd87-7708-cc90-c3d1-caad7bd023e5@deltatee.com> <1511804568.32426.56.camel@perches.com> <f2f5622f-5c5f-3dbf-1d7e-bc49e9c57dae@deltatee.com>
 <1511809027.32426.62.camel@perches.com> <993ca1c1-6d27-2ee1-94ed-41e8249755bd@deltatee.com>
In-Reply-To: <993ca1c1-6d27-2ee1-94ed-41e8249755bd@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>



On Mon, 27 Nov 2017, Logan Gunthorpe wrote:

>
>
> On 27/11/17 11:57 AM, Joe Perches wrote:
> > It may or not be correct.
>
> It's absolutely not correct in that it either requires that a subsequent
> KERN_CONT/pr_cont or a '\n' at the end and it has neither.
>
> > Without inter-function call code flow analysis,
> > it's not possible to be correct.
>
> But how many cases actually have the pr_cont/KERN_cont called in different
> functions? This appears to be exceedingly rare to me.
>
> > If you can get the false positive & false negative
> > rate higher, I'll listen.
>
> The only two classes of false positives that you've pointed out or that I'm
> aware of:
>
> 1) The case where call did not either end in a '\n' or have a
> KERN_CONT/pr_cont in a subsequent call. I've been arguing (to deaf ears) that
> a warning is appropriate here and this is not a false positive because it
> absolutely is incorrect one way or the other. Coccinnelle will also suffer
> from this issue because it can no better decide whether the developer intended
> for the next call to be a continuation or for a '\n' to end the line.
>
> 2) Cases where the pr_cont/KERN_CONT is not in sufficient context for the
> script to detect. These are impossible to fix (and it's likely also impossible
> for Coccinelle to be 100% accurate here). However, I'd expect these to be
> *very* rare and I'm only actually aware of one case where this has actually
> happened (lib/locking-selftest.c:1189) and (mostly by luck) my v2 patch does
> not flag this where Coccinelle did. Not to mention that continuation usage is
> discouraged in new code so this should be even rarer on the majority of what
> checkpatch is used for.
>
> (also 3. would be the %pV case, but I've removed those in what could be a v3
> of the patch -- I'd also be happy to address other false positives classes if
> I could find them)
>
> False negatives are much harder to quantify or improve. But given that I
> detect nearly 6000 errors in the existing kernel it can't be *that* high.
> Also, these false negatives do nothing to negate the benefit of having this
> functionality seeing the vast majority of developers are doing simple things
> with pr_* and dev_*.
>
> Coccinelle may very well be able to do better at false negatives. But in this
> case, it would still be great to have both because checkpatch will flag a
> significant subset of the errors much earlier in the development cycle and
> save developers a bunch of time.
>
> So, in my opinion, I think focusing too hard on the false negatives deprives
> developers of what could be a useful check.
>
> > I think the Coccinelle script has a better chance
> > to be more correct.
>
> And yet, you have not pointed out any false positives that my patch gives
> which Coccinelle does/would not. It really feels to me like your biases are
> guiding your decision here and you aren't really looking at the results.
>
> Another thought I've had is that the dev_ functions don't have any form of
> continuation. So we could potentially limit checkpatch to looking for those to
> avoid the issues with continuations. It's not high coverage but at least a lot
> of the driver patches would be checked with no chance of false positives. I
> think there would be value in doing that.

Perhaps if there is a possible flow from one print to another within a
single function and in both cases the format string is at least say 25
characters (completely random value), then it is pretty likely that a
newline is intended.

Alternatively, if the first format string doesn't end in a space and the
second one doesn't begin with a space, then a newline is also likely
intended.

julia
