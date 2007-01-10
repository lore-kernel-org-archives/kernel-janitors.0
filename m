From: Martin Olsen <triplefault@gmail.com>
Date: Wed, 10 Jan 2007 18:29:43 +0000
Subject: Re: [KJ] powers of 2, and the boundary case of zero
Message-Id: <200701101929.44177.triplefault@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701090539520.7476@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wednesday 10 January 2007 19:04, you wrote:
> On Wed, 10 Jan 2007, Martin Olsen wrote:
> > A quick search on Google Code found this snippet:
> >
> > /* rounding macros, assumes ALIGN is a power of two */
> > #define ROUND_UP(N,ALIGN)       (((N) + ((ALIGN)-1)) &
> > ~((ALIGN)-1)) #define ROUND_DOWN(N,ALIGN)     ((N) & ~((ALIGN)-1))
> >
> > I am no mathematician, but wouldn't the above code work if ALIGN
> > was set to 2?
>
> but that would only round up/down to the next *multiple* of two, not
> *power* of two.  big difference.

You're right!

> > > at this point, i would submit this as an official patch to the KJ
> > > list.  um ... you *have* tested this code to see what it does in
> > > various situations, right?  :-)
> >
> > Heh.. No, I forgot that. A quick testcase compiled against my
> > header file correctly denies any knowledge of "bool" (not defined
> > in C). Should I include linux/types.h or just use "_Bool" (is _Bool
> > part of C? I cant find any definitions of it in my include
> > directories)?
>
> if you want to use "bool" in kernel space, you should include
> <linux/types.h>, which has the line:
>
>   typedef _Bool                   bool;
>
> that should be sufficient.  add that "include" line to your
> power_of_2.h header file.
>
> rday

Looks like it is almost there.

Should i change the short description at beginning of the file?

---

diff -uprN -X linux-2.6.19-vanilla/Documentation/dontdiff 
linux-2.6.19-vanilla/include/linux/power_of_2.h 
linux-2.6.19-changed/include/linux/power_of_2.h
--- linux-2.6.19-vanilla/include/linux/power_of_2.h	1970-01-01 
01:00:00.000000000 +0100
+++ linux-2.6.19-changed/include/linux/power_of_2.h	2007-01-10 
19:26:40.000000000 +0100
@@ -0,0 +1,54 @@
+/*
+ * linux/include/power_of_2.h - Power of 2 helper functions.
+ *
+ * Copyright (C) 2006 Martin Olsen <triplefault@gmail.com>
+ *
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, write to the Free Software
+ * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307 
+ * USA
+ *
+ */
+#ifndef _LINUX_POWER_OF_2_H
+#define _LINUX_POWER_OF_2_H
+
+#include <linux/types.h>
+
+static inline bool is_power_of_2_or_zero(unsigned long i)
+{
+	return (i & (i - 1)) = 0;
+}
+
+static inline bool is_power_of_2(unsigned long i)
+{
+	return i && is_power_of_2_or_zero(i);
+}
+
+static inline unsigned long round_up_to_power_of_2(unsigned long i)
+{
+	while ((i & (i - 1)) != 0)
+		i += i & ~(i - 1);
+	
+	return i;
+}
+
+static inline unsigned long round_down_to_power_of_2(unsigned long i)
+{
+	while (i & (i - 1))
+		i &= (i - 1);
+	
+	return i;
+}
+
+#endif
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
