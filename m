From: "Randy.Dunlap" <rddunlap@osdl.org>
Date: Wed, 07 Apr 2004 23:16:46 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/acenic.c MIN/MAX removal
Message-Id: <20040407161646.44ba26b5.rddunlap@osdl.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71037408820125192=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40250629.3030004@gmx.net>
In-Reply-To: <40250629.3030004@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============71037408820125192==
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 07 Apr 2004 01:45:00 +0200 Michael Veeck wrote:

| Michael Veeck wrote:
| > 
| > Randy.Dunlap schrieb:
| > 
| >> On Sat, 07 Feb 2004 18:35:05 +0100 Michael Veeck 
| >> <michael.veeck@gmx.net> wrote:
| >>
| >> | | | Jeff Garzik schrieb:
| >> | > Michael Veeck wrote:
| >> | > | >> Hi!
| >> | >> Patch (against 2.6.3-rc1) removes unnecessary min/max macros and 
| >> | >> changes calls to use kernel.h macros instead.
| >> | >> Feedback always welcome
| >> | >> Michael
| >> | >>
| >> | >>
| >> | >> 
| >> ------------------------------------------------------------------------
| >> | >>
| >> | >> --- linux-2.6.2.org/drivers/net/acenic.c    2004-02-07 | >> 
| >> 15:25:57.000000000 +0100
| >> | >> +++ linux-2.6.2.new/drivers/net/acenic.c    2004-02-07 | >> 
| >> 15:33:24.286033896 +0100
| >> | >> @@ -335,10 +335,6 @@
| >> | >>  #define ACE_PROBE_ARG                struct net_device *dev
| >> | >>  #endif
| >> | >>  | >> -#ifndef min_t
| >> | >> -#define min_t(type,a,b)    (((a)<(b))?(a):(b))
| >> | >> -#endif
| >> | > | > | > | > Read the code you're patching :)
| >> | > | > You're killing compat code the driver author added.
| >> | > | >     Jeff
| >> | > | | Ah, that didnt came into my mind. But since #ifndef min_t 
| >> doesnt seem to | be in any of the "#if LINUX_VERSION_CODE >= " why not 
| >> put it in the | appropiate one?
| >> | | Do you know when the min_t was introduced in include/linux/kernel.h ?
| >>
| >> BK shows 5-FEB-2002 for min_t.
| >> That would be early 2.5.x, like 2.5.4, estimating by looking at
| >> http://www.kernel.org/pub/linux/kernel/v2.5/
| >>
| > 
| > Digging through the changelogs on kernel.org I found out that 
| > min_t/max_t macros were really introduced in 2.4.9 as "min/max" and then 
| > changed to their min_t/max_t-name in 2.4.10.
| > 
| > I will incorproate that in my next patch! Thanks for the advice!
| > 
| 
| Here is the new patch against kernel 2.6.5. Any comments?

@@ -335,9 +335,11 @@
 #define ACE_PROBE_ARG				struct net_device *dev
 #endif
 
+#if (LINUX_VERSION_CODE < 0x02040a)
 #ifndef min_t
 #define min_t(type,a,b)	(((a)<(b))?(a):(b))
 #endif
+#endif
 
 #ifndef ARCH_HAS_PREFETCHW
 #ifndef prefetchw

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

When is "min_t" not defined?  IOW, it looks redundant to me.

This local #define of min_t() evaluates 1 arg 2 times.  Isnt' that
a no-no?  Wouldn't Jeff accept a patch for that?


--
~Randy
"We have met the enemy and he is us."  -- Pogo (by Walt Kelly)
(Again.  Sometimes I think ln -s /usr/src/linux/.config .signature)

--===============71037408820125192==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71037408820125192==--
