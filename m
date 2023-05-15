Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29FE1C7EE25
	for <kernel-janitors@archiver.kernel.org>; Mon, 15 May 2023 10:32:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240214AbjEOKcc (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 15 May 2023 06:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjEOKca (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 15 May 2023 06:32:30 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5601FC6
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 03:32:29 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3078d1c8828so9416285f8f.3
        for <kernel-janitors@vger.kernel.org>; Mon, 15 May 2023 03:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684146748; x=1686738748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqAu0JmjDleKQlM543bGZcHgQbf6Z8XGhiW21a09aAQ=;
        b=Tz4La/hO+jiAlAXOH2ZQPLEXyK4CwN1/aan7v+r101w9HvEn2CkZQkAqag98DqXpnN
         DLZ9uN9nCH7tQLRyNRsYTLC7CNSyoTgtobulW1+WTFGJPrt+8H6dqDkMdKaQmK6nD3JI
         4cl5v3Q6ncTJKY8gs8Lg5PwgkUme/zfa3RQT0spyGVFQVoo3bzcMKtaCxPMNdCC2Uken
         1gkbMVClWvPPDOGY2o1fP37CYvKqQWC8hLlHfsW7SnSvAIu7YVpQYtE3456F/loZs8Mm
         KGGF3/nI+L/cyIIMahMjIDZpVh3M3n6JwCQCLEhI79AKH/QhMTvELSrxvyAce8wQreMV
         6xFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684146748; x=1686738748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqAu0JmjDleKQlM543bGZcHgQbf6Z8XGhiW21a09aAQ=;
        b=PHa+cEwuDA+wPsqQihdKAjzGLMYj5Zd7AMtube/YP/9XLL7cMrWlUuLzXYydJoag0T
         Xbhcz2qCH5FO4z4W63+LO3rYdwzhrSEPgOhfopWmpnpO/C4mJI9VGLyow0ACKNzHmyT4
         delQFycBhr3GuwDwNDqM5mUAVdj0+oTEo0T1OjOzx8k4GcL6kYYjq7moKfs3SyvSApSe
         R7vZy1iucI0zIVL670fCYzel1opqWeF/CP6FI/bIL0HS/uGJFs6+fbXRSVrAphJPgZhE
         xBD40EDKZnorGC28uVCvdKZvsddZmLyJCeXvXjH0MgHlzKDYeFkllgDR+Dwtsb6DOnTh
         FJyg==
X-Gm-Message-State: AC+VfDyq6KqOThPuTx6tiJuxIxH+nfBvJWmJR3pixd9E+fuwK4b/SYa0
        H+D+Y1+6rL3OltafhBy1o0TxGw==
X-Google-Smtp-Source: ACHHUZ7KZ13Xu/SKezwjzKAinEgmeswPWWjWo9a3m9hp12Jl8Iklcxp1Jheflnku8GT5jGlAoVZgsw==
X-Received: by 2002:adf:ef8c:0:b0:306:8034:b2e4 with SMTP id d12-20020adfef8c000000b003068034b2e4mr22445723wro.69.1684146747805;
        Mon, 15 May 2023 03:32:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id c1-20020adffb01000000b00309257ad16csm1223820wrr.29.2023.05.15.03.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 03:32:26 -0700 (PDT)
Date:   Mon, 15 May 2023 13:32:18 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Koby Elbaz <kelbaz@habana.ai>
Cc:     Oded Gabbay <ogabbay@kernel.org>, Ofir Bitton <obitton@habana.ai>,
        Tomer Tayar <ttayar@habana.ai>,
        Dani Liberman <dliberman@habana.ai>,
        Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
        Dafna Hirschfeld <dhirschfeld@habana.ai>,
        dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] accel/habanalabs: fix gaudi2_get_tpc_idle_status() return
Message-ID: <c8000ec5-18e9-4e25-aeb1-3a6ce467d5f6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The gaudi2_get_tpc_idle_status() function returned the incorrect variable
so it always returned true.

Fixes: d85f0531b928 ("accel/habanalabs: break is_idle function into per-engine sub-routines")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Not tested.

 drivers/accel/habanalabs/gaudi2/gaudi2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index b778cf764a68..5539c84ee717 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -7231,7 +7231,7 @@ static bool gaudi2_get_tpc_idle_status(struct hl_device *hdev, u64 *mask_arr, u8
 
 	gaudi2_iterate_tpcs(hdev, &tpc_iter);
 
-	return tpc_idle_data.is_idle;
+	return *tpc_idle_data.is_idle;
 }
 
 static bool gaudi2_get_decoder_idle_status(struct hl_device *hdev, u64 *mask_arr, u8 mask_len,
-- 
2.39.2

