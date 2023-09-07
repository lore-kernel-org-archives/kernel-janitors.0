Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B04FEC873E
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 16:35:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236287AbjIGQfr (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 12:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234401AbjIGQfq (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 12:35:46 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 810931FD2
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 09:35:19 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-31768ce2e81so1101528f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 09:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694104460; x=1694709260; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cR64pP5v8VMQvK6J+liUDnoig8gBbgzJepG2Ih8CIRg=;
        b=UUOgu1MCWZgRT+hAaOE+QymWGaYmigjMZZpMF/TnaqxX17h2Pf74EdlIk5dDHaKF7h
         rkiic19hUdtMLcSRui8rtZYsu+zmR8LVd9PriaMv3NDpBKQ2kABrgKLwmfu08HmtG70m
         j3J8Z9BPNsFLYWvdid+/mvLC0by4Ec/wWjxTVYxLngueRezdI4rkMJ3XjrQs9xpFNnQM
         rZ2mbV5zu06knYJWMfyOv7MUV+Nh3SNv1VU3OZ4R7D5G4nf3+eE9+l3mDrxTpz5H84v+
         s7Nii6DJ2nfZkhSql6fp1wvz4SIqgvmq4FvMQ+ra9Ty8unq5n5Q87jyQawdBHY5AW5jD
         6bHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694104460; x=1694709260;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cR64pP5v8VMQvK6J+liUDnoig8gBbgzJepG2Ih8CIRg=;
        b=O/JyueDKGEic7OHJHBTp4Pvh4dvrMow18XYZzyOiMmXi+awVGooy5nDhry7+2bVAh3
         vTrgOR1cFhwMiYVQW+qH8wPy7VJiBIUr+8q2CLZOAFbsEJIC7r8so7jBnUv+JVlNMBTf
         O6oybHO+pcMV3YF/PvTjnP4fMOFSLQwRZsoHqVphMvEDhg0mz5LqJB90tjnl/gWRf9h+
         S60zN49R18HWRGVnWn4mSsqfRRK1j/6oS79d2KxnvFH2j7GObTxIXF+WpZte3+nnerTx
         uucQinKqSZGr7WHa/dXDZny8jYioqdsXOa2wwUmHEbIwZf9ZjSYCuVT5vchgdbY+pLHP
         dHPw==
X-Gm-Message-State: AOJu0YyWzrwWLaN3Oh9uISwVXKPl0uBoztBScRBUzpShEfWv+Ie7yxqV
        tV8wgkYTwyLN+lh2Ar3L2EMOu3TrmpiYgF150zk=
X-Google-Smtp-Source: AGHT+IGbhcc700Z65Vg5dhYXY19DZRwb8OPMvUCZt/Zg3IUmCAF6Hg9VeHZzoUmppxCvqiGE3+yE2A==
X-Received: by 2002:a5d:6a89:0:b0:316:f3cf:6f12 with SMTP id s9-20020a5d6a89000000b00316f3cf6f12mr4103507wru.48.1694080538416;
        Thu, 07 Sep 2023 02:55:38 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t2-20020a05600001c200b003196e992567sm22908207wrx.115.2023.09.07.02.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:55:38 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:55:35 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Bastien Nocera <hadess@hadess.net>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] HID: steelseries: Fix signedness bug in
 steelseries_headset_arctis_1_fetch_battery()
Message-ID: <5c1cc882-b2b8-45cb-b8f7-4b35d1800e5d@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The hid_hw_raw_request() function returns negative error codes or the
number bytes transferred.  If it returns negative error codes, then the
problem is that when we check if "ret < sizeof(arctis_1_battery_request)",
negative values are type promoted to high unsigned values and treated as
success.  Add an explicit check for negatives to address this issue.

Fixes: a0c76896c3fb ("HID: steelseries: Add support for Arctis 1 XBox")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hid/hid-steelseries.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hid/hid-steelseries.c b/drivers/hid/hid-steelseries.c
index 43d2cf7153d7..485d2287d58a 100644
--- a/drivers/hid/hid-steelseries.c
+++ b/drivers/hid/hid-steelseries.c
@@ -390,7 +390,7 @@ static int steelseries_headset_arctis_1_fetch_battery(struct hid_device *hdev)
 	ret = hid_hw_raw_request(hdev, arctis_1_battery_request[0],
 				 write_buf, sizeof(arctis_1_battery_request),
 				 HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	if (ret < sizeof(arctis_1_battery_request)) {
+	if (ret < 0 || ret < sizeof(arctis_1_battery_request)) {
 		hid_err(hdev, "hid_hw_raw_request() failed with %d\n", ret);
 		ret = -ENODATA;
 	}
-- 
2.39.2

