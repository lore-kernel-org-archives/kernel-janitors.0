Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B1428850E
	for <kernel-janitors@vger.kernel.org>; Fri,  3 Oct 2025 09:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759483778; cv=none; b=Yq55KdVqK8A8RcAYwRAWIieaDwNj8AJHs/gvjVlgQfBQt1GhiukUsqobSfGn6TQsOLgaFAcA7k21gfKyebJ2bN4naiF7YC2dGPh0gR/cgDSSTcsKZigEVQXWCNh0gGngnvZAw4lDHfIXll46nHpBXwZfu7Okfm0Cs+sDybOowTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759483778; c=relaxed/simple;
	bh=+vdEmMVTHZadaETHiL90NT3fUNKGtrfQcPtzSKVtkLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GMdwoVXs4Ft+8NvJZ6c99O3CjUk38ntOpkMeONB2bGBTQh4ARvhrVu4KTr46Zm1lXw3E4vVyMlTi9K8LcieXBqPTQhWw8T5GJ0yv/ggpLzzsk1lKh8GfzE+1O7Yq7oWCnsNWdvLyf3O9E+LeLbQYi8GhN74BDi0wbEfKDDpHSbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yui/FdC/; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yui/FdC/"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so18309375e9.2
        for <kernel-janitors@vger.kernel.org>; Fri, 03 Oct 2025 02:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759483775; x=1760088575; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mrdVcJnH0ez8wntENTM0uG2XQe2LXopmlQUtIl/gs2g=;
        b=yui/FdC/d8hgGYvQPlc1DfSmXawI1bxx08nHGYm2+n8ZWgG5qg1W535jwmx/1W25B0
         pSwnkCE2fS4TxpTHiyhIs/4CW4jXiq1BofZzs81sG2a75ZZF/KGXYNlbxh9OFxoBboSC
         ATNJR9s7K8ohq3LhjthY7BI5RRnrcX+jdYPNmNgggU7YVcO8QRPn5c+RWFxoKHARs4EZ
         vSJoO/53S5XkRmH6jz2I/ttZE/lVToeB62ziIKFbNf5HXLWqinJIKy+r+JyPEGOickyg
         EgnMJzMv8i7uJafMX8H15SnCNrfIs12n1jYSmb4+kPW3+PT9ZgK83Fm5qm6vz5gU73DE
         7UYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759483775; x=1760088575;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mrdVcJnH0ez8wntENTM0uG2XQe2LXopmlQUtIl/gs2g=;
        b=R71lAfqXjyHBZ5bKUkHDQzc/sJp/FwjJws++TsmymGUMUNf10zPiw6KpXVw9PQe6fK
         jlwYXHFVsUWPu5Tn12OLQ+1D46SYT2dSnFS5/Zu4FI6VxzULWhZyqW7MXpcdu0fQFwUr
         HFaQ0IURLIEATjYN45cEHXRfaoYEWkNHe1s4z1ujVpKBRGAbLNbvY/mBFcLOIrl8sTnB
         b4KTLIl+67ehw5t80hzwp7qtlHkm7UctUlndDNlxG6Rhxpgi53KSqa/y3ld2WFhSvOyF
         JtE/kFNkjJVmfuOd9alcOERXiIvN4FqdjZ9dPXSIvmKbvuUbeKzaF0jD94pcKImOkoi4
         g5oA==
X-Forwarded-Encrypted: i=1; AJvYcCWUr5q1Vy5WuMRRo5MdDiQ3mW/7EUgZ0ZeTXFS25rlZpNGOFz01LWf5bn1GGxEoPguvrFLfPv3Pg205SZXKjPM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJtKMUMv3ncA5SHcbhJ1Ut0uRKrLLtVZSHIaQbdlfg4qSOpzd
	aIaaT5/ghp9r14+bZUqi7cBqNtCdOrp7VFCWUf3nDICgnsGjH8POVcInZqTkhcsnKRo=
X-Gm-Gg: ASbGncu4Tn+gck5NqYlR3sNezM7kIbAWI2h1keu8VF8m1Ko8ErdH1WF1YT+bECCUFn4
	U+W+epNMM4soKdF71GuUGMHOpYhbCbvsSmEy2ec3YfvYJq0ukEG3PgMT2RTAj0msHhSdvIwz7ey
	ADsRxL/vWiEIFkJRYjCDl8JZALKl7d7PLmW1vTiESi+xgFRO9PC2gwYCTel/+oBv8EaGW5kJiWM
	jnlbP5NX4y1N5RfZZmdantWnIJAGbJnOguQ6TTj4VZTrGkkV/ciT/zKNCcR574OIOL9XckahPhY
	z/CMDYe3f6L6sJwWDqwyvMDQPNlRw0L1+lbUApEJoyxlgwm/tuMaUIO1iAD71aDR8TA5BYbSfTY
	MbZP+0EpeFKhuEhTtGKx/5+AAjlwNoyRR4XJQZPy2rGhqef+rdVJgXRcm
X-Google-Smtp-Source: AGHT+IG6tX4ZZBiVIKE1UgKL2V7cxAUZvSbg/e0yGhSGsaSkg/4tX6nLO26JEwdqDcT0Cju2Zjht+w==
X-Received: by 2002:a05:600c:354a:b0:46e:1a07:7bd5 with SMTP id 5b1f17b1804b1-46e7114e5aamr15201675e9.29.1759483775243;
        Fri, 03 Oct 2025 02:29:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-46e72359e2bsm23175955e9.13.2025.10.03.02.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 02:29:34 -0700 (PDT)
Date: Fri, 3 Oct 2025 12:29:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Brian Norris <briannorris@chromium.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] PM: runtime: Fix error checking for
 kunit_device_register()
Message-ID: <aN-Xe4lgox1cCAaR@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The kunit_device_register() function never returns NULL, it returns
error pointers.  Update the assertions to use
KUNIT_ASSERT_NOT_ERR_OR_NULL() instead of checking for NULL.

Fixes: 7f7acd193ba8 ("PM: runtime: Add basic kunit tests for API contracts")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/power/runtime-test.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/runtime-test.c b/drivers/base/power/runtime-test.c
index eca9885e807d..477feca804c7 100644
--- a/drivers/base/power/runtime-test.c
+++ b/drivers/base/power/runtime-test.c
@@ -14,7 +14,7 @@ static void pm_runtime_depth_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	pm_runtime_enable(dev);
 
@@ -32,7 +32,7 @@ static void pm_runtime_already_suspended_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	pm_runtime_enable(dev);
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
@@ -70,7 +70,7 @@ static void pm_runtime_idle_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	pm_runtime_enable(dev);
 
@@ -91,7 +91,7 @@ static void pm_runtime_disabled_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	/* Never called pm_runtime_enable() */
 	KUNIT_EXPECT_FALSE(test, pm_runtime_enabled(dev));
@@ -131,7 +131,7 @@ static void pm_runtime_error_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	pm_runtime_enable(dev);
 	KUNIT_EXPECT_TRUE(test, pm_runtime_suspended(dev));
@@ -214,7 +214,7 @@ static void pm_runtime_probe_active_test(struct kunit *test)
 {
 	struct device *dev = kunit_device_register(test, DEVICE_NAME);
 
-	KUNIT_ASSERT_PTR_NE(test, NULL, dev);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, dev);
 
 	KUNIT_EXPECT_TRUE(test, pm_runtime_status_suspended(dev));
 
-- 
2.51.0

