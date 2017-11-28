From: Joe Perches <joe@perches.com>
Date: Tue, 28 Nov 2017 00:15:21 +0000
Subject: Re: [PATCH v2] checkpatch: Add a warning for log messages that don't end in a new line
Message-Id: <1511828121.32426.83.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171126054037.9743-1-logang@deltatee.com>
         <alpine.DEB.2.20.1711260648130.2387@hadrien>
         <1511676085.20482.18.camel@perches.com>
         <5c0a2778-8e8f-9fbb-b13f-1d880acb949b@deltatee.com>
         <1511735382.20482.27.camel@perches.com>
         <355029d1-48f5-095e-0d99-bb726d2d56e5@deltatee.com>
         <alpine.DEB.2.20.1711270709390.2369@hadrien>
         <ec39f4f5-cfab-a184-0f27-7f0172e2984f@deltatee.com>
         <alpine.DEB.2.20.1711270732550.2369@hadrien>
         <86f3f594-79f7-c2ce-2cc6-f641bd6f55ae@deltatee.com>
         <1511771322.32426.1.camel@perches.com>
         <a0c147a5-a727-0ce8-a0c3-200fe3b17e4a@deltatee.com>
         <1511803686.32426.54.camel@perches.com>
         <322acd87-7708-cc90-c3d1-caad7bd023e5@deltatee.com>
         <1511804568.32426.56.camel@perches.com>
         <f2f5622f-5c5f-3dbf-1d7e-bc49e9c57dae@deltatee.com>
         <1511809027.32426.62.camel@perches.com>
         <993ca1c1-6d27-2ee1-94ed-41e8249755bd@deltatee.com>
In-Reply-To: <993ca1c1-6d27-2ee1-94ed-41e8249755bd@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Logan Gunthorpe <logang@deltatee.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Andy Whitcroft <apw@canonical.com>

On Mon, 2017-11-27 at 12:58 -0700, Logan Gunthorpe wrote:
> 
> On 27/11/17 11:57 AM, Joe Perches wrote:
> > It may or not be correct.
> 
> It's absolutely not correct in that it either requires that a subsequent 
> KERN_CONT/pr_cont or a '\n' at the end and it has neither.

The warning described is simply not correct.

> > Without inter-function call code flow analysis,
> > it's not possible to be correct.
> 
> But how many cases actually have the pr_cont/KERN_cont called in 
> different functions? This appears to be exceedingly rare to me.

Probably more than 50.

> > If you can get the false positive & false negative
> > rate higher, I'll listen.

> The only two classes of false positives that you've pointed out or that 
> I'm aware of:
> 
> 1) The case where call did not either end in a '\n' or have a 
> KERN_CONT/pr_cont in a subsequent call.

or a bare printk.

>  I've been arguing (to deaf ears) 

wrong here too.

> that a warning is appropriate here and this is not a false positive 
> because it absolutely is incorrect one way or the other.

The checkpatch message itself has to be correct.
Classifying the defect properly is a requirement.

> Coccinnelle 
> will also suffer from this issue because it can no better decide whether 
> the developer intended for the next call to be a continuation or for a 
> '\n' to end the line.

Well, coccinelle could do a better job than a
line parser like checkpatch.

Line parsing is what makes the type of defect difficult
for a stupid parser, and checkpatch is one of those, to
be correct enough with a low enough false positive rate
to be useful.

Please be aware I have already written just about exactly
what you are trying to do more than once and discarded
the work because the defect report rate was just too high.

> 2) Cases where the pr_cont/KERN_CONT is not in sufficient context for 
> the script to detect. These are impossible to fix (and it's likely also 
> impossible for Coccinelle to be 100% accurate here). However, I'd expect 
> these to be *very* rare and I'm only actually aware of one case where 
> this has actually happened (lib/locking-selftest.c:1189) and (mostly by 
> luck) my v2 patch does not flag this where Coccinelle did. Not to 
> mention that continuation usage is discouraged in new code so this 
> should be even rarer on the majority of what checkpatch is used for.
> 
> (also 3. would be the %pV case, but I've removed those in what could be 
> a v3 of the patch -- I'd also be happy to address other false positives 
> classes if I could find them)

> False negatives are much harder to quantify or improve. But given that I 
> detect nearly 6000 errors

No, you don't detect errors, you detect matches.

If you look at your results a bit harder, you'll find many
false positives.

> And yet, you have not pointed out any false positives that my patch 
> gives which Coccinelle does/would not. It really feels to me like your 
> biases are guiding your decision here and you aren't really looking at 
> the results.

I know the kernel source code style very well.
You simply haven't looked very hard at your results.

> Another thought I've had is that the dev_ functions don't have any form 
> of continuation.

Untrue

> So we could potentially limit checkpatch to looking for 
> those to avoid the issues with continuations. It's not high coverage but 
> at least a lot of the driver patches would be checked with no chance of 
> false positives. I think there would be value in doing that.

For instance:

drivers/mfd/ipaq-micro.c:		dev_err(micro->dev,
drivers/mfd/ipaq-micro.c-			"unknown msg %d [%d] ", id, len);
drivers/mfd/ipaq-micro.c-		for (i = 0; i < len; ++i)
drivers/mfd/ipaq-micro.c-			pr_cont("0x%02x ", data[i]);
drivers/mfd/ipaq-micro.c-		pr_cont("\n");

$ git grep -A5 -P -w "\bdev_(warn|alert|crit|err|info|notice)" | \
  grep -B5 -P -w "printk|pr_cont"

will find some, but not all of these types of uses.

$ grep -A5 -rP --include=*.[ch] '\bdev_(warn|alert|crit|err|info|notice).*\"[^"]+(?<!n)"' * | \
  grep -B5 -w -P "(printk|pr_cont)"

will find fewer false positives, but miss some
multiline dev_<level> calls too.


