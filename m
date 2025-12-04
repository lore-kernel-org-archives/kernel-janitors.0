Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD330F53E
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Dec 2025 13:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854426; cv=none; b=m/R4ElKbxrdZQpNifh6/sYRwRHsfTYlspkhZk7xi2PrzAhaM7RoRnnnF2fNnXQch7sXvUM3YBdWknf6V4ZkPkmg2ivB9ExadtYUtSwAARdZKkN+h1A5wc/tp5fy+wl3GWI45hMfp+sla8lm90s6nEDWImDMgrXUQHv154TZt+wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854426; c=relaxed/simple;
	bh=OFaIA1I59QW0DvuDmnApT5r5ZexFus+R8cL8PVWTZ6M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nU+clfQ+fIeJTsHicE4ppGjYrAlulRyFMRnoS6No6Wv2TVd34TD9quWws4mmhvzYwvfSM9hOxkY8nbTcKk2Ol76LdoXzLsubiqcgBW776i/Y8BtwOC4XL58Au3McODMkdgHvjKAf5zvFJEEkB6A2ikizbuVSLpnW/DwVcdT5Ve8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t+M4ZVWa; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t+M4ZVWa"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47774d3536dso9329435e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Dec 2025 05:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764854422; x=1765459222; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YklG8feiR5FU/k+rcsWunlToF1mBL/k2qOqrOj6/0mM=;
        b=t+M4ZVWanji94pDQm3+fvjHThh4kkc/5dkHjhNZjKqtC79y60L8Ns1pEHSHS+QxUQB
         uomUHEkSgJxUQ0lNFOqlLDJWEk0mtkx/qNqpx7tnDXRUGAhPahIFh359X25riVz7Hqr7
         /3/5uAJTMzBv90hinNbIz+gDQ5zh0ElFbV8L0epJa772xPJkxuOe9Day3dF/ZJqhRH7P
         bYy6mHFUlb5L55XcRGyb3Akale3/kqEcM+nN6IH52fCLyF9Wesg5z3IjHemFu0jlJ4NN
         IxyjSyeM5J3qV9SZQLQNt2H57ExgEbBSdMko3E+umGLMkf/o22K1osz82xbK15po2S98
         OKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854422; x=1765459222;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YklG8feiR5FU/k+rcsWunlToF1mBL/k2qOqrOj6/0mM=;
        b=LxRbg+v8wfmGWTfM1tg+GjRCDihRCctfUjP3758pDptE+MbFP9g7JRNDz3tc/h6zne
         ZnK26397Y7eLa+qcNOInR14uW5SbRM5ZsKyHSq0HXqoM1kPpDYLPPBZC7uriZr8e++yQ
         jvOV37Mpj+RyinCIbBTZRbMBux4s+8QJrXxAiQC2HouTNaHHd3WBab7pUau9qJvoM1Hr
         8qn/K2omh1qWZfAeb4pkLYI5b+MrG28oIEunzwWeNztOUKsFlZoxBQwBTlNGJs83Rwc4
         g0RlMn48w6b5AlxPj7K8j3bBZ1pl7spf2S7kel91SJ3njtbfffRlg1zjwoqteDhwtVd7
         KT6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcrGGxfDF28pernfEaRkUrT+9mglyqKUbcp2SJ9Pt5D/TtINiJXhh9Zg3vmWOs9FvjCX/bYKHRlo4X31S6mXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/nX+JuMGsVoOaoOtk7vM0gQrfZfKsChfBHcYtnlOMnIgxvc+
	ISgjBqddjLXlQqI0VDSH35w19JmvWEVzL/hEMv2DcYas7DvwcdMlq/ahl3w9g81wBIE=
X-Gm-Gg: ASbGnctAYli/j4ckcch4GADZvTMcD4yMwPVXxk0atYZM6h8NajRzq2sN7dLDM3hcXAC
	x4gBygzUTy+VeRn9aQ83DXWMbEjuajsCL4huiTkM0oc0PncQzB1qU7T/M5adVflQSxTOdWWp60+
	FIXz50M3qjoRgFLg4MbePU5s7ISUKfG/QUuTk+BTySVU708P2ua7EhMaLKrW6dIkPcHVpsVytGH
	lsjbY5LiJgpXPCzIMEVfIOc3gzKCNF39l5m2ewGIcDnEaT+Xn/07EvbvLI/lHfjDuUvisl5+Hd0
	fl0RAp2HG3e/wVXZ707iBqzMRIOoeVYcUoREQ/pngkNfeyGg80Bi52CC0/qFWFkYmNLRtfSfLjd
	Fqigp/6lMYwHBCLSRNXGv0hKOpY43lWcLpCTOuQBzLT5sUL1HQMZ1cgK7IrNcVKjur3N9tF6m+W
	AGJkZ6FMnKc1pShPI+82VibveXL/noh1RbNbEO
X-Google-Smtp-Source: AGHT+IFcjjEFgmXKpF7SlmgB5UtUoXukvdBKYhqBaRbor0ZYnolgBTjOqdu8w3shLE1sDh0KfSPfjQ==
X-Received: by 2002:a05:600c:a07:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-4792eb10ddcmr30456395e9.3.1764854422033;
        Thu, 04 Dec 2025 05:20:22 -0800 (PST)
