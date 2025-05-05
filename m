Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F7561F8F09
	for <kernel-janitors@vger.kernel.org>; Mon,  5 May 2025 14:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746455541; cv=none; b=NMYIIV7spdERcHGTSpmaMeQTTTz2FpPzV+mveKyytQFKt1A0p4xQXfVwIJvZrnyOnaFm0sVsVeSjlUACfHY/CZ7WnkDs8HVfHMcS98CFhRVrRVKp1Vej7fCCRODE79f9mnBNQyU5EyYbe3lwhNw78WcIuXQgQ6lqQKDhBWD0fSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746455541; c=relaxed/simple;
	bh=e+0ixCQAB8W0GMaVTPmt2pQk324LCu5mkg5wTjPzaZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gTlwwi0kIgPnFtCkqypuZ6NA45V7/Ow2YHvPsklExkDJ7a/7VIcqPoXVwlLF/aS8DS71VadqwPCkIlsEqg4W8XVBJR2Q3+UtnRb5+GCDe+6lRsOUf/l91mEjWmbOORL1XG2gtRra0nM77SDqGKQZ6FFS53ZYRXXJ+OSl3JaWylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lawefhdz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lawefhdz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d0782d787so27458285e9.0
        for <kernel-janitors@vger.kernel.org>; Mon, 05 May 2025 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746455538; x=1747060338; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a+ecdvXRp9B7lDrSJDnwst1YRnJE0a6dpkQ8An/AD48=;
        b=Lawefhdz9B6aZS0CiZcWs34OeDz1S3yCgIblhsnafkiEuJ12pfQSJmM3EeW1lSmnee
         LhP/hlnxzR0JuuoCv+BV9yjlehIDKfMtxyd7zrf4Kmcc31Zj87no3j/4SJG0Y2zMid3Z
         KPW/X3hklDU7SsY50UCJSOKu6kMYbR3uIBcBfxfFFyjpLQ8xYz3ZJS4wXqEJDeHJDrF9
         mVRm10YyyVcQjI7EmgKErubA9zpT61rdaThM9KaqfqkoR1ggl7qkrXEGfOe4AUBg/xAW
         x1zjRum/ssP6E56uRDmGw+yGBLIDdct4G6/bhH/9BLO1iPPW0q3R7D6h4hd1ymQQEEIV
         9G8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746455538; x=1747060338;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a+ecdvXRp9B7lDrSJDnwst1YRnJE0a6dpkQ8An/AD48=;
        b=PwUd1OC5KyO5+flhaOSU2gPvBm9E5nHMMSmU2P/9LIlUQ+cUFI2TbNMUzbXf3ZFoVo
         t2HJMngIplkVeIRP3vr3+wFsZx0fw/BHeIY4k12ZrmAzz+dwDneS18TC+DFWtX6VlLj+
         IlxGQEqh2XHo8w/iorC2yuQGz+QKy+BaL8v5c2mP3dJyL+CevQtyvjPgCg8PmLjDUm8d
         cC1uVlta67tooICZa1jBp8BDGinbU9GiGixiooVQfQ85TTaIRy/vR8nE3Eqa6OFmxnQf
         60nxvJMl/qmlkz3ImjgMBOMWA9gtfornJqNfnh9pJlgberLu6F7i4pl7adgRWiaY1vlQ
         bwtA==
X-Forwarded-Encrypted: i=1; AJvYcCUGQcuS9s1m1zCAAuB8rUZ6/O/8KipA5/T9xjjBv8L9FcupyhXTBddFY5BYPUgnOgHqo/2mb5TiUCsSTlLSh/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTjPJPSjevl55mKAkKZ/U6t/nt/CUEdbSLuqehONpPC1qEsfIJ
	E6O4w0Ew09LqR48Q3s4QtFgNYr98GSLHTmWaZ+4VDLyGSgw/nSDXp/buGm6tITg=
X-Gm-Gg: ASbGncsB17fVOeM4Cj6eBy178HeZdiAL5Xk1hq898i7NNfZ/P/09Y5z+1lVGbERCvUr
	OhI7WhokJSP5s0iolYaw5fqs+wFiqgbogH7qG/5+OnVhCul+zJy4AlAJ5ASLjmaVk+rQ6nifsxq
	4TLb3l3ejwi2Mx9TZDPgsL7ty+AyMTHgKyaoWGUTyPxPu+LxATkSncLam4WBs28jLvG01UelmoC
	/9z/+NglJGWzfvhyYkVZOshmmYCbWlnvmDyu78TJe5GOvywLtNgFa5RNvy6zV4GtQCjct+Ybftq
	eSRoBxeoWx6SIrO8R4mek+Mhzxfzc+NeRImRZz5gEt05zA==
X-Google-Smtp-Source: AGHT+IGyIpQEeGOI1bpJxkqVYKCv5xmDFxvVhoHPMyQ+WpC+IU6OnU3bGuzYtxbn8Ywflhv/y8WTSQ==
X-Received: by 2002:a05:600c:45d1:b0:43a:b0ac:b10c with SMTP id 5b1f17b1804b1-441c49236b0mr63894895e9.26.1746455537718;
        Mon, 05 May 2025 07:32:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aed5e8sm180265185e9.16.2025.05.05.07.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 07:32:17 -0700 (PDT)
Date: Mon, 5 May 2025 17:32:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rakie Kim <rakie.kim@sk.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Yunjeong Mun <yunjeong.mun@sk.com>,
	Dan Williams <dan.j.williams@intel.com>,
	David Hildenbrand <david@redhat.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] mm/mempolicy: Fix error code in sysfs_wi_node_add()
Message-ID: <aBjL7Bwc0QBzgajK@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains that there is a missing error code here.  Arguments
could be made either way about what correct behavior should be but
in the end we decided that returning -EINVAL probably made sense.

The wi_node_notifier() already prints an error so this pr_info() is
duplicative so delete it.

Fixes: bc7527e0a127 ("mm/mempolicy: support memory hotplug in weighted interleave")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
Reviewed-by: Rakie Kim <rakie.kim@sk.com>
---
v2: Delete the pr_info() message as well

 mm/mempolicy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index f43951668c41..9a2b4b36f558 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -3539,7 +3539,7 @@ static const struct kobj_type wi_ktype = {
 
 static int sysfs_wi_node_add(int nid)
 {
-	int ret = 0;
+	int ret;
 	char *name;
 	struct iw_node_attr *new_attr;
 
@@ -3568,7 +3568,7 @@ static int sysfs_wi_node_add(int nid)
 	mutex_lock(&wi_group->kobj_lock);
 	if (wi_group->nattrs[nid]) {
 		mutex_unlock(&wi_group->kobj_lock);
-		pr_info("node%d already exists\n", nid);
+		ret = -EEXIST;
 		goto out;
 	}
 
-- 
2.47.2

