From: "Robert P. J. Day" <rpjday@mindspring.com>
Date: Sun, 21 Jan 2007 11:54:20 +0000
Subject: Re: [KJ] standardizing on boolean variables?
Message-Id: <Pine.LNX.4.64.0701210644310.14679@CPE00045a9c397f-CM001225dbafb6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0701210324380.13751@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 21 Jan 2007, Richard Knutsson wrote:

> Robert P. J. Day wrote:

> > ah, quite right, i missed that.  but that, of course, just raises
> > another question -- why have two different sets of tokens
> > representing boolean values?  should programmers use the upper or
> > lower case form? and why did the person who wrote BusLogic.c do it
> > differently from everyone else?  so many pedantic, anal-retentive
> > questions.
> >
> Simple, some people defines 'FALSE'/'TRUE' and some 'false'/'true' ;)

actually, while lots of files define 'FALSE' and 'TRUE', very few
files define values for the tokens 'false' and 'true' since, as alexey
pointed out, those are defined in include/linux/stddef.h:

enum {
        false   = 0,
        true    = 1
};


> Then, to be able to compile, the
> "6e21828743247270d09a86756a0c11702500dbfb" (git show) redefined
> BusLogic.h's
>
> -typedef enum { false, true } __attribute__ ((packed)) boolean;
>
> to
>
> +typedef bool boolean;

but that second typedef doesn't define any values for the tokens
'true' and 'false', so that still has to be done by *someone*.

> > but back to the question at hand -- is there any fundamental
> > problem with trying to define a standard by defining TRUE and
> > FALSE macros in types.h?  certainly, that would also require some
> > simultaneous fixes to the source tree, where those new macros
> > would clash with existing code, like in
> > drivers/net/wireless/strip.c, where one would have to remove the
> > conflicting:
> >
> >   enum { FALSE = 0, TRUE = 1 };
> >
> > but i'm guessing things like that would be rare.
> >
> Please, try to convert it to 'false'/'true' instead. It is meant to
> be the generic boolean-values, same as bool being the type.
>
> Believe it is approved since I saw a patch, adding a function using bool and
> 'false'/'true', signed-off-by Torvalds and Morton (not sure it was a third
> name).

i just read that thread, and it consisted of lots of smart people
arguing over how many angels could fit on the head of a pin, then
finally losing interesting and wandering away, having accomplished
absolutely nothing.

i just submitted the following patch to LKML:

===========================
diff --git a/drivers/net/wireless/strip.c
b/drivers/net/wireless/strip.c
index ce3a8ba..5e64ec1 100644
--- a/drivers/net/wireless/strip.c
+++ b/drivers/net/wireless/strip.c
@@ -177,8 +177,6 @@ typedef struct {
        MetricomNode node[NODE_TABLE_SIZE];
 } MetricomNodeTable;

-enum { FALSE = 0, TRUE = 1 };
-
 /*
  * Holds the radio's firmware version.
  */
diff --git a/include/linux/types.h b/include/linux/types.h
index 0351bf2..d988636 100644
--- a/include/linux/types.h
+++ b/include/linux/types.h
@@ -34,6 +34,8 @@ typedef __kernel_mqd_t                mqd_t;

 #ifdef __KERNEL__
 typedef _Bool                  bool;
+#define TRUE                   1
+#define FALSE                  0

 typedef __kernel_uid32_t       uid_t;
 typedef __kernel_gid32_t       gid_t;
===============================

  note that it adds definitions for TRUE and FALSE to types.h (and
removes a single conflicting construct), so that all of those
ridiculous macro definitions can be removed from the numerous source
files.  note also that it doesn't take a position on what tokens to
use in the future, it just allows for *removal* of lots of unnecessary
crap.  so applying that patch doesn't require finalizing a decision on
what should be done in the future, although i'm sure that's the
argument i'm going to hear.  wait for it -- you know it's coming.

> I have not got too much done in the converting-front (some wants it
> changed to int/0/1 instead); maybe this is something to add on Wiki-
> ToDo :)

  as soon as the wiki exists, we can get started.

rday
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
