From: Greg KH <greg@kroah.com>
Date: Sun, 25 Feb 2007 21:00:49 +0000
Subject: Re: [KJ] another potential project:  using sysfs ATTR macros.
Message-Id: <20070225210049.GB26624@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 25, 2007 at 02:46:12PM -0500, Robert P. J. Day wrote:
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
> 
>   while these macros are used frequently in the source tree:
> 
>   $ grep -rw __ATTR *
>   $ grep -rw __ATTR_RO *
> 
> there are definitely a lot of places that still initialize the
> structure manually which could be abbreviated, such as this from
> drivers/scsi/ipr.c:
> 
> static struct class_device_attribute ipr_fw_version_attr = {
>         .attr = {
>                 .name =         "fw_version",
>                 .mode =         S_IRUGO,
>         },
>         .show = ipr_show_fw_version,
> };
> 
>   this could obviously be rewritten as the shorter:
> 
> ... ipr_fw_version_attr = _ATTR(fw_version, S_IRUGO, ipr_show_fw_version);
> 
> would this be worth putting any effort into?

Yes, because that hand-rolled version above is buggy (they forgot the
.owner setting).

>   the downside to this is that you can see that the __ATTR_RO macro
> expects a definite naming convention -- the "show" routine *must* be
> named "_name##_show".  in cases where that's not true, you're
> obviously screwed and you can't use that macro.  otherwise, you could
> have used *that* for this very same example.  grrrrrrrrrrrrrr.

Any idea how to fix that in a sane manner?

thanks,

greg k-h
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
