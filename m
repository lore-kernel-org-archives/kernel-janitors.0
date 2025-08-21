Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FDC12CD96
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 12:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755779426; cv=none; b=KnPyHjZWXFkqqiKAX+BU8f1zYhztLDxCdmxfzrHCCVqw0a8eEG/eIy3hy4MJuKVII8TYvPXQE+BNz9IvHy5l2ZTOYX7pstp5HqbXUbYV3l7NEevexZI5MNkgncNHZmz+/35BnmTOzUUvxqNmdZ/zBFqA/WqsYIuo7yaU1sv2IMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755779426; c=relaxed/simple;
	bh=uTIRabS6T2mGqxsTk0ErX3psVDv4gnaGVnSGbRpQFbQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XC6YUYYPY87ysQoADDsO3V9oBK9BzXl5YtXCDfeLqNrsQQDVl54pDYPo6zBryRIVD+QHZ3Fo0oKsXPxmbsLMGmJEOp59XXt6DB/k2riO+uv2Z81nIN0DL+Hfaq4HcQqA8ALT9tzfxlAPkx57x6Vb8lBnKC+FsocBUL8LXJ3UMqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q8wA/ZZ9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q8wA/ZZ9"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-45a1ac7c066so5666585e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Aug 2025 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755779423; x=1756384223; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GFauEFqH4elwkI9ughIf+IrmIT0Pv7YSC5PWnrBVGQc=;
        b=Q8wA/ZZ9TS8dwha2JNIFMZsqyoBMbJrZMGWPJ8qpgBLCuqJ2l/W64Q5u4Q9j7sqN8M
         vkvbjhZNB1MQUg1yQhlPAsvjxpVhrmKgXKCH2qPIDxWibV5/NZe2dJnRbFACnTECL618
         Sm4/HpiVhgwjS1MT5F0ej/4mNXTJFTOnKKtnEguP4x5R4Skcdnl/0u8HcrIjxSudcOxN
         otW8pjpgU0h+DEMGLrglzZ4es4OS/4ToQeCEeV2/tlKJPFyHLqPB5JiEMli7pUAmrf3+
         CMot1we+IzVFLrmZrArzG0aJ21KB04LTyqZtt3xEi4sw4x562+2YRU0U5ZC6DyqeQFNd
         6Jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755779423; x=1756384223;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GFauEFqH4elwkI9ughIf+IrmIT0Pv7YSC5PWnrBVGQc=;
        b=kg+yfxDRM9omHOp4RdIAJwzKe2Oe4zJuxgxDp3rRMdwc09IUWQSzbaPW2OrdUDTj5t
         oc8aYx9yUD4XA8DPog3xSdqJDnu0LgQcBqjFqx96bvUgCYOJvE69IgwiAs13GFAZbb7L
         uq/YlrQCQXEZVF2cV8vMgFaTTmm3l6tZOxwuCvc7B/sdZpy5sD1MEXV/w6VLrBF6/AsC
         HM7U/eAxDC2ANOy35d4dc/suTPCbM6AfNAPd1hDrLA/8Q9HcRIHF+W9yYkbmIn8g4rd+
         +obSP0cCp8gzntC+jg4sQ8q4E2vP6d3qa+ce0Vzg/s8uHzTQhMGIQOtvBWddAoa0Pm7Z
         UQ3g==
X-Forwarded-Encrypted: i=1; AJvYcCXPcsCMhUNQHgC1ulU1VvNMDjuMHyBY9vBD6oeZDVIK3wQoyV5XHnIO7nmt4QSMxEfvbzSI6l9uf9W5OLZjUk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPXOLdjWCA4XnImfacro8XCES2plC+vo78ZvpoW7yn1tmIeCU5
	z69VeuQixebr85BUs8loEdLeFXQHg/Mavm3oyOTmlp+lCe6MXO+qMQOZVOnNbO8YCC8=
X-Gm-Gg: ASbGnctVKDG4ES0a4+MQtxLDjwBHGvb9fHnUbYvTHFLWL1xTAAp+PJBNjWz7vgTFbXE
	yUB2Jv+vfmH4YbfuTQhD4J2+TSb0enGJ80OeWd6uOj/pN31GNiYej8smlQ/G0aZCwOyLJWlTx82
	XdEFjJdGrl6MbM/NW9ige8zBPb41UQOXvORTXfJZz6PWTyqnXgF4BMO/+ymuJGA6YNsdtNWi3SF
	XTrk+Se6EyupGpTD5WoPo6lpP28r1vohiLH/Q0p4EG+nlcG59SgZG5qrlyeEQ6Z77HY4Z3cy6s6
	kwIKuQRtdY8x1/nYwneFIgBJmu3C1aQVbAMd9q18rtA6lJQD7uQGoRihe0aKwoUQ4qC/k87vluG
	HED42WcAByzgG/E/eXzJ7TnrFwjGaUz45tq8FuQ==
X-Google-Smtp-Source: AGHT+IEWBahCm/HEzs2ekfN68QoHcjk05inm/vBZ5gGcwgu+SVeuuRQ6tuDqkyo9Irqu2mxhLByrvA==
X-Received: by 2002:a05:600c:3592:b0:453:6c45:ce14 with SMTP id 5b1f17b1804b1-45b4d8deab0mr21551295e9.4.1755779423385;
        Thu, 21 Aug 2025 05:30:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4db1b7b3sm29415745e9.4.2025.08.21.05.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 05:30:22 -0700 (PDT)
Date: Thu, 21 Aug 2025 15:30:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Cc: Oded Gabbay <ogabbay@kernel.org>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] accel/rocket: Fix some error checking in
 rocket_core_init()
Message-ID: <aKcRW6fsRP_o5C_y@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The problem is that pm_runtime_get_sync() can return 1 on success so
checking for zero doesn't work.  Use the pm_runtime_resume_and_get()
function instead.  The pm_runtime_resume_and_get() function does
additional cleanup as well so that's a bonus as well.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/accel/rocket/rocket_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_core.c b/drivers/accel/rocket/rocket_core.c
index 72fb5e5798fa..abe7719c1db4 100644
--- a/drivers/accel/rocket/rocket_core.c
+++ b/drivers/accel/rocket/rocket_core.c
@@ -74,7 +74,7 @@ int rocket_core_init(struct rocket_core *core)
 
 	pm_runtime_enable(dev);
 
-	err = pm_runtime_get_sync(dev);
+	err = pm_runtime_resume_and_get(dev);
 	if (err) {
 		rocket_job_fini(core);
 		return err;
-- 
2.47.2

