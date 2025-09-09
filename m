Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6C31770E
	for <kernel-janitors@vger.kernel.org>; Tue,  9 Sep 2025 10:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757413798; cv=none; b=HrQc16uksaZd95iKavqsDHNVHn/bBLVklt8YwFgv9IufM8HAyplM+v6zRlCkeQ1CpVhKcifTzzt/3fPMRs3zt75erRmnqalgXlta6ip2hM+zPyxOtwrDWGoNFz4l/NBdyR9kHx5nxetGFnx8bYu6Zeq/XzdrqiNDTBg+Os6v5C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757413798; c=relaxed/simple;
	bh=IqiYlfOVbQa/zh50FAoJsm1nVp//uGooPnZlzF1wXek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f553eRnIOqHn9JaiHzVCYWyaT8oityprfHXfg/L7HBUlFilsKk/zz7ijOyR2nT59iIZAUhbx1R31b/yCLlQ2qz1hQmVyXSptMcaIdefbu55gqaPByZLkoNmt8eN929XYdP72nVJAuVajTL/9Kmj/STUCcDhKigHMCUMzO9HbCbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gZh306tf; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gZh306tf"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso4169641f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 09 Sep 2025 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757413794; x=1758018594; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o6DLuZEXjLVaECtCo3C0mHyLZL5DvcGRCHNBQ9l3dvw=;
        b=gZh306tfVI/Vb6F1+ICCiJ9FJjx0eiFQXdGI4DoGVqLhUwulNgja9VOsQU7+uZfJ9u
         fzVbWmAW9b2zEVSBiBsYOo7N4R1FpzA60DV6aAVjL3mdXZstwfuZFgUW8spzERjZujH2
         Y0eRPRLXTc2ftk8i1o/Icd8PncFZ1Jci6cO/626B3PX1BZAMsFj7DISE7mNdFWWdwJSM
         xOV3b/CmNs77mYv5a5zqtEjo26F+3AkpIuv9Z+renrVnoMS0HTVsre+suwZcpgHMJFuT
         hgjqSdnFN4ZmoIfcRBwfKsciUqWYSNeoe9OOAxtpSq9X12eu34zZKpB1O4SKAca4vcie
         ikdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757413794; x=1758018594;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o6DLuZEXjLVaECtCo3C0mHyLZL5DvcGRCHNBQ9l3dvw=;
        b=jbCGEC8AIxBWoe7mALurZNqIn2M+gvLyCdTyFMJWr700775lQoBcRJWZ/aeaLS62P+
         2cP3H0liHsl510cH4Oq/qhPPcrKZDbkGTD+vg/EBtdOnGw+3n7qjFDYrkShoEh80cNii
         9pAPwyIU2RFvXsOZ6KGqrNrKH0sPi3/p4CKOaNqYVi7rSoo8IpMcOzwS5/4RTLALe2PF
         XHN3LbKe6mLkwYdJ+hsR/lXnmXa10bb/d4CI9xt0mi1QjlbogKSngg8ehdklwwA02aW8
         654eHoljoSD8MrDjZqQ4pPHuzmG0aqsy9JQYE/Yt34BcQnj6AIRAFy1UBOilzJvFMyWZ
         7wEg==
X-Forwarded-Encrypted: i=1; AJvYcCX5vA1Uo7UE/x1KPdKOYbZFW7wNen3wj+OP0h4PzkzYE6ynPyRCehVtZdss6p5l5cMIf3w2nOQOJg0fDDuAX7o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiAgF1leF4I1f/cfRm4wuaix0C2awWm5X1hkDTJGDqe2c2FaMZ
	hbtDTFNpUHztnQlqyuGAe/L2OqxTTJjd/2CexqcnVOxkCBrXUHz7EavPSM4hT827hNE=
X-Gm-Gg: ASbGnct+s7iy+Y5Xlsx88f4i8orvVh6qeEKnlKQv1P/4FkzFJ9xx1qBBQuAj+nkPivC
	TEjzPECaxyTyyDg0AM7jxXK7jqOyvYWSacC/rsMbeYgPEEGrKLDrny8QXDKLYLLt9nC8hQ9I30F
	uTc5QwFMNi9tLibQ/QM1RVm37/i3JQ1vOG8f+8CG92q9TqcYAPVPowzMpeUHpFgqkGdlYwPlsXC
	AXYR4u9HUo9LB2QOMkmgjtXuetTJp2glXhroCOCSrAY3ZCsJs/xhnOEG1BEfIX1uPzUvZgUmWXs
	ki1m/H5YdPJjsO7hsKF19fFGCgIsymdMtMLHJ64HSiJ2KFX/Zpt4AN3qk37DztisyWEKB11bUnN
	u7QRJpxLnpw1+AJotzq6ngYII4YE=
X-Google-Smtp-Source: AGHT+IFdlL+stSgluJu4iHh99463lMmfzZUp75gWa4DtFMccsEMf3Hiqt7K4aEcp6FbjhSixFYzjGg==
X-Received: by 2002:a05:6000:612:b0:3e7:484a:741b with SMTP id ffacd0b85a97d-3e7484a77efmr5916594f8f.41.1757413793883;
        Tue, 09 Sep 2025 03:29:53 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45cb5693921sm289899335e9.0.2025.09.09.03.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 03:29:53 -0700 (PDT)
Date: Tue, 9 Sep 2025 13:29:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] PM / devfreq: Fix double free in
 devfreq_event_add_edev()
Message-ID: <aMABnic3SVnYMvGc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The put_device() function calls devfreq_event_release_edev() which frees
"evdev".  Calling kfree() again is a double free.

Fixes: 430a1845c804 ("PM / devfreq: Fix memory leak in devfreq_event_add_edev()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/devfreq/devfreq-event.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/devfreq/devfreq-event.c b/drivers/devfreq/devfreq-event.c
index 34406c52b845..70219099c604 100644
--- a/drivers/devfreq/devfreq-event.c
+++ b/drivers/devfreq/devfreq-event.c
@@ -328,7 +328,6 @@ struct devfreq_event_dev *devfreq_event_add_edev(struct device *dev,
 	ret = device_register(&edev->dev);
 	if (ret < 0) {
 		put_device(&edev->dev);
-		kfree(edev);
 		return ERR_PTR(ret);
 	}
 	dev_set_drvdata(&edev->dev, edev);
-- 
2.47.2

