Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D2D2D1F44
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 09:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758188755; cv=none; b=LWcK+VsMVguslhUMKuqZWfBoWtq8o2FZ/FA8cHxvIDA1jlSs5FDz3XGUXLms1LiZFMJTFGuyoC3Uk2/bSu2qOGTJQznDell6X1c92bihXMQAD7ZGki19jWsgxCBk7q9FOGPs+IpbdJU1bMNSRyiI1KHmbWMBW3yxFM6RMxuRoWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758188755; c=relaxed/simple;
	bh=JoL6E2/9aXfXnQcGR6Zu0injdoly1JOaaGDXQAf0txc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gXv2qmawh/kWQaUpJRIYOmnFRM+jeFFNRwXF9X3p5VmXlJOt0xy1FwRUEHQ15OCbYevlzCXFmcQH9Y46FRHG9gaTTcf9+GaCcjPIoNIaelt9fCN9spZA1d85eVYeTXDpMxX8+HZzg8Ff4NqNybw12zRbxwnhhnOOlASHU8E3Mfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kpIaJive; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kpIaJive"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45dd513f4ecso4955465e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 02:45:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758188752; x=1758793552; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7IBogLcogZtqOzPSFPIn7J8AJq9IuoFrHlKGrmKVoeI=;
        b=kpIaJiveFjL9cP8DJTNPybUcDI+i0gd/iQV7B0nJuZKzeeEXOcWjAWcvF7gDXw/NC9
         sQh57aaiAKvjTixO4lTpag/AwR8gh197SE3yyYwH/xRJ5qJ/QVCQ8Q1Y+aEeJP5U2r5M
         yC9vzjdJurmmObp6WmywgFBl8MtHWBieU/D1gd3MfUD4OtQ3i3qDW04YwUNOs7DVAJJv
         hxV/ggOe3c6KVlLrNfFu9UTdR1LkcyL5pAP3XDLbSSE/W7IlUzGNx0IwTI7jBTtXiCI/
         h5ZEOYr5HzFPDHdBhK84H05Cpu+oLR43tYaNwqUonpJhpyOUta5NnlANu5qWyU+Gh03h
         5eSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758188752; x=1758793552;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7IBogLcogZtqOzPSFPIn7J8AJq9IuoFrHlKGrmKVoeI=;
        b=QtzQc2tVz1KeVgXHFMdR6Ere9EygMQK5ietL5KKDh3YIVTsyDNMC3dp1V2h7nAeNVM
         Lz6eDgZvDkb43KeHQv2SOvZpQgSj0sxQs9NOJoFN8zpWhfKzMdTFSUnTlUY65cYggk6W
         amroTseJy7QTCd5+w3HpowWLec1CIlKFZuxYNJya6VBcw8vuP2HAa1y9SZdM+8huYeOx
         y68bta2XG5KuAwZaSTce4BCjiZB/hAPCavRnEuapWV+izVvZ3/0h9+CHq7tJQQUMp0om
         e9VKFB+Vs/wn6AnZIucs264sES9AjxmAPlXIjCfLZDkuJOiVf9A/GkQrhChHCAKjjey5
         vGQA==
X-Forwarded-Encrypted: i=1; AJvYcCWPq24xsAD9C9U37NMYnVkGPckip+cT59b67bkFJG8vtfmcT9sFjgbngq1h12Bi33NuWlb8bBbVcbQJCg6HRSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyddaRfinV6l3Ji5Z5YzXM2PdjVzySPQcT6GrRQWWLPtU2NsM5d
	JITrMeGVyA8Ln9NFeUvi6L4uzJ5wDrVhufJ1UGebiqXMbOpLSSO+EGpj4MPTi98fyWUKHwRz39p
	8paB8
X-Gm-Gg: ASbGnct6TW6IBdlE+Iir+yHHRtUjil7Rv7kk1rrE94SUZfTV8UltrIMFNtenizk/TgR
	WMI3rz61xOwh+7psX2Km7YveH81BdeGw23ckX9SJKOE8Te+JqniMxVjxIIddCGHH5DQzzCDfyaw
	Gljc0U6yRxgVyD98PCBGKw0l/vKGtEHi2fxKqtUDvq4OWW4mIT/PyHBJ6EJXZzbAKkXD25BSuiB
	H1HQA/yIZExLALJs5TbcCU5DWDjqNtAZK9SX8VIIcZxXZOF7FB0ZzXLm0h3mNsUuYoS73akxTAS
	G6tik/Qz/sC2JFZ5eWuoRgd5BjwhzUiBsPW6/1rUhEW8mx5GCSukbXLOWn8o/fW2sPcim3oI2nu
	rg1kQ+XSjpGWETNReRbTj9zNE4frrZxGBXGytchTf5D0hMDEeTJjVhgEj
X-Google-Smtp-Source: AGHT+IHq3gu7gXUOtzXhMpgJNwrndnSsGHz+f4WtVJeNQ1ESDCp+aiPn30y5ccNPJPYcrqJVmUrWTg==
X-Received: by 2002:a05:600c:1d08:b0:45b:9a7b:66ba with SMTP id 5b1f17b1804b1-46202a0ee42mr49387965e9.14.1758188751408;
        Thu, 18 Sep 2025 02:45:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4613186e5c7sm83783115e9.0.2025.09.18.02.45.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:45:50 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:45:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Fan Gong <gongfan1@huawei.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Zhu Yikai <zhuyikai1@h-partners.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] hinic3: Fix NULL vs IS_ERR() check in
 hinic3_alloc_rxqs_res()
Message-ID: <aMvUywhgbmO1kH3Z@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The page_pool_create() function never returns NULL, it returns
error pointers.  Update the check to match.

Fixes: 73f37a7e1993 ("hinic3: Queue pair resource initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/huawei/hinic3/hinic3_rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
index 6cfe3bdd8ee5..16c00c3bb1ed 100644
--- a/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
+++ b/drivers/net/ethernet/huawei/hinic3/hinic3_rx.c
@@ -414,7 +414,7 @@ int hinic3_alloc_rxqs_res(struct net_device *netdev, u16 num_rq,
 		pp_params.dma_dir = DMA_FROM_DEVICE;
 		pp_params.max_len = PAGE_SIZE;
 		rqres->page_pool = page_pool_create(&pp_params);
-		if (!rqres->page_pool) {
+		if (IS_ERR(rqres->page_pool)) {
 			netdev_err(netdev, "Failed to create rxq%d page pool\n",
 				   idx);
 			goto err_free_cqe;
-- 
2.51.0

