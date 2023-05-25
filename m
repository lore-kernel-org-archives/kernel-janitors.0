Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B3CC77B7E
	for <kernel-janitors@archiver.kernel.org>; Thu, 25 May 2023 09:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235071AbjEYJ0S (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 25 May 2023 05:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233700AbjEYJ0R (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 25 May 2023 05:26:17 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 555B2197
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 02:26:16 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-30a1fdde3d6so1814826f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 25 May 2023 02:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685006775; x=1687598775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjqcXG9PYh/5kS6AfimrtjjMFr5cp9CaRYoGjiYyUKE=;
        b=Qj9JD38yLmOOl5354lUSPiyMhjxomYe1wdOuy2M3pu0mhIojnQ7cB/znQeEO59vv/i
         /PdhZc5o5A+3HvSCANrX1uM7gxBWyCHeLtx0UVao9O4hwL3QTr4rGZ7J69wxnT/gfP3s
         10WvjUtFzwVNU9XPqIJ717zFt1tX5SsnygLCojrpGf9FkE2zlgYXBK0/ORIlM02JnkRT
         nWJyjtXO1waSfrg+KcAPofUGrkG2arPpxHZrqUBUq5PjzT9GlfCc6rlOoNeg307ehtg4
         GYxA+8rTC8YJCQA8vCSb6VOoZfO9PRsNzP1V+BSc38VO9jAiX8DfFNkKYeAK0j9inD6c
         FWhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685006775; x=1687598775;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rjqcXG9PYh/5kS6AfimrtjjMFr5cp9CaRYoGjiYyUKE=;
        b=goAAfq5qOgBfyMLGFvBiYp640UJlGzLQ6JH6zmr50hnu0/YKjEVLapoYzzBtVyVUrG
         pK/ueJYJYMFG1WVDhlBANncF7CP9BKL5zHCutKLAMV0QVcGscUpprMttP3mv0LeaCUCA
         g5XM6TnhipI+Jr/iPoDeEkj+S33kc28o9VLdO7TrMpVWxpi29LH81lU1Ju4xNKQpqMKK
         yl8WUSWD93EGC2jtJgNjfNkH4naIoc+LxOKzWa57M3pzvM6zNwMmLI/H7+aUWQ0jjRMx
         oAuaswitXgcVpG3xsq9KeqcGZ5QG3ZJGGPEYEi+aaMqZNStmLoikRmjeyxTsSJxzC8DP
         aAnw==
X-Gm-Message-State: AC+VfDwd3TKgBJ2MGE37CHEpdBO2tEN3+TbdqK9GVaAo3UOF1J65KC5P
        8/B3uCyLtIicRZJoUu1F8q4aag==
X-Google-Smtp-Source: ACHHUZ7wnoT1TNvsAkSM3KYlwsbVjzEjKFI/gAl0wy0oza0iddN9Wm77nxf5TVFG8JKNpLP72lZY9Q==
X-Received: by 2002:a5d:6852:0:b0:2f9:4fe9:74bb with SMTP id o18-20020a5d6852000000b002f94fe974bbmr1843898wrw.40.1685006774757;
        Thu, 25 May 2023 02:26:14 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id e8-20020a5d65c8000000b0030649242b72sm1072779wrw.113.2023.05.25.02.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 02:26:12 -0700 (PDT)
Date:   Thu, 25 May 2023 12:26:09 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Julien Panis <jpanis@baylibre.com>
Cc:     Lee Jones <lee@kernel.org>, kernel-janitors@vger.kernel.org
Subject: Re: [bug report] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <cf3ada2f-0c44-4389-9758-b72af9d138db@kili.mountain>
References: <afd9a078-1002-4a26-a9b2-d92406912af5@kili.mountain>
 <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <44024069-723a-9726-7cdb-6c10a3ce2c7f@baylibre.com>
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

> > Smatch finds this code hard to parse.  It says that "count" is a user
> > controlled number between 0-u64max which has an upperbound (but the
> > upper bound is variable instead of a constant).
> > 
> > Can count actually be zero?  Smatch is normally good at tracking that...
> 
> 'count' is the total number of bytes in i2c frame: it takes into account
> the number of bytes for address ('reg_bits / 8') + the number of bytes
> for data (which is at least 'val_bits / 8')
> So, with 'reg_bits = 16' and 'val_bits = 8' in 'tps6594_i2c_regmap_config'
> struct, 'count' should be at least 3. It cannot be zero.

Gar...  You're right.  I see that now in _regmap_raw_write_impl().

drivers/base/regmap/regmap.c
  1846          /* If we're doing a single register write we can probably just
  1847           * send the work_buf directly, otherwise try to do a gather
  1848           * write.
  1849           */
  1850          if (val == work_val)
  1851                  ret = map->write(map->bus_context, map->work_buf,
  1852                                   map->format.reg_bytes +
  1853                                   map->format.pad_bytes +
  1854                                   val_len);
  1855          else if (map->bus && map->bus->gather_write)
  1856                  ret = map->bus->gather_write(map->bus_context, map->work_buf,
  1857                                               map->format.reg_bytes +
  1858                                               map->format.pad_bytes,
  1859                                               val, val_len);
  1860          else
  1861                  ret = -ENOTSUPP;
  1862  

My mind only saw "val_len is the last parameter" and I missed the
"map->format.reg_bytes + map->format.pad_bytes + " on the lines before.

> Special handling for 'count == 1' (or 'count < 2') makes sense indeed.
> 
> I'm not sure that I fully understand, though. Will Smatch stop complaining
> for both things that you mentioned above with a patch for handling 'count < 2' ?
> Or will we consider either that warnings are handled, even if they are still there.

No, don't do anything to silence the warning.  Always fix the checker
instead of working around it.

Handling the "map->format.reg_bytes + map->format.pad_bytes + val_len"
is kind of complicated but still easier than handling the:

	if (val_len % map->format.val_bytes)

condition in regmap_raw_write() just because it's closer together.  It's
quite a bit of code to write to silence this false positive but it's
something which could be done.

regards,
dan carpenter

