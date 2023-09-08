Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8194EE57D0
	for <kernel-janitors@archiver.kernel.org>; Fri,  8 Sep 2023 07:03:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239500AbjIHHDs (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 8 Sep 2023 03:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232354AbjIHHDr (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 8 Sep 2023 03:03:47 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A59419AE
        for <kernel-janitors@vger.kernel.org>; Fri,  8 Sep 2023 00:03:42 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-401ec23be82so19607215e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 08 Sep 2023 00:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694156621; x=1694761421; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VRwLn/yXnNs2xVeTU3vC9hmBD8Sa61al2g8apCmPNbs=;
        b=tfWXNszRQwivvuTIbF3YF4SVVW02MXoCeryLcyHX/KWdJ+OmpHU9snt9nyTYm1U++j
         azmV2EdP/pTKGFxd5Yc0/4Er6EnHVTJZfVd+qnJdwPXP2g9dH09SR9a3mg3pd7UaKRpM
         0JXjgkZbkN2PGq46Ba6GMOZZLpZ7jGoIObLYjVMKcxSHsu8Y4GzC0PAgI+Bi9jlK4BgU
         qGygRZF/WLpWCdE5PTiJLOvkdY4aQSLbiWU0oyq74EPs5+B77CIf6rEX2jobF+DO5bhF
         FaAEQ9N21eXBQSDyb+G2sl0emBTta1zVC4Nqpf4DJZlzJo/q34aH52H2xvUqFx8b7CjT
         iYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694156621; x=1694761421;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VRwLn/yXnNs2xVeTU3vC9hmBD8Sa61al2g8apCmPNbs=;
        b=mB5wdULa6Sr66aJITXuZxtPjjSAMukyMbKGFlbgMR+SKDfumyTU730VY7rRVL1xUqQ
         hijt4Ngk4mOzNRxtGWChW/GHwvlYvdJ5COyb/EanKiI9WZ89+Q6EwQ0uT2ZZxY1Bgqkp
         7ezHiZTg7zHJy5nioe/8rNzva1i4VDx5tY/57NTjsYDo0F8XM7Ico6xcLEcwCWiDoCEI
         kHampZjdlu1qWLq3nOfHIz/k6yS7q775+s3qzLioWePONa0YuuEK26R/JRGDAORsrMAV
         Mg01dnu1ukmlVl6CvQBQH+q5aC86PtZNA6NMlMQ2QNMgBGmzLAoUu90Q7340oFQINAKJ
         SDsQ==
X-Gm-Message-State: AOJu0Yxj9Ro5jleFGbCeiYLrMTE5YjKJVLHOJmajGbNMrxYIHWXrmQF9
        45NzIMAibzX9dd0xgv3+n6y8Bg==
X-Google-Smtp-Source: AGHT+IHXaMtp3QOtjBcz+3G+pXLpG/LbHb9b0+uIlRsYErVGK1E/nhr+0+AXCHRWwkAMu3qkSRXzDQ==
X-Received: by 2002:a7b:cc99:0:b0:401:c52c:5ed8 with SMTP id p25-20020a7bcc99000000b00401c52c5ed8mr1366780wma.13.1694156620923;
        Fri, 08 Sep 2023 00:03:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p11-20020a1c740b000000b003ff013a4fd9sm1188820wmc.7.2023.09.08.00.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Sep 2023 00:03:40 -0700 (PDT)
Date:   Fri, 8 Sep 2023 10:03:37 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Lars Povlsen <lars.povlsen@microchip.com>,
        Horatiu Vultur <horatiu.vultur@microchip.com>
Cc:     Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: microchip: sparx5: clean up error checking in
 vcap_show_admin()
Message-ID: <b88eba86-9488-4749-a896-7c7050132e7b@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The vcap_decode_rule() never returns NULL.  There is no need to check
for that.  This code assumes that if it did return NULL we should
end abruptly and return success.  It is confusing.  Fix the check to
just be if (IS_ERR()) instead of if (IS_ERR_OR_NULL()).

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202309070831.hTvj9ekP-lkp@intel.com/
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This bug is old, but it doesn't affect runtime so it should go to
net-next.

 drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
index c2c3397c5898..59bfbda29bb3 100644
--- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
+++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
@@ -300,7 +300,7 @@ static int vcap_show_admin(struct vcap_control *vctrl,
 	vcap_show_admin_info(vctrl, admin, out);
 	list_for_each_entry(elem, &admin->rules, list) {
 		vrule = vcap_decode_rule(elem);
-		if (IS_ERR_OR_NULL(vrule)) {
+		if (IS_ERR(vrule)) {
 			ret = PTR_ERR(vrule);
 			break;
 		}
-- 
2.39.2

