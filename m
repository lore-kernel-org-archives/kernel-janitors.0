Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4E62C433EF
	for <kernel-janitors@archiver.kernel.org>; Wed,  9 Feb 2022 23:33:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230240AbiBIXdc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 9 Feb 2022 18:33:32 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:37728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiBIXda (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 9 Feb 2022 18:33:30 -0500
X-Greylist: delayed 66 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 09 Feb 2022 15:33:20 PST
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 958D0E06EA7E
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Feb 2022 15:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1644449600; x=1675985600;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0uLAqxVp4=;
  b=n1mQt9WXESnam6RkT/mlx5c6V6kRqcqSs/3WzeJQsACZxQBfKTyK6siW
   eeMBnjcP37CB73r+Rm4qLsJ6WYiH0LOLYQXgtbBCpNnXdS7FWZgiGRu0D
   XCuzxJBbjKgikOpp5atTRL0Ci3ID6oUhXuZtxwSu4t33yHFrPXV0FB9Ml
   xR6sZ1gy2/A090BLs+Lj9n7D3PQB6rJKnH6DxhiuBvcknYMMlA7zZPNNA
   0Z/OIby5CDLf3q+UJLiceTmh74tRN/IZXKzprxWmimWeTCKTa9ciJ24oQ
   VjanblNE1/4fZoiQOdEeryhTGmb9kOLBffxmT554w8gY9bOeZpUPMphMj
   w==;
X-IronPort-AV: E=Sophos;i="5.88,357,1635177600"; 
   d="scan'208";a="304450434"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2022 07:32:14 +0800
IronPort-SDR: BgIXcsLY/uEczBIUoKrY0L7+33+uOqlWpza74hp8qjxpv/dmsyGnqAJM9dMxvBXdF/HNJTCAx0
 27zbPaZpTwkE+dLf7Rwp0n5gzm1NDGK7xMUX4nOjXh8MyN3ML7m/jkouRm6lYxaGtKy6v5eY/o
 nFxJvx8htgFGbKyfeJrd1pQGXEp6NU3PjjmHoh5yvmvp6XPP+5W6eA/f6wy3YGXnCs8C8mJC/F
 YTEv7ibxASJPe0jYPSFVkmGInKeOZgbNQp4VTrkTM1elGl5rU0qY7kzd1i2o4XsfMWm4MSk941
 pn0ezBzBiyt1hPGo5Qq+BGi4
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:05:12 -0800
IronPort-SDR: 4IGJ3BmM2znPCb3Tthm2CNit/naUkSmcasEVZGvlcPuNr1Rw2Kth3F2IrwDT7MxlF86yrxU+Pp
 fwV9jgHnH1pb2QmzVEed6R4FwgO83byQNwktrxzz7sEhXHrsa9YHVZixRpfLvzg5yREGAMePLz
 ZVXrRaSLCGN8EcYN9uFhlhjLU3fpV5OC76CREgnYdNyw14ouG9Grxq9tfO7VhJc38Dlg2plPxI
 6NmgcC8l99WNUvyHVmvm4kZvHA07k68Jgoj8SRniDjglihychu+2VBKZjaYiC34+SaWH/4GDvp
 GWA=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
  by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2022 15:32:14 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JvGPT6mlvz1SVnx
        for <kernel-janitors@vger.kernel.org>; Wed,  9 Feb 2022 15:32:13 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
        reason="pass (just generated, assumed good)"
        header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
        opensource.wdc.com; h=content-transfer-encoding:content-type
        :in-reply-to:organization:from:references:to:content-language
        :subject:user-agent:mime-version:date:message-id; s=dkim; t=
        1644449533; x=1647041534; bh=SCi2xcOs63Mel3nuQiDXDDze0xfHJgyKIw0
        uLAqxVp4=; b=ZRVIrmYj3XrTAJf0bnCsH4qtvNW0lUuFx/jJpWP8hLrqcOQmCjH
        CS3UrT8uPJ31QdHyUUwNLCHm7OOsAj1e34aBO71VmFXG2NcDvCBhyhFSyiG4fr/U
        L2FFphXB3QBK+lw2V84dy18E+QBE3SP2Yx2dO9XcD1KO4LztCZmKEEQItl6U8g/H
        WVkkyb/6lPH3M4mOB1fqrMeaKI5WtnpucaK4rARJudXqICvOtws0Z41hzi4zQHS8
        phkVH8bXie4WlQPTWBMTcJ31yPyIxksSNokHNWC98vJi1YLHjlRqrV8U1YvP+e9J
        btSV5NXYRLTD1QYQVM7bpYz1TYQkTYU6JGA==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
        by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id 5vY-EtQpVxHC for <kernel-janitors@vger.kernel.org>;
        Wed,  9 Feb 2022 15:32:13 -0800 (PST)
Received: from [10.225.163.67] (unknown [10.225.163.67])
        by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JvGPS2bf7z1Rwrw;
        Wed,  9 Feb 2022 15:32:12 -0800 (PST)
Message-ID: <2b574c51-5039-5145-b1b2-a139c27daa96@opensource.wdc.com>
Date:   Thu, 10 Feb 2022 08:32:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@oracle.com>,
        Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Anderson <seanga2@gmail.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <20220209180804.GA18385@kili>
From:   Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <20220209180804.GA18385@kili>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On 2/10/22 03:08, Dan Carpenter wrote:
> The loop exited too early so the k210_pinconf_drive_strength[0] array
> element was never used.
> 
> Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index 49e32684dbb2..e3d03f2de7ef 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
>  {
>  	int i;
>  
> -	for (i = K210_PC_DRIVE_MAX; i; i--) {
> +	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
>  		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
>  			return i;
>  	}

Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>

-- 
Damien Le Moal
Western Digital Research
