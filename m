Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F35C6FD18
	for <kernel-janitors@archiver.kernel.org>; Wed, 19 Apr 2023 14:26:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbjDSO0q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:26:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbjDSO0p (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 19 Apr 2023 10:26:45 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D98A459D7
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:26:11 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id v3so4178107wml.0
        for <kernel-janitors@vger.kernel.org>; Wed, 19 Apr 2023 07:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914368; x=1684506368;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JeZNA1s0QESP/I0CqxVMnzYwGVuCPAunM/8r509Fe9w=;
        b=ShYYRDYCGQc99t8l2LBANPb2KPl6FYJ/5rLLIlr+3iIn1nHXCsMf4hGejSQOch/iW/
         KLpdrkwNzuaTyHCMVmD7SRamW7oNIwqrQxddFKuoYjuWaeWs1JctAxvvF+FVkoCR5Xmk
         EsjvFK1/q9h+Z46Fz0f7p6Er60x57Bhfe76eECK8ykW0ocL22TW+KW30LsboBIN9nl1N
         3fgoDWK/zC+RMJUFVqA4ACiOOldMhuVvGsgHQsZbBuP13xPWcbOIzIGiD0jP1z7b2lSJ
         H19z+Gm8Yj2/gpsCFTa0Kq3ks8UzOQfQwbggkHmzn4dxtVcCiDcS+6zBGChjWOVIlQCU
         F/Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914368; x=1684506368;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JeZNA1s0QESP/I0CqxVMnzYwGVuCPAunM/8r509Fe9w=;
        b=fP5CgpDPUgZm1lJu7+3gkZpd+v1Qv/0eSIbRmTFNMj2nWhBC3KYZ0KmURO4XAI4hnE
         imi2oNNXE8/auwVXeNq4kEmRI6SABwQegk2dr2pSoxxeteFQEUDx7Zo+p5lef7XkSMuq
         3IGowz2+FNZSlWWC4LTyxI7yrXWzC6l3Z3tmcH2BtGV8fw611Sk5+MRRjas9sw1facz0
         TNM7tPzo4h5U57oJnOkzKiIRJijYEmTeiagdGUPpk9nXhG5ueuETaHNpdIabDcAnXQOJ
         jJQwG6Y2DIlF+KOUkV/HVsxXUZf/Mfs2kIQ0qsuovK7iYVwUR5A7BmqYw3U6/WUnGavL
         sIzQ==
X-Gm-Message-State: AAQBX9fcSvFsvXLus7xpCT1DDOpYoxBdmdjzUoYKlagZviS7dxWjtT6D
        pCnV6ozD+s8hs5K4HiXUAfD/QQ==
X-Google-Smtp-Source: AKy350YovrybGst8hzvGzmZDFWnh2USQWtHYaasH+1FyJ6ozgojeUQ2NlRYNyrYogEORRcf/pt5p1Q==
X-Received: by 2002:a1c:7c04:0:b0:3ed:2ae9:6c75 with SMTP id x4-20020a1c7c04000000b003ed2ae96c75mr16934529wmc.37.1681914368188;
        Wed, 19 Apr 2023 07:26:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u19-20020a05600c211300b003f17316ab46sm2343548wml.13.2023.04.19.07.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:26:07 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:26:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] crypto: ixp4xx - silence uninitialized variable warning
Message-ID: <7de7d932-d01b-4ada-ae07-827c32438e00@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

Smatch complains that "dma" is uninitialized if dma_pool_alloc() fails.
This is true, but also harmless.  Anyway, move the assignment after the
error checking to silence this warning.

Fixes: 586d492f2856 ("crypto: ixp4xx - fix building wiht 64-bit dma_addr_t")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
index ed15379a9818..4a18095ae5d8 100644
--- a/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
+++ b/drivers/crypto/intel/ixp4xx/ixp4xx_crypto.c
@@ -1175,9 +1175,9 @@ static int aead_perform(struct aead_request *req, int encrypt,
 		/* The 12 hmac bytes are scattered,
 		 * we need to copy them into a safe buffer */
 		req_ctx->hmac_virt = dma_pool_alloc(buffer_pool, flags, &dma);
-		crypt->icv_rev_aes = dma;
 		if (unlikely(!req_ctx->hmac_virt))
 			goto free_buf_dst;
+		crypt->icv_rev_aes = dma;
 		if (!encrypt) {
 			scatterwalk_map_and_copy(req_ctx->hmac_virt,
 						 req->src, cryptlen, authsize, 0);
-- 
2.39.2

