From: Randy Dunlap <randy.dunlap@oracle.com>
Date: Sun, 19 Aug 2007 22:41:46 +0000
Subject: Re: [PATCH 4/5] Documentation/firmware/... convert #include
Message-Id: <20070819154146.337bf347.randy.dunlap@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561972.4200.143.camel@localhost>
	<20070819153422.1e0b54af.randy.dunlap@oracle.com>
	<1187562717.4200.154.camel@localhost>
In-Reply-To: <1187562717.4200.154.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@suse.de>, Markus Rechberger <markus.rechberger@amd.com>

On Sun, 19 Aug 2007 15:31:57 -0700 Joe Perches wrote:

> On Sun, 2007-08-19 at 15:34 -0700, Randy Dunlap wrote:
> > > -#include "linux/firmware.h"
> > > +#include "firmware.h"
> > I believe that it should be <linux/firmware.h>.
> 
> OK.
> 
> That's not my taste though, especially if only
> included by files in the firmware_class directory.
> Less pollution/namespace collision in include/linux

It's not only included in that directory.
I find it included in 88 source files throughout the kernel tree.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
