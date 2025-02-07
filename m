Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A3A1DDA2F
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Feb 2025 09:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919786; cv=none; b=B88xhw2rSdnAt3pTzs1T4KYPkUfu2jJVUi/37VIdNRx2WHKFrjMNe+Ntr9MthiIjRVsfoCNouHbRZrsK+xOl2J9nPQXaqRRPXqN/4aKEGQFvDHl8nVP4QBtZ2AHQ6dsKNhKqPZ8psVBwlc39wdjJR9o7NfWHgD/aKhwEtgtUJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919786; c=relaxed/simple;
	bh=8QyhjSt+PXmG79JqqMzYxvWUPvnaR1/TlhVoEt5+boM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+kqMSc3DvDvByra5Ue273e5IwMcr+N0tQ67SrJvcn6EL8DO0tMqrlbc8keZCGSSwHeWcPjfzmd6IJ+gHE3XY8GTfxdWVLVTOzJdK67u+IU0PGmrafjftxjkDdeZ7bfDxoO4eBcZ7Or0nPhNIsQOynFDn44pQnuBHEsknMLGxmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rEfuvVzJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rEfuvVzJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-38dc1dfd9f2so880338f8f.3
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Feb 2025 01:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738919783; x=1739524583; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vvLbUtxX6Is1AqBp8WxV0jhxtX114UxVQqr6c6sxU+8=;
        b=rEfuvVzJaugBmbO1ALFHHOKtedha/I3DKWGnXzXrsyODjKqCWZlu28q9j8b4cyUpc9
         b0leMaD7xx/qHCTYdURVKfF4E7/UtBJd4/eAC4UFFT9vbl2CrVu74q/Ks1iYUSHp4KZk
         5XJJ0iKczoiohEHsDJnavZJKLIeCtJLZQQ1kRsxyreaysn3zoGMI5w5eQUzhB1d3Jfmp
         +27hrAO18exGrdY0nIdnERfjHfTMCO1tfEKm7VKRkEzE58e1tl1RR5vlwQZZ4jMQiohN
         xvOMQKX1KNigz25GtoQA74Pa3Tcro+vQvL9fZiSs5eli9585J/eTw067p6Ebxpm3Tfhw
         Pq1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738919783; x=1739524583;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vvLbUtxX6Is1AqBp8WxV0jhxtX114UxVQqr6c6sxU+8=;
        b=pnwRQqFHP2Z/UCodCJ1DErhMDtmKuU+lPwHuI+TJVq3JL0rFtlDM5EHZigqKTtr+vz
         +S2HBgCmGahhg06EBnobA+A1lp/2kiqs/7rUsa+XlLDYGo3Ea9s8QUGSNdRxW2MgXyLH
         dBWX4HY2wOKoMtABjz3rtKus7eC8vtYZmeAcsANax3aTe8Go/GBOlozqpzycAjNKnKOH
         xjPww0hYmmrlj3tniBB19yAfKCAkGRi7kE93Cl0iBQv1urY8TAS9aHfPNKxjDbTuepWq
         QnazBGNfEZ5m1cXwUS4BYtP0iiX/n9fzuy1MkfuHhUR7qNozbKxDx91R1fZCtlVGEzlh
         e3ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV5zp19m1c7XU/l8iHZvIDF9ZR20lcSxbdB/5uO74v64nsXMPLxIWKPdWKiyuWFBZs859IzBsHHdzqI/SmgJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfCAijXSzxGpp+OC5ZPoQaTk5sc2Mg3Ftzoov6M1Le41PTi3gK
	puDYyPstTXFP5YJdj5tfCnHV1TDwnfiWVtYSV3nJ2Q0554DKQVgBvvshXr3NpIk=
X-Gm-Gg: ASbGncsnuuL7N0xbIMNhSNi4qfqOjVD7w+2xNooVogOQjbf1tU71I+HXTzi2cTw8qPJ
	cRP3faeDQrljpIgmLjrARrCHtfzHHnl1EwE3HNaTdNc5bTv3XpLaCjMNaXPIzSsw3JyQ5B2KkD7
	zaBr/XPjUm7A/orqYLOGaj2lhKKfejhmnNM9h4Y0bbCmYJXYHkguXKZC45El8hiFr8rPUZMAhft
	NBLNDh0MO/CLovJoePHAcI4dPUju7KOshATphQYebROBctj3SDjpb9gl1xJadwWaweJ2ZsqUUq0
	6OmZKBXfk0/+HcMM8M97
X-Google-Smtp-Source: AGHT+IHzf8MzMXdkrcAtuah1r8BuF90slZNj+eI0Wnjcj38CkfEtHceBBNaIgCqFjXafoOn3pJtT+w==
X-Received: by 2002:a5d:64c3:0:b0:38d:c58f:4cfd with SMTP id ffacd0b85a97d-38dc8914130mr1679493f8f.0.1738919783039;
        Fri, 07 Feb 2025 01:16:23 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38dbdd5c87csm4012010f8f.52.2025.02.07.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 01:16:22 -0800 (PST)
Date: Fri, 7 Feb 2025 12:16:19 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Selvin Xavier <selvin.xavier@broadcom.com>
Cc: Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] RDMA/bnxt_re: Fix buffer overflow in debugfs code
Message-ID: <a6b081ab-55fe-4d0c-8f69-c5e5a59e9141@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Add some bounds checking to prevent memory corruption in
bnxt_re_cc_config_set().  This is debugfs code so the bug can only be
triggered by root.

Fixes: 656dff55da19 ("RDMA/bnxt_re: Congestion control settings using debugfs hook")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/hw/bnxt_re/debugfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/infiniband/hw/bnxt_re/debugfs.c b/drivers/infiniband/hw/bnxt_re/debugfs.c
index f4dd2fb51867..d7354e7753fe 100644
--- a/drivers/infiniband/hw/bnxt_re/debugfs.c
+++ b/drivers/infiniband/hw/bnxt_re/debugfs.c
@@ -285,6 +285,9 @@ static ssize_t bnxt_re_cc_config_set(struct file *filp, const char __user *buffe
 	u32 val;
 	int rc;
 
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
 	if (copy_from_user(buf, buffer, count))
 		return -EFAULT;
 
-- 
2.47.2

