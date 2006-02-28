From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 28 Feb 2006 22:00:21 +0000
Subject: Re: [KJ] [PATCH] check request_region() return value in arch/ppc and
Message-Id: <9a8748490602281400j2b3c61b2sa41d608ae1dde0e8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602272229.51950.tim@aapopfiets.nl>
In-Reply-To: <200602272229.51950.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/28/06, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> On Tue, Feb 28, 2006 at 07:18:58AM +0100, Tim Cooijmans wrote:
> >  void __init
> > +chrp_request_region(unsigned long start, unsigned long n, char *desc)
> > +{
> > +     if (!request_region(start, n, desc))
> > +             printk(KERN_WARNING "chrp: unable to allocate %s region.\n", desc);
> > +}
> > +
> > +void __init
> >  chrp_init2(void)
> >  {
> >  #ifdef CONFIG_NVRAM
> >       chrp_nvram_init();
> >  #endif
> >
> > -     request_region(0x20,0x20,"pic1");
> > -     request_region(0xa0,0x20,"pic2");
> > -     request_region(0x00,0x20,"dma1");
> > -     request_region(0x40,0x20,"timer");
> > -     request_region(0x80,0x10,"dma page reg");
> > -     request_region(0xc0,0x20,"dma2");
> > +     chrp_request_region(0x20,0x20,"pic1");
> > +     chrp_request_region(0xa0,0x20,"pic2");
> > +     chrp_request_region(0x00,0x20,"dma1");
> > +     chrp_request_region(0x40,0x20,"timer");
> > +     chrp_request_region(0x80,0x10,"dma page reg");
> > +     chrp_request_region(0xc0,0x20,"dma2");
>
> OK, you've followed this route. One question they'll ask me is
>
>         Can those calls ever fail?
>
> I mean, you're deeply in arch-specific setup code. And request_region()
> parameters are hardwired. And numbers are common among other subarchs in
> this patch.
>
>

I believe the comments Paul Mackerras gave after he NACK'ed a similar
patch of mine in -mm explains this very well.  The thread is on the
mm-commits list, but I've quoted all of it below for your convenience
(the interresting bits are at the end) :


---< cut here >---


The patch titled

    request_region fixes for ppc prep_request_io

has been added to the -mm tree.  Its filename is

    request_region-fixes-for-ppc-prep_request_io.patch

See http://www.zip.com.au/~akpm/linux/patches/stuff/added-to-mm.txt to find
out what to do about this


From: Jesper Juhl <jesper.juhl@gmail.com>

request_region fixes for ppc prep_request_io.

Signed-off-by: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Andrew Morton <akpm@osdl.org>
---

 arch/ppc/platforms/prep_setup.c |   51 +++++++++++++++++++++++++-----
 1 files changed, 44 insertions(+), 7 deletions(-)

diff -puN arch/ppc/platforms/prep_setup.c~request_region-fixes-for-ppc-prep_request_io
arch/ppc/platforms/prep_setup.c
--- 25/arch/ppc/platforms/prep_setup.c~request_region-fixes-for-ppc-prep_request_io
    Fri Feb 24 15:10:27 2006
+++ 25-akpm/arch/ppc/platforms/prep_setup.c     Fri Feb 24 15:10:27 2006
@@ -1064,20 +1064,57 @@ prep_map_io(void)
       io_block_mapping(0xf0000000, PREP_ISA_MEM_BASE, 0x08000000, _PAGE_IO);
 }

+static inline int
+prep_request_region(unsigned long start, unsigned long n, const char *name)
+{
+       struct resource *region;
+
+       region = request_region(start, n, name);
+       if (!region) {
+               printk(KERN_WARNING "prep_request_io: could not allocate "
+                                   "%s region\n", name);
+               return 0;
+       }
+       return 1;
+}
+
 static int __init
 prep_request_io(void)
 {
-       if (_machine = _MACH_prep) {
+       int tmp;
+
+       if (_machine != _MACH_prep)
+               return 0;
+
 #ifdef CONFIG_NVRAM
-               request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+       tmp = prep_request_region(PREP_NVRAM_AS0, 0x8, "nvram");
+       if (!tmp)
+               goto out_nvram;
 #endif
-               request_region(0x00,0x20,"dma1");
-               request_region(0x40,0x20,"timer");
-               request_region(0x80,0x10,"dma page reg");
-               request_region(0xc0,0x20,"dma2");
-       }
+       tmp = prep_request_region(0x00,0x20,"dma1");
+       if (!tmp)
+               goto out_dma1;
+       tmp = prep_request_region(0x40,0x20,"timer");
+       if (!tmp)
+               goto out_timer;
+       tmp = prep_request_region(0x80,0x10,"dma page reg");
+       if (!tmp)
+               goto out_dma_page;
+       tmp = prep_request_region(0xc0,0x20,"dma2");
+       if (!tmp)
+               goto out_dma2;

       return 0;
+ out_dma2:
+       release_region(0x80,0x10);
+ out_dma_page:
+       release_region(0x40,0x20);
+ out_timer:
+       release_region(0x00,0x20);
+ out_dma1:
+       release_region(PREP_NVRAM_AS0, 0x8);
+ out_nvram:
+       return -EBUSY;
 }

 device_initcall(prep_request_io);
_

Patches currently in -mm which might be from jesper.juhl@gmail.com are

