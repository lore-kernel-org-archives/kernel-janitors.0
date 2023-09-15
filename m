Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10150EE645C
	for <kernel-janitors@archiver.kernel.org>; Fri, 15 Sep 2023 12:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235200AbjIOM7Q (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Fri, 15 Sep 2023 08:59:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbjIOM7P (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Fri, 15 Sep 2023 08:59:15 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D91A8
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:08 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40472c3faadso18358515e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 15 Sep 2023 05:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694782747; x=1695387547; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wkICMbZeb9K27rKShEhdEgIC1HVJdUeuWJvlVg6+FQ=;
        b=a7Yl8Wp3K2I1TU6MJxq7M9h/CYslsoo/i1ln6kxAPmdN44s3E0RFPooH20Fj878XR6
         LUTWlklP+bLgkSPzODHtvx0NktL8sTBsshVNtSmYTt+KeJzoiJakNpHkf7n3bQ3TZJDw
         e9cpugChqnh4EsgmgtqJHIJiXF9/uKvBnx3K3YKZTbxyKiWeg3fmdCPsV6Q8LiS+EqtI
         xdP2XJYBIjcaHIYySqKtTqPt65O/OJ9heO0Q1RdQMSwvQgLnSW3vF4yTQ6S51nXTed3P
         vZl8TD3TlnAl1+Euz3cjkIKjt9BuIVE+KbYGchBZpFxNiOhAt5rK4O8jfz0rccJ7UCDb
         DqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782747; x=1695387547;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6wkICMbZeb9K27rKShEhdEgIC1HVJdUeuWJvlVg6+FQ=;
        b=TlBDOeO8XChr29R56zqUXQ20MZbJGm1z0N8l37fogWNnq7yBSnqyV93wz3eZBOksRu
         SF2ovVXOIyUouZlWMPlgP61A5KtC2Ym6BdV7KFklwFiG7d3mOzaDL36MMlZ9/ImJO7xT
         gTJUUv8+sDYcMtdw6w0CkgPd2oKZ0apQl5DtBOn76q4DBKb5+sdwU0PmFGZrMAA+mDnH
         h0QZIeCLBK0atdJRl7jCOVEr3SNRicg6Z350np740J/CCfD1yhxcFEnyciYJZiakVGsO
         gEs2gjM6K2b4hwGA/m4s7O9IMqsPDKGY7EG5XC4PX+pXs5KdqD4J3RwIs3RqZIVZdNI5
         VlfA==
X-Gm-Message-State: AOJu0Yxc6+Z0a41E2TW3xwOwXPXV6jdDLwMMGUZI54FUaeX3nhEx5oCy
        Fj6zJgr4PwuHjDeSjoA7A0Pmwg==
X-Google-Smtp-Source: AGHT+IFyoQcN09Isr3VMkGu17Z7fRcD4qsm/VxDnd5QaHo6qEbSKPticjZW+NfnyQeZD9MkcGdYgkw==
X-Received: by 2002:a1c:7c0e:0:b0:403:cab3:b763 with SMTP id x14-20020a1c7c0e000000b00403cab3b763mr1508908wmc.33.1694782747356;
        Fri, 15 Sep 2023 05:59:07 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hn40-20020a05600ca3a800b003fef19bb55csm4576653wmb.34.2023.09.15.05.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:59:07 -0700 (PDT)
Date:   Fri, 15 Sep 2023 15:59:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <6e0a33e3-1564-419a-9946-b2d0afa0f98d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The hid_hw_raw_request() function returns negative error codes or the
number bytes transferred.  The problem is that when it returns negative
error codes and we check if "ret < sizeof(arctis_1_battery_request)",
then the negative values are type promoted from int to high unsigned long
values and treated as success.

This was detected using Smatch:

    drivers/hid/hid-steelseries.c:393 steelseries_headset_arctis_1_fetch_battery()
    warn: error code type promoted to positive: 'ret'

Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Re-word the commit message.  Add the Smatch warning.  Use a cast
instead of an explicit check for negatives.

 drivers/hid/hid-steelseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 43d2cf7153d7..b3edadf42d6d 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -390,7 +390,7 @@ static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
 	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
 				 write_buf, sizeof(arctis_1_battery_request),
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < sizeof(arctis_1_battery_request)) {
+	if (ret < (int)sizeof(arctis_1_battery_request)) {
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
-- 
2.39.2

