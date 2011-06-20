From: Peter =?iso-8859-1?q?H=FCwe?= <PeterHuewe@gmx.de>
Date: Mon, 20 Jun 2011 20:16:19 +0000
Subject: Re: [PATCH 1/2 v2] mfd/ab3550: Convert to kstrtou8_from_user
Message-Id: <201106202216.20343.PeterHuewe@gmx.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <BANLkTikKRVP4PW48YtR+mMMNsaxTDxoGtw@mail.gmail.com>
	<1308599189-28555-1-git-send-email-peterhuewe@gmx.de>
	<20110620195037.GA2534@p183.telecom.by>
In-Reply-To: <20110620195037.GA2534@p183.telecom.by>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Am Montag 20 Juni 2011, 21:50:38 schrieb Alexey Dobriyan:
> On Mon, Jun 20, 2011 at 09:46:28PM +0200, Peter Huewe wrote:
> > -	char buf[32];
> > -	int buf_size;
> > -	unsigned long user_address;
> > +	u8 user_address;

> > +	/* Get userspace string and convert to number */
> > +	err = kstrtou8_from_user(user_buf, count, 0, &user_address);
...
> > 
> >  	ab->debug_address = user_address;

> 
> You don't need temporary variable and should write straight to final
> location, because kstrto* functions will never write to result unless it
> was converted successfully.

Alexey thank you very much for your review, hints and most of all patience ;)
The code really gets cleaner and cleaner.

While changing the code (once again ;) and looking at your remarks I also saw 
that ab3550->debug_address and ->debug_bank are always casted to u8.

Do you think I could also change the two fields of the struct ab3550 (only 
used in this file) to u8 in this patch, too?
This way I could get rid of the u8* cast which is now needed in this case, if 
I take you last remark into account.
> err = kstrtou8_from_user(user_buf, count, 0, (u8 *)&ab->debug_address);

And also clean the code from all the other unnecessary u8 casts.

What do you think?
Or split it up into two seperate patches?

Thanks,
Peter
