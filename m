From: Dan Carpenter <error27@gmail.com>
Date: Sun, 28 Nov 2010 21:19:55 +0000
Subject: Re: [PATCH] Fix sparse message rtl8192u
Message-Id: <20101128211955.GD30799@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
In-Reply-To: <1290634903.4ced8697b0603@webmail.aliceadsl.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Nov 27, 2010 at 11:37:48PM +0100, David Chosrova wrote:
> Hello,
> 
>  In this patch I have removed the #ifdef ENABLE_DOT11D. 
> 

Cool man.  Looks good.

There are several places where ENABLE_DOT11D is still there in the
comments.  Can do a: grep ENABLE_DOT11D drivers/staging/rtl8192u/ -R
and remove all those?

Then add an:
Acked-by: Dan Carpenter <error27@gmail.com>

When people apply patches they try to automate the process.  They
have scripts that automatically take an email and creates a kernel
patch.  So choose a good subject and write a patch description.
I would normally write this:

Subject: [patch] Staging: rtl8192u: remove dead code to disable dot11d

This patch removes all the ENABLE_DOT11D ifdefs.  It's always enabled
for this driver.  DOT11D has to do with regulatory domains.

What prompted this patch was a warning message in Sparse:

drivers/staging/rtl8192u/r8192U_core.c:247:1: warning: "eqMacAddr"
redefined in file included from drivers/staging/rtl8192u/:81:81:
drivers/staging/rtl8192u/dot11d.h:35:1: warning: this is the location
of the previous definition                                                                                                   

Now there are no ifdefs around dot11d.h it made no sense to have this
second definition, so I removed that macro as well.

---
Edit that however you want.  That's just an idea.

Don't put the "Hello etc" into the message because Greg will have to
strip those bits out of the patch description by hand.

After the Signed-off-by: line put three dashes "---".  Things below that
line get stripped out of the patch description.  That's where you can
put the "Compile tested."  or "Feedback requested" stuff if you want.

Send your email to: gregkh@suse.de
CC these addresses: devel@driverdev.osuosl.org, error27@gmail.com, 
andreamrl@tiscali.it, linux-wireless@vger.kernel.org,
kernel-janitors@vger.kernel.org

regards,
dan carpenter
