Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900321547FF
	for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 10:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732961209; cv=none; b=SjKR46Kyra0cl5mjG96ShWL8zwIHpICjK/B/3M+8xmtYKg0UjkparOO6GGAacrw/84fyo4Xd+Mps9EtTIWFjICwGg13Nggi1gHsp6YC/MZw+dXM823QwCBlUwtWvo7J8xYFApH3AI26c+kg6Jqb1LN0H7I+H38r+zR0k/akLcao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732961209; c=relaxed/simple;
	bh=yF4jc/0jnas8u7mphux/NDbZLQaah9CybZy/aj1SKX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dsQ33Q1i6AEe+CCJ03gY0Q8m7FuQwVJJls2uWtwxnZqC2rpgVdun6LhgyTO1ntSmFOhfQrFhhdMlAccAmAUxJXE8xQNlJdPJ9NeTS1Er6NHncvxM0QUrzEEnax35a0UpTq6oxs7X/kd16Q/LJY+/KQdxokOlI9W11f8jSnGHfB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VS/zch+m; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VS/zch+m"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cfd2978f95so4374833a12.0
        for <kernel-janitors@vger.kernel.org>; Sat, 30 Nov 2024 02:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961206; x=1733566006; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c8lTqcXsmGRMOtMxTUX660jV7KdM2uwrFwbDJ8pCTWo=;
        b=VS/zch+m09chtAANJf75Mhcb0ZQcPj5smcPYN9Qdmn3GwT8IaMs3dNiwBqi+Eref0w
         JGTk4lZG/FvqYZY0ZMbh/KOakPJoeA308dY8OwC9HY9M+iBWsdAwLOUvueJEhUGIQZON
         yeJdXzV9V5YbZCzMYshLFMkam99FbSUwL8+p8DARNw59uQ6x7kv1OV1BJiQNgXDhS9gb
         sUiuy5mEvExGdmImNyRwbz5PvVtGvmnkQPVMHBsZLTi6ZvPx2U9nrm5WuV+x0OfHjIyf
         vG89wIjEvmTyZ4tDSZ5ukP6y8JsgXvtHb7oyoM+VTV7CJSEHWtbrcW4cHyg9klKXuChP
         XfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961206; x=1733566006;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c8lTqcXsmGRMOtMxTUX660jV7KdM2uwrFwbDJ8pCTWo=;
        b=GyOKjB04rl5yUWvZN3Q2y+bpGL9ROhhkqSxp3xwtjZChb04DhqNeDBQUaW3NkXJun6
         URi1Gtva5WLHgjsfywCQCnA2qreEO4M9K+Ivq5jgOgBIAyXSrsa8oQLf0g+JPKYwiZGB
         Q41qrzklnsBD8QzdPYnR5Uo3L19DwFvkOH0FvHx9UoAN8Bd5tFYScKNXVG8ZVB4DwqVR
         EsbElvTRphFCv02IHoO8UAfUDu+zq5Y4tjFvKaVCDMI6puU71uIiBNIA43R3lMDww6/U
         E79O9HwaKMZShzQ5FFQFLjTYF4hJlpL0muT9xr7MGpR1WoN09rPRNGwkmoxld84x+H0V
         SXuA==
X-Forwarded-Encrypted: i=1; AJvYcCW3aLQWZ7oFbKnZnv8BQqiLWS+oy7IoML+HTUd9YhdZBCmQZQ0QReA1FDmtCTrpLlJ7Ti+mnr5iTy1p+hvbgBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhb/O6Iv5N28DO3wTkEpOXfdST9MhbAKO/cVd63QG5YlwQc4LI
	VqBMnKIMU0w3o+MTPEwUJDnikmBCF/TkbyxmqaDiYyWsQrWyvZN5JhOzlWb60aU=
X-Gm-Gg: ASbGncvqKhW26rGPik88hWUkxKkoslMxUjoWJDjQanqKP2hwJczZFJtq+pw/tqICo16
	FSlkAiHKxv+6qJBJiW8klMyuZMI1nfiPLsfGS/MBqhuw0TbwLvuh6PF0Dg3PfWhFnWnq5eqgd17
	JOcDGCLXBTzTFgisXguk+ZOAhdawS9xtMoMpsRgitGPbmI6hR4IXMeUBaBTxAiU0b7L8viGxMlD
	tSxn4gntdyn2YoId5rU1tfCzLo6NbujUKL/GWGTQVsdU6TNrh1NLbmYHgloJIlQxiLdcFgi
