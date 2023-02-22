Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133B6C61DA4
	for <kernel-janitors@archiver.kernel.org>; Thu, 23 Feb 2023 04:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233267AbjBWE5N (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233023AbjBWE5M (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Wed, 22 Feb 2023 23:57:12 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05B29367D3
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:57:11 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id v3so9613173wrp.2
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Feb 2023 20:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g7kUpsnawfyg2ZRyIba11uMYTEsMyAFj9I8/zy69niw=;
        b=d/2ElFcihnD1C6glcD23C7A/SWFZ7ZUBjeiUtTyuB0E/+Yp5Xh6q0DcjtyUtXP6yG4
         M97I4pPuipWZK8zaLqtUzOsea2WsNwaFu+y19NOdv/YX/0MgnutgmWQyvR58MfQJy02u
         ooNcvUdWKBUppLh4o/+TLFrRf82Mcc61GIaXSOpZJFaeGRu+7fGspUq4HN9AFE7/GwUZ
         47g0sZLQqfGKtTHF95Za7mVDYU+le/5BVRmO/Tuh96vmXEGc9uh6R84M1fTPCGnxuUQP
         aoDizM3r9dMMejq/LdfSD8sD3Ol1lbHAfuqXGWNQ3IR/M7zfTyioUrX5ieqhuLz0yJ8l
         FShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g7kUpsnawfyg2ZRyIba11uMYTEsMyAFj9I8/zy69niw=;
        b=5QLhZXGUZSbEh5EvmSFnrnxtrh6O2rc3JiWaFRVUuLpz3w/xhv9GtYF/LQAWWyk7pY
         xGOyDWWbwN66OZZ2SlA07BedoVZjxJsU2uWLGbSYxDyc9Cf0GJG2N5x3488vR0+fmd2h
         63VVSNOYxj0YkXmqy1MD/CjFdYLyhMK9cryYCNaN6wvzlqDT5J+rwygVMuWizCRXM3yz
         JjDq8xjRcd5+mZE3f2xtVB6zEveKNswBgWeHuZcMVq6gGoS3vzhv/BNbsKqlER+sJGDk
         ksiC2dR1dKR4vIQlfbM51BJDCoPkNssl8F1C2GlVOPBGcjcCLoBNGCjEgeJ9meULORvk
         Qzyg==
X-Gm-Message-State: AO0yUKUF/MMwOrD0JdgYCSoow56IyhnX621j2a7cHwTo2P79zo14ZcGg
        92NZ66X6ryu+1udKcUR9iTO5lsnndw9Htg==
X-Google-Smtp-Source: AK7set+eYY8DnAFYHh4MQC9XO/j7UocMG1ow7qW/1FSjw5zvCevKuVVESVwmQvGrR9EHEousz00jDg==
X-Received: by 2002:a5d:4a06:0:b0:2c7:658:f835 with SMTP id m6-20020a5d4a06000000b002c70658f835mr6595239wrq.33.1677128229538;
        Wed, 22 Feb 2023 20:57:09 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q2-20020adff942000000b002c573778432sm12528180wrr.102.2023.02.22.20.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:57:09 -0800 (PST)
Date:   Wed, 22 Feb 2023 18:17:06 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] firmware: arm_scmi: return a literal instead of a variable
Message-ID: <Y/Yx8pOdf8rNhPVe@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

In this context "return scmi_dev;" and "return NULL;" are equivalent
but it is more readable to return a literal.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/firmware/arm_scmi/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/bus.c b/drivers/firmware/arm_scmi/bus.c
index 73140b854b31..ac306ca48b07 100644
--- a/drivers/firmware/arm_scmi/bus.c
+++ b/drivers/firmware/arm_scmi/bus.c
@@ -436,7 +436,7 @@ struct scmi_device *scmi_device_create(struct device_node *np,
 	/* Nothing to do. */
 	if (!phead) {
 		mutex_unlock(&scmi_requested_devices_mtx);
-		return scmi_dev;
+		return NULL;
 	}
 
 	/* Walk the list of requested devices for protocol and create them */
-- 
2.39.1