Received: from localhost (h1f65.n1.ips.mtn.co.ug. [41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479310b8e70sm31237805e9.5.2025.12.04.05.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 05:20:21 -0800 (PST)
Date: Thu, 4 Dec 2025 16:20:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hersen Wu <hersenxs.wu@amd.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <siqueira@igalia.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"ChiaHsuan (Tom) Chung" <chiahsuan.chung@amd.com>,
	Roman Li <roman.li@amd.com>, Peter Shkenev <mustela@erminea.space>,
	Timur =?iso-8859-1?Q?Krist=F3f?= <timur.kristof@gmail.com>,
	Wayne Lin <Wayne.Lin@amd.com>, Alex Hung <alex.hung@amd.com>,
	Kun Liu <Kun.Liu2@amd.com>, Ray Wu <ray.wu@amd.com>,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/display: Fix debugfs output in
 dp_link_settings_read()
Message-ID: <aTGKkpf2p-Dqg5RL@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This code passes the wrong limit to snprintf().  It does:

	str_len = strlen("Current:  %d  0x%x  %d  ");
	snprintf(rd_buf_ptr, str_len, "....

The limit should  normally be the number of bytes remaining in the
buffer but instead of that it's using the number of bytes in the
unexpanded format string.  So if any of the numbers are more than 1
digit then the output string will have characters missing from the
middle of the output.

Normally, we would do it like this:

	off += scnprintf(p + off, buf_size - off, "...

Also we can use cleanup.h magic to free the "buf" and
simple_read_from_buffer() to copy the buffer to the user as a bit
of a cleanup.

Fixes: 41db5f1931ec ("drm/amd/display: set-read link rate and lane count through debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Not tested.

 .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 94 ++++++-------------
 1 file changed, 31 insertions(+), 63 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index cb4bb67289a4..028dfd0aa43d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -185,72 +185,40 @@ static int parse_write_buffer_into_params(char *wr_buf, uint32_t wr_buf_size,
  * check current and preferred settings.
  *
  */
-static ssize_t dp_link_settings_read(struct file *f, char __user *buf,
-				 size_t size, loff_t *pos)
+static ssize_t dp_link_settings_read(struct file *f, char __user *ubuf,
+				     size_t count, loff_t *pos)
 {
 	struct amdgpu_dm_connector *connector = file_inode(f)->i_private;
 	struct dc_link *link = connector->dc_link;
-	char *rd_buf = NULL;
-	char *rd_buf_ptr = NULL;
-	const uint32_t rd_buf_size = 100;
-	uint32_t result = 0;
-	uint8_t str_len = 0;
-	int r;
-
-	if (*pos & 3 || size & 3)
-		return -EINVAL;
-
-	rd_buf = kcalloc(rd_buf_size, sizeof(char), GFP_KERNEL);
-	if (!rd_buf)
-		return 0;
-
-	rd_buf_ptr = rd_buf;
-
-	str_len = strlen("Current:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Current:  %d  0x%x  %d  ",
-			link->cur_link_settings.lane_count,
-			link->cur_link_settings.link_rate,
-			link->cur_link_settings.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Verified:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Verified:  %d  0x%x  %d  ",
-			link->verified_link_cap.lane_count,
-			link->verified_link_cap.link_rate,
-			link->verified_link_cap.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Reported:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Reported:  %d  0x%x  %d  ",
-			link->reported_link_cap.lane_count,
-			link->reported_link_cap.link_rate,
-			link->reported_link_cap.link_spread);
-	rd_buf_ptr += str_len;
-
-	str_len = strlen("Preferred:  %d  0x%x  %d  ");
-	snprintf(rd_buf_ptr, str_len, "Preferred:  %d  0x%x  %d\n",
-			link->preferred_link_setting.lane_count,
-			link->preferred_link_setting.link_rate,
-			link->preferred_link_setting.link_spread);
-
-	while (size) {
-		if (*pos >= rd_buf_size)
-			break;
-
-		r = put_user(*(rd_buf + result), buf);
-		if (r) {
-			kfree(rd_buf);
-			return r; /* r = -EFAULT */
-		}
-
-		buf += 1;
-		size -= 1;
-		*pos += 1;
-		result += 1;
-	}
-
-	kfree(rd_buf);
-	return result;
+	size_t size = 1024;
+	int off;
+
+	char *buf __free(kfree) = kcalloc(size, sizeof(char), GFP_KERNEL);
+	if (!buf)
+		return  -ENOMEM;
+
+	off = 0;
+	off += scnprintf(buf + off, size - off, "Current:  %d  0x%x  %d  ",
+			 link->cur_link_settings.lane_count,
+			 link->cur_link_settings.link_rate,
+			 link->cur_link_settings.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Verified:  %d  0x%x  %d  ",
+			 link->verified_link_cap.lane_count,
+			 link->verified_link_cap.link_rate,
+			 link->verified_link_cap.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Reported:  %d  0x%x  %d  ",
+			 link->reported_link_cap.lane_count,
+			 link->reported_link_cap.link_rate,
+			 link->reported_link_cap.link_spread);
+
+	off += scnprintf(buf + off, size - off, "Preferred:  %d  0x%x  %d\n",
+			 link->preferred_link_setting.lane_count,
+			 link->preferred_link_setting.link_rate,
+			 link->preferred_link_setting.link_spread);
+
+	return simple_read_from_buffer(ubuf, count, pos, buf, off);
 }
 
 static ssize_t dp_link_settings_write(struct file *f, const char __user *buf,
-- 
2.51.0

