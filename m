From: Grant Coady <lkml@dodo.com.au>
Date: Thu, 28 Jul 2005 00:41:32 +0000
Subject: [KJ] 2.6 kbuild inconsistent CONFIG_DEBUG_INFO usage?
Message-Id: <hdage1thbneer1ucku4amfkjsq5tnlf50m@4ax.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============76162305874617897=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============76162305874617897==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi there,

2.6.13-rc3-mm2 (cc: Russell King as lots of arms in there)

linux-2.6.13-rc3-mm2b$ grep -r CONFIG_DEBUG_INFO *|cut -d: -f2-|sort|uniq -c|sort -nr
     57 # CONFIG_DEBUG_INFO is not set
     22 CONFIG_DEBUG_INFO=y
      4 #ifdef CONFIG_DEBUG_INFO
      2 ifdef CONFIG_DEBUG_INFO
      2 #ifndef CONFIG_DEBUG_INFO
      1 ifneq ($(CONFIG_DEBUG_INFO),y)  <<== ??
      1 ifeq ($(CONFIG_DEBUG_INFO),y)   <<== ??


linux-2.6.13-rc3-mm2b$ grep -r '($(CONFIG_DEBUG_INFO),y)' *

arch/arm26/Makefile:ifeq ($(CONFIG_DEBUG_INFO),y)
arch/x86_64/Makefile:ifneq ($(CONFIG_DEBUG_INFO),y)
  
Two Makefiles check for a value. The rest only check if [not] defined.

ifdef CONFIG_DEBUG_INFO
CFLAGS          += -g
AFLAGS          += -g
endif

This a problem?  I read somewhere setting to 'n' stops debug, that can't 
be right?  

Places setting it to 'y' are off the main path (for me):

linux-2.6.13-rc3-mm2b$ grep -r CONFIG_DEBUG_INFO=y *
arch/um/defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/pxa255-idp_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/h7202_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/mainstone_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/bast_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/lubbock_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/mx1ads_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/lpd7a404_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/s3c2410_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/badge4_defconfig:CONFIG_DEBUG_INFO=y
arch/arm/configs/lpd7a400_defconfig:CONFIG_DEBUG_INFO=y
arch/ppc/configs/ocotea_defconfig:CONFIG_DEBUG_INFO=y
arch/ppc/configs/lite5200_defconfig:CONFIG_DEBUG_INFO=y
arch/ppc/configs/luan_defconfig:CONFIG_DEBUG_INFO=y
arch/m32r/opsput/defconfig.opsput:CONFIG_DEBUG_INFO=y
arch/ia64/configs/sn2_defconfig:CONFIG_DEBUG_INFO=y
arch/ia64/configs/sim_defconfig:CONFIG_DEBUG_INFO=y
arch/v850/configs/rte-ma1-cb_defconfig:CONFIG_DEBUG_INFO=y
arch/v850/configs/sim_defconfig:CONFIG_DEBUG_INFO=y
arch/v850/configs/rte-me2-cb_defconfig:CONFIG_DEBUG_INFO=y
arch/alpha/defconfig:CONFIG_DEBUG_INFO=y
arch/arm26/defconfig:CONFIG_DEBUG_INFO=y


Thanks,
Grant.


--===============76162305874617897==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============76162305874617897==--
