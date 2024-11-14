Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7831F7098
	for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 08:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731574779; cv=none; b=YF9M8cJY0cZot9cnfjbtEiIk8+aldxvMWpABmPkP6WtJvT0SKg9fixZ3g9zBgMi4pfrTW4RejKRciCG20eDxYbpxK8mkZTgDbl04Z7mHTVItWtr2HIPYlTYEY21jjDDyqp3dvKGT0S+gDJ9GZEEX6k5lb2ggTwmSF47kVyYe/aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731574779; c=relaxed/simple;
	bh=XycamBY/nYOgqAvwbffcnYn4/Yabq7JhXqCOkrXC1xo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqikarhztBVZE4+rQSh/8nJINcf6c1hTIK8JJHSV8n6OsEUYP0k0n4dEANM6Yk46uZY7SVYDp1DhjG4I2QHMeR4EgsUR9rYDUN1W5vBgVp1IiMpRethkhQbb4ZlQSr0Kygz5LbPy3RBvjiROsHgTd3PNGgQWrkfwGU8BYYlBwhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jNbFXWb7; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jNbFXWb7"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so451197a12.0
        for <kernel-janitors@vger.kernel.org>; Thu, 14 Nov 2024 00:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731574776; x=1732179576; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RFvv3LbF9Kdg9CtKKlONGsxCX12ovGg602Za7rDJdl8=;
        b=jNbFXWb7jcm+CDw7YVEZz23nl4UM1utKC5g3fqOHWPXKBMO0zc9aZ89LoDGSm9se1r
         cK2tPrK5YvrJJ6nFOSMXEamgQTC7+6HczQZOAvkwO5O4+dn+tKblhZJtiaKiVOazbgEX
         xadz47PXFUddSC/bEQWU/uR3dekqmuqZLEpxTgAsZwXdDbXLnYWOJ24DgrVm6+To9Myu
         y4I3y7TwIkULbdQQRRhtYpExJtqtc8brkAI+NdbgXPHPTyqqUKt9LhfqqWlR2RHKig/x
         0Ts2fEP2bKzcTRYZ/0Ist/ixEJR1vw30RHzkbjDq4sqXE9SZ7VimomJpiFIyUUW86IKl
         grJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731574776; x=1732179576;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RFvv3LbF9Kdg9CtKKlONGsxCX12ovGg602Za7rDJdl8=;
        b=FmHggspzcXdAlxV9sZ0FHeCxesVsDPQrkHDJurF+XwVt5wn0isoo5QB0iaBcYce8nB
         1lyV9One6my9KxNzLHNvym36gA7LR0+3io1gysKmNbKhfGsOh8IjIeCcWDqnSUKukl44
         W3z5hdk642w7uME1UtG9WAxAaJEyfPEw4aoPRLsKF2rJNw2zSgdnIYxvC4UA9eaEhRNC
         YwVZ0GhCyRdtjpceXrMy83TQdoNMIZgemD0w5TJSjQB7QpXkW1FqRizhAJ8ZV1DqH0Mj
         O+RGFqgPrUfHgKqmsKvKuZB3d34dCrBWGQmPuxTXC5UbL/sBeRhMzhsI1tUP4Rj6iq04
         PFRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTXb3e84QGdAHArOKjei1x6ZxqIsvj3xVuKINzs3YnmBmZnMBt30u+82rYWrJHHpOpQBcT9ZjwO90abIxtOh0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUlHQKYIA4S8ypWfxrRRyZp/6blyD3vHKtk+kPDMp5ZKqpVjr
	2oPh/LskEI8gwuzLGBw8n/60OWCSGAVDhZ5o1rgyIAJrsWXskcUHsVWwQ2WfGvI=
X-Google-Smtp-Source: AGHT+IERWfaAqNKqw9yYfROoHVQjEmjB8jy1fnYHJoHTg2lYc4YgdDb9SwWLsbU0fU1K76xN3CY0pw==
X-Received: by 2002:a05:6402:40d0:b0:5ca:da2:b2ca with SMTP id 4fb4d7f45d1cf-5cf630c4fc0mr5133838a12.19.1731574775753;
        Thu, 14 Nov 2024 00:59:35 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df56b13sm38701066b.76.2024.11.14.00.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 00:59:35 -0800 (PST)
Date: Thu, 14 Nov 2024 11:59:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrii Nakryiko <andrii@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>, Peter Xu <peterx@redhat.com>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Andrei Vagin <avagin@google.com>, Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/proc/task_mmu: prevent integer overflow in
 pagemap_scan_get_args()
Message-ID: <39d41335-dd4d-48ed-8a7f-402c57d8ea84@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "arg->vec_len" variable is a u64 that comes from the user at the
start of the function.  The "arg->vec_len * sizeof(struct page_region))"
multiplication can lead to integer wrapping.  Use size_mul() to avoid
that.

Also the size_add/mul() functions work on unsigned long so for 32bit
systems we need to ensure that "arg->vec_len" fits in an unsigned long.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/proc/task_mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index f57ea9b308bb..38a5a3e9cba2 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2665,8 +2665,10 @@ static int pagemap_scan_get_args(struct pm_scan_arg *arg,
 		return -EFAULT;
 	if (!arg->vec && arg->vec_len)
 		return -EINVAL;
+	if (UINT_MAX == SIZE_MAX && arg->vec_len > SIZE_MAX)
+		return -EINVAL;
 	if (arg->vec && !access_ok((void __user *)(long)arg->vec,
-			      arg->vec_len * sizeof(struct page_region)))
+				   size_mul(arg->vec_len, sizeof(struct page_region))))
 		return -EFAULT;
 
 	/* Fixup default values */
-- 
2.45.2

