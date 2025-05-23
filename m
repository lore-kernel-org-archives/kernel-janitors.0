Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAEF221DA2
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016459; cv=none; b=deOGDQV9ZzE4PuIi0BMnO/CHOASmWKzfK+CMKUz5YoMup7Mfn4ssvdg5xnB4QyzlyiJi14kLhOUugsfug03B+oh7D9+EnlPvd9gODbUQtQ9ShTBDRZj/Qav40fu6pVg7lRv9XXwyw9CZVQQBJU3+o1zP04XHAodtJWQ2pDYiCBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016459; c=relaxed/simple;
	bh=y9OYzuX98oTB1Cnsu0UWtD1TX6DeKBLx6XvM4dg3M5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sx+WFb0lbruN4jlzfPr3ndldm4trCHROtwRBNqfp1aG73lXqUpRccDLaY+TgFnhYYrKeNzAGWa0Y6mKKCngAjrp5z6id/9gufge4kifJTL2ayA5vOUBC5wTF7krP6TDpl5rU6XFKOrbr0Lb3UlSrhbt2wPIOfpK7Pue8bNnKwoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UIwvPYqD; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UIwvPYqD"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442ea341570so65526315e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016456; x=1748621256; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
        b=UIwvPYqDiFyE0KWOHtncKn5Vw0aWT9Ti8FGGSE2yvNynG/aUXuFkcOnI3ynFslgb+7
         x7vruntiaqPwV0UG9TRiS1dTmxkPZ6OD6PMp9qelnciAi8+gaRrWJiaFcBN7BGSrpgDZ
         Kdompbog9FvQl2i6JWTyI6YL6zv1rvHTRc/A1ZoF2Bw6J7KXTXbWAXTmtzFdpCeLNssx
         qBXifebUeOGm08hLNxMr2v6KjfYihJRdt0QqeLR7RHLQhBi2YNV6OUGD9HuVJHKhGnT0
         FdnExBQIzNMwkRMFr5gtJ6FyXn/KRCw0Ok2h3lzndR/0e+ZETnyljh72xYHKMmY03kjf
         nXbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016456; x=1748621256;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ySA+I9x3ijxPrMXr+uDkaCBuOqoQX2Q5RgcLdxKb0qM=;
        b=LrElp/C+R9lErQaSXVcFtO856qvdDUeE2GQuPQuI2g0MRRtlZZiEQ4C+IrLC6D/Uy9
         5UQHMzQOzJehWqWuhRmkoXIXkYwWZg39h8Qqn7Gp6lRC367N1kyNBjxHLdrIKJT9n7e8
         1JQut4+IRKyDuW1LvmJIwPJP796OodurTMTZk84Nro3FqknVql1YZFVNBkXzLZ8+2JAV
         n27ZmU99RAeeeUr4+2dss1I3w/s9UeCt+iGJwjwtiDtfEq0eoQ9yOoPYneBkCbCYdwMM
         ujaENY2/biC/qSxpmfHtR3axS9BiUn6ESTRabJaFou1hz6Nzy4F3hZ32B7MkOko6TPL2
         MhCA==
X-Forwarded-Encrypted: i=1; AJvYcCWc3qBVADdJOgph7OOrZiEXfqq9/UuCc9QsY5KOdMBJN2kq96SBa0MpOwdNKRs8bljdGtpROx+8NEP7xQWjKcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb4XFsYPI4ZuTFS+xx8Gzp7qIpRysU8QkrEXHjTORcVJEJVCg1
	HRlWaBFH57xme9xNBiG5EQlotrwD0/EvAI1jRtX/D5Zhy0BH4cf3xb+PIJIrb9ZZ5vU=
X-Gm-Gg: ASbGncsTuQDD4nLDkZB9ELxIgojvl6AvVbE5Ow5hCuyonbro6jPwn4sb+5t9Nr8i3iV
	lWWiG2XIwIGOnfA0BBLoD9Xenqm9JkoSvBwLFhD6E2B+LHkiAtFEitNTIzcZ4DvuWrUxVZfqfZL
	IVmvvJho8DGtgM6iBDCTHqQcL5VbuTzenzz+qZnAdllwftyuS6kK9vaiW6KdLQDhK+Po/t2+fpm
	DMn3TWR2AWz4w2nqUAkz+rWCXrMeSYhTo8Ob3ItmwVrqMXIlnzKvi81/soKD33OWs6tbYlKnmwz
	OFTVNVwqsUmfZiDZ8kHnXs6JF0LmLVnWmKP547M9DO/7nNFSS86ZaJPa
X-Google-Smtp-Source: AGHT+IGofrhPwUyQkmyigwaxUlF2xUHWhAZovkrgIBPkwqcSNQYKQBTR5Syeu5oZ8hxjg03O13Decw==
X-Received: by 2002:a05:600c:528a:b0:43b:d0fe:b8ac with SMTP id 5b1f17b1804b1-442ff03c4edmr317016795e9.30.1748016455699;
        Fri, 23 May 2025 09:07:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-447f3dd94d1sm143921865e9.34.2025.05.23.09.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:07:35 -0700 (PDT)
Date: Fri, 23 May 2025 19:07:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arun R Murthy <arun.r.murthy@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
	Harry Wentland <harry.wentland@amd.com>,
	Suraj Kandpal <suraj.kandpal@intel.com>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Xaver Hugl <xaver.hugl@kde.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/plane: Fix error pointer vs NULL bug in
 create_in_format_blob()
Message-ID: <aDCdRKZHmCPwaJWp@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The callers expect to receive error pointers on error but
create_in_format_blob() returns NULL.  Change it to return error
pointers.

Fixes: 0d6dcd741c26 ("drm/plane: modify create_in_formats to acommodate async")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 04992dfd4c79..75a7e8aa6611 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -209,7 +209,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 	formats_size = sizeof(__u32) * plane->format_count;
 	if (WARN_ON(!formats_size)) {
 		/* 0 formats are never expected */
-		return 0;
+		return ERR_PTR(-EINVAL);
 	}
 
 	modifiers_size =
@@ -225,7 +225,7 @@ static struct drm_property_blob *create_in_format_blob(struct drm_device *dev,
 
 	blob = drm_property_create_blob(dev, blob_size, NULL);
 	if (IS_ERR(blob))
-		return NULL;
+		return blob;
 
 	blob_data = blob->data;
 	blob_data->version = FORMAT_BLOB_CURRENT;
-- 
2.47.2

