Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9C728A1EF
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396706; cv=none; b=JPdAPD3G+OlyTPs3TL7EE6ZcXjvlIrkKoNAQlaUxb9E+zqSrbWmo+f0pd+OMwG3IkXJzsL5wR6UclJGqR0dnwV8Y4fEWTjDtaQZFamZizQ+P3QV9oGJIVa67bX6tngw9X92RZRG6gFVrtOJwKuHLbgiRIP1QW4zEjx+DPDzPVO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396706; c=relaxed/simple;
	bh=mgXUK5sj3c48J4YiMVHK3z4CVDEbhjTcZXmPRxa92T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C8BVgdvuMXTu7WcFbc027aN/T03rimMOqmuvyn6nM/jR2SNSs2hDwEuS10WoXjpdNV7jwsHi+a22vjiJXl1I6DOx3v+CQJ/ZXLOxbCL77auc9JfXTl9ZSvBovK53c24sNgLn4jiUGjvRGPdmBZyzqW+mE8afqoadlhp4Pk9dd04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GE5MI48a; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GE5MI48a"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4394a823036so49642505e9.0
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396702; x=1746001502; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZ2BajsrO1xtArLAi+wn8MeS8GL5ES9k/0bb/t3RE8U=;
        b=GE5MI48a5yIvjSRhhHdHCAmI6xFRH0DpJlny4WaHda8yUi9QAKaAGi2zWMZIzOiOCT
         nTrgJjZCXkbIfjJIWRg4wSubem3KsHSU9fnfm5ywBWJXdpHS+DR9FFFKk6OLbYc4nb8x
         tWmTGrdL+a++spLgrTU1Kv+i/yiAR2OlyQ72PV9uVdBtYDqkwP4cNPoYlCUTChl80PgI
         y+mWupJdUY2mL4u4gUhvvLABPPvEQIedRY93ZK5Behxv/Ea/SkCL6CIKSPMlYwtY+f+7
         iCnw9KQ6NTOVvbF6+AEehMnl2N2sf9SWhoSExbIS2wPulcYXVIb2ZjoU+Zu8LeyMJVzy
         CiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396702; x=1746001502;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ2BajsrO1xtArLAi+wn8MeS8GL5ES9k/0bb/t3RE8U=;
        b=rbGG8dar8irmS+cs3OMI0FD0SCXyzrrzFtJi8EGFgEYMf0U4SNoR5MK3VUrMIrR1mT
         IV1LbJS15KUdPGmZIMgPnNKC/EHnvczaOl4BKoNl5zEQJCnI142+GNypQmsVESKiJwHl
         7VGcFxoFTrqg64I/08roF7Ypb98HkAAVqPHvKtaiVFunelcA85NKoX+LXJu2WoDC7AHF
         ygIpNquRVSckrcVvonfU9+thjmpB2eBVWLiT8RXoQs6Nsh/5BOLi8oMv5mwm+7HXe8L9
         phTB7hntGTof/tV4uZRXMwqRLGAbbA5jqbOkzxan8pgbB6iG+ojiZV+NfhOtm5jj8qfE
         Ybzw==
X-Forwarded-Encrypted: i=1; AJvYcCXUOeMOo69nTnb1rhaTgDvafVLApkCQRHDft9k4qa8ZIU4bJkiO/yaK9SlD5VeGqPi84/W97Bj/0KiWAek+Hu8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkIs/RXQXEiKEc9XtAqxV6fdV3tb50biD+q7JGG+7Dq5QYz3UG
	5v8HhB71n6aoD20SnSmvK6ITBbb/ztTnLFuuywgaofQaUJ6kcUiZH6hnX8+NAVQ=
X-Gm-Gg: ASbGncvf3uwnjhuDffZ69jeJsRjNLvP1N7aXUYCK9KBMz/ZUVcScPfo/4LTo+zruL4a
	9SAPRmqUm7gijOl7vNhZ+ZsMcroWzni/4STLU2oiHuYAloGm2gJWGXiKmU4vFYvsByI5cjz04AS
	dQDOkWfeC7KQLinYjcaNVduY22LCsGIF31Xka8p6FcQFimH3OV7ExCcc1JxTwt1SGX7x49wkDZ4
	XDQ27bXMoxfdx9HcSU664QyCd65jGWJA/rdQavlw8omDIRmPVu6PaZ60xbFvCiDZjR1WWYWNl/m
	S05K0XZJ47seQQWsUafWdOp5qYAMBgli+naJ7tNRkeQiww==
X-Google-Smtp-Source: AGHT+IEOsr2GYu8CB0C6z+X52cXEurZZkRfa4SYjeQ2F18Db0W+Om64FqFyMx1yp67irQ95BN9CpFw==
X-Received: by 2002:a05:600c:a009:b0:439:9b2a:1b2f with SMTP id 5b1f17b1804b1-4406ab8144bmr182156015e9.3.1745396702371;
        Wed, 23 Apr 2025 01:25:02 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39f069df9fcsm12706005f8f.16.2025.04.23.01.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:25:02 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:24:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rakie Kim <rakie.kim@sk.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Honggyu Kim <honggyu.kim@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Gregory Price <gourry@gourry.net>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aAij2oUCP1zmcoPv@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EEXIST if the node already exists.  Don't return success.

Fixes: 1bf270ac1b0a ("mm/mempolicy: support memory hotplug in weighted interleave")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Potentially returning success was intentional?  This is from static
analysis and I can't be totally sure.

 mm/mempolicy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f43951668c41..0538a994440a 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
 
 static int sysfs_wi_node_add(int nid)
 {
-	int ret = 0;
+	int ret;
 	char *name;
 	struct iw_node_attr *new_attr;
 
@@ -3569,6 +3569,7 @@ static int sysfs_wi_node_add(int nid)
 	if (wi_group->nattrs[nid]) {
 		mutex_unlock(&wi_group->kobj_lock);
 		pr_info("node%d already exists\n", nid);
+		ret = -EEXIST;
 		goto out;
 	}
 
-- 
2.47.2

