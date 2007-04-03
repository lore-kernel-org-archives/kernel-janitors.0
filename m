From: "Howell, David P" <david.p.howell@intel.com>
Date: Tue, 03 Apr 2007 23:34:38 +0000
Subject: Re: [KJ] Any need for __cplusplus?
Message-Id: <3B06E32CF3FCA74A8F072DE335057C8901B1122C@fmsmsx413.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <461201B3.8000800@student.ltu.se>
In-Reply-To: <461201B3.8000800@student.ltu.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Every time I heard it come up in the kernel mailing list it was
emphatically
"No". Only other use I could see would be for source that applies for
the kernel and possibly some other application use where C++ can be
used.

-----Original Message-----
From: kernel-janitors-bounces@lists.linux-foundation.org
[mailto:kernel-janitors-bounces@lists.linux-foundation.org] On Behalf Of
Robert P. J. Day
Sent: Tuesday, April 03, 2007 7:14 PM
To: Richard Knutsson
Cc: kernel-janitors@lists.osdl.org
Subject: Re: [KJ] Any need for __cplusplus?

On Wed, 4 Apr 2007, Richard Knutsson wrote:

... snip ...
> Yep, and just found a few C/C++ structs not even _used_ in the
> kernel... Guess the __cplusplus may be worth a look or two since it
> seems to be possible indicator of old cruft.
>
> Thanks for reminding about "headers_install".

so is there anyone on this list who can make a confident proclamation
about this C++ stuff in the kernel source one way or the other?

rday
-- 
====================================
Robert P. J. Day
Linux Consulting, Training and Annoying Kernel Pedantry
Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
