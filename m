From: Jiri Kosina <jkosina@suse.cz>
Date: Fri, 18 Dec 2009 14:07:01 +0000
Subject: Re: [PATCH 02/10] Fix misspellings of "should" in comments.
Message-Id: <alpine.LNX.2.00.0912181505400.3755@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1260567342-8327-3-git-send-email-adam.buchbinder@gmail.com>
In-Reply-To: <1260567342-8327-3-git-send-email-adam.buchbinder@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, 11 Dec 2009, Adam Buchbinder wrote:

> Some comments misspell "should"; this fixes them. No code changes.
> 
> Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
> ---
>  arch/x86/kernel/ptrace.c                           |    2 +-
>  drivers/ata/libata-core.c                          |    2 +-
>  drivers/gpu/drm/radeon/atombios.h                  |    2 +-
>  drivers/ieee1394/pcilynx.c                         |    2 +-
>  drivers/input/tablet/aiptek.c                      |    2 +-
>  drivers/scsi/lpfc/lpfc_scsi.c                      |    4 ++--
>  .../comedi/drivers/addi-data/APCI1710_Chrono.c     |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Dig_io.c     |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_INCCPT.c     |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Inp_cpt.c    |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Pwm.c        |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Ssi.c        |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Tor.c        |    2 +-
>  .../comedi/drivers/addi-data/APCI1710_Ttl.c        |    2 +-
>  .../comedi/drivers/addi-data/addi_amcc_S5920.c     |    2 +-
>  .../staging/comedi/drivers/addi-data/addi_common.c |    2 +-
>  .../staging/comedi/drivers/addi-data/addi_eeprom.c |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_APCI1710.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci035.c       |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci1032.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci1500.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci1516.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci1564.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci16xx.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci2016.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci2032.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci2200.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci3120.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci3200.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci3501.c      |    2 +-
>  .../comedi/drivers/addi-data/hwdrv_apci3xxx.c      |    2 +-
>  .../staging/rtl8192e/ieee80211/rtl819x_HTProc.c    |    2 +-
>  drivers/staging/rtl8192e/r8192E_core.c             |    4 ++--
>  .../staging/rtl8192su/ieee80211/rtl819x_HTProc.c   |    2 +-
>  drivers/staging/rtl8192su/r8192U_core.c            |    2 +-
>  drivers/video/sstfb.c                              |    2 +-
>  fs/locks.c                                         |    2 +-
>  include/linux/input-polldev.h                      |    2 +-
>  kernel/audit.c                                     |    2 +-
>  mm/slub.c                                          |    2 +-
>  40 files changed, 42 insertions(+), 42 deletions(-)

This doesn't apply any more on 2.6.33-rc1 (partially because some of the 
typos have been already fixed).

Also, could you please separate the drivers/staging bits out, and send 
them separately to staging maintainer (Greg)?
This area of code is under rather heavy development and changes, so we'd 
better avoid conflicts by merging them through staging tree directly.

Care to respin and resend?

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
