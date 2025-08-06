Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7850028C01D
	for <kernel-janitors@vger.kernel.org>; Wed,  6 Aug 2025 11:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754480721; cv=none; b=QP/vT/aFhqXv8evSerKR1zV1On/H1QqTNGrr/2p1ngWqI+q6GrkYpsZONsbkI1uvpQO5rBdymJQ0vhs8p6DuWms8J5HZmanTpLG4MC9pSwpqHpVp8Vjcpaegen3E0O2FxVdu/ktq3baNyUxZ+EAuwpMNfZ2A5yF98N8N1lOzN1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754480721; c=relaxed/simple;
	bh=F5eRXrtsxffdegpuQ0f4xPChPgfV/JPNT5j2y0VgMrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAX2ELpwKnl7djAGiGi9oPmvvweHFOnmssFRRyNLtapDoevXgArJ6CvDWViYBBQhfK6P6Hybd6fMM6rvdYBO9uBiRPqhQzT3woQX5ux25Bpq51UM7IUClBZp92adhYqlvuFdVqiInVVW+qDiomMPhy7vpEsHSqFz6sdCTg+FRZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mUsa2BFn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mUsa2BFn"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b7834f2e72so4069916f8f.2
        for <kernel-janitors@vger.kernel.org>; Wed, 06 Aug 2025 04:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754480717; x=1755085517; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gzJczgeb2E2EatXdWgiOPTAxDTD2f2zBu8DeU1yQO2Q=;
        b=mUsa2BFnbNPGG+KtAsxrAg4KKJUIQlbfDjU1ZVbwgHYBeSj445hqorARUFAaC6vuWd
         f5k3SYTBxoBT6VMgKWJTOJixcf3TORX5ogXM978FTjlVRILTHjbuy8nDUxdKGoInt7CB
         Swm+G4uiqyxJEx4OZggG1W14sq5DL9ciR5tpclVBY2vC1DEFrmrXZVLq6njvs8DhOwQg
         zGM/RzPs8UT0SYu1q5K6pg52Jna+wF5hrWAicHiAeX1Bqwe3RI+lYyWSPlV+/430nkuF
         w2UOtRNPvXYFMO1p5bGgWW12TEGO6kEk9wXqT+WHUkvkhAK92H5f4HpxLF8VsP1wQb8d
         xzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754480717; x=1755085517;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzJczgeb2E2EatXdWgiOPTAxDTD2f2zBu8DeU1yQO2Q=;
        b=nYYFHP/5PWQWnbAWB/QzXbFX30gVbRPvfFd/Al85u82Zru3sGY3x/Y9x+E+A2Xk0hy
         Nsn/14zsgRo4u0sZpEPa/syDBQI8StcpQYzHmjFZrkMEYfrgwpqZI43rGvEzRBjW4WGO
         mLRy6nqKXT8Zgflafc0bN5/TuRX508BzV+f8Ok5iKGgJaA4oTg6q1Tk/Rho22W3YA6Jw
         9b2SeVIYBbfnrJ5GTusdPtlI4YEL3sKFhmtIwe+VkE+A13hQJm3X7M5KY2VMy2SW1Bhg
         l0RLNhaeq1ttXtFjunWt0VYllLxXeCzsigLCfgtub+wwIsBiTEVlokk1QEGMAWzXeWbJ
         Cfgg==
X-Forwarded-Encrypted: i=1; AJvYcCXD4lFDuLyn+cJXnmmCQ8WH0Mq+zmmeE29F/uAywt6zZ9DzS4/uUAxhS+KFySxoE9bmSXvFKSGlCQICHv0/foQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0WfEBAdAZa0OwZ1zocqHuFfqqOR4OS0QMfYrILRN0SbGK06t3
	qDTtWVu6yBPnYshJI2Sf5KDYIdT71IqM1/xlkL0olTpd82aDMnaN/Hkn1FA3a0gfYhU=
X-Gm-Gg: ASbGncvfbGUkadqWIPNU0mQ9JsaRlQ51bpvF5jt2RYj22dCMucTDGXHp2ac9TOTDxN+
	FXL1OriUT196cSAQtYbQCkytw5hzbFlCH/HpCnqop45wKD44grYP6G1fW6QQ1F4vAD8xYRRM4+e
	Ty5D3cyrgLGn1AvLppR/YiFpWg09LK0fV6cRkQqqvPBgj+lDVdGZ3o4xBwKvNOEsNHWxJfgxW83
	d7+RkYD6zMclnu7QuxqGG4jIEcaHGxjRG6ZffYM+cDy4ywXHFETBvKh7ji6R0G46bF4U4mMFlxl
	jJIhQXdfaP7D5e86PGHX292TjD4QJpwC9vEQw4HDVMe49xsLpdET9eYx3yIQWY5u0l218J0ZmAf
	iHsh0ft8OpbgYn9+ZdC7qv36RVP8=
X-Google-Smtp-Source: AGHT+IErH+bIbW86Py9obhBfpJ7Ic4nUmflEhhhvraU68gExR0HV14Ll3Dg9SWn5Dg7piKiH/oo48g==
X-Received: by 2002:a05:6000:2dca:b0:3b7:973b:39bc with SMTP id ffacd0b85a97d-3b8f41bea48mr2156278f8f.54.1754480716705;
        Wed, 06 Aug 2025 04:45:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-459c58ed07fsm142317845e9.22.2025.08.06.04.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 04:45:16 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:45:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Stefan Metzmacher <metze@samba.org>
Cc: Steve French <sfrench@samba.org>, Paulo Alcantara <pc@manguebit.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
	Bharath SM <bharathsm@microsoft.com>, linux-cifs@vger.kernel.org,
	samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] smb: client: Fix use after free in send_done()
Message-ID: <aJNASZzOWtg8aljM@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The mempool_free() function frees "request".  Don't free the request
until after smbd_disconnect_rdma_connection() to avoid a use after free
bug.

Fixes: 5e65668c75c0 ("smb: client: let send_done() cleanup before calling smbd_disconnect_rdma_connection()")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/client/smbdirect.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/smb/client/smbdirect.c b/fs/smb/client/smbdirect.c
index 58321e483a1a..162f8d1c548a 100644
--- a/fs/smb/client/smbdirect.c
+++ b/fs/smb/client/smbdirect.c
@@ -286,8 +286,8 @@ static void send_done(struct ib_cq *cq, struct ib_wc *wc)
 	if (wc->status != IB_WC_SUCCESS || wc->opcode != IB_WC_SEND) {
 		log_rdma_send(ERR, "wc->status=%d wc->opcode=%d\n",
 			wc->status, wc->opcode);
-		mempool_free(request, request->info->request_mempool);
 		smbd_disconnect_rdma_connection(request->info);
+		mempool_free(request, request->info->request_mempool);
 		return;
 	}
 
-- 
2.47.2

