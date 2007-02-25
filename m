From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 25 Feb 2007 19:52:18 +0000
Subject: Re: [KJ] another potential project:  using sysfs ATTR macros.
Message-Id: <Pine.LNX.4.64.0702251451050.24657@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Feb 2007, Robert P. J. Day wrote:

>
>   (and while we wait and wait and wait for the new wiki to come back
> up ...)
>
>   the header file linux/sysfs.h defines a couple macros that make it
> easier to define sysfs attributes:
>
> ===================> #define __ATTR(_name,_mode,_show,_store) { \
>         .attr = {.name = __stringify(_name), .mode = _mode, .owner = THIS_MODULE },     \
>         .show   = _show,                                        \
>         .store  = _store,                                       \
> }
>
> #define __ATTR_RO(_name) { \
>         .attr   = { .name = __stringify(_name), .mode = 0444, .owner = THIS_MODULE },   \
>         .show   = _name##_show, \
> }
> ====================

as a short followup to my own post, are there any other common
combinations of creating a sysfs attribute that would justify another
flavour of macro?  just curious.

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
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
