Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BB8605AE
	for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 18:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707847788; cv=none; b=fUiS9sOV1/udtj1aJtIq8ySve9BehnqYDyngqmFC+lLrzGMFBr4v0TcfVbcvE6f3ddOr9vcQRQJ1i/GH3D8FQNjZHDkw8O9KH/rbM4vJrim/QLVeCPx4w+6Zk75YBAFP4vE92UIkbPEsr0qsQEqlPDhzA0yRHu6TUxqgA0lA15w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707847788; c=relaxed/simple;
	bh=4ul5Tw3COSLN/gf7enKgp1nS0J788ARuuwxLOzxXNKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTKGc6Ax8Xi8xfgUwEPcjTb5HsUtTOH4Uj9qDVZ+INEUwjVaSLr9QvyeBQNkI8kXFNBY/aqKVZ/uFZLnbktWJVVN9Cf3pf+uyw0LqYqFPg6oJJM6JaBMyjCLcE6daCtyU5tTPyyl3KAUuaq5YM/qJpZRD3TgbsyoWrY+ddvi2V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jEr8eJOH; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jEr8eJOH"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56003c97d98so5570106a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 13 Feb 2024 10:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707847785; x=1708452585; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=33nfQ6E2IZzcs7Pxb0qMF/g8B61uICxiGHNN3IFmu48=;
        b=jEr8eJOHGPuv9ePsH2/x1K6QMulDrlHaVaqW+3OEwXzZncth6plYvGdNfQktzOiqgQ
         5rdJGqQBl6WOuvnA130CWQAafxRvJdo4DrtZAcwe5o0gMHvcHqK/5YzvtEuCEXkT3f4W
         bUWQnAdVsZ0ew/psMP38XxJkyHSMrM5YZ1K0kjhPSkPGi4jxAfqfIBaFwMAGQf8UQCNz
         585gcgJMByrkRh5NfIchzhle9vvwS7UNzchOsnznUALV/7D2YSHPvadLg4ApXoGC8LgE
         I4e/4i2DQbQ2AVvPjvP9wgwOhMnQET7/Nsl33EGZpIigD8Zw1vcKhD975S9UqhgqyJxe
         tRAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707847785; x=1708452585;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=33nfQ6E2IZzcs7Pxb0qMF/g8B61uICxiGHNN3IFmu48=;
        b=gxUHX2J9b/Z1UvcgVufdAYXc8wYvJkH9hXKq7ZlxGIg+wAyABrX3ERcaMxYCQaJkLs
         /9jdU9giMiC2yZElHcuN3W3VkflSSjGoxGaxQEaTBTFv3598gLAsBHvYnV47lsobToKg
         ejTxQZzXJKIXhKJ7EiwLpjFLXfZx5dk9GdFgPHzq+kIFbeDh949+C6p0WUov2tPdttIZ
         zoB/Ae6Q3lm6PyLRD+qG3h9ltxLcKUv8ZzJ3vHnfMTI+7iUlXjEO4glctSpVC2JCKfB+
         8cB+At5Wat01Ybzdx+nMaiqmtyqBA486jG5/CJ1Fo617qtSyYYiw8597pLRnDPeJQcI1
         O2xQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLkkiiCCqV8NryMqE+bZQJSEGA7/WvDs/7BXbyYKu1GCLEfUo07WpoJM6REmx4sxcdCM3DQQAUcFXPIvUzxrafQAGhuPGwbQzMxP0yNK37
X-Gm-Message-State: AOJu0YzME1wj2zM/Rh0Q+WOJ9yi7VQYiAE+u1ZlglU8PSMRgXL9JJGrA
	kjKi1sGImHbyv2Yj8zjxrfFR1adD0oneSNDOdRr/nroKSsFEdTjUSeIbzQIAR7wzfLQ0FYf3rZl
	i
