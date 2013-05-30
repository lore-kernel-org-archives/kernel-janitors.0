From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 30 May 2013 13:58:39 +0000
Subject: Re: [Patch] Staging: winbond: Made local functions static
Message-Id: <20130530135839.GK23932@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51A6E81C.2000303@gmail.com>
In-Reply-To: <51A6E81C.2000303@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, May 30, 2013 at 06:51:48PM +0530, Harsh Kumar wrote:

> The v2 patch will be over & above the changes that have been by my
> previous patch, right?

A v2 patch is a replacement for the first patch.  There is a formula
to it:

1) Reply to the original patch.
2) The subject changes to [patch v2] Staging: winbond: Made local functions static
3) Use the same changelog as before.
4) After the signed off by line put:
---
v2: whitespace changes

That line gets chopped out of the commit message save in the git
log.

5) The same patch but without the whitespace changes

Btw, once Greg sends you an email that your patch has been applied
then it's too late to send a v2 patch and everything needs to be
done as a separate patch.

I feel like if Greg has already merged the patch then just forget
about it.  We'll fix it up later.  No worries.  Patch review isn't
meant as a punishment for newbie stuff.  ;)

regards,
dan carpenter
