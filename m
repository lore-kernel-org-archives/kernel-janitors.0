From: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 09 Jun 2020 09:10:14 +0000
Subject: Re: [PATCH] exfat: Fix use after free in exfat_load_upcase_table()
Message-Id: <20200609091014.GA529192@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
In-Reply-To: <9b9272fb-b265-010b-0696-4c0579abd841@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Namjae Jeon <namjae.jeon@samsung.com>, Sungjong Seo <sj1557.seo@samsung.com>, Tetsuhiro Kohada <kohada.t2@gmail.com>

On Mon, Jun 08, 2020 at 05:07:33PM +0200, Markus Elfring wrote:
> > This code calls brelse(bh) and then dereferences "bh" on the next line
> > resulting in a possible use after free.
> 
> There is an unfortunate function call sequence.
> 
> 
> > The brelse() should just be moved down a line.
> 
> How do you think about a wording variant like the following?
> 
>    Thus move a call of the function “brelse” one line down.
> 
> 
> Would you like to omit a word from the patch subject so that
> a typo will be avoided there?

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
