From: Randy Dunlap <rdunlap@xenotime.net>
Date: Wed, 04 Apr 2007 02:14:15 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <20070403191415.f645bbaf.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 04 Apr 2007 03:41:56 +0200 Richard Knutsson wrote:

> Robert P. J. Day wrote:
> > On Wed, 4 Apr 2007, Richard Knutsson wrote:
> >
> >   
> >> Yep, and just found a few C/C++ structs not even _used_ in the kernel...
> >>     
> >
> > i'm not sure what that means ... can you explain that?  with an
> > example or two?
> >   
> The ones I was talking about is in drivers/scsi/dpt/sys_info.h. Only 
> found sysInfo_S to be used (by drivers/scsi/dpt_i2o.c).

Interesting.  Those structs don't seem to be used.

Vendor drivers historically have carried excess baggage in Linux,
often for "management application" purposes.
I doubt that that driver would be merged in that same condition today.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
