Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5029BEB64DD
	for <kernel-janitors@archiver.kernel.org>; Fri, 23 Jun 2023 12:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231228AbjFWMJ4 (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 23 Jun 2023 08:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231249AbjFWMJx (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 23 Jun 2023 08:09:53 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E53C1BD6
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 05:09:49 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b4725e9917so9501251fa.2
        for <kernel-janitors@vger.kernel.org>; Fri, 23 Jun 2023 05:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687522187; x=1690114187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=INyk+cs8lXfdbKNGqgibtpw8hPpbnH1cZSfvCvkoydI=;
        b=iB4MZJgv9/CLQBd+Py56pjcfSmEYX9ng0/9Dvp43t51K7a7A8ZjkshUMk4zBV8aUPB
         tvDPXfEYdjOqJQvRNrxctjl4q3OaHunU80o6Z+P+M9keuIPeo4z71MRWMfcrn5qrmBYl
         7IFGJy6LtOhDG/SPt6Mp+sP76ALeMxp4Wb6J+lHbTWaz43HzD/wiGkA2YCY4AtOa6iRm
         05TC3m+auLv7WP6DEHFLFOjvLcedkQibQ/Dn5jniPGzvzfIGCyA8SbA/wOXuFPw6GzGR
         jKEkyOdyTOylzX7vxTfUU1fPMv7kgQimEXIB3QM3qwfhGNY07recQgHr3uMhe8dSbdjW
         o+Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687522187; x=1690114187;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=INyk+cs8lXfdbKNGqgibtpw8hPpbnH1cZSfvCvkoydI=;
        b=PQR2zaezo/pRXf3n7N22rZYtsKI0oPx1o8ZZee23FesraSad4xzjWc4R0xuLig3S6/
         9UVWa03+hw7iD7DXmTFe3M+SeaGp8QJQOgcPTqKCnfMcb5VoMz5WhBq8nYFxLddEL+3F
         vLXKOgxe2p60CiYtoLKLkvMqtFp4KMz1cgdjqGCg5YPifAV+cHotU15BWb9uOuJ/TgmG
         0J1eX6TuC3gdYm9N0AuQCGzQvP2YhASywOAmGqN92p+YzmZS07OkFjXtYNstyIbY4Dhp
         2VcUqeu2bfdohmOM+9ke1Cf8KjYd6lI3n8rt4AVGP1XM6Wm9r7mkNZJw8prrgy3AZPFQ
         UYGg==
X-Gm-Message-State: AC+VfDyJT6qr0G2mwH2ukmABdojvkpn8yHUtBoPBvxjBsuP9lTjQd9EV
        vV6G/qSqIIDPzv3VW5efOYHhaA==
X-Google-Smtp-Source: ACHHUZ6tjcU/WuZFOxWw0NcfScpJ1hd/rSyIsPE8QHfoMpMzAPstJqG+ZiHoZ6QXgKNk0KW7ewfPKw==
X-Received: by 2002:a05:6512:214c:b0:4f9:61a2:3592 with SMTP id s12-20020a056512214c00b004f961a23592mr3290795lfr.35.1687522187204;
        Fri, 23 Jun 2023 05:09:47 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id g17-20020a7bc4d1000000b003f7f87ba116sm2197500wmk.19.2023.06.23.05.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 05:09:44 -0700 (PDT)
Date:   Fri, 23 Jun 2023 15:09:40 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Martin Kurbanov <mmkurbanov@sberdevices.ru>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] leds: aw200xx: Fix error code in probe()
Message-ID: <4d791b69-01c7-4532-818c-63712d3f63e1@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "ret" variable is zero/success here.  Don't return that, return
-EINVAL instead.

Fixes: 36a87f371b7a ("leds: Add AW20xx driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/leds/leds-aw200xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
index 96979b8e09b7..7b996bc01c46 100644
--- a/drivers/leds/leds-aw200xx.c
+++ b/drivers/leds/leds-aw200xx.c
@@ -368,7 +368,7 @@ static int aw200xx_probe_fw(struct device *dev, struct aw200xx *chip)
 
 	if (!chip->display_rows ||
 	    chip->display_rows > chip->cdef->display_size_rows_max) {
-		return dev_err_probe(dev, ret,
+		return dev_err_probe(dev, -EINVAL,
 				     "Invalid leds display size %u\n",
 				     chip->display_rows);
 	}
-- 
2.39.2