X-Google-Smtp-Source: AGHT+IEOc9jIZditY5gokNfJ5nlqPtrusPC9dfFz5hgOhFOTkyw8kuxlKUxjhYhVekorWlipgivMsg==
X-Received: by 2002:a17:906:f9c9:b0:a3c:f71e:215c with SMTP id lj9-20020a170906f9c900b00a3cf71e215cmr94770ejb.19.1707847785142;
        Tue, 13 Feb 2024 10:09:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtvq2ePchqRVLeWfWRgjTIk0XHuXOVDZfnCNszJq0nbh4i9MvodQpq3+8ABQI2MxEcHkYz5Scv6UcH/V3N+y/xplTvs75cSdcIXhTHTMTtw27UVIi0YBCIkkYkaWgKQ0GQCgemeQCjQr6wOD/pUUBCfyJTh45toXbSxkECFAdQoj/zayjtgIqsV+LiOukPpn43nbhAMz1p4mHYHrOyvcVydnqgRcM3NhvOpgxMvbvgxaK/ecksL/FqjmsT3v3EBsUd8jZDUcKZ5xd+PgL4Q7eJZcgFRfWJCd7I1AWjL3UQ2luNhrHp9QO5YoQhez+mhpPq94YvzCM30QWAnTzOsoioMInxZMNSMNxeKuHbzNkMgBR2pk7mjDJ9nTxHYlWlsE5b0ZX9Atdv/XGAZT/TOt6C1QYan6Mg/+1/bo8pgXhb+ZTcjVk6LfK3qQ==
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id gl15-20020a170906e0cf00b00a367bdce1fcsm1520638ejb.64.2024.02.13.10.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 10:09:44 -0800 (PST)
Date: Tue, 13 Feb 2024 21:09:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Damian Muszynski <damian.muszynski@intel.com>
Cc: Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Lucas Segarra Fernandez <lucas.segarra.fernandez@intel.com>,
	Tero Kristo <tero.kristo@linux.intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Markas Rapoportas <markas.rapoportas@intel.com>,
	qat-linux@intel.com, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] crypto: qat - uninitialized variable in
 adf_hb_error_inject_write()
Message-ID: <193d36b0-961a-4b66-b945-37988f157ebe@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There are a few issues in this code.  If *ppos is non-zero then the
first part of the buffer is not initialized.  We never initialize the
last character of the buffer.  The return is not checked so it's
possible that none of the buffer is initialized.

This is debugfs code which is root only and the impact of these bugs is
very small.  However, it's still worth fixing.  To fix this:
1) Check that *ppos is zero.
2) Use copy_from_user() instead of simple_write_to_buffer().
3) Explicitly add a NUL terminator.

Fixes: e2b67859ab6e ("crypto: qat - add heartbeat error simulator")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c b/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c
index 5cd6c2d6f90a..cccdff24b48d 100644
--- a/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c
+++ b/drivers/crypto/intel/qat/qat_common/adf_heartbeat_dbgfs.c
@@ -160,16 +160,17 @@ static ssize_t adf_hb_error_inject_write(struct file *file,
 					 size_t count, loff_t *ppos)
 {
 	struct adf_accel_dev *accel_dev = file->private_data;
-	size_t written_chars;
 	char buf[3];
 	int ret;
 
 	/* last byte left as string termination */
-	if (count != 2)
+	if (*ppos != 0 || count != 2)
 		return -EINVAL;
 
-	written_chars = simple_write_to_buffer(buf, sizeof(buf) - 1,
-					       ppos, user_buf, count);
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+	buf[count] = '\0';
+
 	if (buf[0] != '1')
 		return -EINVAL;
 
@@ -183,7 +184,7 @@ static ssize_t adf_hb_error_inject_write(struct file *file,
 
 	dev_info(&GET_DEV(accel_dev), "Heartbeat error injection enabled\n");
 
-	return written_chars;
+	return count;
 }
 
 static const struct file_operations adf_hb_error_inject_fops = {
-- 
2.43.0

