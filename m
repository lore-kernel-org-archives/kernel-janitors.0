Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E59E1D0DF5
	for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 19:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675832; cv=none; b=ql7qqv4+qXsPXhg9HghOCXkbxUT+YGPkaLOAeSDUU7z8YINGMW7P/vFZY4B8VxxDLT6MQSw9hQkFIKUJi+2xGYUnIhONXzhkukgcESojrjX6xbYtLaFT5t8MNjEz7f/ZhzulVVosDVSma2FvfVlJpEVLDjDs5lXv9fLiEni331o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675832; c=relaxed/simple;
	bh=HiP2jOYwlaN68o8fGVOSlLIUh0g94c1H626IWPYeMaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Oggpya0HwjIITYp+9ErW72MjWf9Ag0Ha3965OxmSMAav0W7VrUvjRn18MXi14S37MBwVS0YOPi3pVZBbumFAsVk+AdhIVWQ+VuPElYGldXsoFCBBgnxd4ST3MolK7u54nye3Led9cYgAQcC+1AbBXCfT64nxMUZpUbF2jHEFQU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzDSImMX; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzDSImMX"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37cea34cb57so1447393f8f.0
        for <kernel-janitors@vger.kernel.org>; Fri, 11 Oct 2024 12:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675828; x=1729280628; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=snxiN7FRdAtoQFX+9wj1Js2TBnmcNUFNjqb40Wms3JA=;
        b=MzDSImMXLs6LaRdCpvtEeqnd735C5Go/xkpg+mTtaUjmqjMFMPugGnq2YKPerU2pRb
         buVoZD+42JuYLgbIbHvJ3XQixjS2z+DPmtWC3ZbNSR813efLU3eLdeT/ckwgXOJePJe7
         IKZ0KozpYIN2iYH3C8rRaQTxN2lRXkInYKbh+ibc8bKliCm6FFfRh16+1Q9r58F2rsMI
         FaOBimBwPp+ELhBOsQyQuf3gyFTAh5vpBY2Zv4EP7tzrDZjCreTrGr/gQp4KCyg2C4Sk
         mWj2Jj/BQhsWynTgRV3lglYQUtxTVTMxkIL2h5gm4CRsGcsxy3EkRVtYsgm80ORJTmcr
         bu9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675828; x=1729280628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=snxiN7FRdAtoQFX+9wj1Js2TBnmcNUFNjqb40Wms3JA=;
        b=ubB8ui4dNAS/+aZnyfe6jeLL/geS0SN0B/w08hXQKpLMQUJaY4ZGBOvdYWqVv7NvcR
         6I9SuOo2KiqcSwPo71sRdBKcnKunFPhGYbbx8WnVmuwp65IYM5K7L8N5PjRSlRsEo0k6
         LpXSuP9aY1fWFNB9Lg0YHachaNHBAcgFALs7Yednkoz8UXBCMcjREDd2lSc1+L34GylP
         7SSbeZO8j5dS60EHp3+REQm6YzPzYIdDfiyb+sCCQcimHCJPh91buKHtFzbhqhPkUErv
         VyYpDTeUWv0bN1OWKH42/zNyFtYSIYd+eExcQAa75GB5n/yVafxa3SLsHVWcA6B5IAiw
         B2BA==
X-Forwarded-Encrypted: i=1; AJvYcCVSaM4UxAqrvzNad6IBXyKOHRITmAJIdUb/Vht01z2Zd8wGDJiN3czknq3N8muCAEaXn/ALSkgRYFwbNk3GMH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlFadjr/ceIqZe7z0J9Qm2HKp269EKwkedb0MGE9zJjfNvpZlT
	boJZFv91JzANbmQe6LBBL7ccDDajfQK4Ywf62dS64YblsMIpeQ38Ouvlf/B5LJg=
X-Google-Smtp-Source: AGHT+IGqnlRZZDSw4G70Cr1FwcKYeBF9aBQnwl7GGMEcvuGtDm0ChmM83BRDyWQouKHv719pFKBvZg==
X-Received: by 2002:a05:6000:18a7:b0:374:c92e:f6b1 with SMTP id ffacd0b85a97d-37d551b9788mr3103211f8f.23.1728675828472;
        Fri, 11 Oct 2024 12:43:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d885sm83769715e9.46.2024.10.11.12.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 12:43:47 -0700 (PDT)
Date: Fri, 11 Oct 2024 22:43:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Theodore Ts'o <tytso@mit.edu>, Ritesh Harjani <riteshh@linux.ibm.com>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ext4: cleanup variable name in ext4_fc_del()
Message-ID: <96008557-8ff4-44cc-b5e3-ce242212f1a3@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The variables "&EXT4_SB(inode->i_sb)->s_fc_lock" and "&sbi->s_fc_lock"
are the same lock.  This function uses a mix of both, which is a bit
unsightly and confuses Smatch.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/ext4/fast_commit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/ext4/fast_commit.c b/fs/ext4/fast_commit.c
index b33664f6ce2a..e4cb1356e9b6 100644
--- a/fs/ext4/fast_commit.c
+++ b/fs/ext4/fast_commit.c
@@ -291,9 +291,9 @@ void ext4_fc_del(struct inode *inode)
 		return;
 
 restart:
-	spin_lock(&EXT4_SB(inode->i_sb)->s_fc_lock);
+	spin_lock(&sbi->s_fc_lock);
 	if (list_empty(&ei->i_fc_list) && list_empty(&ei->i_fc_dilist)) {
-		spin_unlock(&EXT4_SB(inode->i_sb)->s_fc_lock);
+		spin_unlock(&sbi->s_fc_lock);
 		return;
 	}
 
-- 
2.45.2

