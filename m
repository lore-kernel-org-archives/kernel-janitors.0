Return-Path: <kernel-janitors-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA63CC38A2D
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Oct 2022 07:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232926AbiJZHY7 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Oct 2022 03:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiJZHY5 (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Oct 2022 03:24:57 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F39CDF6A
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 00:24:56 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y13so9919695pfp.7
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Oct 2022 00:24:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lbsIGfNdTRFI62Q4sgMBIvZMA5h+sOP1oBKSZ5ur8sg=;
        b=pNtYy80rJqYM08OpI1tcWHi5BJehiegmf/3b81VbZwJFYi2J0V6LxLfOBGST56LYDB
         yf1ZpcpCQWBINhlBqut6Pvft6+UgM0QGpgp3iqsdQAwlqXp2HAvFZaF3o0LhZBHFSxZv
         4PMwaXRB/4bpixQJ60oJCAuwuAUFiYmo8hdpBb6EmbOgagTt/fpVMy2VPJ4zRogsrSem
         xq/Ey8C89WgWQI+ErYXv2Bgxjx/SjfLjN4imGQ0rdOnXLrZLjOPmEGYFqOWxIHP2MmFZ
         Yor9FM03SpqhhFBFhNr2YsV+pnZZg/3msxAEwEX9wQuod/l4ifb/UHSXDELucDE0xIno
         NptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lbsIGfNdTRFI62Q4sgMBIvZMA5h+sOP1oBKSZ5ur8sg=;
        b=pCXFF2fxAUd7VQGbJCrlcTsTajK5t8zW2+Qw/UXN80qp8jICDKSiM/RYCe3CO7fEiD
         7UUueRG2mManiQZ1CegH97CcwSkBZfuvWJ2vZiOoe+UJphkJWM76kMoMkLSPvnaPq+uU
         KUoA6EgmtToT8cNcPRCZTcF82kJwd4r1Z+i1NEJqiaT7UX8sfdN/gfbpy2NKy/aJ6E1F
         8AFcTUfls3+VJ3FMGhxVLZ0ro8N5Xy8oJtLWO+NnKJA0K0urCd7krWIQTNjtyphQ6UuO
         7vW06lQ4ipK2sCGt4wFDkezpnJ5imyMCdBHDRMbZXZoI7M8CXxjShsgEu0lmEC6dtgnY
         +eXA==
X-Gm-Message-State: ACrzQf1MpZghtOKolVan4I5qeWqWMzkVkkAWwDuMe8EXF/yyTsUltqxT
        G7yKbf48d4KsVGI+Ivt23Ck=
X-Google-Smtp-Source: AMsMyM5Pgl8UXjLTT+IynrpLOReb8fQxrJOCS430MlGcU+ORFvzAO1lF4PZ8RLhm+3ZNVYQprM6ROw==
X-Received: by 2002:a63:1a45:0:b0:439:49b4:9672 with SMTP id a5-20020a631a45000000b0043949b49672mr36078100pgm.551.1666769095629;
        Wed, 26 Oct 2022 00:24:55 -0700 (PDT)
Received: from cyhuang-hp-elitebook-840-g3.rt ([2402:7500:47a:8591:4c25:2ac0:9173:656f])
        by smtp.gmail.com with ESMTPSA id k22-20020a63d116000000b00469e09532e0sm2252228pgg.18.2022.10.26.00.24.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Oct 2022 00:24:55 -0700 (PDT)
Date:   Wed, 26 Oct 2022 15:24:48 +0800
From:   ChiYuan Huang <u0084500@gmail.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Lee Jones <lee@kernel.org>, ChiYuan Huang <cy_huang@richtek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        ChiaEn Wu <chiaen_wu@richtek.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH resend] mfd: mt6370: add bounds checking to
 regmap_read/write functions
Message-ID: <20221026072444.GA24881@cyhuang-hp-elitebook-840-g3.rt>
References: <Y1aCiReTZDbPp/rS@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1aCiReTZDbPp/rS@kadam>
User-Agent: Mutt/1.5.24 (2015-08-30)
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

On Mon, Oct 24, 2022 at 03:18:17PM +0300, Dan Carpenter wrote:
> It looks like there are a potential out of bounds accesses in the
> read/write() functions.  Also can "len" be negative?  Let's check for
> that too.
> 
> Fixes: ab9905c5e38e ("mfd: mt6370: Add MediaTek MT6370 support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This came from static analysis, but then I couldn't figure out the next
> day if it was actually required or not so we dropped it.  But then
> ChiYuan Huang did some testing and it was required.
> 
> There was some debate around various style questions but honestly I'm
> pretty happy with the style the way I wrote it.  I've written a long
> blog on why "unsigned int" is good at the user space boundary but should
> not be the default choice as a stack variable.
> 
> https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
> 
> The other style issue was wether to use ARRAY_SIZE() or MT6370_MAX_I2C
> and I just think ARRAY_SIZE() is more obvious to the reader.
> 
Hi,

Before applying the patch, the test result is like as below
1) overbound register access
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
pc : i2c_smbus_xfer+0x58/0x120
lr : i2c_smbus_read_i2c_block_data+0x74/0xc0
Call trace:
 i2c_smbus_xfer+0x58/0x120
 i2c_smbus_read_i2c_block_data+0x74/0xc0
 mt6370_regmap_read+0x40/0x60 [mt6370]
 _regmap_raw_read+0xe4/0x278
 regmap_raw_read+0xec/0x240a

2) normal register access with negative length
Unable to handle kernel paging request at virtual address ffffffc009cefff2
pc : __memcpy+0x1dc/0x260
lr : _regmap_raw_write_impl+0x6d4/0x828
Call trace:
 __memcpy+0x1dc/0x260
 _regmap_raw_write+0xb4/0x130a
 regmap_raw_write+0x74/0xb0


After applying the patch, the first case is cleared.
But for the case 2, the root cause is not the mt6370_regmap_write() size
check. It's in __memcpy() before mt6370_regmap_write().

I'm wondering 'is it reasonable to give the negative value as the size?'


>  drivers/mfd/mt6370.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
> index cf19cce2fdc0..fd5e1d6a0272 100644
> --- a/drivers/mfd/mt6370.c
> +++ b/drivers/mfd/mt6370.c
> @@ -190,6 +190,9 @@ static int mt6370_regmap_read(void *context, const void *reg_buf,
>  	bank_idx = u8_buf[0];
>  	bank_addr = u8_buf[1];
>  
> +	if (bank_idx >= ARRAY_SIZE(info->i2c))
> +		return -EINVAL;
> +
>  	ret = i2c_smbus_read_i2c_block_data(info->i2c[bank_idx], bank_addr,
>  					    val_size, val_buf);
>  	if (ret < 0)
> @@ -211,6 +214,9 @@ static int mt6370_regmap_write(void *context, const void *data, size_t count)
>  	bank_idx = u8_buf[0];
>  	bank_addr = u8_buf[1];
>  
> +	if (len < 0 || bank_idx >= ARRAY_SIZE(info->i2c))
> +		return -EINVAL;
> +
>  	return i2c_smbus_write_i2c_block_data(info->i2c[bank_idx], bank_addr,
>  					      len, data + MT6370_MAX_ADDRLEN);
>  }
> -- 
> 2.35.1
