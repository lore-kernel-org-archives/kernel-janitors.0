Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B977AEB64DC
	for <kernel-janitors@archiver.kernel.org>; Mon,  3 Jul 2023 14:18:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230128AbjGCOSQ (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Mon, 3 Jul 2023 10:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjGCOSQ (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Mon, 3 Jul 2023 10:18:16 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C8BAE5E
        for <kernel-janitors@vger.kernel.org>; Mon,  3 Jul 2023 07:18:14 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-313fb7f0f80so4989880f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 03 Jul 2023 07:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688393893; x=1690985893;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k7CiJPEXfB/mPmolwvUH6t7dx6TKSOIIJmAn9VAkdqw=;
        b=BT3omfXSB3tnc4/9PQPsSKSw7cx/qjf/1NXY1wt3Q4TvbbFW5ekgxa0mQcUZPMjfeV
         nM8RiwzvvoyJ8YKGKT5FlbFzg6VWUe1ppRtzVXStYS92HDR9bLci298+IUiKjgbWycmj
         357oGZdMtDCWBYAB3AC5EYdouPZuszAUAOjyrrzu4g4lQyE137pUUFAat5oP7luo0Ffd
         jeAu+K0XLk+mez5brGbWDwfh7yPI0sxUcG5bCkgcHR9FchvUxSe8xNCRVHoDfY3ZvY60
         eDIevhPL5HNFOTVeUEmDvudJGjbpjklwSJ4RYoBNeujQKVpYijBpMHecavNIWLClwfUB
         qzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688393893; x=1690985893;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k7CiJPEXfB/mPmolwvUH6t7dx6TKSOIIJmAn9VAkdqw=;
        b=H/4BSoDho0yj2VSktnYZjKQbevCN9uaQahASczGiOGCFmm+gA8bOyd5d+pHowmAcjK
         2b294B4gL7sQPtwZxXRjKok/ytvTIPsd5W7Tce1JKp5MMJenC7m46/7Af2cFjEvDKe7e
         W1uFt2DYawZjY4TnOWcXF95FkLRkQwLEoKDMrbVsT/av5dGirzdKxQXWX4EmSm3lP+0M
         U2tJ3TymrBpXMUYecmpzzNvDmPmJWq5pldvvLg7Am12cCpdHt+zJLgaW4h5Md2ghC1rC
         TWZXsI704+hpv/x7+gOYDVtShjtHvekuKR/lY8guo6SkkGPot1ob6dSbkZnJ4nRyJgIp
         J7NA==
X-Gm-Message-State: ABy/qLZ5q/rL4u8ySY9aHV4AlgbSXmgiz7RCYG82hgdROnX0kNPW7MpD
        IyYqpv2DFQk+VjkLBbFZzGyIrQ==
X-Google-Smtp-Source: APBJJlEfnqKOoSS2ucE8MaIOcLJR/x7mdTN0VM771Waqqjt25CgAaEUgofxqr6Xluv6cSjS6uVAUEA==
X-Received: by 2002:a5d:4f86:0:b0:30f:c42e:3299 with SMTP id d6-20020a5d4f86000000b0030fc42e3299mr7758185wru.60.1688393892860;
        Mon, 03 Jul 2023 07:18:12 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q10-20020adfdfca000000b003141e629cb6sm9813243wrn.101.2023.07.03.07.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 07:18:11 -0700 (PDT)
Date:   Mon, 3 Jul 2023 17:18:08 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Herbert Xu <herbert@gondor.apana.org.au>
Cc:     David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>, keyrings@vger.kernel.org,
        linux-crypto@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KEYS: asymmetric: Fix error codes
Message-ID: <c5e34c6a-da1e-4585-98c4-14701b0e093e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These error paths should return the appropriate error codes instead of
returning success.

Fixes: 63ba4d67594a ("KEYS: asymmetric: Use new crypto interface without scatterlists")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 crypto/asymmetric_keys/public_key.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/crypto/asymmetric_keys/public_key.c b/crypto/asymmetric_keys/public_key.c
index e787598cb3f7..773e159dbbcb 100644
--- a/crypto/asymmetric_keys/public_key.c
+++ b/crypto/asymmetric_keys/public_key.c
@@ -185,8 +185,10 @@ static int software_key_query(const struct kernel_pkey_params *params,
 
 	if (issig) {
 		sig = crypto_alloc_sig(alg_name, 0, 0);
-		if (IS_ERR(sig))
+		if (IS_ERR(sig)) {
+			ret = PTR_ERR(sig);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
@@ -208,8 +210,10 @@ static int software_key_query(const struct kernel_pkey_params *params,
 		}
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-		if (IS_ERR(tfm))
+		if (IS_ERR(tfm)) {
+			ret = PTR_ERR(tfm);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
@@ -300,8 +304,10 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 
 	if (issig) {
 		sig = crypto_alloc_sig(alg_name, 0, 0);
-		if (IS_ERR(sig))
+		if (IS_ERR(sig)) {
+			ret = PTR_ERR(sig);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_sig_set_privkey(sig, key, pkey->keylen);
@@ -313,8 +319,10 @@ static int software_key_eds_op(struct kernel_pkey_params *params,
 		ksz = crypto_sig_maxsize(sig);
 	} else {
 		tfm = crypto_alloc_akcipher(alg_name, 0, 0);
-		if (IS_ERR(tfm))
+		if (IS_ERR(tfm)) {
+			ret = PTR_ERR(tfm);
 			goto error_free_key;
+		}
 
 		if (pkey->key_is_private)
 			ret = crypto_akcipher_set_priv_key(tfm, key, pkey->keylen);
@@ -411,8 +419,10 @@ int public_key_verify_signature(const struct public_key *pkey,
 
 	key = kmalloc(pkey->keylen + sizeof(u32) * 2 + pkey->paramlen,
 		      GFP_KERNEL);
-	if (!key)
+	if (!key) {
+		ret = -ENOMEM;
 		goto error_free_tfm;
+	}
 
 	memcpy(key, pkey->key, pkey->keylen);
 	ptr = key + pkey->keylen;
-- 
2.39.2

