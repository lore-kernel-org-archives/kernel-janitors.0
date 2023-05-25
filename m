Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38961C7EE2C
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 07:47:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234281AbjEYHrb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 03:47:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239368AbjEYHrJ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 03:47:09 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F8A5E55
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 00:47:07 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-309550d4f73so467365f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 00:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685000825; x=1687592825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OHPfUFAWDspd+UBGduiW+GWhR9UJRMeAF/G1AjNnx8g=;
        b=ZOM74rsDYgvGKWA5lD7Hr+jYuwm1pkmAC4tN5Y9tMzZeQhai6sRvHB0TaE6/rDag/K
         WaMnDtYIrCtT4tF6DAAZAXpJGPfpM1T7SJmF/Q076wQ3zHi38s8bu1mZCG+F7X4SouN7
         Z0bWujXRMWz+XCc9A35snOMgeAa7jQbzAh3S6754v6TdRW6HDijjeB3/Ia1K7UJqQfye
         fSByk1curM3I3jatNY4ZODUlFnvDnB3XmZcmYWfj2q/33qP3Vj/w8bZO2HoZmIN6xweB
         XQ7hvwaFdNnBbEaw4INnURRVvtDQId5pUJTti/saWxOXFNR03eYsAR95AUlZ4bmTrHOg
         qdeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685000825; x=1687592825;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHPfUFAWDspd+UBGduiW+GWhR9UJRMeAF/G1AjNnx8g=;
        b=hNfSeJvKEYpyxjwupFrlgRpee+AccznFrBPcQq7CeeaBvswZzZ0JLNKCai7U+PExzH
         JE9r1VVxLo/DqcPa+jJaApGo1oAvZHF9nHEQ8AtBDnoVu7PILtt61SkIp5uY4Ond0EcQ
         Su16jcVHE85UPFx+kBMuzQp1zNfhg3CiWIArE5tyrNa98FChAOzzN+PGwiBguzx5RFXD
         TIgI3f1T2mX/BJu3T8+F7ILfz7zufNV9awMfwL1SPXHxRFY9fOW9BKjNtbhR3cu8yDzS
         XFQ1rUaYNmvmUMdnno1hRQMNZnh5ww08d41jkluJxSAkIKrPaQPKghpYkmw3x/a1yEbu
         e0PA==
X-Gm-Message-State: AC+VfDwYoQGK/us7k3jftCMQl6mSe8jo5bOPmAbko+tUacZDdey+oxsG
        yr3IceyDfHO5aYVYk4BN1wQQfw==
X-Google-Smtp-Source: ACHHUZ402/3ph3gVw3SSS/2lVQf/9SGluE2KkvWeAS/wyM6pZDq+apsXJm1tthDIf10Sxu1zUJi6Sg==
X-Received: by 2002:a5d:5092:0:b0:30a:a93c:c9df with SMTP id a18-20020a5d5092000000b0030aa93cc9dfmr1464097wrt.13.1685000825631;
        Thu, 25 May 2023 00:47:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b4-20020a5d5504000000b003062b6a522bsm796185wrv.96.2023.05.25.00.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 00:47:03 -0700 (PDT)
Date:   Thu, 25 May 2023 10:46:58 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     jpanis@baylibre.com
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
Subject: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Hello Julien Panis,

The patch 325bec7157b3: "mfd: tps6594: Add driver for TI TPS6594
PMIC" from May 11, 2023, leads to the following Smatch static checker
warning:

	drivers/mfd/tps6594-i2c.c:159 tps6594_i2c_write()
	warn: 'count - 2' negative user limit promoted to high

drivers/mfd/tps6594-i2c.c
    142 static int tps6594_i2c_write(void *context, const void *data, size_t count)
    143 {
    144         struct i2c_client *client = context;
    145         struct tps6594 *tps = i2c_get_clientdata(client);
    146         struct i2c_msg msg;
    147         const u8 *bytes = data;
    148         u8 *buf;
    149         const u8 page = bytes[1];
    150         const u8 reg = bytes[0];
    151         int ret = 0;
    152         int i;
    153 
    154         if (tps->use_crc) {
    155                 /*
    156                  * Auto-increment feature does not support CRC protocol.
    157                  * Converts the bulk write operation into a series of single write operations.
    158                  */
--> 159                 for (i = 0 ; ret == 0 && i < count - 2 ; i++)

TL;DR Smatch is correctly complaining that "count - 2" can underflow.

Smatch finds this code hard to parse.  It says that "count" is a user
controlled number between 0-u64max which has an upperbound (but the
upper bound is variable instead of a constant).

Can count actually be zero?  Smatch is normally good at tracking that...
The other limitation that Smatch does not track is from regmap_raw_write()

	if (val_len % map->format.val_bytes)

In this case the value of map->format.val_bytes comes from:

drivers/mfd/tps6594-i2c.c
   186  static const struct regmap_config tps6594_i2c_regmap_config = {
   187          .reg_bits = 16,
   188          .val_bits = 8,
                ^^^^^^^^^^^^^^

   189          .max_register = TPS6594_REG_DWD_FAIL_CNT_REG,
   190          .volatile_reg = tps6594_is_volatile_reg,
   191          .read = tps6594_i2c_read,
   192          .write = tps6594_i2c_write,
   193  };

So we either need to add some special handling for count == 1 or change
.val_bits = 16 or something.

    160                         ret = tps6594_i2c_reg_write_with_crc(client, page, reg + i, bytes[i + 2]);
    161 
    162                 return ret;
    163         }
    164 
    165         /* Setup buffer: page byte is not sent */
    166         buf = kzalloc(--count, GFP_KERNEL);
    167         if (!buf)
    168                 return -ENOMEM;
    169 
    170         buf[0] = reg;
    171         for (i = 0 ; i < count - 1 ; i++)
    172                 buf[i + 1] = bytes[i + 2];
    173 
    174         /* Write register and data: I2C address = I2C base address + Page index */
    175         msg.addr = client->addr + page;
    176         msg.flags = client->flags & I2C_M_TEN;
    177         msg.len = count;
    178         msg.buf = buf;
    179 
    180         ret = tps6594_i2c_transfer(client->adapter, &msg, 1);
    181 
    182         kfree(buf);
    183         return ret;
    184 }

regards,
dan carpenter
