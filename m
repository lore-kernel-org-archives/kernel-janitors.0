Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BE910A33
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 09:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RzHNCCpR"
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B632E12B
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:53:58 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2c5210a1515so79154031fa.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 02:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698746037; x=1699350837; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qWALiZD+LmJgzXNjW8ZH05nKNc7IXtVIX8FUs6lSTpo=;
        b=RzHNCCpRDGl9QEd7IqwaCc9hYr9IA7qwXQeozLN4KlQk7MaeyHJXg995kATOGkdBrd
         zJ/49TuYnzsJMESiva6E6DEUVNv9I8N9OpRXdJJyoyyA97FAnJKg3iMuRZd7SFqOc0P/
         RWigy2pkHEqCjyyI5KZr51eEzFSmq7dIegk6gpNE/fFUsnc0mkRCL8jwA7ssgpZPdA4D
         XGOV4k8uuBrhnnqOoIjTY1LiAMdivh8CloZwywJiHHG0zBSCALdrTI36Y9Nebm4gHLet
         GTeJr5xjPXAJPTqAONQNI5biTnvgJ/dFXyuwHkFhaGu6X2ZU9dDig/LUDpXgrvNo5vF7
         oARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698746037; x=1699350837;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWALiZD+LmJgzXNjW8ZH05nKNc7IXtVIX8FUs6lSTpo=;
        b=e6xIr0Avcro+JH3RIh6bD69DTe5v9LbwYfO7P4mu4Js6OguZsA4FFi+mTuFGnUBBoN
         +UMeSVx0qMOp3gyHp5QHYV1rpIanHAiCiNZr09u+cf/htrFwfDKJ6AGw5k3Ogmiq+iJH
         Id6nRlx/Qhx/9cdaUJJ2Q52SpjIu/OmS+beD/yIubKjlsSrVxq6e8XX01yTi0IEZMdZy
         wzQKQvNaZyrKnTgyvy4WFycH7cK5KYUGkrTE9NMngQdTzFIV+NL3rMlutuBHB0ZW1xEm
         Q0U3IVHzVRvLp7m8l0iHeY5q7MGvpJnXzqLPUBrbnLBNu7zTYzfvnTgGCm6+KhUAyF1b
         5Z2w==
X-Gm-Message-State: AOJu0YxfKEsPIHsf7t7HXoZXHiLc7iaED3bNBhb+Fxhc3qeEL14CQRvY
	Od5VHQeePOgxEbTDq8tty0JH6Q==
X-Google-Smtp-Source: AGHT+IEHXsb4rb/FV413wamIK0APOt1PRUhvDkv2ZnekSu6wmtFA8saDU7XHHx5zCQF4/tqmP/At7g==
X-Received: by 2002:a05:651c:327:b0:2c5:15a5:826a with SMTP id b7-20020a05651c032700b002c515a5826amr8672532ljp.19.1698746036880;
        Tue, 31 Oct 2023 02:53:56 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id ha15-20020a05600c860f00b004053a6b8c41sm1225323wmb.12.2023.10.31.02.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 02:53:56 -0700 (PDT)
Date: Tue, 31 Oct 2023 12:53:52 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Robert Richter <rrichter@amd.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Terry Bowman <terry.bowman@amd.com>, linux-cxl@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] cxl/hdm: Fix && vs || bug
Message-ID: <60028378-d3d5-4d6d-90fd-f915f061e731@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If "info" is NULL then this code will crash.  || was intended instead of
&&.

Fixes: 8ce520fdea24 ("cxl/hdm: Use stored Component Register mappings to map HDM decoder capability")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cxl/core/hdm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cxl/core/hdm.c b/drivers/cxl/core/hdm.c
index bc8ad4a8afca..af17da8230d5 100644
--- a/drivers/cxl/core/hdm.c
+++ b/drivers/cxl/core/hdm.c
@@ -146,7 +146,7 @@ struct cxl_hdm *devm_cxl_setup_hdm(struct cxl_port *port,
 
 	/* Memory devices can configure device HDM using DVSEC range regs. */
 	if (reg_map->resource == CXL_RESOURCE_NONE) {
-		if (!info && !info->mem_enabled) {
+		if (!info || !info->mem_enabled) {
 			dev_err(dev, "No component registers mapped\n");
 			return ERR_PTR(-ENXIO);
 		}
-- 
2.42.0

