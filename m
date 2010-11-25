From: Dan Carpenter <error27@gmail.com>
Date: Thu, 25 Nov 2010 05:36:27 +0000
Subject: Re: [PATCH] Fix sparse message rtl8192u
Message-Id: <20101125053626.GS1522@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
In-Reply-To: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Nov 24, 2010 at 10:41:43PM +0100, david.chosrova@libertysurf.fr wrote:
> 
> 
> Hello,
> 
> Fix sparse message:
> 
> drivers/staging/rtl8192u/r8192U_core.c:247:1: warning: "eqMacAddr" redefined
> In file included from drivers/staging/rtl8192u/:81:81:
> drivers/staging/rtl8192u/dot11d.h:35:1: warning: this is the location of the
> previous definition
> 
> if ENABLE_DOT11D is enabled eqMacAddr is defined twice.
>

It would be better to remove the #ifdef around the include "dot11d.h"
and delete this definition.

Also your email client is line wrapping on long lines and changing 
tabs to spaces.  Read Documentation/email-clients.txt then send an 
email to yourself.  Save the raw email (including email headers 
and everything) then `cat email.txt | patch -p1`  Resend when the
patch applies.

CC the maintainers when you resend:
	Greg Kroah-Hartman <gregkh@suse.de>,
	devel@driverdev.osuosl.org

regards,
dan carpenter


