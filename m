Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCE2E92702
	for <kernel-janitors@archiver.kernel.org>; Thu,  5 Oct 2023 14:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237258AbjJEOiw (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 5 Oct 2023 10:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236629AbjJEOgo (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 5 Oct 2023 10:36:44 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6B240D36
        for <kernel-janitors@vger.kernel.org>; Thu,  5 Oct 2023 07:01:32 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-406618d080eso9325225e9.2
        for <kernel-janitors@vger.kernel.org>; Thu, 05 Oct 2023 07:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514469; x=1697119269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EEBsoHti+XFvDHXO7qEwI1whIGP245jboTAo/jjD/QE=;
        b=KKrci8db8VRy3JFiNy+IZkV0W7Q/sa3mLAmCPkqXzvuUsYdQYoa2s9Gf3h2F6SZnOg
         m/cgxtqrpDBqc6TkMBcciSx1IsDXsoLD40FEbsflmpi12IJrh4PU3w0LHyylFeo+3+Lx
         ZMO8Hxgk4WnqAZh0FooXSjv7aaOBC98sxUJ2WObUyNPXx1xaWhrqBO9Vl4hK8g0mehP8
         luig5mMA25vLPH1srIt3PmsRVBnCgB6Suv5LxtvtT3GU5xxLH1dRhP6ZpSgTKchXJnu4
         xGWVkHNagosGEq95hf5z8DvhYyIA2dbE78RAjhjVnxw5jDTidJs0fUS/R7kfsJUG2jbU
         f9lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514469; x=1697119269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EEBsoHti+XFvDHXO7qEwI1whIGP245jboTAo/jjD/QE=;
        b=ebCA5EUNaFOTE8f+DxAI9d/lps57cFgkzko5fgcaAEWhudcGcwRkXjGd2BS1fHzGn2
         k81oPhAS5bcGD2EGZrkplsF3xpHCkbMGtqS3iUcyrQVNmy+7tGJNr+49aWsdp/XnbVnm
         UbfXPk9QmLxZGwGcIEQgxs0DpS+NYgqTIt9RsyCQpfxKUxFcQu4lEotxcZdSK+IJOOMH
         sanu7q1VQ+1E0UCV3GvrdmE5mG0wlHHvYw2tCRJ5Pt5bahRWtE7f3aIjGOD7RwI1tdqA
         pwjoIbBuFlxHsmmjFT2ySwENUXqf+80nLhEUVCbKtTLyedS6GCUxpbNx42RtQ71EJBQy
         wb4A==
X-Gm-Message-State: AOJu0Yye6ZXF9DCgLdKhxJJkQodN6wt/of63sOiLoynwSxT3Jc9qK2Q1
        ErBO/B8Qnj+hLzkTnvTe37c3ig==
X-Google-Smtp-Source: AGHT+IGzlifFWTIjaG638PhGniL1vFxzx5LlNFebcJmya8nSpTFh0K36mX5cGJufCOfMbbweh6tN1A==
X-Received: by 2002:a7b:cc8e:0:b0:401:38dc:8916 with SMTP id p14-20020a7bcc8e000000b0040138dc8916mr5000549wma.10.1696514469148;
        Thu, 05 Oct 2023 07:01:09 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l1-20020adffe81000000b0031779a6b451sm1854809wrr.83.2023.10.05.07.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:01:08 -0700 (PDT)
Date:   Thu, 5 Oct 2023 17:01:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] usb: usbtest: fix a type promotion bug
Message-ID: <506f7935-2cba-41d9-ab5d-ddb6ad6320bd@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The "len" here is sometimes negative error codes from
usb_get_descriptor(), so we don't want to type promote them to unsigned
long.

This bug pre-dates the invention of git.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/misc/usbtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/misc/usbtest.c b/drivers/usb/misc/usbtest.c
index ac0d75ac2d2f..caf65f8294db 100644
--- a/drivers/usb/misc/usbtest.c
+++ b/drivers/usb/misc/usbtest.c
@@ -705,7 +705,7 @@ static int is_good_config(struct usbtest_dev *tdev, int len)
 {
 	struct usb_config_descriptor	*config;
 
-	if (len < sizeof(*config))
+	if (len < (int)sizeof(*config))
 		return 0;
 	config = (struct usb_config_descriptor *) tdev->buf;
 
-- 
2.39.2

