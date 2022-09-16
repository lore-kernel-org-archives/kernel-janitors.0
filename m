Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7CFC54EE9
	for <kernel-janitors@archiver.kernel.org>; Fri, 16 Sep 2022 14:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbiIPO1I (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 16 Sep 2022 10:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232135AbiIPO03 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 16 Sep 2022 10:26:29 -0400
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47617B40D7
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1663338385; x=1694874385;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=712YwNQdrWKANR3vHtT8MY/Ny21R8h1VOwwEWwMdGyA=;
  b=gZzuTZWYbf/x2c7muPQwRksSH+KSoEJHpMFCUBmAISodJtmk0hi0vLy5
   itUSc+Mkq37FAz5c/7cvSVNxipAatkGJPNZqHJ+x/nFLI8z1RCc32yrSK
   YsHQOYP5b3jk+nn/4TgVaQYXp77uFOdL3Cdk9+rg2zKTK2IRMQ+OSJVSF
   yQe1e/gSrmbqh96KWZn7wUWYifmd0q3y+anph3RzsYZOMsk2pmKyH5D9o
   eKDbbMAmh7+Wysbsv61QpABNBJtid9AUWgVzzkFcwmQGgfsEUr28NNCP/
   CedCUqju1SU4SysXM8dWV7c8D12CnaJTPAYPQfFVRpPMB26w7OsMfdroi
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654531200"; 
   d="scan'208";a="216707953"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2022 22:26:24 +0800
IronPort-SDR: KilMNWvvNfWjLvjL6k4M+YqfSFrPn9bp+TKeukrbfCEb3XBXjpPa1vQlyntMc7kTT0TtQlm9S+
 z/iOxDcRBwjlosBYs7Dd3cS45bXAM4GenvE5+yzeZdaKhmgT73EtDNG+Y4yxLQN9nwEU7VCSJM
 RnwciVvPCPwQEAgQnbF1u8BaU2jmiB9Ua8sMnnQAU/PxaXaB6F2YiRgLfR1kw3ID/XINOnXawu
 MxJzQYm8MEIyGOGe7OtEuN7+5mCDjyzOLUPRL0DMoEA2+tIHTaAGIJ0a9FAk7iYfH30BgwgnqI
 6N8X8quZ0vHqx3ldEwKIvuuF
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2022 06:46:35 -0700
IronPort-SDR: kQhbsbQaojfjZlITKNBWHFccdcy3PbAPiYBp/qvkPiYvs30KqGCRfdn1WpcwWF6m5/zJPfA86z
 bibwRP1Lbh1vAS4xgVXOLx9Z8mQeYraFsDOERUtimMxZd4baakoMFt6Mq0ATexQNsuCAB6Rj3H
 wwwq9qqF2Sn2c1Y0w6yNdlRCuFXMvPsOIpviuXEbqeHJqVQyHnyPX03EikvKTzvjTIvRt82G9Y
 i+hGMrEAUrvWm2SmoCth1hm0X21RgiHQ947ggUlf1f1/mmArd9IPjhennpV1c0QM3RpzRu1GAG
 4Ok=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 16 Sep 2022 07:26:25 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4MTbwc5Yt9z1RvTr
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Sep 2022 07:26:24 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1663338383; x=1665930384; bh=712YwNQdrWKANR3vHtT8MY/Ny21R8h1VOww
        EWwMdGyA=; b=SDry22ytjYJvvjMx3nluMVo1RXucQuw09chczhDMllGaXqA40+4
        K+3fggtBLIPON9W5FEHzjjO9jet1Aa1WU5V7g/4YvKV3wXWWZRumQRxA+001ohVe
        yWtw+NVJfzoLdk1DwP0hp9VwNmr+1x0jnZMuEaPY1EleTJHBhq5g/ON933TdJ4JO
        jjH2nyfl5dDTR387QeOBJD0r6ToNDDyCkmvS4ER5W6kJH0hllyITeQTGSnIq/GyR
        6dkOnG/8rrdnHjZMMkbDRVfsCU7/r9j5cvFSRTINkXe6A5AyUyKg/L9V2Y33xuAu
        y6Syd74iS/g+0j4j3Eu2u7KfhMRZC/1vLqg==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id em9m00Weao22 for <kernel-janitors@vger.kernel.org>;
        Fri, 16 Sep 2022 07:26:23 -0700 (PDT)
Received: from [10.225.1.43] (unknown [10.225.1.43])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4MTbwX3hFkz1RvLy;
        Fri, 16 Sep 2022 07:26:20 -0700 (PDT)
Message-ID: <6cb1bb99-be0d-f2db-a59e-76e6b8d14aa0@opensource.wdc.com>
Date:   Fri, 16 Sep 2022 15:26:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH 1/2] ata: clean up how architectures enable PATA_PLATFORM
 and PATA_OF_PLATFORM