X-Google-Smtp-Source: AGHT+IG1JrcrPGtyAZJteVJCHxH7vH8ZY5O7MkjzsGsefj4ES1XpFTzV8A+g+FkUnjuwPIicEV56fQ==
X-Received: by 2002:a05:6402:1d50:b0:5d0:b931:8db9 with SMTP id 4fb4d7f45d1cf-5d0b9319043mr5867129a12.20.1732961205855;
        Sat, 30 Nov 2024 02:06:45 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996df78csm267844366b.67.2024.11.30.02.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:06:45 -0800 (PST)
Date: Sat, 30 Nov 2024 13:06:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Roland Dreier <roland@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Akiva Goldberger <agoldberger@nvidia.com>,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] RDMA/uverbs: Prevent integer overflow issue
Message-ID: <b8765ab3-c2da-4611-aae0-ddd6ba173d23@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In the expression "cmd.wqe_size * cmd.wr_count", both variables are u32
values that come from the user so the multiplication can lead to integer
wrapping.  Then we pass the result to uverbs_request_next_ptr() which also
could potentially wrap.  The "cmd.sge_count * sizeof(struct ib_uverbs_sge)"
multiplication can also overflow on 32bit systems although it's fine on
64bit systems.

This patch does two things.  First, I've re-arranged the condition in
uverbs_request_next_ptr() so that the use controlled variable "len" is on
one side of the comparison by itself without any math.  Then I've modified
all the callers to use size_mul() for the multiplications.

Fixes: 67cdb40ca444 ("[IB] uverbs: Implement more commands")
Cc: stable@vger.kernel.org
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/infiniband/core/uverbs_cmd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
index 66b02fbf077a..5ad14c39d48c 100644
--- a/drivers/infiniband/core/uverbs_cmd.c
+++ b/drivers/infiniband/core/uverbs_cmd.c
@@ -161,7 +161,7 @@ static const void __user *uverbs_request_next_ptr(struct uverbs_req_iter *iter,
 {
 	const void __user *res = iter->cur;
 
-	if (iter->cur + len > iter->end)
+	if (len > iter->end - iter->cur)
 		return (void __force __user *)ERR_PTR(-ENOSPC);
 	iter->cur += len;
 	return res;
@@ -2008,11 +2008,13 @@ static int ib_uverbs_post_send(struct uverbs_attr_bundle *attrs)
 	ret = uverbs_request_start(attrs, &iter, &cmd, sizeof(cmd));
 	if (ret)
 		return ret;
-	wqes = uverbs_request_next_ptr(&iter, cmd.wqe_size * cmd.wr_count);
+	wqes = uverbs_request_next_ptr(&iter, size_mul(cmd.wqe_size,
+						       cmd.wr_count));
 	if (IS_ERR(wqes))
 		return PTR_ERR(wqes);
-	sgls = uverbs_request_next_ptr(
-		&iter, cmd.sge_count * sizeof(struct ib_uverbs_sge));
+	sgls = uverbs_request_next_ptr(&iter,
+				       size_mul(cmd.sge_count,
+						sizeof(struct ib_uverbs_sge)));
 	if (IS_ERR(sgls))
 		return PTR_ERR(sgls);
 	ret = uverbs_request_finish(&iter);
@@ -2198,11 +2200,11 @@ ib_uverbs_unmarshall_recv(struct uverbs_req_iter *iter, u32 wr_count,
 	if (wqe_size < sizeof(struct ib_uverbs_recv_wr))
 		return ERR_PTR(-EINVAL);
 
-	wqes = uverbs_request_next_ptr(iter, wqe_size * wr_count);
+	wqes = uverbs_request_next_ptr(iter, size_mul(wqe_size, wr_count));
 	if (IS_ERR(wqes))
 		return ERR_CAST(wqes);
-	sgls = uverbs_request_next_ptr(
-		iter, sge_count * sizeof(struct ib_uverbs_sge));
+	sgls = uverbs_request_next_ptr(iter, size_mul(sge_count,
+						      sizeof(struct ib_uverbs_sge)));
 	if (IS_ERR(sgls))
 		return ERR_CAST(sgls);
 	ret = uverbs_request_finish(iter);
-- 
2.45.2

