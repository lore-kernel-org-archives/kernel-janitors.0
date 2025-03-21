Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75411D61A2
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567757; cv=none; b=GI+u0Gyimtb3WV9K7gW6SUkA7qSbJAIkRBhlMLFp2qMLP8/ame4RHd35I2HCOkSNkrfHyheCEvr70qx86KD6KyY5goO9QFmHjpZexNZLhpkNBxp3KFWtF4Gl5VZHCSA55x8q6p4zt0Xulukuep+K4ogC2f55sAi4Mi99b537qcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567757; c=relaxed/simple;
	bh=zewkcsreTAIYS7PHyX+Qg+PK84VPiklh12ShuEBHSeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OMRGXHvwn6HtyDIeILDMo0sI9aIpxe4eYSBF4zgC0jCWoWmf3PwY9DrFjnCwTefaY3gwyrm0qRAnYEZtRUUJQ2J8woWrEIJ28PraM8blUFxeyZuS81zmx1BnhC1QAsT+LVsfgsIV9KcTSnkf9G2WC0Jfwj1n5+zmL4uVqcSb8y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DKE3+r+4; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DKE3+r+4"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cef035a3bso15202355e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567754; x=1743172554; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jhrcb/mTWviEZZ7YzcelEEpsaZNAgBebPczHwX9f7os=;
        b=DKE3+r+4X2pN1mTf4btc6K08Jo6IBxqc3fpE8DwsT/Yjhj56lj0mnxHHQl6Pql8O2H
         1q0hy80hyInP532X4gjbVhyvUkdfJFyovESh5SvYvpkblbmYJVeH/+txxwsXqFo5k1Xo
         54oEdae/1/htQzyra5WMWQTvYh1qsbXdE/5f/fQ6yhpPUmgT0opOdP93vc8f2uCbAje+
         fbmzhJ+nOr+SdF2tH/jkM4T81ErOGYcDZlK9rhChgsAFXXUQ20hTj+0t1I9CVHa/uxl4
         5AeezBxjoke9jayxqCawXNiKDp5/T3P0Texjic96WmjmmzCG7Rb5aBQHzKe1cp8+iVKw
         5ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567754; x=1743172554;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jhrcb/mTWviEZZ7YzcelEEpsaZNAgBebPczHwX9f7os=;
        b=DS8SUbA8qdYgnCOewLjlZ89zAhuchB8AtllI6aW5oNTrurKmhpWThUQxYE9nhTD9rM
         ThDbwFt1PegOYfCHojbTOe9bm+ctjYzMJWli5SiL5YDewfzCCqugxaMoefGva3zGVx5M
         +kd9/89eGHTM7OtJPJVo6n9zEGfVKkk/hZ6Ei8FNyBXIDpA+kbyhLKeMkTf0K8Ap6u1M
         n6TfIqC/vllRCNnWdS/elcRj5w39e9rfY+tN4bCIybFpQgViO6WGZfoISgNyuFADoghh
         O5aYwTjDf3iKhjSonz7DypRdYrwqEJx7KHccmBweC+PCCOw5nxUjrA5DEhJqIkeM0hFv
         Ts/w==
X-Forwarded-Encrypted: i=1; AJvYcCU6tB2f03dkGZtIQvV9ZtwPQd/55R1394YEFPbG95w0nbzv14IHL0oMmQoQaLkD8uAT+0OJnPSoMr+jZa7Fops=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRkZ5krJv2pkisjnNlQGrYtPVxnb4j/N0Y61pQpiYRsL0lICY3
	4SnQRrTUnqYLyQATY7uFa+SqPml8QVM/8WnbZX2DWaxQjinJ0GOvWhd5/XTtZ7o=
X-Gm-Gg: ASbGncturtt6dw5VXgWJH6rO+/dnEz0XtWZiGo0kHSw4SyoCbfWZnTc5y9UUYSl1A/L
	VFj275nJvcy9aBR41D17l7rAjcI2tmABNJeQd9PELYyyTTt+ths/AI/iMcNfPLFtNKsBIQ6/3y0
	jfNshDtrUlneX3VszpTdlo2alTsGbsrDKXw7xJ0rbgUCJ6jwwKUiCyiQ00XF+HDw8JYNmMPd+tM
	4495b4+88Y4tk2lmviCHZb5YfzOKyazCFenwl3Dst63z/4HQW4ruYcXIHArmHl59uccXE9FXIIU
	/0lamzTiS13HfPuqocwX659B0M6oqdwjOj2nf5oI4ZrVGn5jWDNaYldjxu1i
X-Google-Smtp-Source: AGHT+IFTlIYuugJCayoKps7oOfO+nEY2lgoAtdOqm9RkYPvK6VO/88fiHmYrMJaHHiCsISy8+YmeUg==
X-Received: by 2002:a05:600c:1548:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-43d509f4d23mr32282675e9.13.1742567753912;
        Fri, 21 Mar 2025 07:35:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f43ed6sm79077865e9.13.2025.03.21.07.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:35:53 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:35:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: "K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Anirudh Rayabharam <anrayabh@linux.microsoft.com>,
	Praveen K Paladugu <prapal@linux.microsoft.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] Drivers: hv: mshv: Prevent potential NULL dereference
Message-ID: <9fee7658-1981-48b1-b909-fb2b78894077@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Move the NULL check on "partition" before the dereference.

Fixes: f5288d14069b ("Drivers: hv: Introduce mshv_root module to expose /dev/mshv to VMMs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hv/mshv_synic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hv/mshv_synic.c b/drivers/hv/mshv_synic.c
index a3daedd680ff..88949beb5e37 100644
--- a/drivers/hv/mshv_synic.c
+++ b/drivers/hv/mshv_synic.c
@@ -151,13 +151,12 @@ static bool mshv_async_call_completion_isr(struct hv_message *msg)
 	rcu_read_lock();
 
 	partition = mshv_partition_find(partition_id);
-	partition->async_hypercall_status = async_msg->status;
-
 	if (unlikely(!partition)) {
 		pr_debug("failed to find partition %llu\n", partition_id);
 		goto unlock_out;
 	}
 
+	partition->async_hypercall_status = async_msg->status;
 	complete(&partition->async_hypercall);
 
 	handled = true;
-- 
2.47.2

