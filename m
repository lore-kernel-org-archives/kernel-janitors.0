From: Julia Lawall <julia.lawall@lip6.fr>
Date: Mon, 01 Feb 2016 07:35:03 +0000
Subject: Re: [PATCH] staging: rtl8192u: Fix block comments use * on subsequent lines in r8192U_wx.c
Message-Id: <alpine.DEB.2.02.1602010834100.2052@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160201051647.GA5001@gmail.com> <alpine.DEB.2.02.1602010800210.2052@localhost6.localdomain6> <CAOxTRzqmtXbs9w1UFkBgON4mWcmOXg8sQug1Xzo6PhxObq+_+g@mail.gmail.com>
In-Reply-To: <CAOxTRzqmtXbs9w1UFkBgON4mWcmOXg8sQug1Xzo6PhxObq+_+g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ByeoungWook Kim <quddnr145@gmail.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, gregkh@linuxfoundation.org, ksenija.stanojevic@gmail.com, luisbg@osg.samsung.com, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



On Mon, 1 Feb 2016, ByeoungWook Kim wrote:

> The current realtek driver was written like my patch comments. but
> Documentation/CodingStyle isn't before.
> So I wrote patch like current realtek driver.

That is probably fine, then.  Sorry for the noise.  I looked at some other 
code in the kernel, and it didn't have it.

julia

> 
> How should i do it?
> 
> Regards,
> Byeoungwook.
> 
> 2016-02-01 16:01 GMT+09:00 Julia Lawall <julia.lawall@lip6.fr>:
> >
> >
> > On Mon, 1 Feb 2016, Byeoungwook Kim wrote:
> >
> >> clean up checkpatch warning:
> >> WARNING: Block comments use * on subsequent lines
> >>
> >> Signed-off-by: Byeoungwook Kim <quddnr145@gmail.com>
> >> ---
> >>  drivers/staging/rtl8192u/r8192U_wx.c | 38 +++++++++++++++++++-----------------
> >>  1 file changed, 20 insertions(+), 18 deletions(-)
> >>
> >> diff --git a/drivers/staging/rtl8192u/r8192U_wx.c b/drivers/staging/rtl8192u/r8192U_wx.c
> >> index 4911fef..f828e64 100644
> >> --- a/drivers/staging/rtl8192u/r8192U_wx.c
> >> +++ b/drivers/staging/rtl8192u/r8192U_wx.c
> >> @@ -1,21 +1,23 @@
> >> -/*
> >> -   This file contains wireless extension handlers.
> >> -
> >> -   This is part of rtl8180 OpenSource driver.
> >> -   Copyright (C) Andrea Merello 2004-2005  <andrea.merello@gmail.com>
> >> -   Released under the terms of GPL (General Public Licence)
> >> -
> >> -   Parts of this driver are based on the GPL part
> >> -   of the official realtek driver.
> >> -
> >> -   Parts of this driver are based on the rtl8180 driver skeleton
> >> -   from Patric Schenke & Andres Salomon.
> >> -
> >> -   Parts of this driver are based on the Intel Pro Wireless 2100 GPL driver.
> >> -
> >> -   We want to thank the Authors of those projects and the Ndiswrapper
> >> -   project Authors.
> >> -*/
> >> +/******************************************************************************
> >
> > Is the row of *s needed?
> >
> > julia
> >
> >> + *
> >> + * This file contains wireless extension handlers.
> >> + *
> >> + * This is part of rtl8180 OpenSource driver.
> >> + * Copyright (C) Andrea Merello 2004-2005  <andrea.merello@gmail.com>
> >> + * Released under the terms of GPL (General Public Licence)
> >> + *
> >> + * Parts of this driver are based on the GPL part
> >> + * of the official realtek driver.
> >> + *
> >> + * Parts of this driver are based on the rtl8180 driver skeleton
> >> + * from Patric Schenke & Andres Salomon.
> >> + *
> >> + * Parts of this driver are based on the Intel Pro Wireless 2100 GPL driver.
> >> + *
> >> + * We want to thank the Authors of those projects and the Ndiswrapper
> >> + * project Authors.
> >> + *
> >> + *****************************************************************************/
> >>
> >>  #include <linux/string.h>
> >>  #include "r8192U.h"
> >> --
> >> 2.5.0
> >>
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> >> the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >>
> 
