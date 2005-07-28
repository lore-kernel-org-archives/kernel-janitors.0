From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 28 Jul 2005 04:43:52 +0000
Subject: Re: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <20050728044352.GA4161@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============60532529452363626=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
In-Reply-To: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
To: kernel-janitors@vger.kernel.org

--===============60532529452363626==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 28.07.2005 [10:41:32 +1000], Grant Coady wrote:
> Hi there,
> 
> 2.6.13-rc3-mm2 (cc: Russell King as lots of arms in there)
> 
> linux-2.6.13-rc3-mm2b$ grep -r CONFIG_DEBUG_INFO *|cut -d: -f2-|sort|uniq -c|sort -nr
>      57 # CONFIG_DEBUG_INFO is not set
>      22 CONFIG_DEBUG_INFO=y
>       4 #ifdef CONFIG_DEBUG_INFO
>       2 ifdef CONFIG_DEBUG_INFO
>       2 #ifndef CONFIG_DEBUG_INFO
>       1 ifneq ($(CONFIG_DEBUG_INFO),y)  <<== ??
>       1 ifeq ($(CONFIG_DEBUG_INFO),y)   <<== ??
> 
> 
> linux-2.6.13-rc3-mm2b$ grep -r '($(CONFIG_DEBUG_INFO),y)' *
> 
> arch/arm26/Makefile:ifeq ($(CONFIG_DEBUG_INFO),y)
> arch/x86_64/Makefile:ifneq ($(CONFIG_DEBUG_INFO),y)

I think the first can be

ifdef CONFIG_DEBUG_INFO

and the second

ifndef CONFIG_DEBUG_INFO

> Two Makefiles check for a value. The rest only check if [not] defined.
> 
> ifdef CONFIG_DEBUG_INFO
> CFLAGS          += -g
> AFLAGS          += -g
> endif
> 
> This a problem?  I read somewhere setting to 'n' stops debug, that can't 
> be right?  

Read menuconfig:

  CONFIG_DEBUG_INFO:
      If you say Y here the resulting kernel image will include
      debugging info resulting in a larger kernel image.  Say Y here
      only if you plan to debug the kernel.

	If unsure, say N.

This basically is used for debugging purposes, changing the compiler
flags when you build your kernel (per arch's Makefile). Not sure what
you mean by "stops debug." That's a very vague statement wrt. the
kernel.

> Places setting it to 'y' are off the main path (for me):
> 
> linux-2.6.13-rc3-mm2b$ grep -r CONFIG_DEBUG_INFO=y *
> arch/um/defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/pxa255-idp_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/h7202_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/mainstone_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/bast_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/lubbock_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/mx1ads_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/lpd7a404_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/s3c2410_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/badge4_defconfig:CONFIG_DEBUG_INFO=y
> arch/arm/configs/lpd7a400_defconfig:CONFIG_DEBUG_INFO=y
> arch/ppc/configs/ocotea_defconfig:CONFIG_DEBUG_INFO=y
> arch/ppc/configs/lite5200_defconfig:CONFIG_DEBUG_INFO=y
> arch/ppc/configs/luan_defconfig:CONFIG_DEBUG_INFO=y
> arch/m32r/opsput/defconfig.opsput:CONFIG_DEBUG_INFO=y
> arch/ia64/configs/sn2_defconfig:CONFIG_DEBUG_INFO=y
> arch/ia64/configs/sim_defconfig:CONFIG_DEBUG_INFO=y
> arch/v850/configs/rte-ma1-cb_defconfig:CONFIG_DEBUG_INFO=y
> arch/v850/configs/sim_defconfig:CONFIG_DEBUG_INFO=y
> arch/v850/configs/rte-me2-cb_defconfig:CONFIG_DEBUG_INFO=y
> arch/alpha/defconfig:CONFIG_DEBUG_INFO=y
> arch/arm26/defconfig:CONFIG_DEBUG_INFO=y

Were you asking a question with all of this? All of these are
defconfigs, which are basically machine specific config files (helps
with first build).

Thanks,
Nish

--===============60532529452363626==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============60532529452363626==--
