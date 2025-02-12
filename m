Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1506211719
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739374073; cv=none; b=ERirkyPwMQYVLVE6f9Im8FysGreL9tRbhBCPFGfLGM3rWltrGIAELKEmp3mYL6Hz3LrmaJGIsmA4UjmP/W1MachGKwF/2TPfapFqQUGK3UnmC3In8YfB4UtGinoJ05mWRKrYdrDfZbE6Y9Uws9RXC6y2SNezK9OQQmOwKThX230=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739374073; c=relaxed/simple;
	bh=nGOHHKMn8GtXJDicwnkL8tmz9VcKp2LxDT7FzaficDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nNj8QWKGtySGyQYECvfZ3S+prn4L5Tm+cYOVDpl33KyWZLfS+MAM5uurABg/0aZn8JVSQDrUQsX4hYhq+gk8rFGbwsNmo8//q7YlKDUQmFSwti1exXPGRp6DFw8F+nY6IsXh6Or9AEhBFg88/yEBblRv/oWux4T1Z/tJf4i1KiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=laZvZrLv; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="laZvZrLv"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ab7c14b880dso706707966b.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 07:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739374070; x=1739978870; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIK/hsLjBmZb4Q7phf+8q1FhCeVWqfbKwX81hLs6leU=;
        b=laZvZrLvajbe2NVmhCSHQkDLWb84Kp2eSfV0E9fjiZ0hDzBWt7T15XZM3Anp8FpC/8
         75KKTUx5rQ3P2ObiIGcxyImsSbpRd4t3LlCiZQ6QAMMppDnnupbyWUWqPIlM4gAvNxOo
         diABh2kPy4TFr9xlDiW+2LzDex9uU5LlDOCqpJMgQTrdLcaQfPm6UVkfXgessfNkr6no
         mUtquWoWyCCjxbWCxWy09TOjRzvRDughZg6V7GVyC7oHFTutcWYAIpd+bxu63mXmIxO3
         Axi6Cplv2dqrfgjLH9WWGIuSNTi4ujywvZhQSOoZ/rAtOUVMToDtZqP9Hs302RaWrNXw
         ZvsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739374070; x=1739978870;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gIK/hsLjBmZb4Q7phf+8q1FhCeVWqfbKwX81hLs6leU=;
        b=d5O+JxfjiFoZImeOkkwVoSbCmh/gX2Dc5rLiHTRd/T9DQ+K3q2OOVVrSdAdWL32pmy
         Ydp12IJ1vF1I5E2ZKXtmxUiqS1W8CJIvmMNmkxilDd2vuI0qV9d5jpYdt2knPR/BaK1u
         5tIuru/eOzDMUP/d9nC1M1ZfrlLPfh7xJe1i3IeBa5jHhQDaLRjp6OT1Tfm0tOIrEJTf
         5s481m1SWdGVV0BZ0hAXHJmDEpqYp0d5LWqPCOB1KK+UitgE6h3g2JRtl0Baoy2FnOFe
         pktjnrzRgNEThSNT2a0dunib0XstqxsO3DBkXMNOX37vdzOlUh28DprbyyKDx9kFviU8
         gfwA==
X-Forwarded-Encrypted: i=1; AJvYcCU5HsRa3vfdLyMSzTtGjnkJGHfvM5g6XVaqopGgLUHa/raPOgE94xUxH7qio3fzO7FTS6/HnW5muHiePsBzgEE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBC9qkibtj6gSi5oh6opEcGIwLKGmGhAXYjBYpyiJnHE03yaFT
	RBxEj9n4SNc7hEmx1P0+oJGlgehbQKN6bJL6z/7mycXgJMxnrCmwYb/2nLDiPt0=
X-Gm-Gg: ASbGncsmnHhV1JWTrNmb2Fp3rDuz2iPoMcLAps6uVNtCH3s4IBLBkl8W5lD3oR7lVQd
	J4Ftd1uo/RHZIrhXCIkl37WmzF6zWPIF0VgJG5Y8BVwWlJa9KTJfgA+pxT1nvrZJvTt2/k4JQUU
	kel3htG4D+da6Gfbmu7N5cGU1EaNEYOiBMr6DztIIKC6bn/cZX7diuRXAHFYMBTU4KFaMwEWxWW
	WsQ/+uXX5P+KgoJUbdPHfdalzZ91CJxYtYM6KiUhwpm+s5/UAQZe/Ld1DwTJ9rtmj1A99p4WILH
	tzE8j/iPI5G0Brp6dUyr
X-Google-Smtp-Source: AGHT+IFpL8Nw1g0cPCijD/OhpU2DBTaHM0/BqrJs7pa0K+2D+M9iqhuvdq5hwJqMDWlN3ZppYMHMIA==
X-Received: by 2002:a17:906:dc91:b0:ab7:eeae:b23b with SMTP id a640c23a62f3a-ab7f354ed67mr381322466b.0.1739374070037;
        Wed, 12 Feb 2025 07:27:50 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ab79d9ced43sm967079866b.78.2025.02.12.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 07:27:49 -0800 (PST)
Date: Wed, 12 Feb 2025 18:27:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Matthew Wilcox <willy@infradead.org>, linux-fsdevel@vger.kernel.org,
	nvdimm@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] fs/dax: Remove unnecessary check in dax_break_layout_final()
Message-ID: <ddd61469-637c-4a1f-a024-141574fd76a8@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "page" pointer is always NULL at this point.  Adding a check is
a bit confusing.  Delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/dax.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/dax.c b/fs/dax.c
index 9e4940a0b286..21a743996f90 100644
--- a/fs/dax.c
+++ b/fs/dax.c
@@ -987,8 +987,7 @@ void dax_break_layout_final(struct inode *inode)
 		wait_page_idle_uninterruptible(page, inode);
 	} while (true);
 
-	if (!page)
-		dax_delete_mapping_range(inode->i_mapping, 0, LLONG_MAX);
+	dax_delete_mapping_range(inode->i_mapping, 0, LLONG_MAX);
 }
 EXPORT_SYMBOL_GPL(dax_break_layout_final);
 
-- 
2.47.2

