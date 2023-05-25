Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD4A1C7EE2E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 08:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240453AbjEYIzP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 04:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231382AbjEYIzN (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 04:55:13 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08BC318D
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:55:11 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3f6e13940daso420915e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 01:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685004909; x=1687596909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QtDjcqj8z1Plq2b8p/rVfpFVt89quubK5nag52Q/T+k=;
        b=U4gsbWe1BbtxwEM7W66xmy9HNLFI3gdQevrGWZXD135Jf0wsJF23wGd0Iy92GM+xsH
         pBqhI47yxBlCWFv2AQjJhTgbEucGXUoODNbKB2kGmmxdyHXPdVdSgzeDDCRcDclEI+4O
         3DC110zUHqkJXwPq05AW3j/48uY9TeNvhgTvySlue0ZiEouDx11QN3d7M5Otw7EopIkB
         Br9HNt6uFtRjL9u97esQ3TOiQXq8/Wg5jy045HLadZ9Lst6h/SjVVPJfMEZukFIJJTGx
         xiwQ7tSR4AS1B561Cnyxz7TCbaQQVXWj345yhyoZGMngo5gg1IbYCEOp/vcxTLD3e1Tj
         wl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685004909; x=1687596909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QtDjcqj8z1Plq2b8p/rVfpFVt89quubK5nag52Q/T+k=;
        b=KZxYTPaqKjLdVDGTo8B5yKwrArDCIXaHygqI1hPVv1NlhxEvTTs5qvu0ZqAjetJY9d
         UzJQ62l8tdPEnAQhwo2rYAaeJisNmH5vixikwQYaEJWhAj9lcW+/mvNJKKUjr3qJ+fKz
         +YmgzG4AGTLDp/Xb/YRAMBhOnMVE27bktGVaMTJG8k5LbxwfqF2DtHXEqstR88yLvffd
         Th1LWy9c1OLiesIMGi1dV5jijINdKHA1Ow2Tae+CmFwWf2qCGs2aVupPCTMpanA3wAm4
         xgP7aimNXYYGHv+pqHuH0YEmg/RgwGGq+X27neGxKnrbuJ0Rq5LWhwSJf5NfHhsN4H6N
         pVOQ==
X-Gm-Message-State: AC+VfDwXSxrtDA9htKqtzzc+CiBRqLnA3mKTIydiRNRAuerVpOW5Gxgo
        qRs0ZC+souXhY10WPSnTZkseWmy3wCRGI7CNycs=
X-Google-Smtp-Source: ACHHUZ7MKkmEvS8XAlRhJ9e7nLGPgpi1xHXKsIVhLDqVOloaGU+KPvnCmhA+6ocXZxBOPSCef8GgxA==
X-Received: by 2002:a7b:cb91:0:b0:3f6:45d:28a1 with SMTP id m17-20020a7bcb91000000b003f6045d28a1mr2373900wmi.14.1685004909469;
        Thu, 25 May 2023 01:55:09 -0700 (PDT)
Received: from [192.168.1.70] (29.31.102.84.rev.sfr.net. [84.102.31.29])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d4385000000b003062b57ffd1sm1033766wrq.50.2023.05.25.01.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 May 2023 01:55:09 -0700 (PDT)
Message-ID: <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
Date:   Thu, 25 May 2023 10:55:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Content-Language: en-US
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
References: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
From:   Julien Panis <jpanis@baylibre.com>
In-Reply-To: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Dan,

On 5/25/23 09:46, Dan Carpenter wrote:
> Hello Julien Panis,
>
> The patch 325bec7157b3: "mfd: tps6594: Add driver for TI TPS6594
> PMIC" from May 11, 2023, leads to the following Smatch static checker
> warning:
>
> 	drivers/mfd/tps6594-i2c.c:159 tps6594_i2c_write()
> 	warn: 'count - 2' negative user limit promoted to high
>
> drivers/mfd/tps6594-i2c.c
>      142 static int tps6594_i2c_write(void *context, const void *data, size_t count)
>      143 {
>      144         struct i2c_client *client = context;
>      145         struct tps6594 *tps = i2c_get_clientdata(client);
>      146         struct i2c_msg msg;
>      147         const u8 *bytes = data;
>      148         u8 *buf;
>      149         const u8 page = bytes[1];
>      150         const u8 reg = bytes[0];
>      151         int ret = 0;
>      152         int i;
>      153
>      154         if (tps->use_crc) {
>      155                 /*
>      156                  * Auto-increment feature does not support CRC protocol.
>      157                  * Converts the bulk write operation into a series of single write operations.
>      158                  */
> --> 159                 for (i = 0 ; ret == 0 && i < count - 2 ; i++)
>
> TL;DR Smatch is correctly complaining that "count - 2" can underflow.
>
> Smatch finds this code hard to parse.  It says that "count" is a user
> controlled number between 0-u64max which has an upperbound (but the
> upper bound is variable instead of a constant).
>
> Can count actually be zero?  Smatch is normally good at tracking that...

'count' is the total number of bytes in i2c frame: it takes into account
the number of bytes for address ('reg_bits / 8') + the number of bytes
for data (which is at least 'val_bits / 8')
So, with 'reg_bits = 16' and 'val_bits = 8' in 'tps6594_i2c_regmap_config'
struct, 'count' should be at least 3. It cannot be zero.

> The other limitation that Smatch does not track is from regmap_raw_write()
>
> 	if (val_len % map->format.val_bytes)
>
> In this case the value of map->format.val_bytes comes from:
>
> drivers/mfd/tps6594-i2c.c
>     186  static const struct regmap_config tps6594_i2c_regmap_config = {
>     187          .reg_bits = 16,
>     188          .val_bits = 8,
>                  ^^^^^^^^^^^^^^
>
>     189          .max_register = TPS6594_REG_DWD_FAIL_CNT_REG,
>     190          .volatile_reg = tps6594_is_volatile_reg,
>     191          .read = tps6594_i2c_read,
>     192          .write = tps6594_i2c_write,
>     193  };
>
> So we either need to add some special handling for count == 1 or change
> .val_bits = 16 or something.

Special handling for 'count == 1' (or 'count < 2') makes sense indeed.

I'm not sure that I fully understand, though. Will Smatch stop complaining
for both things that you mentioned above with a patch for handling 'count < 2' ?
Or will we consider either that warnings are handled, even if they are still there.

About upstream process, should I submit a new driver version or should I
just send to Lee a patch fixing these warnings ? (I am not familiar with this
situation actually).

>
>      160                         ret = tps6594_i2c_reg_write_with_crc(client, page, reg + i, bytes[i + 2]);
>      161
>      162                 return ret;
>      163         }
>      164
>      165         /* Setup buffer: page byte is not sent */
>      166         buf = kzalloc(--count, GFP_KERNEL);
>      167         if (!buf)
>      168                 return -ENOMEM;
>      169
>      170         buf[0] = reg;
>      171         for (i = 0 ; i < count - 1 ; i++)
>      172                 buf[i + 1] = bytes[i + 2];
>      173
>      174         /* Write register and data: I2C address = I2C base address + Page index */
>      175         msg.addr = client->addr + page;
>      176         msg.flags = client->flags & I2C_M_TEN;
>      177         msg.len = count;
>      178         msg.buf = buf;
>      179
>      180         ret = tps6594_i2c_transfer(client->adapter, &msg, 1);
>      181
>      182         kfree(buf);
>      183         return ret;
>      184 }
>
> regards,
> dan carpenter

Julien Panis
