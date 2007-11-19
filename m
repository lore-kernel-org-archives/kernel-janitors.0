From: Greg Ungerer <gerg@snapgear.com>
Date: Mon, 19 Nov 2007 01:40:25 +0000
Subject: Re: [PATCH] m68knommu: Removing config variable BDM_DISABLE
Message-Id: <4740E989.3040303@snapgear.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <473C063B.2060400@gmail.com>
In-Reply-To: <473C063B.2060400@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Jiri Olsa wrote:
> Marcin S'lusarz wrote:
>> 2007/11/15, Jiri Olsa <olsajiri@gmail.com>:
>>> Removing config variable BDM_DISABLE, since it is not used
>>> Removing #ifdef MCF_BDM_DISABLE code , since MCF_BDM_DISABLE is not defined
>>>
>>> Signed-off-by: Jiri Olsa <olsajiri@gmail.com>
>>> ---
>>>  arch/m68knommu/Kconfig.debug          |    6 ------
>>>  arch/m68knommu/defconfig              |    1 -
>>>  arch/m68knommu/platform/5307/config.c |    9 ---------
>>>  arch/m68knommu/platform/532x/config.c |    9 ---------
>>>  4 files changed, 0 insertions(+), 25 deletions(-)
>>>
>>> diff --git a/arch/m68knommu/Kconfig.debug b/arch/m68knommu/Kconfig.debug
>>> index 9ff47bd..2784b46 100644
>>> --- a/arch/m68knommu/Kconfig.debug
>>> +++ b/arch/m68knommu/Kconfig.debug
>>> @@ -33,10 +33,4 @@ config NO_KERNEL_MSG
>>>         help
>>>           Do not output any debug BUG messages within the kernel.
>>>
>>> -config BDM_DISABLE
>>> -       bool "Disable BDM signals"
>>> -       depends on (EXPERIMENTAL && COLDFIRE)
>>> -       help
>>> -         Disable the ColdFire CPU's BDM signals.
>>> -
>>>  endmenu
>>> diff --git a/arch/m68knommu/defconfig b/arch/m68knommu/defconfig
>>> index 5a0ecaa..fa44eea 100644
>>> --- a/arch/m68knommu/defconfig
>>> +++ b/arch/m68knommu/defconfig
>>> @@ -599,7 +599,6 @@ CONFIG_MSDOS_PARTITION=y
>>>  # CONFIG_BOOTPARAM is not set
>>>  # CONFIG_DUMPTOFLASH is not set
>>>  # CONFIG_NO_KERNEL_MSG is not set
>>> -# CONFIG_BDM_DISABLE is not set
>>>
>>>  #
>>>  # Security options
>>> diff --git a/arch/m68knommu/platform/5307/config.c b/arch/m68knommu/platform/5307/config.c
>>> index 6040821..e356e4a 100644
>>> --- a/arch/m68knommu/platform/5307/config.c
>>> +++ b/arch/m68knommu/platform/5307/config.c
>>> @@ -116,15 +116,6 @@ void config_BSP(char *commandp, int size)
>>>  #endif
>>>
>>>         mach_reset = coldfire_reset;
>>> -
>>> -#ifdef MCF_BDM_DISABLE
>>> -       /*
>>> -        * Disable the BDM clocking.  This also turns off most of the rest of
>>> -        * the BDM device.  This is good for EMC reasons. This option is not
>>> -        * incompatible with the memory protection option.
>>> -        */
>>> -       wdebug(MCFDEBUG_CSR, MCFDEBUG_CSR_PSTCLK);
>>> -#endif
>>>  }
>>>
>>>  /***************************************************************************/
>>> diff --git a/arch/m68knommu/platform/532x/config.c b/arch/m68knommu/platform/532x/config.c
>>> index f77328b..4166ce5 100644
>>> --- a/arch/m68knommu/platform/532x/config.c
>>> +++ b/arch/m68knommu/platform/532x/config.c
>>> @@ -98,15 +98,6 @@ void config_BSP(char *commandp, int size)
>>>         mcf_timervector = 64+32;
>>>         mcf_profilevector = 64+33;
>>>         mach_reset = coldfire_reset;
>>> -
>>> -#ifdef MCF_BDM_DISABLE
>>> -       /*
>>> -        * Disable the BDM clocking.  This also turns off most of the rest of
>>> -        * the BDM device.  This is good for EMC reasons. This option is not
>>> -        * incompatible with the memory protection option.
>>> -        */
>>> -       wdebug(MCFDEBUG_CSR, MCFDEBUG_CSR_PSTCLK);
>>> -#endif
>>>  }
>> Maybe someone wanted to write "#ifdef CONFIG_BDM_DISABLE"?
>>
> 
> who can tell? I'll try to find out...

That is right. s/MCF_BDM_DISABLE/CONFIG_BDM_DISABLE/ is the
more correct fix.

Regards
Greg



-- 
------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
Secure Computing Corporation                PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
