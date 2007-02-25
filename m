From: Greg KH <greg@kroah.com>
Date: Sun, 25 Feb 2007 23:45:44 +0000
Subject: Re: [KJ] another potential project:  using sysfs ATTR macros.
Message-Id: <20070225234544.GA28471@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, Feb 25, 2007 at 02:52:18PM -0500, Robert P. J. Day wrote:
> On Sun, 25 Feb 2007, Robert P. J. Day wrote:
> 
> >
> >   (and while we wait and wait and wait for the new wiki to come back
> > up ...)
> >
> >   the header file linux/sysfs.h defines a couple macros that make it
> > easier to define sysfs attributes:
> >
> > ===================> > #define __ATTR(_name,_mode,_show,_store) { \
> >         .attr = {.name = __stringify(_name), .mode = _mode, .owner = THIS_MODULE },     \
> >         .show   = _show,                                        \
> >         .store  = _store,                                       \
> > }
> >
> > #define __ATTR_RO(_name) { \
> >         .attr   = { .name = __stringify(_name), .mode = 0444, .owner = THIS_MODULE },   \
> >         .show   = _name##_show, \
> > }
> > ====================
> 
> as a short followup to my own post, are there any other common
> combinations of creating a sysfs attribute that would justify another
> flavour of macro?  just curious.

You mean becides DEVICE_ATTR(), CLASS_ATTR() and other *_ATTR macros in
device.h?  :)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
