Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3017A1EB19B
	for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746000350; cv=none; b=Dh9yW0YY4NUZL31dvHk+VA81B/Au4o3eQJIBv1EAA4LKlO3cxB7CHR+VX9Sz+FfhD/vzixbOYoTPFpI2TK7f2UDKMC71BXtg+P5RvtyxmkeQqovzAF2UtyUgC0D9h3Y2qz3TovQ8W2fDv9Z8eUrBHzHa/4+0l57ewIKyTO412kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746000350; c=relaxed/simple;
	bh=ZqvHfDFGxrFXdLJ27WXdmU7pM11pkbcxNPujmSlum4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1qc57mEQu1+qDUylwvv69n0iXZeZYPIJ6+dC/GAswWvqIYgg0HIYq/JL8FwcZbpFkFJbLqCuHIuT47mqDc+6yJV8z8LNQpUWnytzXWPDKeQt9mqUEvGvjy6qPupW6LRS8zlLpxrpHwGarEOwbs/pPP/WXad+qDlF3XWEL7qMDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y+iB64BH; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y+iB64BH"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so62363685e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 30 Apr 2025 01:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746000347; x=1746605147; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fqWvU5S5lLe8ZShiLr0+11SRPt/eXf13R7SasBVI7Sk=;
        b=Y+iB64BHp3do9RGctvWSKL5JTVoEk07Gt4MxTNGwIXgfHUmid3wH2LfD1oltt/Q+X7
         TdXsZOCmFYTWOd9xqsxvoti0DJUdvm1oMStYb9LecSkQbgiQl6AuvtdKqaKaCzK4gwFj
         knzsuP8bhNvrpq4gmIUYvLq7jtH6XA3bkR8hxDBLPts9V2ffXbaJMcDEr2Jxfa7wuJVD
         biMrKtHlGjMF/SPI4wArVeak52apkJ5iSOTOFu9Q7SXa6HAFDUH4hIj+I9c+O1Q2S2wL
         uRMcLidSAIxeEUfhD4JHP1slnWrNFrILL5J24VFzS5noV8loAw4jTJdppR2R5OEOM2d6
         927g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000347; x=1746605147;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fqWvU5S5lLe8ZShiLr0+11SRPt/eXf13R7SasBVI7Sk=;
        b=sjwKzAD4jjRxXfHSsxXoU/ubOK2PJHTD2pwalqL+wK58PcgxpNOq3ZBBKfehl5mvkv
         fDV69GWbzhv4HcNeahOoM6+PMtou4tqGTY5aMw1P08/qh0LK9WOuBNo5SWevEe+KPm/C
         nDlWNVeBjmvSdM/w4FZq9J/WYbp581s9pNL0rQfRp9K+wA8pdEuJA8rk6GdV3ne0Y98b
         u7KZuz6cPtmMXU49h9itISpyz+lkI3OgIYDkvnU4rqlB9DjLA+3c4/3RtTht4LoOywxp
         f+pbk1Y0PjBSggFUvV7snFtdaRxUY9dsV0IO85Qmpj6AMnee3hehy8TScDc9xdLX+Z8/
         IjGg==
X-Forwarded-Encrypted: i=1; AJvYcCXU+n0CGGLUYLy5arGwB0UHjHQFyaeTWxmyyhwEx1OqCILrqyc1isoejgdHg75R1fV0dQahfXaPZ6QevjLDrIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJTIwbViIOyPuTvfo+4kgjCQ88faMrLdVw0wR7BQTuqKw1Hl4
	//OlXs/eUs6IZM1WVhHiinaqlpP6ervhbjuxnPsX6IXymcyQDnUptHciRS1GixM=
X-Gm-Gg: ASbGncvKj/HyRkufVHc46TGrnlbnWkj7KffC08prf6PkuMkCSs8Y6SGZ6nnstId7gvB
	innn8KnX6B389jbIN/sE2UUlZDvDPI8E2ZY0UIC1itIVnt+mzbzHpPFD1MTWCYKfkAVuUcMT0bI
	UsC9bquhcrPEl+SI0+zA4I8p2JQrTV0N5i6syHf4V73wI9ylG4Bg3KOx4JLocDte6NMxHERykKV
	9kmE4Rq5Cw/wMQuyl3lpFFlT7Wosf02p58vbmQabTa5HQ7jwfsSJVBnrSM0KQPQD9Rs7E/vkCa+
	woa3JgnraH2jdl/SEHLkkwFbV/FId4B8vng+gYEyoIP57Q==
X-Google-Smtp-Source: AGHT+IEDP4j6PWm+SFGfBw5+tbnB8EDT0CQ/gUZjNaKthvdfQEhiUCvSW6a6RsNFm+kY0bY0w89Lqw==
X-Received: by 2002:a05:600c:5246:b0:43d:49eb:963f with SMTP id 5b1f17b1804b1-441b1f5bdb0mr13183955e9.24.1746000347523;
        Wed, 30 Apr 2025 01:05:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2bb3f34sm14911025e9.19.2025.04.30.01.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:05:47 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:05:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Frank Rowand <frowand.list@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] of: unittest: Unlock on error in unittest_data_add()
Message-ID: <aBHZ1DvXiBcZkWmk@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The of_overlay_mutex_unlock() was accidentally deleted if "of_root" is
NULL.  Change this to a goto unlock.

Fixes: d1eabd218ede ("of: unittest: treat missing of_root as error instead of fixing up")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/of/unittest.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 64d301893af7..eeb370e0f507 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -2029,15 +2029,16 @@ static int __init unittest_data_add(void)
 	rc = of_resolve_phandles(unittest_data_node);
 	if (rc) {
 		pr_err("%s: Failed to resolve phandles (rc=%i)\n", __func__, rc);
-		of_overlay_mutex_unlock();
-		return -EINVAL;
+		rc = -EINVAL;
+		goto unlock;
 	}
 
 	/* attach the sub-tree to live tree */
 	if (!of_root) {
 		pr_warn("%s: no live tree to attach sub-tree\n", __func__);
 		kfree(unittest_data);
-		return -ENODEV;
+		rc = -ENODEV;
+		goto unlock;
 	}
 
 	EXPECT_BEGIN(KERN_INFO,
@@ -2056,9 +2057,10 @@ static int __init unittest_data_add(void)
 	EXPECT_END(KERN_INFO,
 		   "Duplicate name in testcase-data, renamed to \"duplicate-name#1\"");
 
+unlock:
 	of_overlay_mutex_unlock();
 
-	return 0;
+	return rc;
 }
 
 #ifdef CONFIG_OF_OVERLAY
-- 
2.47.2

