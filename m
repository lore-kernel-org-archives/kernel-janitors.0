Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA2FD1CD26
	for <kernel-janitors@vger.kernel.org>; Sat,  4 May 2024 11:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714822728; cv=none; b=gIERBvUrNB8g4aRDFtyJJ4UzZ+gkZid61IXbSW+Dpj0CyJtHLG6D5DdMDf9D1irfBJr7Tyl3XosHzXNwny4gkUhOVshP1JBjqh7ZOgF3I1ivV5m7chptqxXIOle+kcsPl+p3KAjBr3IwEyG0ljJbsshg1+Rejbap4YQ1rQRT16k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714822728; c=relaxed/simple;
	bh=W7sFU/NBzY2gTAuU7v68tSUG7bpYXdqwLPRfBVRFeu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmVpJ2ZaE5e7EIKRw98cH3G1BBlImbHJE4f62Rc1p2XkmQoGjM225c1fQ95gYwQf+N8tkgUYQVuWck8xi/xgRrHRPxbGduLgfP490CpW7f2gfbyYXntw3qSsefhArkO6fcMlDvPby6upR2mLsjS3A04rILs157HZxzL35rLOrw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X6rSsirU; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X6rSsirU"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-41bca450fa3so3439975e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 04 May 2024 04:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714822725; x=1715427525; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MA9CnCgEcVb7taExL/ppkOG7f3FT7xMxv2EZ6jhbciU=;
        b=X6rSsirUKwf83GPK55ontntEXXPnWa/x1vcp1AJtyHn4Pfkfax6iSIoqDLYEoieufK
         GEf+aUIWNcD9ck4d17ceNTX5xLYzwPIR1Al3F+AUBVPQ+reFZCRPNwU9R0fA3KleF8Aw
         nc4kyu9sjzBr2JJKNghChAvi9+yTgu2ZazeRyWJG2krXuaw0WleVTb46Um2dWhu0O7bF
         g3vleF1Zq8MoJ4vJdLs7u70d0ovT2GJyCsHqZV3JmvIlkKZTc299H/svEg7rdK4/dSIF
         UR3eWD3llc2/SBgxbacPV4gcXrSp3GwCw0g/XFXeJePmwuKGntIz1FkFBGlKr7YQD9Zu
         yLwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714822725; x=1715427525;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MA9CnCgEcVb7taExL/ppkOG7f3FT7xMxv2EZ6jhbciU=;
        b=vrSuwq03sdSyFArvQ0rGhdOTR+ojFNp1RQoDvxyGSDjrY/DVGq8fgTNx42J3C7Jqbe
         XuL9jh05smcxs8Dy8YJif3OVbtM+wycusUhNBd3t8hyKMtd3wGMpvV1rXLfRDw1mlI8f
         tAuNn2upgwfsre5vnyCgZBjfCBQt9OGkaFg8QMIuO8apFCKZg1DobBloa2JNm9EN8zZi
         PIbO9rZ0zyQYdXzXDFLanu8SsUGEc9KEJBvSvkZWVtScv4LFqKNIHGQ5l0OpzsQGFerJ
         qnKm8tGyKqgr9legePs9QXO69jr3G/z7l33sKGpZia6Zwbycc1ZsmV1YTeoPfPp89C83
         qaew==
X-Forwarded-Encrypted: i=1; AJvYcCUY57cud/7Ozbjr8c99TGAwqRlS/+Fe9wCCb/CqFaaq+BQB8Oau1+L2bDy9xzZC4wjP3UgQsqZbKN7B4ApxwtzRSMzHb4wqe1OP6K5exQBL
X-Gm-Message-State: AOJu0YyXP7iiIUS/Bcipmop0AFVuHqyPDy3StXvnt6Qj2fIPmadj2TsV
	VUhuGurQCRYpIw5X7otRhE3zn2HtNvP0LsVIJE5JOO+XcE4VIZ9VFtYWoOntwU5C1M5KvcdPadl
	Z
X-Google-Smtp-Source: AGHT+IEkJ4fOtICM941w8eVuYTvSQvPKGtFpzVYQYzbWbR7QYJoZ1oKTpJnJ8jAyaUP+45cwLrsaFw==
X-Received: by 2002:a05:600c:4f07:b0:41d:d406:9416 with SMTP id l7-20020a05600c4f0700b0041dd4069416mr4117137wmq.34.1714822725029;
        Sat, 04 May 2024 04:38:45 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d4988000000b0034cceee9051sm6018954wrq.105.2024.05.04.04.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 04:38:44 -0700 (PDT)
Date: Sat, 4 May 2024 14:38:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Boris Burkov <boris@bur.io>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] btrfs: fix array index in qgroup_auto_inherit()
Message-ID: <a90a6d6b-64c7-4340-9b3d-7735d7f56037@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "i++" was accidentally left out so it just sets qgids[0] over and
over.

Fixes: 5343cd9364ea ("btrfs: qgroup: simple quota auto hierarchy for nested subvolumes")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis.  Untested.

 fs/btrfs/qgroup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
index 2ca6bbc1bcc9..1284e78fffce 100644
--- a/fs/btrfs/qgroup.c
+++ b/fs/btrfs/qgroup.c
@@ -3121,7 +3121,7 @@ static int qgroup_auto_inherit(struct btrfs_fs_info *fs_info,
 	qgids = res->qgroups;
 
 	list_for_each_entry(qg_list, &inode_qg->groups, next_group)
-		qgids[i] = qg_list->group->qgroupid;
+		qgids[i++] = qg_list->group->qgroupid;
 
 	*inherit = res;
 	return 0;
-- 
2.43.0

