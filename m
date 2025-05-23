Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85379152DE7
	for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 16:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748016087; cv=none; b=YlruzsIuC3wht4u7BCASMDt0vTxdNKbHS+tNWoCSnUs2crNAS/aQxlTS0xFcH+KvStwpHbujqn4rlMDSJxQ17fUkK1TXhfSDVKES3te4xBByUsNXjeMZtNOD+rzKD/m+g+QkaTsw5t2opMpKbgQR5uceR3z1WrWHQOm48PX0nJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748016087; c=relaxed/simple;
	bh=dqiZEMAaMAT+i+xQPPAltTkTCc/jQDjYHiWPdk7ovcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5/xrR/VTMIqS6spuBG8pfY/JkLX3ORB+Xz2yVjQXv+GJH/uCN84+yd6a2I37O82AQGWYGRAnmixpe2m1JeD3dePgnIKXh6u/TBhqXyp+Bb+Gl3Bo3m5355KgeqhG7+91uQaLOnqdxV3nhgdPMKPAI2q02gHpivVaoHHIh3/Lcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bBi2hYdS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bBi2hYdS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so103303085e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 23 May 2025 09:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748016084; x=1748620884; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=bBi2hYdSaDB5q8+PD/DVueyD6u2Gt2C17hrXWWnurkaAzEL8JCBKUeZ0e1U2B+EmZ6
         F2BbADLxsvsv9U5gCIxvPm42rapK2RM/l6lSUHCk+Mb5dtOmWnOE3diNOMFbGv7z2zvH
         GcdcJ93l+QZfHTDVE3YG+s0PagS8os0Td3y7stPAB8tx8ntohA6c1tNl8ha92kValNsS
         IYAoCphr/IlYSMLPReF5/LndzLnCV5Um/5+dvzVYNtUM+WdfvIHvI3lCz2NMF2ANo7C6
         iCWYs5608QTdl679F5n/ib73AD46ZOy3cIyG6r83dvOpxjbdClpvNZLYzspelH/Mmves
         Zu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748016084; x=1748620884;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=15n3jb6X6nc1Ptss7d0u5htP58z40RIPOIkeUdClyjQ=;
        b=kmEr2b80OO/jA0Nyv6dAJuzf/RRweKXEWLbokJZ9UiNdM0fO/KWMLsKghXZ4KlOfwU
         aprXCcJ4deFZhpUw/8FBIVDIQgKPdcSkmefi87JqCMviYekwi7p2rroIum0/grhug6HV
         SIsgjO0SjnRm5pm2H2BnJ9rYrieoVgczDCLryRDLXl4aa+qPe7wy8cumPIBHX5K+MtWF
         /EEvr3ZV6e3BMvdh3YxUaGfHc1LbKr36gx2WIQAB80vPt31C3dNw9klUS/ft7uKY9dbk
         GTtftEC1+nVmJ9ptYEsdkQed8TzFoKcSKaQ8Aw3FzZSFbvkdJzciNZyW4eyXIOC/Xx+g
         hZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCWrExDMUViSosVUH4i4YQXzYRpRstQ+IlE9l3x08Aq4U+TZJrb/wLUdg7KKnXye7VYU/7jP9muHYMh4vWH3gpw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8t7tczc2L0HIhd2QFQP7XFM9KfNZCkR/Wj7YUW/n59RdCv5ja
	s2ev3NsjShS3F//2+66MDpJmKVADCNDK6YnquXEX+3g1G/tUEs1bSfMJeaPGd4sdz0c=
X-Gm-Gg: ASbGncscSGSJrCquSNZc6I+75PE1upwSDK8QbS7jkCU2CSp3l7eszKDQxki9w7/m1gy
	SQ+7L/HfANgz8RBFnpvuCv5DK+Jfdth+MwqXQ8zXuVlCla8jkxdwDF3yZJdIFv4UKFxcsWpi6nE
	PB5YY9SnvYFKzHVi204ceDJ3/pw7PgXp9jA62kfR2oZB/mR1YUhfIG3KU+ryjKGc2+vpFOcDIQj
	fCSoVT4xs+D3EKVSub6ktgiOFM90tlWjM9j34kqf9PS8Ene8QAyDmv01Fc4662ob+JQPaBoDlqq
	2S1gFW2BkUrpa4KEWJDEAakeuGq2EbeW9WCFjiRAnVydVx1ECsMk6iCN
X-Google-Smtp-Source: AGHT+IF/THP6E9ZS/GCIatMYe54LeoFTYKNGEZBFtW+dbZFIBIbOWxAiwtQRKvPBgXMHhn/LPjXNiQ==
X-Received: by 2002:a05:600c:1e1c:b0:43c:fffc:7855 with SMTP id 5b1f17b1804b1-442feffb6damr331857925e9.15.1748016083583;
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a364d2636bsm24546310f8f.99.2025.05.23.09.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 09:01:23 -0700 (PDT)
Date: Fri, 23 May 2025 19:01:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] coresight: fix indenting in
 cscfg_remove_owned_csdev_configs()
Message-ID: <aDCbz3J5wibnW60S@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Use a tab to indent this line.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 83dad24e0116..6836b05986e8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;
 
-  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
 
 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
-- 
2.47.2