git-net.patch
reduce-nr-of-ptr-derefs-in-fs-jffs2-summaryc.patch
isdn-fix-copy_to_user-unused-result-warning-in-isdn_ppp.patch
docs-update-missing-files-and-descriptions-for-filesystems-00-index.patch
debug-shared-irqs.patch
decrease-number-of-pointer-derefs-in-jsm_ttyc.patch
sound-remove-unneeded-kmalloc-return-value-casts.patch
dont-check-vfree-argument-for-null-in-vx_pcm.patch
dont-check-vfree-arg-for-null-in-usbaudio.patch
small-whitespace-cleanup-for-qlogic-driver.patch
dont-null-check-vfree-argument-in-pdaudiocf_pcm.patch
request_region-fixes-for-ppc-prep_request_io.patch
vfree-null-check-fixup-for-sb_card.patch
maestro3-vfree-null-check-fixup.patch
ne2000-kconfig-help-entry-improvement.patch
no-need-to-check-vfree-arg-for-null-in-oss-sequencer.patch
vfree-does-its-own-null-check-no-need-to-be-explicit-in-oss-msndc.patch
fix-signed-vs-unsigned-in-nmi-watchdog.patch
const-static-vs-static-const-in-nfs4.patch
trivial-typos-in-documentation-cputopologytxt.patch


Reply	Reply to all	Forward	Invite akpm@osdl.org to Gmail
	
		
		
Paul Mackerras 	
to akpm, me, benh, mm-commits
	 More options	  Feb 26 (2 days ago)
akpm@osdl.org writes:

> The patch titled
>
>      request_region fixes for ppc prep_request_io
>
> has been added to the -mm tree.  Its filename is
>
>      request_region-fixes-for-ppc-prep_request_io.patch
>
> See http://www.zip.com.au/~akpm/linux/patches/stuff/added-to-mm.txt to find
> out what to do about this

Nack.  Printing a message if one of the request_regions fails is OK,
but why release all the previous regions, and why not go on to request
the rest?

> +     tmp = prep_request_region(0x00,0x20,"dma1");
> +     if (!tmp)
> +             goto out_dma1;

Use of the tmp variable is unnecessary and verbose.

Paul.

Reply	Reply to all	Forward	Invite Paul to Gmail
	
		
		
Jesper Juhl 	
to Paul, akpm, benh, mm-commits
	 More options	  Feb 26 (2 days ago)
On 2/26/06, Paul Mackerras <paulus@samba.org> wrote:
> akpm@osdl.org writes:
>
> > The patch titled
> >
> >      request_region fixes for ppc prep_request_io
> >
> > has been added to the -mm tree.  Its filename is
> >
> >      request_region-fixes-for-ppc-prep_request_io.patch
> >
> > See http://www.zip.com.au/~akpm/linux/patches/stuff/added-to-mm.txt to find
> > out what to do about this
>
> Nack.

Thanks. I appreciate you taking the time to review the patch.

> Printing a message if one of the request_regions fails is OK,

OK.

> but why release all the previous regions, and why not go on to request
> the rest?

Probably because I misunderstood the code.

As I read it, all regions must be requested successfully or none at
all, and in that case (one or more failing) we should report an error
back.

But from your comment it is clear that that is a misunderstanding.
Would you mind enlightening me on the purpose of the code and what
will happen if one or more of the request_regions fail but we just
continue regardless ?

>
> > +     tmp = prep_request_region(0x00,0x20,"dma1");
> > +     if (!tmp)
> > +             goto out_dma1;
>
> Use of the tmp variable is unnecessary and verbose.
>
True.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

Reply	Reply to all	Forward
	
		
		
Paul Mackerras 	
to me, akpm, benh, mm-commits
	 More options	  7:10 am (15 hours ago)
Jesper Juhl writes:

> > but why release all the previous regions, and why not go on to request
> > the rest?
>
> Probably because I misunderstood the code.
>
> As I read it, all regions must be requested successfully or none at
> all, and in that case (one or more failing) we should report an error
> back.

Well, returning an error code from an initcall function doesn't
actually do anything.

In the case of this code, it isn't that there is some driver which can
refuse to load if an error is reported, since these are essential
platform functions that the I/O port ranges are being reserved for
(DMA controller, timer, nvram).  The code that uses these devices is
elsewhere and doesn't change its behaviour if the request_region calls
fail.

The main reasons for doing the request_region calls is so that the
user sees the ranges marked as reserved in /proc/ioports, and to stop
any other driver from requesting those regions.

> But from your comment it is clear that that is a misunderstanding.
> Would you mind enlightening me on the purpose of the code and what
> will happen if one or more of the request_regions fail but we just
> continue regardless ?

That's a good question.  The only reasons I can think of for the
request_region calls failing are that there is some kernel bug causing
the request to fail even though nothing else has done an overlapping
request, or that some buggy driver has requested an overlapping
region.  In the first case, the code that uses the DMA controller,
timer or nvram should still work fine.

In the second case, it depends on whether the buggy driver is also
poking I/O ports in the region(s) it has requested.  (The driver must
be buggy, because a PReP platform would never have an actual device
with I/O port regions that overlapped these system devices.)  If the
driver has just requested the wrong ports but is doing I/O to the
correct ports, then things will still work.  If the driver is doing
I/O to the wrong ports then anything can happen.

There is an argument that if there is the possibility that some driver
is doing I/O to the wrong ports, we should just panic to avoid the
possibility of data corruption.  On the other hand there is the
argument that we should try to continue running if possible.

Actual PReP machines are pretty old by now, since it is an old
specification that has been superseded.  There are possibly embedded
PPC boards designed to the PReP spec still being made, though.  Given
that, I tend to lean towards the "continue running" side of the
argument.  (Also, continuing to run will mean that the user can look
in /proc/ioports and see what has done the interfering request.)

Paul.




--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
