Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FC56CDB47E
	for <kernel-janitors@archiver.kernel.org>; Wed, 18 Oct 2023 14:32:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235164AbjJROcy (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 18 Oct 2023 10:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235151AbjJROck (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 18 Oct 2023 10:32:40 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED0349001
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Oct 2023 07:20:17 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40836ea8cbaso12389725e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 18 Oct 2023 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697638816; x=1698243616; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMwfTW5sLakF4hd5w4/oY7o5mpcFlkM3nBeiv13a35Y=;
        b=ziRE6AGiXzQE+pPOFRVDq9a0lYmPHXfkG7//tc488N1x6hhebXjWusjXX8zdjGfi1a
         B1UPITjiwVyIpPrC4wm04cp7aHpUqwMKn1RNSZSf5wYSg16gJw1zNL+y1u1ZPOzR2l+d
         msmPnYIbe+8QwBiSnmt8oOtN0bJ11uYKPOJKinCbvOKP8ZMUAprre30cPicM4Hz+D8a9
         EWgo+IOXkZcqGtZEiS0NxHwTncjO6QhJ+UgVtFtjSEflgfh77+/9uFVWNJoD+4tcBfxX
         ZXRjUiCpVP5oJo0wP88MqI/nWtL0nbRfGJqpaFIyNcO/KQew50LBCHi0v4kaic/yoj/j
         3O/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697638816; x=1698243616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VMwfTW5sLakF4hd5w4/oY7o5mpcFlkM3nBeiv13a35Y=;
        b=UOEy4B5wqViHDKATijyizgGw4fMwVT6jXUmBIru/TpkmYPX4Y13zl8z/ey4XvkT4TP
         9wa6uaopP4cD/rvd/Br9P1+Vgyw322X9kzr221k2an1r9UDcplRIVs4piZaPxW+GEJNz
         C/HPNP4dYVUp+dm+/ocBLH3wUGXLp0ZyaxVtOW+dJj4WUW1R/TI6lBkRBg6h28CimjQs
         BOzmhmwrMrxlyUgsJq0/JjGgiox63JarlGpapga9KFEdc3MPV+VMfQYxqrP4nOTOJ52O
         lmeLLxPrfx6h2NldpvHEHYY1Jw9fZ3tndOOBXJnSM6TUrcBD+ByLEPykab7JrW/hpBiS
         f3eA==
X-Gm-Message-State: AOJu0YznaqWiA4G3BjwZdajr0AGWzyabaSphwhOoehFqlE5YaRW2AVsJ
        KrNAZUV5HKSbM3fIbpetiyxZPw==
X-Google-Smtp-Source: AGHT+IFnFsKqE7pLQfOFoMoo7c2gVgpY0VQGFq1MNOxPSVPFDy/2kfATaJYsqON657eh+It9ATQN/Q==
X-Received: by 2002:a5d:568b:0:b0:317:393f:8633 with SMTP id f11-20020a5d568b000000b00317393f8633mr4087284wrv.58.1697638815705;
        Wed, 18 Oct 2023 07:20:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p14-20020adfcc8e000000b0032db1d741a6sm2222382wrj.99.2023.10.18.07.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 07:20:15 -0700 (PDT)
Date:   Wed, 18 Oct 2023 17:20:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Xabier Marquiegui <reibax@gmail.com>
Cc:     Richard Cochran <richardcochran@gmail.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] ptp: prevent string overflow
Message-ID: <d4b1a995-a0cb-4125-aa1d-5fd5044aba1d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The ida_alloc_max() function can return up to INT_MAX so this buffer is
not large enough.  Also use snprintf() for extra safety.

Fixes: 403376ddb422 ("ptp: add debugfs interface to see applied channel masks")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/ptp/ptp_clock.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_clock.c b/drivers/ptp/ptp_clock.c
index 2e801cd33220..3d1b0a97301c 100644
--- a/drivers/ptp/ptp_clock.c
+++ b/drivers/ptp/ptp_clock.c
@@ -220,7 +220,7 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 	struct ptp_clock *ptp;
 	struct timestamp_event_queue *queue = NULL;
 	int err = 0, index, major = MAJOR(ptp_devt);
-	char debugfsname[8];
+	char debugfsname[16];
 	size_t size;
 
 	if (info->n_alarm > PTP_MAX_ALARMS)
@@ -343,7 +343,7 @@ struct ptp_clock *ptp_clock_register(struct ptp_clock_info *info,
 	}
 
 	/* Debugfs initialization */
-	sprintf(debugfsname, "ptp%d", ptp->index);
+	snprintf(debugfsname, sizeof(debugfsname), "ptp%d", ptp->index);
 	ptp->debugfs_root = debugfs_create_dir(debugfsname, NULL);
 
 	return ptp;
-- 
2.42.0

