Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC94C0015E
	for <kernel-janitors@archiver.kernel.org>; Wed, 26 Jul 2023 10:47:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233537AbjGZKrM (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 26 Jul 2023 06:47:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231475AbjGZKrL (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 26 Jul 2023 06:47:11 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E37C212F
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 03:47:08 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fc04692e20so65357585e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 26 Jul 2023 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690368427; x=1690973227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FPdomX7dp8TGU4MIOJN63VoiHSMVcog9K5D8a+5Yv00=;
        b=F/K+3WcJUF0cJF24SmVrGpIDnoCnB1agb9ecevYPtDSHJXhTY0KwSLcwh44Z2MPb0V
         7mCCNzUN4G9CKh22WnVS8Lj74mGPuGtlCClfh/tT+jieUa8s+NF2lVZpkAmgc/dbi+ro
         x0YEEsXI72lSh4305HwUTjqB0qBJtG0L3aPGIP6xO//UCxvDl0pPerhAefRoUmdOLmlb
         z6tp9acWjN/hMFIgZH3Hp0Cmqak/6Tlpv331Al30I3d3Gi338FcOOAlatB9nnOCmIuAT
         GAVr87+hIIGrqYVRmY2ALWB0WfyyhAfXG2E9jySPaxOrrqLkWWwK6nx9v1iXkTB63Z2O
         TOew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690368427; x=1690973227;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FPdomX7dp8TGU4MIOJN63VoiHSMVcog9K5D8a+5Yv00=;
        b=dpVsxjtKjyprk9xhRMlGab8MiMKoZ1Vy57S8bUCx69BTrIkOOhvJd19Rr9fI++R8zw
         ta85ybgU3E1Q57QVvZoFHtmvHUVtLxGwxxQ4o9J55QOFKdTRj8S88/QT3wLB+/Tfn6hn
         /zR9OXG1vxxg+MiIW7n/GdSTHAJpbN+5MfErOeEiT4RIbIukgF/3JdOjmfKCXj/erOT/
         V36KOTNxT6KoDOcrIbNUYGCM00uKJIX123GUUMhdLAvFZkKdthFwta5SrsYVL4lKzOyQ
         Oz6QgdN8+QThcUsTRTPXOKKYNiw34TdMyj02wXJilvtDRGIcdXKAFlbaYEuntn1bwH6F
         H4MQ==
X-Gm-Message-State: ABy/qLZt8HRDiD+uVS67aT7nasY57HDch90J70Nq/OrRBO5bRL64XG6n
        iqMiZLeUkpGVKT/KMPkYt/JaLQ==
X-Google-Smtp-Source: APBJJlEQzU/OChI2cfTtzLG73M1MUxSfhsDlw7ejnSoADvsiVZ5cfbJqWfp50XIZ2gZtpdV547+eTQ==
X-Received: by 2002:a05:600c:294a:b0:3fc:5fa:e2a9 with SMTP id n10-20020a05600c294a00b003fc05fae2a9mr1102874wmd.41.1690368427054;
        Wed, 26 Jul 2023 03:47:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u12-20020a7bcb0c000000b003fbc9b9699dsm1619645wmj.45.2023.07.26.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 03:47:06 -0700 (PDT)
Date:   Wed, 26 Jul 2023 13:47:02 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Gerrit Renker <gerrit@erg.abdn.ac.uk>
Cc:     "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, dccp@vger.kernel.org,
        netdev@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] dccp: Allocate enough data in ccid_get_builtin_ccids()
Message-ID: <35ed2523-49ee-4e2b-b50d-38508f74f93f@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

This is allocating the ARRAY_SIZE() instead of the number of bytes.  The
array size is 1 or 2 depending on the .config and it should allocate
8 or 16 bytes instead.

Fixes: ddebc973c56b ("dccp: Lockless integration of CCID congestion-control plugins")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/dccp/ccid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/net/dccp/ccid.c b/net/dccp/ccid.c
index 6beac5d348e2..9067958d3857 100644
--- a/net/dccp/ccid.c
+++ b/net/dccp/ccid.c
@@ -48,7 +48,8 @@ bool ccid_support_check(u8 const *ccid_array, u8 array_len)
  */
 int ccid_get_builtin_ccids(u8 **ccid_array, u8 *array_len)
 {
-	*ccid_array = kmalloc(ARRAY_SIZE(ccids), gfp_any());
+	*ccid_array = kmalloc_array(ARRAY_SIZE(ccids), sizeof(*ccid_array),
+				    gfp_any());
 	if (*ccid_array == NULL)
 		return -ENOBUFS;
 
-- 
2.39.2

