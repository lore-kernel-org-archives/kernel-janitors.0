From: Michael Veeck <michael.veeck@gmx.net>
Date: Tue, 06 Apr 2004 23:45:00 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/net/acenic.c MIN/MAX removal
Message-Id: <407340FC.4040408@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010302030502000207020302"
List-Id: <kernel-janitors.vger.kernel.org>
References: <40250629.3030004@gmx.net>
In-Reply-To: <40250629.3030004@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------010302030502000207020302
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit


Michael Veeck wrote:
> 
> 
> Randy.Dunlap schrieb:
> 
>> On Sat, 07 Feb 2004 18:35:05 +0100 Michael Veeck 
>> <michael.veeck@gmx.net> wrote:
>>
>> | | | Jeff Garzik schrieb:
>> | > Michael Veeck wrote:
>> | > | >> Hi!
>> | >> Patch (against 2.6.3-rc1) removes unnecessary min/max macros and 
>> | >> changes calls to use kernel.h macros instead.
>> | >> Feedback always welcome
>> | >> Michael
>> | >>
>> | >>
>> | >> 
>> ------------------------------------------------------------------------
>> | >>
>> | >> --- linux-2.6.2.org/drivers/net/acenic.c    2004-02-07 | >> 
>> 15:25:57.000000000 +0100
>> | >> +++ linux-2.6.2.new/drivers/net/acenic.c    2004-02-07 | >> 
>> 15:33:24.286033896 +0100
>> | >> @@ -335,10 +335,6 @@
>> | >>  #define ACE_PROBE_ARG                struct net_device *dev
>> | >>  #endif
>> | >>  | >> -#ifndef min_t
>> | >> -#define min_t(type,a,b)    (((a)<(b))?(a):(b))
>> | >> -#endif
>> | > | > | > | > Read the code you're patching :)
>> | > | > You're killing compat code the driver author added.
>> | > | >     Jeff
>> | > | | Ah, that didnt came into my mind. But since #ifndef min_t 
>> doesnt seem to | be in any of the "#if LINUX_VERSION_CODE >= " why not 
>> put it in the | appropiate one?
>> | | Do you know when the min_t was introduced in include/linux/kernel.h ?
>>
>> BK shows 5-FEB-2002 for min_t.
>> That would be early 2.5.x, like 2.5.4, estimating by looking at
>> http://www.kernel.org/pub/linux/kernel/v2.5/
>>
> 
> Digging through the changelogs on kernel.org I found out that 
> min_t/max_t macros were really introduced in 2.4.9 as "min/max" and then 
> changed to their min_t/max_t-name in 2.4.10.
> 
> I will incorproate that in my next patch! Thanks for the advice!
> 
> Veeck
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> 

Here is the new patch against kernel 2.6.5. Any comments?

Best regards
Michael Veeck


--------------010302030502000207020302
Content-Type: text/plain;
 name="minmax_drivers_net_acenic.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax_drivers_net_acenic.patch"

--- linux-2.6.5.org/drivers/net/acenic.c	2004-04-04 05:37:06.000000000 +0200
+++ linux-2.6.5.new/drivers/net/acenic.c	2004-04-06 23:55:33.141177224 +0200
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

--------------010302030502000207020302
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------010302030502000207020302--
