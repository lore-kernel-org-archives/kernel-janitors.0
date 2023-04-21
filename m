Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AC38C77B75
	for <kernel-janitors@archiver.kernel.org>; Fri, 21 Apr 2023 10:42:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbjDUKmu (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 21 Apr 2023 06:42:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjDUKmt (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 21 Apr 2023 06:42:49 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B493C07
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:42:47 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f191c1a8a7so3701025e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Apr 2023 03:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682073766; x=1684665766;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJNQPIVgpo0k9cBK3eiufu4iuPFearoW+KRcZ0E6+uI=;
        b=IYMMMjpIZLIomm55FS+rS8rQ7TVENxzCZe9RE21cg3V2H9Fa7p1Ypv94kV9wEchh1X
         v2BwrXdmzv4T3NdfBpoX+Nc/VZTiD6dkBPQgKN9I6AOd7Tr3zWKC2Ii7UhSnna/uFbWn
         KR1UFyqA7YJhbYhmhWw2U23PU38axed/QRyRKUbMEC7IVfXqR8ooqtXqltZTDcmGCRKL
         ATcJ/C/a2vTrJGLRcjW/MPdj+38PlV6QfbgHPhd6yhNjjzY0CG6La5Cn1mnKlVLvLCOD
         v13Qla9s3gkzI6qiC/xJm+J+QN0fVkPUDq/GvPrvzq0EJA2f9xO6uBi2WsY3ILJnzB7C
         v8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682073766; x=1684665766;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pJNQPIVgpo0k9cBK3eiufu4iuPFearoW+KRcZ0E6+uI=;
        b=FNOemUMd1WrKn3RY6Ef3OsQ/Fb5H47oQiKZl5GbPX5ZAH8DvRCbWN2ezZaTCB+bpdI
         fXurV62GMp7GsDGof7DOgl+/AbOFpCaOSlPcr6nLHywkXmBzJuvCQHS8i72Sxhx//AHZ
         CEHOeRcbQUBIFIpWjgNZMd3g7zJElJAzpEeECQ81AmSmU7dwLErPQ2jM4NSS5uJGqcSi
         ap5StipfklvqH/ryirAVeenHYqaW4+NTWrvBBOuwu5ygIFbLrmKFdW0IPyGmlUzFE1qV
         VWmlhH2xmHI1ua78hQeyV5N0uK3KmksOf9azDBm8/6QwX7ni5OOWahwSCihHVWqyb8bG
         UIJg==
X-Gm-Message-State: AAQBX9fOC+TTAwC4e3FroUwWI2yRdXgqMLF5ZU96OqAQecd6dZrTgF+3
        2Ixm6DX+I4QxsGd8va1Ytu3Jng==
X-Google-Smtp-Source: AKy350ZUgw0vyBnmYLAjQqosc1capWBtzz8s55MJdq3C/+B8SVk0KS7JInXHSLo4bzQ4SKP5lxzGsg==
X-Received: by 2002:a7b:ca4c:0:b0:3f1:91fc:564 with SMTP id m12-20020a7bca4c000000b003f191fc0564mr1334442wml.7.1682073766311;
        Fri, 21 Apr 2023 03:42:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c00d300b003f17eaae2c9sm4513810wmm.1.2023.04.21.03.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 03:42:45 -0700 (PDT)
Date:   Fri, 21 Apr 2023 13:42:41 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight: Fix signedness bug in
 tmc_etr_buf_insert_barrier_packet()
Message-ID: <7d33e244-d8b9-4c27-9653-883a13534b01@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This code generates a Smatch warning:

    drivers/hwtracing/coresight/coresight-tmc-etr.c:947 tmc_etr_buf_insert_barrier_packet()
    error: uninitialized symbol 'bufp'.

The problem is that if tmc_sg_table_get_data() returns -EINVAL, then
when we test if "len < CORESIGHT_BARRIER_PKT_SIZE", the negative "len"
value is type promoted to a high unsigned long value which is greater
than CORESIGHT_BARRIER_PKT_SIZE.  Fix this bug by adding an explicit
check for error codes.

Fixes: 75f4e3619fe2 ("coresight: tmc-etr: Add transparent buffer management")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 918d461fcf4a..eaa296ced167 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -942,7 +942,7 @@ tmc_etr_buf_insert_barrier_packet(struct etr_buf *etr_buf, u64 offset)
 
 	len = tmc_etr_buf_get_data(etr_buf, offset,
 				   CORESIGHT_BARRIER_PKT_SIZE, &bufp);
-	if (WARN_ON(len < CORESIGHT_BARRIER_PKT_SIZE))
+	if (WARN_ON(len < 0 || len < CORESIGHT_BARRIER_PKT_SIZE))
 		return -EINVAL;
 	coresight_insert_barrier_packet(bufp);
 	return offset + CORESIGHT_BARRIER_PKT_SIZE;
-- 
2.39.2

