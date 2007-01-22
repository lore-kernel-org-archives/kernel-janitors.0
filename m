From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 22 Jan 2007 09:15:18 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701220405340.21693@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 22 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:
> >   by the way, part of my style script looks for code that insists
> > on redefining booleans in one way or another.  at the moment, it
> > looks like this:
> >
> > $ grep -ri "^typedef.*bool" .

> Is the script also checking for booleans defined by "#define" or
> "enum" (without typedef)?

nope.  if you look at that grep command, what you see is what you get.
i can extend the search to try to hit others.  this was meant to be
just a *very* rough first pass, to at least let someone get started.

> > ./drivers/scsi/BusLogic.h:typedef bool boolean;

> Sent a patch on this one yesterday to LKML.

yup, i saw that.  good job.

> > ./drivers/scsi/pci2000.h:typedef        BOOL    *PBOOL;
> > ./drivers/telephony/ixj.h:typedef __u8 BOOL;
> > ./drivers/block/DAC960.h:typedef bool boolean;

> How did I miss this one?

you don't have a handy-dandy "style.sh" script.  :-)

> > ./drivers/video/riva/riva_hw.h:typedef int Bool;
> > ./drivers/video/sis/vgatypes.h:typedef unsigned int BOOLEAN;
> > ./arch/parisc/math-emu/float.h:typedef int boolean;
> > ./include/acpi/actypes.h:typedef unsigned char BOOLEAN;
> > ./include/linux/types.h:typedef _Bool                   bool;

> The "generic" one.

i didn't try to do any clever filtering, so that "grep" command is
bound to produce a few false positives, which i just ignore.

> > ./include/linux/efi.h:typedef u8 efi_bool_t;
> > ./include/linux/efi.h:typedef efi_status_t efi_get_wakeup_time_t (efi_bool_t
> > *enabled, efi_bool_t *pending,
> > ./include/linux/efi.h:typedef efi_status_t efi_set_wakeup_time_t (efi_bool_t
> > enabled, efi_time_t *tm);
> > ./fs/xfs/xfs_types.h:typedef enum { B_FALSE,B_TRUE }    boolean_t;
> >
> Have sent them a patch before but they seemed not too interested for
> the moment. Will come back when most of the cleanup is done.

that sounds pretty typical.

> >  did you want to submit a patch to clean up any of that, if it can
> > be done at the moment?
> >
> Should get DAC960.h out today. But the rest should be checked, to
> see if it is used when declaring in struct's and that struct is
> mem(cmp|cpy|move|...) (or something that may be size-sensitive).

that's a good point but it seems to me that anyone who declares
something of type "boolean" of some kind shouldn't be trying to
squeeze in any size-sensitive information there.  any variant of a
"boolean" which requires anything beyond being able to hold the two
values of TRUE or FALSE strikes me as broken.

> Any help appreciated ;)

if someone wants to jump in here, feel free.  i'll go back and see if
i can broaden the search of my script to see what else i can find.


rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
