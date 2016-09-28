From: Paul Bolle <pebolle@tiscali.nl>
Date: Wed, 28 Sep 2016 17:44:04 +0000
Subject: Re: [PATCH 1/5] ISDN-Gigaset: Use kmalloc_array() in two functions
Message-Id: <1475084644.16606.44.camel@tiscali.nl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
         <6d4bbb77-914f-19b8-a1a9-2731d1158612@users.sourceforge.net>
         <4fb300f1-ff02-7983-464f-fcbca5919dac@users.sourceforge.net>
         <1475062635.16606.27.camel@tiscali.nl>
         <1a101dea-006f-f507-54e5-5d05ccd996ec@users.sourceforge.net>
In-Reply-To: <1a101dea-006f-f507-54e5-5d05ccd996ec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: gigaset307x-common@lists.sourceforge.net, netdev@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

On Wed, 2016-09-28 at 18:38 +0200, SF Markus Elfring wrote:
> > I'm not going to change code just because some checker suggests to
> > do so.
> 
> The script "checkpatch.pl" can point information out like the
> following.
> 
> WARNING: Prefer kmalloc_array over kmalloc with multiply

Am I being trolled?


Paul Bolle
