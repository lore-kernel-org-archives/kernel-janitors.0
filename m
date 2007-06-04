From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Mon, 04 Jun 2007 13:27:55 +0000
Subject: Re: [KJ] another project or two
Message-Id: <Pine.LNX.4.64.0706040919460.599@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706040528251.31127@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 4 Jun 2007, Matthew Wilcox wrote:

> On Mon, Jun 04, 2007 at 05:31:23AM -0400, Robert P. J. Day wrote:
> >   also, something i've been thinking about for a while is the
> > feasibility of centralizing a lot of the identical information
> > that is duplicated across all of the include/asm-* header files.
> > as an example, if you take a look at all of the
> > include/asm-*/types.h files, there's a lot of absolutely identical
> > content.
> >
> >   i'm wondering if there's any value to factoring all the common
> > content and just leaving the differences in the arch-specific
> > files. thoughts?
>
> My thought is "Bad idea".  An example of this is asm/errno.h.
> Before, when I wanted to know what -27 was, I would go and look in
> asm/errno.h. Now, I have to look in asm/errno.h which may direct me
> to asm-generic/errno.h, which redirects me to
> asm-generic/errno-base.h, which tells me it's EFBIG.  Worse, not all
> arches use asm-generic/errno.h, so I may look in the wrong file by
> mistake.

true.  it's not clear that there's an overwhelming benefit of
centralizing content that *just happens* to be the same, but i think
there's benefit for centralizing content that must *necessarily* be
the same.

if there are too many arch-specific files that differ from a generic
file, then it's clearly not worth the trouble.

> What *is* a win is providing a mechanism for adding a new
> errno/type/whatever to every architecture, without editing 27 header
> files.  The normal way to do something like this is:
>
> <linux/foo.h>
> includes <asm/foo.h>
>
> #ifndef THINGY
> #define THINGY *suitale definition*
> #endif
>
> which allows architectures to override it when they need to.

in fact, i submitted something remarkably like that a while back, to
centralize the content in all the ioctl.h files.  most arches use
*exactly* what's in asm-generic/ioctl.h, while those that don't differ
mainly in ... well, here's the patch:

diff --git a/include/asm-generic/ioctl.h b/include/asm-generic/ioctl.h
index cd02729..e035e6d 100644
--- a/include/asm-generic/ioctl.h
+++ b/include/asm-generic/ioctl.h
@@ -21,8 +21,15 @@
  */
 #define _IOC_NRBITS	8
 #define _IOC_TYPEBITS	8
-#define _IOC_SIZEBITS	14
-#define _IOC_DIRBITS	2
+/*
+ *  Let any architecture override either of the following.
+ */
+#ifndef _IOC_SIZEBITS
+# define _IOC_SIZEBITS	14
+#endif
+#ifndef _IOC_DIRBITS
+# define _IOC_DIRBITS	2
+#endif

 #define _IOC_NRMASK	((1 << _IOC_NRBITS)-1)
 #define _IOC_TYPEMASK	((1 << _IOC_TYPEBITS)-1)
@@ -35,11 +42,17 @@
 #define _IOC_DIRSHIFT	(_IOC_SIZESHIFT+_IOC_SIZEBITS)

 /*
- * Direction bits.
+ * Direction bits, which any architecture can choose to override.
  */
-#define _IOC_NONE	0U
-#define _IOC_WRITE	1U
-#define _IOC_READ	2U
+#ifndef _IOC_NONE
+# define _IOC_NONE	0U
+#endif
+#ifndef _IOC_WRITE
+# define _IOC_WRITE	1U
+#endif
+#ifndef _IOC_READ
+# define _IOC_READ	2U
+#endif

 #define _IOC(dir,type,nr,size) \
 	(((dir)  << _IOC_DIRSHIFT) | \


  as you can see, any arch-specific ioctl.h file would simply define
what differs from the generic, then include the asm-generic version,
and there are at least a few of those files for which this patch would
be perfectly appropriate.  is that the sort of thing you were thinking
about?

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