Content-Language: en-US
To:     Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-arm-kernel@lists.infradead.org, linux-ide@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220914142713.29351-1-lukas.bulwahn@gmail.com>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220914142713.29351-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2022/09/14 15:27, Lukas Bulwahn wrote:
> There are two options for platform device PATA support:
> 
>   PATA_PLATFORM: Generic platform device PATA support
>   PATA_OF_PLATFORM: OpenFirmware platform device PATA support
> 
> If an architecture allows the generic platform device PATA support, it
> shall select HAVE_PATA_PLATFORM. Then, Generic platform device PATA support
> is available and can be selected.
> 
> If an architecture has OpenFirmware support, which it indicates by
> selecting OF, OpenFirmware platform device PATA support is available
> and can be selected.
> If OpenFirmware platform device PATA support is selected, then the
> functionality (code files) from Generic platform device PATA support needs
> to be integrated in the kernel build for the OpenFirmware platform device
> PATA support to work. Select PATA_PLATFORM in PATA_OF_PLATFORM to make sure
> the needed files are added in the build.
> 
> So, architectures with OpenFirmware support, do not need to additionally
> select HAVE_PATA_PLATFORM. It is only needed by architecture that want the
> non-OF pata-platform module.
> 
> Reflect this way of intended use of config symbols in the ata Kconfig and
> adjust all architecture definitions.
> 
> This follows the suggestion from Arnd Bergmann (see Link).
> 
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Link: https://lore.kernel.org/all/4b33bffc-2b6d-46b4-9f1d-d18e55975a5a@www.fastmail.com/
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied this patch and 2/2 to for-6.1. Thanks !

> ---
>  arch/arm/mach-versatile/Kconfig | 1 -
>  arch/arm64/Kconfig              | 1 -
>  drivers/ata/Kconfig             | 6 +++---
>  3 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm/mach-versatile/Kconfig b/arch/arm/mach-versatile/Kconfig
> index 2ef226194c3a..b1519b4dc03a 100644
> --- a/arch/arm/mach-versatile/Kconfig
> +++ b/arch/arm/mach-versatile/Kconfig
> @@ -256,7 +256,6 @@ menuconfig ARCH_VEXPRESS
>  	select GPIOLIB
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
> -	select HAVE_PATA_PLATFORM
>  	select CLK_ICST
>  	select NO_IOPORT_MAP
>  	select PLAT_VERSATILE
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 51f3f07c3efd..036bd67e662e 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -194,7 +194,6 @@ config ARM64
>  	select HAVE_IRQ_TIME_ACCOUNTING
>  	select HAVE_KVM
>  	select HAVE_NMI
> -	select HAVE_PATA_PLATFORM
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
> diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
> index 1c9f4fb2595d..c93d97455744 100644
> --- a/drivers/ata/Kconfig
> +++ b/drivers/ata/Kconfig
> @@ -1102,8 +1102,7 @@ config PATA_PCMCIA
>  	  If unsure, say N.
>  
>  config PATA_PLATFORM
> -	tristate "Generic platform device PATA support"
> -	depends on EXPERT || PPC || HAVE_PATA_PLATFORM
> +	tristate "Generic platform device PATA support" if EXPERT || HAVE_PATA_PLATFORM
>  	help
>  	  This option enables support for generic directly connected ATA
>  	  devices commonly found on embedded systems.
> @@ -1112,7 +1111,8 @@ config PATA_PLATFORM
>  
>  config PATA_OF_PLATFORM
>  	tristate "OpenFirmware platform device PATA support"
> -	depends on PATA_PLATFORM && OF
> +	depends on OF
> +	select PATA_PLATFORM
>  	help
>  	  This option enables support for generic directly connected ATA
>  	  devices commonly found on embedded systems with OpenFirmware

-- 
Damien Le Moal
Western Digital Research

