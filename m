Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 469E5E810DF
	for <kernel-janitors@archiver.kernel.org>; Wed, 27 Sep 2023 12:41:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231721AbjI0MlP (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 27 Sep 2023 08:41:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231724AbjI0MlO (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 27 Sep 2023 08:41:14 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192B11AA
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:41:10 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40566f89f6eso80681045e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 27 Sep 2023 05:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695818468; x=1696423268; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X/PZVGWh38IGMNLfCFE13HurQjj0K/IOi3TM5LqffvI=;
        b=dJWwjlX1a8OPBRJS0G+nONwCXe/5pAAu+QlUB14uNTRynBgooVq4272DP2eESoOYiy
         uctX+67JGRGzhWC11mhqmR+coSd2SYR36UZCJcJujOQALDpyS2caV88P+ld8m9tZDBxX
         F7EDIwCal5Darfl//WOBzhNljCXeMp4h3iaiLZ0DphpEtHgFJ28UAqX5HdgYCcizRrQl
         Gj4IFCvI/mUGG2CfBNsemrdDWNZMqjdDf/Wp57f+cn+eOI7z0Z9TQe56E2uKrGmA9PJ1
         wU/3nRWVh+np4/qxqFozvLjLfzGr+MkLJyXmWgYRBbZj1L6W2GT+05fB0OUzV4H0C+MM
         yEEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695818468; x=1696423268;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X/PZVGWh38IGMNLfCFE13HurQjj0K/IOi3TM5LqffvI=;
        b=JEmaUnGZMrSqyPLDdPWwMok6Rc9vG5ARIw2jJhgoYoPrMDpVuD19Hk+14RcEWACvJW
         2mY0+WIv/u8stCGZG9MBUpNLxrAKFZWiN4cRhzBiwgLDFJcNHkBc0rJo9Ahx+I7pXiy2
         mzNx3Uy6SVb1ZNly0qFV2ZwhpyA81CwC0PjcAN+qe5GJyp3vOq4LMODzWYIaHwb4tF3W
         mVFul+2JjNI5VsfIp1MWY5EBGFFzJsIfBxzR9XNxihhq+Mnh+0u0h1reSzwLlP5JixVX
         bGYHYrKOtrfb8N/Sh7szYH7dtY9L9wYR0SCUeDZDpA/uybPbjio/5rHYq/oenxcGjxga
         eTog==
X-Gm-Message-State: AOJu0Yz7xmgKpVBR2MFmxVXxI7+lfgfQWQIljSx/ap06B2qmO4HoZb+R
        xQ9HRyh3o2/ztZr+LdgE0EwIrmjUIdL9v/iqGfU=
X-Google-Smtp-Source: AGHT+IENafhtbCspNC+paUZ6mbnEn1NS6e0zCRdFz7XcyOvaCEx9fRHpY7d2Xo9EcyUgsCuDcZkOcg==
X-Received: by 2002:a05:600c:249:b0:3fe:2bb1:11ba with SMTP id 9-20020a05600c024900b003fe2bb111bamr1960716wmj.27.1695818468538;
        Wed, 27 Sep 2023 05:41:08 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z4-20020a1c4c04000000b004063ee0b10esm3149503wmf.46.2023.09.27.05.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 05:41:08 -0700 (PDT)
Date:   Wed, 27 Sep 2023 15:41:05 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     Konrad Dybcio <konradybcio@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] power: supply: mm8013: Fix an error checking issue in
 mm8013_checkdevice()
Message-ID: <c46b4408-bf1d-408d-9e6b-16b0ad272532@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

There is a missing "ret = " assignment so this checks the same "ret"
value twice.

Fixes: c75f4bf6800b ("power: supply: Introduce MM8013 fuel gauge driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/power/supply/mm8013.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/supply/mm8013.c b/drivers/power/supply/mm8013.c
index 29fd65fe6545..caa272b03564 100644
--- a/drivers/power/supply/mm8013.c
+++ b/drivers/power/supply/mm8013.c
@@ -53,7 +53,7 @@ static int mm8013_checkdevice(struct mm8013_chip *chip)
 	if (ret < 0)
 		return ret;
 
-	regmap_read(chip->regmap, REG_BATID, &val);
+	ret = regmap_read(chip->regmap, REG_BATID, &val);
 	if (ret < 0)
 		return ret;
 
-- 
2.39.2

