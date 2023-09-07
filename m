Return-Path: <kernel-janitors-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B3FEC8742
	for <kernel-janitors@archiver.kernel.org>; Thu,  7 Sep 2023 17:46:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237233AbjIGRqK (ORCPT
        <rfc822;kernel-janitors@archiver.kernel.org>);
        Thu, 7 Sep 2023 13:46:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbjIGRqI (ORCPT
        <rfc822;kernel-janitors@vger.kernel.org>);
        Thu, 7 Sep 2023 13:46:08 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3311BF9
        for <kernel-janitors@vger.kernel.org>; Thu,  7 Sep 2023 10:45:42 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2bd3f629c76so21634941fa.0
        for <kernel-janitors@vger.kernel.org>; Thu, 07 Sep 2023 10:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694108730; x=1694713530; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7+oeYHhCCZf4UqPQvsghd+Ar5QM+qfPLVMJj3atC+1c=;
        b=v51ZIL5esQ3cXxYsEsAligWkVLciLkacWEdojoby3wYNx66KpxG7oZMASY6AZ9a8Lp
         As1VujL+ZSNreAlNexHR9jYRUEHfIrbIET3AU5GImYo4JZCncBGmO1i9xt61aHn9gYtc
         j21exWpB2gENYwMmTsGrx96hPkAHtbWWIJQaEcJ2GZrxwCMDFScWXNr+85w0PkveVlb3
         bavhX8BoVM7DKZMUMRqsSaD13xfizUWiROyP2c+rKd/zjLEtz7eC966dxHiIL+BmUFzq
         7l5YbWC0cnMOAZTeCDh1/FIdabRXq3LMSuuc6B7CFZMeqCB5XKYR46nKHX75iWoM3YEO
         TVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694108730; x=1694713530;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7+oeYHhCCZf4UqPQvsghd+Ar5QM+qfPLVMJj3atC+1c=;
        b=oEZcDueifSVCxtwTcJZOFLysUrIdgmfZNefnNnM/wuWKoQDS/8vcyZ2uwmiWGSyt0w
         K4RguDnXgCssRkrrDD1VZpnwTKCTZQ2ehAYhbnRNOzeiMvCuhdp0ygDLks/kvJa42n0y
         OmHswdFxlzwBnXGzOounVb/Eiuc6atxMyTJ5HUixt5A5qGgsmVQlPhj+bvrEuuUXlfEV
         RJuv0b7hn9IqRP/KltXPORkhnuBG8QWJGUVbRJgRvaApW6of0Qp9SlkbXBD88r64wgqp
         mkKEEykL75XWypR+hXdkQhsc74C4hcowChWSIJQad/RguVLtbNvacGVYD0BjU1FUskNy
         Qomg==
X-Gm-Message-State: AOJu0YwatnZXq6IrkwnNgF3v3yqODvkveITT9c1m/u/aBNMjLMKWux6j
        cIingMft7PbFuzP0WtzbpGsOIRhwLdaYGJIZL58=
X-Google-Smtp-Source: AGHT+IEUCqT/4Qvl7BteIhCYfFd+u2xnC6HQNrqjt2oIdRyQrjNUNt43eRhSqUZxSCuOAp+rQ/F7EQ==
X-Received: by 2002:adf:ee08:0:b0:317:5e73:7594 with SMTP id y8-20020adfee08000000b003175e737594mr4534863wrn.28.1694080549826;
        Thu, 07 Sep 2023 02:55:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id d18-20020a5d5392000000b0031c6e1ea4c7sm22973928wrv.90.2023.09.07.02.55.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Sep 2023 02:55:49 -0700 (PDT)
Date:   Thu, 7 Sep 2023 12:55:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>,
        Alistar Popple <alistair@popple.id.au>,
        linux-fsi@lists.ozlabs.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] fsi: i2cr-scom: Fix error code in read/write
Message-ID: <ee554aa1-0257-4662-8da5-1ea6be2740e9@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <kernel-janitors.vger.kernel.org>
X-Mailing-List: kernel-janitors@vger.kernel.org

The copy_to/from_user() functions return the number of bytes that they
were not able to copy but we want to return negative -EFAULT to the
user.

Fixes: c0b34bed0bbf ("fsi: Add I2C Responder SCOM driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/fsi/i2cr-scom.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/fsi/i2cr-scom.c b/drivers/fsi/i2cr-scom.c
index cb7e02213032..df1e1df40332 100644
--- a/drivers/fsi/i2cr-scom.c
+++ b/drivers/fsi/i2cr-scom.c
@@ -45,9 +45,8 @@ static ssize_t i2cr_scom_read(struct file *filep, char __user *buf, size_t len,
 	if (ret)
 		return ret;
 
-	ret = copy_to_user(buf, &data, len);
-	if (ret)
-		return ret;
+	if (copy_to_user(buf, &data, len))
+		return -EFAULT;
 
 	return len;
 }
@@ -62,9 +61,8 @@ static ssize_t i2cr_scom_write(struct file *filep, const char __user *buf, size_
 	if (len != sizeof(data))
 		return -EINVAL;
 
-	ret = copy_from_user(&data, buf, len);
-	if (ret)
-		return ret;
+	if (copy_from_user(&data, buf, len))
+		return -EFAULT;
 
 	ret = fsi_master_i2cr_write(scom->i2cr, (u32)*offset, data);
 	if (ret)
-- 
2.39.2

