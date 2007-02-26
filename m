From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 26 Feb 2007 00:15:36 +0000
Subject: Re: [KJ] another potential project:  using sysfs ATTR macros.
Message-Id: <Pine.LNX.4.64.0702251914160.31117@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Feb 2007, Greg KH wrote:

> On Sun, Feb 25, 2007 at 02:52:18PM -0500, Robert P. J. Day wrote:
> > On Sun, 25 Feb 2007, Robert P. J. Day wrote:
> >
> > >
> > >   (and while we wait and wait and wait for the new wiki to come back
> > > up ...)
> > >
> > >   the header file linux/sysfs.h defines a couple macros that make it
> > > easier to define sysfs attributes:
> > >
> > > ===================> > > #define __ATTR(_name,_mode,_show,_store) { \
> > >         .attr = {.name = __stringify(_name), .mode = _mode, .owner = THIS_MODULE },     \
> > >         .show   = _show,                                        \
> > >         .store  = _store,                                       \
> > > }
> > >
> > > #define __ATTR_RO(_name) { \
> > >         .attr   = { .name = __stringify(_name), .mode = 0444, .owner = THIS_MODULE },   \
> > >         .show   = _name##_show, \
> > > }
> > > ====================
> >
> > as a short followup to my own post, are there any other common
> > combinations of creating a sysfs attribute that would justify another
> > flavour of macro?  just curious.
>
> You mean becides DEVICE_ATTR(), CLASS_ATTR() and other *_ATTR macros
> in device.h?  :)

actually, yes, besides those.  if you look at the definition of, say,
CLASS_DEVICE_ATTR:

#define CLASS_DEVICE_ATTR(_name,_mode,_show,_store)             \
struct class_device_attribute class_device_attr_##_name =       \
        __ATTR(_name,_mode,_show,_store)

it was clearly created to abbreviate initializing a particular kind of
attribute.  i was more asking whether there were other variations of
__ATTR or __ATTR_RO that would be useful.  why just those two?  why
not __ATTR_RW as well?  and so on.  it just seems awkward to have
defined the generic __ATTR macro, then added that incompatible
__ATTR_RO macro, and stopped there.

i think the first thing to do is agree on a fundamental and consistent
set of macros for this, if that's even possible at this point.

rday

p.s.  certainly, one possible cleanup (did i mention this already?)
would be to replace stuff like:

  #define EFI_ATTR(_name, _mode, _show, _store) \
  struct subsys_attribute efi_attr_##_name = { \
        .attr = {.name = __stringify(_name), .mode = _mode, .owner = THIS_MODULE}, \
        .show = _show, \
        .store = _store, \
  };

with the simpler form of:

  #define EFI_ATTR(_name, _mode, _show, _store) \
  struct subsys_attribute efi_attr_##_name = __ATTR(etc etc)

that could be done right now, as long as there's no chance of __ATTR
being redefined any time soon.

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
