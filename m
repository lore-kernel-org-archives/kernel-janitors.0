Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE3024E4A9
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 15:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741186841; cv=none; b=MNXVgenQTP/nUCGaT7/aUuL/7eiFPVCEyzWo7RGZyZf7YXvpQTEcsDBuXQ6AS1TdX4+KLHaDqBO53uOx1VxNYoz0zuLHplX0wD8Y/VSVEI2NIO+KlVUlCiOfwcpAZ9zeCvbjXvf3zTFi2JefwdiVEvp7bL7z13ffVVQJVJEAnkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741186841; c=relaxed/simple;
	bh=bzbnqVocaCxfmALbCmAFbfMJej/qbh3rRgH5YqAiY6s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOIY7I7uwfPr+YeHCBx1HfEJZnLpDQchLo5kP8gAtKhlxYNhHL6kPOl/xGS8ovA1VZ3GRqMlXh4Mgy2kHESokzF6L+JJILQPoxwLVOkI1kN1mx3Z1j9HBDDrbACvPwZI+GU7nNrgX11QopwHuScmK8dxclTAns/veo7mKbyuKJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7wjWBGn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7wjWBGn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390e6ac844fso6160123f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 07:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741186837; x=1741791637; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZANWTEPPVCS7kbn+yeIU+DKraUb8OGsxxymaQwr00e0=;
        b=d7wjWBGnWEfdZMQX83pknwfXpvJb9TOzUAXH+ePFdPLwwbRRDJhWLNzuR4vtL2nvj9
         Z5hwOxP+MFBb4oZphkrzRBYjrswbIpIgjcGkJfDZHos9Bb4GaPNe2B+PEBTszF1+sfmD
         aPpqH7vPNeto+CPUlpPUj2J9agfHAzaLQy8aNRx+/J3JCnqdTgIelrhtqtq0NW53IatX
         wOlIc7loNNok0ADehUxn+DR4xroTuOR7/zN5QEc4hubRrfXhldUdEDrlqI2bO4QsgtqJ
         qENvTi/iGebdCBgs/AhK7KHYKj/x5L3Tmlw25f5PPx9ZpSQ9KnQF+9zyIj9qNFq/+Tpu
         ZDlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741186837; x=1741791637;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZANWTEPPVCS7kbn+yeIU+DKraUb8OGsxxymaQwr00e0=;
        b=iqB9dxiYxyqcdzZNYGNMIBqBARtqK+KxSVFmnQ4QFTC5JheFeaHg9j6HiQcSWCcNU5
         buJC9QM8kZf//Gp9Ev2663E/R6+0tX4MtzOy0sXspzvGCHXFVmwvoWo4KDcNG9z7BBZC
         y45IT0nVwxmmSxGHK+ztk3GyYobpyzqskuLoriFNE4bCSs8nnufJg8l8mU1GD2zixIzz
         kx5fdFMh/7bcQz0zjov4RuiiNgN4D/kl001hw+fKHBEeToTGS9Nrk4LThYopwmm2iM2P
         THiRyIv+CMqovPh/drRsV0yPoZqmj9vW6zDwXUpNy2gzH//T3g98x6cH93u6J1C2zWAu
         79Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUGj3ff1jxB6Cy5lQvuOIJQSCvCKwfPFnm7FBUcQ5I4DOuMxf+RBK/ASQYDvYAzyGjOfat2Fwf6RWiOc+MvgzU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVx+3mapTziTldoDpmswzrLyDHyxFKWT06/C6hK2dXDNPAEgzV
	S11eirhCzBvtinruEbdN3Rmm5K6CD7AqV9ugWJlTDy9iy+5EqsuTUgTviCiilgk=
X-Gm-Gg: ASbGnctNpb4VYkSUSxJ9tsXWBWZocVk5CyjJuWxIF/UOf5lCTdTQTMUETu670WS5M0m
	OlCD6iyl+vSXZ+tHwOkKgsDLQ6n/yuRNwqgH5ekbiAKk5u02TKDDD5N9m9cuCl+2vtYWkcVldyb
	7u4MvKcEnpZms2ORDFLPTCwbOFPIhPspElCJu/wBGtojlHekJs04voiXf6fnarV+/yMvfp+y+hi
	eF0q7o3P77CacwQdsh+ECH0B7Kvici9FKp4waw5Oa5L/qHJK9V9gXim/LRq0P/NDMmL/O2RO4Wb
	5RQmst3Is1srFzAEs3+j5seZUX7769ZjPNZiYWDYFiVFtgESaA==
X-Google-Smtp-Source: AGHT+IHaXShFpWUZrnjuQ9xahJkrprzqmBEW+AnaFKuI1m235GQthfy1Zavq4gvhC9Eeze/MbuNM3w==
X-Received: by 2002:a5d:6d07:0:b0:38f:3224:660b with SMTP id ffacd0b85a97d-3911f7377fdmr2631065f8f.22.1741186837476;
        Wed, 05 Mar 2025 07:00:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e485e61csm21592653f8f.98.2025.03.05.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 07:00:36 -0800 (PST)
Date: Wed, 5 Mar 2025 18:00:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Howells <dhowells@redhat.com>
Cc: Marc Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] afs: Fix error code in afs_alloc_cell()
Message-ID: <26a4651e-b56c-4350-8f9a-e0e2a2a3b452@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return the error code if idr_alloc_cyclic() fails.  Currently it
potentially could return either -ENOMEM or an uninitialized variable.

Fixes: 72c52e46a517 ("afs: Change dynroot to create contents on demand")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/afs/cell.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/afs/cell.c b/fs/afs/cell.c
index 9f6b7718836c..dc56b0203b53 100644
--- a/fs/afs/cell.c
+++ b/fs/afs/cell.c
@@ -200,8 +200,10 @@ static struct afs_cell *afs_alloc_cell(struct afs_net *net,
 	atomic_inc(&net->cells_outstanding);
 	cell->dynroot_ino = idr_alloc_cyclic(&net->cells_dyn_ino, cell,
 					     2, INT_MAX / 2, GFP_KERNEL);
-	if ((int)cell->dynroot_ino < 0)
+	if ((int)cell->dynroot_ino < 0) {
+		ret = cell->dynroot_ino;
 		goto error;
+	}
 	cell->debug_id = atomic_inc_return(&cell_debug_id);
 
 	trace_afs_cell(cell->debug_id, 1, 0, afs_cell_trace_alloc);
-- 
2.47.2

