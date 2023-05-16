Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D4BC77B7F
	for <kernel-janitors@archiver.kernel.org>; Tue, 16 May 2023 08:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjEPINC (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Tue, 16 May 2023 04:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbjEPINA (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Tue, 16 May 2023 04:13:00 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82050448D
        for <kernel-janitors@vger.kernel.org>; Tue, 16 May 2023 01:12:58 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f509ec3196so15242905e9.1
        for <kernel-janitors@vger.kernel.org>; Tue, 16 May 2023 01:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684224777; x=1686816777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D9WQpX8umTNZT1uMb2NpjGwQWrLstlpv7/gcs4042jo=;
        b=bnfuz3FzUAPekyOCUVPSBs2VQGQNvFw2wLjvtwYrqBOE7GHXzarHw9sqLweKgCApYh
         AYbgyvBoeSd2q+POJlyCU32HL4NdVq4dvoKq4N2cE9eh321INKsHD0cMl+gB0IBcMDEB
         hho3cw8B7TPI/RjkMbkdAR1VIHLFOmw+wRkFWWqNTaGo9Ca5tkH2OuC8nVBeZG62O2EO
         B5KLFzlOyHaRT2shV7N0nlKY7UYAP/b8lfLF56VPvfPjxvjigPvsHNL6+HGHl2lY2WHS
         Z1SDZ87cxINgY/CQ05WKOPsWL/5CiP/Rptu0yyZhr31buWpwjwnvzBjP9dZM+BMbmQIj
         YRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684224777; x=1686816777;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D9WQpX8umTNZT1uMb2NpjGwQWrLstlpv7/gcs4042jo=;
        b=ip2sYFGFnHspCNV25Acg4GyHhGV/wbMXyvqwQ+SRrsyfxdIwMFpzELmZCw7ZdY3HEW
         NMGxyG/oQPcGfXYJV0WCPhpy1tJw9HG33cwr8OQ6EX0fxfNxHRfVMg5+YeJwlL606B65
         1DM0iFT/XIejYuve5LfB3TwaEsoNU581+O0TF6nQz8PIpZwX8EkxoL93TlT7hArYMTny
         +M8ocCdQgdJbYDkNmCGQAKFykUZo0h1lf9bGzTm1lXniXh6yb6terSRd0Fswd+Y0cnVC
         oGtSd4ISCVHdWIIRtvJOIzgQMMDBpeLXKhNdJ271HszHt5ayIy91t3ja5ADsxW9MH1Py
         jKgQ==
X-Gm-Message-State: AC+VfDwEuU1jIZu4BLcBnc5qehwVAy9iTgagqHOy2W1JpaXNRFlgahWp
        ci4QRGrCr9QYZIJDHUtdTEPyfw==
X-Google-Smtp-Source: ACHHUZ6DoBmPoL+uBvO+KMfO5nAi5sGfthknTsmZHJArkDkYOxvL1fpBdJ623ALeF5qQXCX+e26eKA==
X-Received: by 2002:a5d:604b:0:b0:2fb:b869:bc08 with SMTP id j11-20020a5d604b000000b002fbb869bc08mr26741990wrt.23.1684224776867;
        Tue, 16 May 2023 01:12:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v14-20020a1cf70e000000b003eddc6aa5fasm1418188wmh.39.2023.05.16.01.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 01:12:55 -0700 (PDT)
Date:   Tue, 16 May 2023 11:12:51 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= 
        <amadeuszx.slawinski@linux.intel.com>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Russ Weight <russell.h.weight@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware_loader: Fix a NULL vs IS_ERR() check
Message-ID: <36ef6042-ce74-4e8e-9e2c-5b5c28940610@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The crypto_alloc_shash() function doesn't return NULL, it returns
error pointers.  Update the check accordingly.

Fixes: 02fe26f25325 ("firmware_loader: Add debug message with checksum for FW file")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/firmware_loader/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 9d79d5ad9102..b58c42f1b1ce 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -812,7 +812,7 @@ static void fw_log_firmware_info(const struct firmware *fw, const char *name, st
 	char *outbuf;
 
 	alg = crypto_alloc_shash("sha256", 0, 0);
-	if (!alg)
+	if (IS_ERR(alg))
 		return;
 
 	sha256buf = kmalloc(SHA256_DIGEST_SIZE, GFP_KERNEL);
-- 
2.39.2

