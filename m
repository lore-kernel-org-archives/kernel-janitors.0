Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AC917BA1
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 22:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752620388; cv=none; b=WFDt0ubnCsolxljtywbf346rCPZ7KWKzhLyeMw9mCGfaqAc7nDI2AFjosSoN+8q/ASO/PHAOcSVGvG7d9os3M1LQ6LI23JE+IBBRVjVMyL1s2FWr6qyOTnwFP3LB1WSk7Fr+fLfLDwJl5X70pzRa8GRiD3xXW1BdVTUgs3KvHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752620388; c=relaxed/simple;
	bh=ZW+wto4d4xM8WCNkguom32Y0IH7jAjN9Rw7cTLBj1l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ac/McIUtfD0zglFVz1LRW5QeYLM3733yOyCjZa/gog/mPMzJVquMmUSSwXw/U3G4Kj4quib31Xz+ixUy98Hn+X6G4KupS0X2e5DObqFVPyWRhu/q5SkR8CVepzvdaFdHmv78ubtBHpR5I951V19Q3cmuc1+pH6ka3ZOjXfJamHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jKPEwoBd; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jKPEwoBd"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-73ce7b40d7aso199071a34.1
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752620386; x=1753225186; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
        b=jKPEwoBd29unWcHKre1NeVr4NF+frN5o3/wJvS2q5MmwmJlcigrPm/iTu9AE70RB2l
         UtKNdjWkDGpGLZ+aqlJ+6HZOfRyC1pgeHki6M55H7b1/f9q5U1vkxZaVlJB804EcxIZn
         K24ok7DDbt6nHyXMd6JNkpXnIsU+I0rer2tCvTxeFblZ+PIq4JZaLZiJwb4cZb3+eN1m
         /x2RWSJUTAtQvyyzuMMHFEKJcGgCxMhQGrd1zRMi6V6LIXj9H02IZBinTsqOc4wwvpfH
         twgizSDnVswRU2hYLtYB9b2dEXICUlKBRn2QwaC2p9rJEQqYvKXnLdp4ci7T06hBw9Mr
         XkHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752620386; x=1753225186;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OFDftDinGJeWeNvMt3z+fTzSOMnuJXF888WFq+QttdM=;
        b=IYP6u7fS05TkfRMeNXRKEtkB/dDQzo1XmKS92EayzsnYJ4BQHiz7xXieW/KBOZCDeD
         LvwzkEr4u7J80t58hz2TovdanBof9EGLvc6cY2EVlGqPbvtNQt84iL3KqeZ04OiIQUBR
         ojBoylzJCuRLHSoaHC6ZJ2jFYy4AIcp6cUNj2EUp8LmfUEaDPgbIcRbLF4tJE+v1oiwY
         Ta3xakHYpO8z6zhGOXCCnHyWBk3qXwxU7/CFuD/iaSPy7qOkJhLmK9rTo3WqXI5PT61T
         cO2ufy3IMtofZPgjbdEvVd2myLaF/rhPhVsUnTyDC09Da0mrUihaL61b8KiUP4h7xBp/
         pV1A==
X-Forwarded-Encrypted: i=1; AJvYcCWy1iOPohVDbm8yVEjhDH99pTxsKJCL7TDgl700ErO96djc2drZeNSQAR95sCdh3VzSARY2fOlVw4TJ5tGNrLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzS4IjiZkW8i7lcz8uOKO/L5FmPR2pTp6JUSadVn3RmFrLnqF5
	YsPU0L4YovNrWBOg1thkfskeIDAsxy6LxdCu6jws6TIgLIIjTyFyEYJKk5LexDci9gA=
X-Gm-Gg: ASbGncu5YCyYOArLj2PsleRtINL7YIUhZl5ylLSb254xRp3kIu5n5JuAUFEVcKfBG4b
	yK5GDgLs0gsJAMek3s4WhZiNoD2Xx5dAkppWTyBrY4HwVOwocU/smUhpUc6tSy344MIbzMjjSY8
	aEt6oIE61YNaKJXEz6c40c6T9qwb+Lk8MBrJtcnZh5NUwuS4pwxN1e17nqM0XbZ0NGlxRdN8KFo
	0y2vq2K2qeZAlbQA6VdYkdHaDocXX/x7kGQ3Jp8mDPWygqPldtl+6q0bylYcQyMzF2mcBAJvRH4
	30htmJFET1h4Xv+ZXn/EKstflt5uQgjcdmLc0fnv8WyPWEGvSkC/hjOP6a9IhFdrMQU8+8eFEN/
	ltEI+wj/upfBV/b+59OiG8ftUvQmx
X-Google-Smtp-Source: AGHT+IFowfVX3G4HjzfwSYl1lhCis63CfINpQgLZSZ3TnKOciDf8Pn3iqvnmzXQdfCjFJtdK0DYWAw==
X-Received: by 2002:a05:6830:98:b0:73a:8a05:cd3d with SMTP id 46e09a7af769-73e5734d2c2mr3545805a34.0.1752620386019;
        Tue, 15 Jul 2025 15:59:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73e541c3a6fsm1022866a34.57.2025.07.15.15.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:59:45 -0700 (PDT)
Date: Tue, 15 Jul 2025 17:59:44 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	Andi Shyti <andi.shyti@linux.intel.com>,
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/xe: Fix a NULL vs IS_ERR() bug in
 xe_i2c_register_adapter()
Message-ID: <65825d00-81ab-4665-af51-4fff6786a250@sabinyo.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The fwnode_create_software_node() function returns error pointers.  It
never returns NULL.  Update the checks to match.

Fixes: f0e53aadd702 ("drm/xe: Support for I2C attached MCUs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/xe/xe_i2c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index db9c0340be5c..1f19718db559 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -96,8 +96,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	int ret;
 
 	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (!fwnode)
-		return -ENOMEM;
+	if (IS_ERR(fwnode))
+		return PTR_ERR(fwnode);
 
 	/*
 	 * Not using platform_device_register_full() here because we don't have
-- 
2.47.2

