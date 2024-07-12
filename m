Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427C17164B
	for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 14:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793262; cv=none; b=PT4nplZ85sRicneRk3bn4GCq2VKtFIPH8wMIzK+6m67I8cSst++P5u4fUtz9hNwKVy67Zhzo2ZOqrw9PboGhNln1aIq1m+xWezApr8mN+/ToSQFqWp4kzFv8ioFPs8ojvvPFTiDXUVtn25nx0qVa/ZaFV9o/Kw6VQ/4Y2cn0cNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793262; c=relaxed/simple;
	bh=SfyLdJmWIl09BqrLT3s5UZpOh+WQ4L3Y+LeTeNjzYvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oj0bD3IS7GcUDnzzpMf63KdABVSWosTN/fhrh8SdcMCmqjvPow6S78FflhYJ/sbkPXIvcNuqxKFzpFukcK2So7myN7o2cC3hAhEJA7bbEUuVHJ3A11wrfWmHLcUxxQSB/1PzkSCm0FwzlonKE9+X/Sd06uj3w6GA17Zwx4QnFQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XCt1Cpaw; arc=none smtp.client-ip=209.85.160.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XCt1Cpaw"
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-25e171122fcso921962fac.0
        for <kernel-janitors@vger.kernel.org>; Fri, 12 Jul 2024 07:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720793260; x=1721398060; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/kDrIianMg+3X2yJ60OXLpyMU7e0jBqRLYg/AtDIiSk=;
        b=XCt1CpawhEs2zmeR7RI6jlzeBzM0wFj8MfIsgtasolujsMu37/pkZtssjkgqBvSbhd
         atg9w7PgzfXgqtmwQt8lA+eYUYUtEFfGrF9MCkhqU4tYNnOrqRdiK77zKJlM+HJaqNWE
         pkbKBfD7ttSLuyJsCiqxPZDz+hjV9lb68ZRuoFzDjg2Wr6FgV1bQknK6McqE/hIdZ6VW
         ZiIRRz+coMUDboxPKQEgazHInB6WtjIgJW4P42swT8n8yKqYldSHV3ZFI8Em/vo6GORK
         Rn7pfkldkdXlhroV5XIpv/26OG8fz/2rIf3ML9z8LBynXEseeOISHGESWGJs/0l9pq4j
         JwcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720793260; x=1721398060;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/kDrIianMg+3X2yJ60OXLpyMU7e0jBqRLYg/AtDIiSk=;
        b=pj0jx+IJVltCwtdMQ0SF5r2inNT3eb8AJ6GS33/JWPRH4OfOvd/zVCy8mmC6qtLh/S
         UcudgG6uLy4clP085v4xCPpZH6MOjfaz1xPuP1unmEzOGseyNAv52t+JrD8oILLH7FoR
         h+SeMdvKYF6JHIebn1rr4oMX5g/1FABNxheVhwQaIQh7yQe8RgPieYxcuDwc61Ri7dMb
         M6sLCxP5q3jCdmX37dG3ButxPtiotfnh8UasHslwhS2xYgsUWRZ8+usgJ6epyxTqjErw
         svHW7JCaV84JFslNbO++f7HVRj4gThd4ggqKJZKtAuYoEAJeVaaDlGP5OaW2wHVh7XLf
         Plzw==
X-Forwarded-Encrypted: i=1; AJvYcCXDVb9xZIcHPsQqxf1rZ8sp7tkSmbj5mr7kI2lio999Z3aeVZDAFzEkzxi+fp4Ud/9/1o4YrCsmovM0oCyOeG+A4/6mqzmEIn0A4TxWMIje
X-Gm-Message-State: AOJu0Yy8CZobRKkiUCQmJvTlLAzdXAOdBmAaw1XKW/bzoOdWF0lk98bg
	nuL+4VIEh4re01npxmFOeXbWca5myv9HOeH3JffC0MVVfxKo46zH+MeTCSHuQBY=
X-Google-Smtp-Source: AGHT+IH0XTKXSXVxdXKq83umC1HPIu3utFplrKBotLtfEPjZGT5ZNt/dC043fyKGyZP2rTqqiVF5+A==
X-Received: by 2002:a05:6870:f10e:b0:260:246e:99aa with SMTP id 586e51a60fabf-26052cd32aamr1168947fac.11.1720793259963;
        Fri, 12 Jul 2024 07:07:39 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:d26:9826:56eb:a2e5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25eaa2a148esm2242391fac.54.2024.07.12.07.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 07:07:39 -0700 (PDT)
Date: Fri, 12 Jul 2024 09:07:36 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chandan Babu R <chandan.babu@oracle.com>
Cc: "Darrick J. Wong" <djwong@kernel.org>, linux-xfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] xfs: remove unnecessary check
Message-ID: <a6c945f8-b07c-4474-a603-ff360b8fb0f4@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We checked that "pip" is non-NULL at the start of the if else statement
so there is no need to check again here.  Delete the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/xfs/libxfs/xfs_inode_util.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/xfs/libxfs/xfs_inode_util.c b/fs/xfs/libxfs/xfs_inode_util.c
index 032333289113..cc38e1c3c3e1 100644
--- a/fs/xfs/libxfs/xfs_inode_util.c
+++ b/fs/xfs/libxfs/xfs_inode_util.c
@@ -308,7 +308,7 @@ xfs_inode_init(
 		    !vfsgid_in_group_p(i_gid_into_vfsgid(args->idmap, inode)))
 			inode->i_mode &= ~S_ISGID;
 
-		ip->i_projid = pip ? xfs_get_initial_prid(pip) : 0;
+		ip->i_projid = xfs_get_initial_prid(pip);
 	}
 
 	ip->i_disk_size = 0;
-- 
2.43.0

