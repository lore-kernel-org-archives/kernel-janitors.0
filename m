From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 25 Feb 2007 21:26:24 +0000
Subject: Re: [KJ] another potential project:  using sysfs ATTR macros.
Message-Id: <Pine.LNX.4.64.0702251612300.28602@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0702251424170.24434@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 25 Feb 2007, Greg KH wrote:

> On Sun, Feb 25, 2007 at 02:46:12PM -0500, Robert P. J. Day wrote:
...
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
...
> > static struct class_device_attribute ipr_fw_version_attr = {
> >         .attr = {
> >                 .name =         "fw_version",
> >                 .mode =         S_IRUGO,
> >         },
> >         .show = ipr_show_fw_version,
> > };
> >
> >   this could obviously be rewritten as the shorter:
> >
> > ... ipr_fw_version_attr = _ATTR(fw_version, S_IRUGO, ipr_show_fw_version);
> >
> > would this be worth putting any effort into?
>
> Yes, because that hand-rolled version above is buggy (they forgot the
> .owner setting).

um ... you *had* noticed that there about a billion of those cases,
where someone forgot to set the .owner value?  :-)

as a random example, consider fs/dlm/lockspace.c, which still
re-invents the wheel (at least to some extent):

...
struct dlm_attr {
        struct attribute attr;
        ssize_t (*show)(struct dlm_ls *, char *);
        ssize_t (*store)(struct dlm_ls *, const char *, size_t);
};
...
static struct dlm_attr dlm_attr_control = {
        .attr  = {.name = "control", .mode = S_IWUSR},
        .store = dlm_control_store
};

static struct dlm_attr dlm_attr_event = {
        .attr  = {.name = "event_done", .mode = S_IWUSR},
        .store = dlm_event_store
};
... etc etc etc ...  there's plenty of those all over the place.

> >   the downside to this is that you can see that the __ATTR_RO
> > macro expects a definite naming convention -- the "show" routine
> > *must* be named "_name##_show".  in cases where that's not true,
> > you're obviously screwed and you can't use that macro.
> > otherwise, you could have used *that* for this very same example.
> > grrrrrrrrrrrrrr.
>
> Any idea how to fix that in a sane manner?

not offhand.  everyone seems to have invented their own naming
standards, so i think you're stuck with the existing chaos.  i mean,
the inherent inconsistency between the definitions of __ATTR and
__ATTR_RO is enough to give you a headache.

at the very least, it might be nice to make a short list of the
absolutely most common variations of defining one of these sysfs
attribute structures and creating a macro for those situations.

rday

p.s.  even people who are trying to be efficient end up defining
macros that conflict with the "standard" ones, like in
arch/x86_64/kernel/mce_amd.c:

#define THRESHOLD_ATTR(_name,_mode,_show,_store) {            \
        .attr = {.name = __stringify(_name), .mode = _mode }, \
        .show = _show,                                        \
        .store = _store,                                      \
};

#define RW_ATTR(name)                                           \
static struct threshold_attr name =                             \
        THRESHOLD_ATTR(name, 0644, show_## name, store_## name)

RW_ATTR(interrupt_enable);
RW_ATTR(threshold_limit);
RW_ATTR(error_count);

  so ... still no assignment to .owner, and in RW_ATTR, the strings
"_show" and "_store" come *after* the name, not before.

  it's just messy.

--
====================================
Robert P. J. Day Linux Consulting, Training and Annoying Kernel
Pedantry Waterloo, Ontario, CANADA

http://fsdev.net/wiki/index.php?title=Main_Page
====================================
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
