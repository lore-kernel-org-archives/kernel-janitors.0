Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DD974438
	for <kernel-janitors@vger.kernel.org>; Wed,  8 May 2024 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715154192; cv=none; b=eOxlssJdVLEBzbzjdU/ZriHe//rMpaDse2DH2xIo15aCt+RPQ+hPX+RT/PZvv6zX1Km0teSInbrvJZmyTEx2utV3CVvAbU+WNfAy6Eyz0YYHAbCiNBOMUi3mOQloszZsuPTWqc9c8OLvE1rF1qMSq8r0yf34yTox/CSS96kVxgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715154192; c=relaxed/simple;
	bh=/K1XcnvsP30yWA0TcnD+ptMLyVHuWtcwczM/qqCTSuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nhTouRaQZcJcrPeWKnCQxaUDBTATyc5h71EBHmMaEVEj7r2fl9EepTuENDl6KXxM7OxVSjfUSZPkJMbxlqVK8z7q+QR9Ln/18GlHY/TBT9+pH64jHwNLrwg++VVqgY4YNBfNZPt4A8RI4nhzEphDLj6ciA4cFwgJKws51UmjUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=s0XZMc2G; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="s0XZMc2G"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a59b49162aeso862673866b.3
        for <kernel-janitors@vger.kernel.org>; Wed, 08 May 2024 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715154189; x=1715758989; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Xvw3cr1RyoF79KTdx9ez6z4+coEhpvNMvaOv4mOPeY=;
        b=s0XZMc2GVH22ks4YW/y9FPtu3ksMTX0NzWUqArMM+TJbCin0u+ZbA5v2jepTYcoDZb
         xJwoHnQv2xQpfmolZJYv7KG5bpqnk/flQhtkeK0uxWVOdSl+rMKE1X2LHxom6ZeOXeEs
         P+ta8V69/xFisEeyC5Zf8uyRF+fLJUph9H6e0Mwogo4ReNt1jue96wLPlSbPG9Wk2CAg
         pSiZt3aVjw6ZWmTihBw+Owr9Jhn/4bXtwIbOellRcBLA56SEf7R7U/9cgW8UH9gB3hA8
         gOQzxdoBCAuBcVIEwNgreJAB+grycZLaDZ13i/zqQujZNNmHd53wUl+EsG+0wRoteZcs
         Witw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715154189; x=1715758989;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xvw3cr1RyoF79KTdx9ez6z4+coEhpvNMvaOv4mOPeY=;
        b=Sg/Pq1bvknjNjocrpXO4PK5FNK88RvFreWT/vgJwOTFMQuE7OH2/T7DCXeKpZKl7W7
         woVpX0/lGH6k+WZJl/Uwjuu9n/xmAw57sHbqY2WUmTfLkEEr7Mso7TgKQg8H6RfFP6ff
         +++ahn/rHyLtqMFXN65Xq2fB13bJDUu+s7VivFnKhjna3z2ZvwE+9+0yldgO1DVpTbJh
         w6kZ+aTSVsLdW7Rj5wjjHyMdFniDHIHxZ11tULi5BMngYuFt7ThieNWUiViPHlF/VIJd
         i9sPE97uqYsLkyP0SdmcYq9+mvx3UB8WJBc0ch5mrLYvyh7bTszTp++LIhGajlOfFtJd
         pjwA==
X-Forwarded-Encrypted: i=1; AJvYcCU/1azYo97D/k4URakO3lonNAXaENRiJwuE+JE6ljcUGXJhE843Pi4W7qJcgImOVBAZ3qsmkQGBToRgLpN23iJn8eCYpRgSmhX8z9/6ysHj
X-Gm-Message-State: AOJu0YxYNyp5IpOSdT4q3d4adDKDyIvPa8wYLgLpwIZFtbs3GuT/xy32
	NcIatFgScT96xS98wr9IYaB3bCDmcYx5bj8N2+vlVg2H9USYztuql3CqPc+flFQ=
X-Google-Smtp-Source: AGHT+IGNGbq3AaoeyQZEUAek7mACIMKHY6D74+bWoezKoLVMrHCzDFCvjv/4+axxxyGGJUbfgQms/w==
X-Received: by 2002:a50:8e4f:0:b0:572:78df:c606 with SMTP id 4fb4d7f45d1cf-5731da6b1e5mr1274488a12.26.1715154188725;
        Wed, 08 May 2024 00:43:08 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id q9-20020aa7cc09000000b005725d859e4esm7328022edt.73.2024.05.08.00.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 00:43:08 -0700 (PDT)
Date: Wed, 8 May 2024 10:43:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sagi Grimberg <sagi@grimberg.me>
Cc: Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] nvmet: prevent sprintf() overflow in
 nvmet_subsys_nsid_exists()
Message-ID: <25e9c58d-d192-4a91-ad40-4c2ea01fbdf5@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nsid value is a u32 that comes from nvmet_req_find_ns().  It's
endian data and we're on an error path and both of those raise red
flags.  So let's make this safer.

1) Make the buffer large enough for any u32.
2) Remove the unnecessary initialization.
3) Use snprintf() instead of sprintf() for even more safety.
4) The sprintf() function returns the number of bytes printed, not
   counting the NUL terminator. It is impossible for the return value to
   be <= 0 so delete that.

Fixes: 505363957fad ("nvmet: fix nvme status code when namespace is disabled")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/nvme/target/configfs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configfs.c
index 89a001101a7f..37cd75ff150e 100644
--- a/drivers/nvme/target/configfs.c
+++ b/drivers/nvme/target/configfs.c
@@ -757,10 +757,9 @@ static struct configfs_attribute *nvmet_ns_attrs[] = {
 bool nvmet_subsys_nsid_exists(struct nvmet_subsys *subsys, u32 nsid)
 {
 	struct config_item *ns_item;
-	char name[4] = {};
+	char name[12];
 
-	if (sprintf(name, "%u", nsid) <= 0)
-		return false;
+	snprintf(name, sizeof(name), "%u", nsid);
 	mutex_lock(&subsys->namespaces_group.cg_subsys->su_mutex);
 	ns_item = config_group_find_item(&subsys->namespaces_group, name);
 	mutex_unlock(&subsys->namespaces_group.cg_subsys->su_mutex);
-- 
2.43.0

