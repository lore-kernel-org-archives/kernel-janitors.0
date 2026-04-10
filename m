Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758F1377EC1
	for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 10:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775815863; cv=none; b=r4ikjHddN/nzrcBxpECipR72MuS76TOrF8kgrGP9qZUo7dCTZnQ2Yr+MuIjxLUCFZlOC3U9G2ihYoaoYfmQBSt2F8lkGE21z1MQebuQv/HQ1BW/Tm//xRn8iufR9mvJBua3/N/mBGyrMEATkOPWBonCXnaiaMOSdGak7aT4DLrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775815863; c=relaxed/simple;
	bh=PUuojCNELCKoaIkkmqQDOk5yIbSxVIW0zN5dnhUi/ME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LWOW+fqJWx5GTmP7SF+coS/lp4NPcOL836k8VeqGPsu/GAxTUIl7cgdOTp+LAnqCpu7REu4B7UaYeHKd/EPl6GKq8xQOsPfexhybiSzQawp3U/HlnhxEOMPexFfLQDezCZdQ07xZcYtisgn5XSQ+IhyZr3Uotc8+ytZCoxv7P1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ6JgoSL; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ6JgoSL"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488aa77a06eso29139365e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 10 Apr 2026 03:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775815861; x=1776420661; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y7V2wf57jyU8Y8uJ3/NHV3uJqjb9+6yGjC9YCeBBCSs=;
        b=UJ6JgoSLeLdnZeT/0xzPY69bR3gd4Gc++Enw9AjsWJcYV6eV7gV2jBd+5hiSaWRAX9
         nUsZ4kRqV2ccyLbr4CLd8KY+KQg7sBEWw9eeAh5Tnh0Pzfw3TO1AQQJw/fqULqNOI8ld
         6ZQa2cDPGBsgPGXtQ4WP+YzS5smbsiqzGKq2RdAyvwLmAmHUuzk+RDLL/Q5Pc3O67y+k
         u4LY3RxSnrGBKgYr8hLlswHFNP5/zdRIMhMZsbx3mSn9em+WtUQOQiwp9HSzj9fPer58
         EkQLEdOuZimuu4jk7J9OR5dwYo5NTMmMNFXwZ8p3fadbzlx45iF/rTEYZN5D40S71YoM
         6Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775815861; x=1776420661;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y7V2wf57jyU8Y8uJ3/NHV3uJqjb9+6yGjC9YCeBBCSs=;
        b=fLpRRzcK4Lgg5sudFnomdxMw08CRVk8lPr6px0gLHmLuDt0yrIQ6ldcCnIq6bPVU2s
         2/EQDWC9xVjRSXl8dTh1Iq7ZtWm3JsvGjcQmayZhOt25ei6U5RNdiM8wukte65TROdHF
         KMnM2IUP5Y2nWXHpCLGm7yabDF3NawzNSK5xNaTjeFpuWajYTuYIt+to8mOsrJ/I0KAT
         O62eWAGLU0YzPJwdoHgoesJjzykyNrMki78RwIXypNpVTRDVjav6RRrZHuEYU8yC0eun
         lolbNJKMKMCeeVVq48SE5zb2DvObO30b7T8YtGNqGOmaXvtS2BZnizQxlAinarfvW81v
         JdNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVH7L9u7AFp3RZHCy3IO++1YEbJGBi+Ql83WCp/UkP5yq9VTi/SV81OEli+heFcOchTaMBdb8/RUzzdaB4Sedk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx86tDRn0V/olObsoIz+8JqYnfa+3JjvijR9DcRC26YLmQpQXjM
	VxA1jkcweeYErV1Z6rJgq/x2pH7AQHEqr9dtKVt+9sGVq1gczpmPCdCMxkP16Q==
X-Gm-Gg: AeBDietc2c8YT0AYflw5mv+ogz6uaMX/PJsgqw3M3wNrmI0y3bvN+pm5w04uUk8CW2J
	DYeM22SYjlSPmVB94KkJzezS8eRhru25eFPC0kmH9Ham7C6CAoimhsChI2hAR0jG/l4QGzCRyuK
	CstUHcs4BftlN+nBM4oOi4qjrd0zwViyDnja2nOnfJEphb/eKCB+oSvBtjSAR6aV/3I2LFjB8Wk
	cfuDDwIsfPKfpRHjK9IO3q5Ff4Kx0mFQwQFSSvQNxlNnUUb2C5hKZK5yM6xq6QeYLdsiDYqJBjg
	252M+RUD6UImYP7MgRDftK7yPvOl4B3yhe5wmdff9yWSxYOfRwoI6N+8QSFt1fimpk5H5H1UQEj
	eBnUuXInJFgTeFxgkdwmIGFylcUdPqdcLhaqZMf9Tno1N4K1CDKpRahotx5e/fWnJ71iXrzb/k+
	1CkKoI/CW33Uu9No23Ioo=
X-Received: by 2002:a05:600c:a411:b0:488:af48:af11 with SMTP id 5b1f17b1804b1-488d67c749emr24705175e9.1.1775815860819;
        Fri, 10 Apr 2026 03:11:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d538c39bsm58700195e9.14.2026.04.10.03.10.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 03:11:00 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:10:57 +0300
From: Dan Carpenter <error27@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ntfs: delete dead code
Message-ID: <adjMsTa3Xv7O3jWH@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We know "ret2" is zero so there is no need to check.  Delete the
if statement.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 fs/ntfs/file.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index e5b897a6c1e1..b04919124989 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -534,10 +534,9 @@ static ssize_t ntfs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from)
 			ret = -EIO;
 			goto out;
 		}
-		if (!ret2)
-			invalidate_mapping_pages(iocb->ki_filp->f_mapping,
-						 offset >> PAGE_SHIFT,
-						 end >> PAGE_SHIFT);
+		invalidate_mapping_pages(iocb->ki_filp->f_mapping,
+					 offset >> PAGE_SHIFT,
+					 end >> PAGE_SHIFT);
 	}
 
 out:
-- 
2.53.0

