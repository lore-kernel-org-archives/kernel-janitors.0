Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4F1C77B7C
	for <kernel-janitors@archiver.kernel.org>; Thu, 20 Apr 2023 15:02:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233541AbjDTPCb (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 20 Apr 2023 11:02:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232294AbjDTPCa (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 20 Apr 2023 11:02:30 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F34F40FE
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 08:02:28 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3f17fdb520dso7558535e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Apr 2023 08:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682002947; x=1684594947;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YehB+aCxQJ7NwuSnHKqeWdstAfxc3OEh7yGW15/WjHQ=;
        b=ohOTUH2U2DOgXYkcRH7+e25eFmij6t0+lxLz4YDsopS4rQfAzmftQYW/qoqvrNyOLy
         xGOwBk51VCp9YLtNc8+0iMh36U29ARfN45NFz/C+W6yeaQPOC3pEjmXhwTEyQ6AFpZhN
         wres/etT76uM7FlaDL/FmM2RvBJXtVtmokgIK0UDApphTAEj7bn6tUVFoIAiTTRQVo3a
         7BY5L/epdKztY3JDcP3sBe21LpoLVDbmISu09Y9ARJgF9CMk2dyjqSpMLzdr8f8/mq44
         RNNJkOdYVmIZm4bdsQEn1ZALuMgaPEgPOtukN5JVFAQIBKmfiHy+NqSvqhFM2q2bWIX1
         p/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682002947; x=1684594947;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YehB+aCxQJ7NwuSnHKqeWdstAfxc3OEh7yGW15/WjHQ=;
        b=iAPVYxLWWVRiF9gT5CKYygyuEGKHfVrfzVFvI81dDPz9OzkyZffGyevFA/hS3QIcoK
         iwp3fxvJB6rhHJViyKT3tDYS77Wsu/OYoJubQEjSFuru5PD7mdv5lV/ofAA03kESfqhx
         D67Mt4l4YdzIdSt8ygqDoGo239sGt8NPhIxKEnjbOsu+4yEKnJUJOiVKVQhM6g8uFQU+
         IqTSI5zIV63ElLm0N8WagzWcVnqwAj21qf0xPiFVPJI/7wF9iwkLa6xRw0TbvkFelFcG
         cCacjQeIU+ig2qZpzQFCERDquvjZTh2X+jqX/h762osshn8qN2eO/Hq9siVbf4ThlbkK
         zCmA==
X-Gm-Message-State: AAQBX9cAnaD+/ph/HcDPfrg4YjbY2mvdvJ+ARjpzsY/+QTZ5GwSQZuTS
        IzRaORG+by564e8skyTpU3P8vw==
X-Google-Smtp-Source: AKy350Y7oDyMvSTI57Za7A6LCVkECIbMG4J12ymr60ayd+HREXX7lPM+1lPeQEWQt1mtwb7+yFmK9w==
X-Received: by 2002:adf:f149:0:b0:2ff:148d:7e4e with SMTP id y9-20020adff149000000b002ff148d7e4emr1497512wro.2.1682002947005;
        Thu, 20 Apr 2023 08:02:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a05600000c900b002c8476dde7asm2120212wrx.114.2023.04.20.08.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 08:02:26 -0700 (PDT)
Date:   Thu, 20 Apr 2023 18:02:11 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     William Breathitt Gray <william.gray@linaro.org>,
        Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] counter: rz-mtu3-cnt: Unlock on error in
 rz_mtu3_count_ceiling_write()
Message-ID: <7b535d6b-6031-493a-84f6-82842089e637@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

These error paths need to call mutex_unlock(&priv->lock) before
returning.  The lock is taken in rz_mtu3_lock_if_counter_is_valid().

Fixes: 25d21447d896 ("counter: Add Renesas RZ/G2L MTU3a counter driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: I had the wrong function in the subject.  Also style changes.

 drivers/counter/rz-mtu3-cnt.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/counter/rz-mtu3-cnt.c b/drivers/counter/rz-mtu3-cnt.c
index a371bab68499..48c83933aa2f 100644
--- a/drivers/counter/rz-mtu3-cnt.c
+++ b/drivers/counter/rz-mtu3-cnt.c
@@ -358,13 +358,17 @@ static int rz_mtu3_count_ceiling_write(struct counter_device *counter,
 	switch (count->id) {
 	case RZ_MTU3_16_BIT_MTU1_CH:
 	case RZ_MTU3_16_BIT_MTU2_CH:
-		if (ceiling > U16_MAX)
+		if (ceiling > U16_MAX) {
+			mutex_unlock(&priv->lock);
 			return -ERANGE;
+		}
 		priv->mtu_16bit_max[ch_id] = ceiling;
 		break;
 	case RZ_MTU3_32_BIT_CH:
-		if (ceiling > U32_MAX)
+		if (ceiling > U32_MAX) {
+			mutex_unlock(&priv->lock);
 			return -ERANGE;
+		}
 		priv->mtu_32bit_max = ceiling;
 		break;
 	default:
-- 
2.39.2

