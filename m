From: Jean Delvare <jdelvare@suse.de>
Date: Wed, 20 Jul 2016 21:10:44 +0000
Subject: Re: staging: ks7010: Rename jump labels
Message-Id: <20160720231044.4b4f2864@endymion>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1402251014170.2080@hadrien>
	<530CD2C4.4050903@users.sourceforge.net>
	<alpine.DEB.2.10.1402251840450.7035@hadrien>
	<530CF8FF.8080600@users.sourceforge.net>
	<alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
	<530DD06F.4090703@users.sourceforge.net>
	<alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
	<5317A59D.4@users.sourceforge.net>
	<66bd684a-98f1-0ec4-aa95-1a966d7c4e90@users.sourceforge.net>
	<5f019748-0e67-6077-5abc-381725410b66@users.sourceforge.net>
	<20160720155216.GD1688@katana>
	<ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
In-Reply-To: <ca946880-bb63-b0a3-c9c8-e8233ce9656c@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Wolfram Sang <wsa@the-dreams.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

Hello Markus, Wolfram,

On Wed, 20 Jul 2016 20:21:25 +0200, SF Markus Elfring wrote:
> >> Adjust jump targets according to the Linux coding style convention.
> > 
> > Really? Is that documented somewhere?
> 
> How do you think about information from the chapter "7: Centralized exiting of functions"?
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/CodingStyle?idGef4ad2684d380dd6d596140fb79395115c3950#n389

I'm not impressed by this piece of documentation. For example, <<also
don't name them after the goto location like "err_kmalloc_failed:">> is
as unclear as you can get. It would be much better to tell what to name
them, if the author thinks it really matters. (Personally I think it is
out of scope of coding style rules.)

Back to the lack of space before labels, it's at best a personal
preference. If you insist on standardizing, I'd call it a bug in the
documentation, which should be fixed. One space before label is the way
to go.

> > Quoting Jean Delvare:

I'm honored :)

> > "> It is generally accepted to indent labels with a single space. This
> >  > avoids breaking the -p option of diff."
> 
> Would you like to take another look at the warning "LEADING_SPACE"?
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/scripts/checkpatch.pl?idGef4ad2684d380dd6d596140fb79395115c3950#n3004
> 
> Does such a check need further considerations?

checkpatch has become so complex, it's full of false positives, trying
to enforce rules just because one developer wants to force his view on
all others. I stopped following everything the script says long ago.
I'm cherry-picking now.

That being said... checkpatch does not complain about leading space
before labels. Not even with --strict. So why are you mentioning it
here?

> > So, NACK for now unless we know 'diff' has been fixed.

Full nack from myself as well. Just looking at the thread on lkml makes
me feel dizzy. When you are about to send that amount of messages, you
should pause and think again. Is it really worth it? I think I'd be
less annoyed by regular spam.

> I am also curious on corresponding software evolution.

I wouldn't consider it a bug. Despite the description of option -p in
the diff man page calling it C specific, it looks very generic to me.
As I understand it, it looks for any line not starting with a blank and
containing at least one letter (or maybe just starting with a letter -
I didn't look at the code.) Thankfully it doesn't try to parse C. So it
depends on how you indent your code. Live with it.

It's been that way for so long that changing it now is hardly an
option. That change would be seen as a gratuitous regression by many
(including myself.) And for the record, "git diff" behaves exactly the
same. So it's a de facto standard.

-- 
Jean Delvare
SUSE L3 Support
