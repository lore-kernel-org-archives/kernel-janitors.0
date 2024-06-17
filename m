Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DA81922FD
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718616880; cv=none; b=SsSrt08WgIczU2qxLWfGzhhPUW+qLQUN7p3YVlqzdueTdh+b7II20kjerdMYYmkshlewm8sHy9BwpEUTWjjPvAdfQqD6WKHqInD07jcPxNK8K0WjZ+kemPCfJ2gNhBOdtIO5+iEn5OK/pnUdQytCsDGkKeq6MpqI+ASDIUGU8b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718616880; c=relaxed/simple;
	bh=eQ3GEmVfz/NFFavQ5n+cPs0wp3Jo10dh1DwRVPw1aME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHPjcpmsOMkw2KCrVsg/YHOkX1zwVf79vCTcr4ylgigg+k6P9hN9m5temB4OeLmnhuZNHqQiwXBnDBOgJM2HQVWJfabMb7GTOJToH9EKDPh6yqj0/6kHXkYzPj7ZR+s2+DRq5TXVXeZuMHeM3QjXn8N2LsGP4SKErjaGJEUBPM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PbqQOMOP; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PbqQOMOP"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52c94cf4c9bso4989386e87.2
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Jun 2024 02:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718616877; x=1719221677; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pZqlfzq0gqd8L9nHKEtDudKTVJ2RTjWVZ3OJQhA6rBE=;
        b=PbqQOMOPL+ZjqEOB2y7P3WMc7nwjms/hKhbpjzmpBdWoX8Wea+u8Md/MMdbE67z9Qa
         fUe+RmpDytiSpJJ/2M0rdzFXPAGtl5aSjzJcn/mmKDkAzVsUC+ONIiyX8DEVkgXvbK/n
         LvmLsAcz49Vn5PGl6dU1ciOkqJ4o+zuChoCZuKEf9LS6SDBY2UxaGgqnpXPS00GL7V5n
         2p2vuLpVI+WzhymLz6pivD0YrI0/ROB1NeMLBIUT5MW4ucwei+Pje+ZeM9nHo04x8489
         0rIxiYByQrNgkJ8KHPlPjSKDXK3BXkt16M/BZ7+dqyGK06e7BGmlBjrFqcqiM1Y6O/vH
         1/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718616877; x=1719221677;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pZqlfzq0gqd8L9nHKEtDudKTVJ2RTjWVZ3OJQhA6rBE=;
        b=wde2ln2f8f7O+cu5XolH1NJCIprcuGB2ZSv2BpmqjVX73bsVCP6gJhRt6SF1os+O8V
         2O5n5hVklgvCig4OFEUMHNn6cK5kmoxgZ1POETkf0GMMy6Ym7dRvfv5/Y7yXCHeMFqnf
         9kEOhveZMZHdR22q0sBUpAHpVA72dBXBMI050bX2ZNbysQGFg2TVVLKoYoALtbXUM//8
         n4qRMofQh0bBuSTYj8veP/GlR7fHOyPvhL6gQ/T3JBA4Jvdtib9c41B400lsswKYYIwr
         4auokn6yIcuVVy1Ovar3u39zaViKx4a/uzRe48bKDxi/BZrP29CC5/SugLRta14SXP+t
         BxBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUVVIloQvZ/ahDjJ2gYsfTbf32BMgozUoMnwZvQJ/SnLRwC8LizRZ6dU50kvH4hcHcTK2fr1DRbeqfb8qh1MYLXwagd8vzi/P2qh+BY7R0V
X-Gm-Message-State: AOJu0Yzho22UgdsQvPy6GLJcaJRcDXHfCXBOF/8gate0XkPkts0ziJrx
	Zg5jAi1SGLUZcW0QSj4w0nrZSCDnVrDZ1dwmTLhHQ+rGKIO7SZtFI11jNd0cHcs=
X-Google-Smtp-Source: AGHT+IGTlennQ1HIxAYqKG4+OH6QB/vWUXrpLW9Q5q5XLEK9WNED7iZgfkSiN+EXrJNQbyVatzIneA==
X-Received: by 2002:a05:6512:1c2:b0:52b:863a:59b4 with SMTP id 2adb3069b0e04-52ca6e6e576mr6799194e87.41.1718616876583;
        Mon, 17 Jun 2024 02:34:36 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602e0c2sm152224985e9.14.2024.06.17.02.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 02:34:36 -0700 (PDT)
Date: Mon, 17 Jun 2024 12:34:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yangbo Lu <yangbo.lu@nxp.com>
Cc: Richard Cochran <richardcochran@gmail.com>,
	"David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v2 net] ptp: fix integer overflow in max_vclocks_store
Message-ID: <ee8110ed-6619-4bd7-9024-28c1f2ac24f4@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On 32bit systems, the "4 * max" multiply can overflow.  Use kcalloc()
to do the allocation to prevent this.

Fixes: 44c494c8e30e ("ptp: track available ptp vclocks information")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: It's better to use kcalloc() instead of size_mul().

 drivers/ptp/ptp_sysfs.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/ptp/ptp_sysfs.c b/drivers/ptp/ptp_sysfs.c
index a15460aaa03b..6b1b8f57cd95 100644
--- a/drivers/ptp/ptp_sysfs.c
+++ b/drivers/ptp/ptp_sysfs.c
@@ -296,8 +296,7 @@ static ssize_t max_vclocks_store(struct device *dev,
 	if (max < ptp->n_vclocks)
 		goto out;
 
-	size = sizeof(int) * max;
-	vclock_index = kzalloc(size, GFP_KERNEL);
+	vclock_index = kcalloc(max, sizeof(int), GFP_KERNEL);
 	if (!vclock_index) {
 		err = -ENOMEM;
 		goto out;
-- 
2.43.0

