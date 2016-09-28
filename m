From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 28 Sep 2016 11:56:06 +0000
Subject: Re: [PATCH 0/5] ISDN-Gigaset: Fine-tuning for three function implementations
Message-Id: <1475063766.16606.39.camel@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
In-Reply-To: <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Mon, 2016-09-26 at 17:37 +0200, SF Markus Elfring wrote:
> Some update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (5):
>   Use kmalloc_array() in two functions
>   Improve another size determination in gigaset_initcs()
>   Delete an error message for a failed memory allocation
>   Release memory in gigaset_initcs() after an allocation failure
>   Enclose two expressions for the sizeof operator by parentheses
> 
>  drivers/isdn/gigaset/common.c | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)

Two of the five patches introduced bugs. The rest of the series isn't
free of various nits either. Of course, I was in no mood to be lenient
when I looked at those three patches.

I won't take any of these patches, sorry.


Paul Bolle
