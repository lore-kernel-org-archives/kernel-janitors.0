Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30AE231A2A
	for <kernel-janitors@vger.kernel.org>; Mon, 13 Jan 2025 06:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736749158; cv=none; b=LfvxYdkv7SyYBIjLYFZhTskqZ9k3ZmL9kZAppLXD+erKxwBFni71n0SfjhrlcrPzoHhQepwazuzt0ZLsldNRWQ31aG+RPJIUxx34baMvDjVqhmE+i9wEuXr2ZB3DjjxPqgYaCk5wC7glTYUlzGIN+59ADw4bnPGuyFadMAgq5/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736749158; c=relaxed/simple;
	bh=JS+4J5lh8Fucg3Gbhf9aAPZyh0H2XmOy45D+czstqF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXE7QiT3MpPbMJI7oiZwEvboTr36CDpm5OkS+aNYW9VBO+t4tzCWrLE4OgJ4/SfubSZiiiwWhTCH46+KQlqK+LMq+rDeRkeAVivlBHSZVs1FklsIbPgYkEN8rK2PEtTW0hcwQnlRyJAolP3FyXRwSoYqqwJwm+JG3s5kkoC+FbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VttzT19s; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VttzT19s"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa67333f7d2so597359266b.0
        for <kernel-janitors@vger.kernel.org>; Sun, 12 Jan 2025 22:19:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736749155; x=1737353955; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IsRvXHGSWUxVyT3HvHK3zRMHjp5k3n6wAVlQb9UAIoo=;
        b=VttzT19s66sUUcMCO9MYS2mBazY2P2Ck+IqK7m/+bmpljh4he/aEoMagid9FIOR8iM
         Uoed4Btr2vfkfCO7HNPO2sYVLmMs2SOdxNzq/m2fmcIySwfmeN/UletaUa9sVWGsd+DQ
         nZtAmlBHOnhP/C9L5WbcUNIhuvftBGF0KHvPQRFma5Bh03HyzWyQkai2bQd9Zzox3v3K
         V38kh0LQ66EJOSVa0m6dVV1OzHhblIJfjoa76QQMm83w8XCKVp6WS5ZpKW64ZnxW7YjX
         kOxGDonShA/XD99/SjhOjPyPg07RSAFjGGCM42xMiI7WTy6Wvbx3o4GXz5Q6iDNZt0wc
         MAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736749155; x=1737353955;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsRvXHGSWUxVyT3HvHK3zRMHjp5k3n6wAVlQb9UAIoo=;
        b=E8swK5gvKk5KQ0QRnbdEIFnrIb8J7Ee4BB5gwWBR0zyS2u1ew7L7nKkwAzjxv8mRc7
         lsmcc0gIqz5eAg2QpAzbZewdxNQY1VCeGip5aQUEtIiawEstIGg5lofEFyg+B8kZpmPp
         G701brI2XTNUMSjV50OgaJ0z4oTZWwhrZgeswPMXhR/kQ2Eiy821SdWK3Q0GyXPApZAv
         bKIXHWxWYY8AUiI4jDUCq7UQEQynTnhpmTedMVAoKCG8ZZ14gAcQE0KPBAYj2fNb6hj6
         14ZpXhvnnolYvNVVFrVbUDmdJXTxO/lvyeLPs8OLkKeMuUGngtGFkDhXpkbZvewb9Nxw
         +b8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPH4mJ10wpNKvX08zLe/rQ4m0UZvZrWCCqrbmgF+ySUyHJL5PkG3H0wZ5GzxWVdLHyc0RACK6gkbXR7JEWJs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb9EvcJwPE1K1nKeW7oQU86ZktUCSkfaYSQmIfWjn1J/1H1280
	HRQ0l/OBp+Z2ownvldMgnO/Cdp6ddWUXvnVgxHaNXJPD2MsxwDd8D6ThVCKqW6w=
X-Gm-Gg: ASbGncsqY8Xhla9ifxjJcEQGwAiOFJGQH104SRRvHgwOk95sDe9SEnqDGD3sc8Yf6/5
	F3AQii/zQnNOkkNGMiXSLbqPidkKYWKhbFmyjgIXrS/3+Fp+IgusdveCYGStXQozdXBWrRQJcUR
	MlJ4zJHZHJv1Ie77JlzvUAo0+aPO4qZ/3hFH9JDpKRrld75o23n3zaT3dHdeKj9tleJaiE3Ygul
	PP0pcOnOrH1EAkUAWTli1TaRkcXTpB5s840zlCtTPVCJg8KMWB9TigQLGnTQw==
X-Google-Smtp-Source: AGHT+IFqpX9e3c3D8tjbJ4iafdBuamD/RqHrGmivwZIPI4DdokOcWz0agCCvtb6wFgzixam07yQ7Rg==
X-Received: by 2002:a17:907:c0d:b0:aaf:1183:ec2c with SMTP id a640c23a62f3a-ab2ab6bfc89mr1610144966b.5.1736749155208;
        Sun, 12 Jan 2025 22:19:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c9060bccsm451648166b.22.2025.01.12.22.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 22:19:14 -0800 (PST)
Date: Mon, 13 Jan 2025 09:19:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Halcrow <mhalcrow@us.ibm.com>
Cc: Tyler Hicks <code@tyhicks.com>,
	Andrew Morton <akpm@linux-foundation.org>, ecryptfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ecryptfs: use struct_size() to prevent in integer overflow
Message-ID: <cb70e767-1498-4b5b-9d77-0270a6548ab6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems the "(sizeof(*msg) + msg->data_len" addition can lead
to integer wrapping.  Use struct_size() for safety.

Fixes: 8bf2debd5f7b ("eCryptfs: introduce device handle for userspace daemon communications")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ecryptfs/miscdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
index 4e62c3cef70f..88882f96e06f 100644
--- a/fs/ecryptfs/miscdev.c
+++ b/fs/ecryptfs/miscdev.c
@@ -325,7 +325,7 @@ static int ecryptfs_miscdev_response(struct ecryptfs_daemon *daemon, char *data,
 	struct ecryptfs_message *msg = (struct ecryptfs_message *)data;
 	int rc;
 
-	if ((sizeof(*msg) + msg->data_len) != data_size) {
+	if (struct_size(msg, data, msg->data_len) != data_size) {
 		printk(KERN_WARNING "%s: (sizeof(*msg) + msg->data_len) = "
 		       "[%zd]; data_size = [%zd]. Invalid packet.\n", __func__,
 		       (sizeof(*msg) + msg->data_len), data_size);
-- 
2.45.2

