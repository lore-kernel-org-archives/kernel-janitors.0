Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B101DCB24
	for <kernel-janitors@vger.kernel.org>; Tue, 17 Dec 2024 08:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734424963; cv=none; b=Fvm8LUKjcmrBOqisGNVTTtCzMAcEvn+u+eeJYRrELb8mb1AwuFGd8Xeh16SNsbbZ9YUU4cbeQQo6b6SpJcH1lpTGh//M5ZNR2pqp0mwY0sCYQQtPyX88W/K/JKNnB6zuCA2aeHD9yb3JcWjuYsjGA7D1k9JIaH1VxwAcfjSJVnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734424963; c=relaxed/simple;
	bh=u7EPmGjE3yItsH3s2qUAg0PSaWW2yPqZNBMhA+bEKW0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EB+hU7vq2g8vIwZ9n/C2zyAmjD9m5hbQ9Js4sQ3DFHSIE2tYnKsB0ZRI4jR/IVcyeOg5nfYxsK992v5pjK09dRuOtwdGHk6I1WAWVSg9kA3mIEds4jd/c87xyuV/jQMb/699VY5ETIdxE/mmjocAJTCb8gV/seK3MvoLaes++2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eGpkFEJq; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eGpkFEJq"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9a68480164so821689266b.3
        for <kernel-janitors@vger.kernel.org>; Tue, 17 Dec 2024 00:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734424960; x=1735029760; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tnqCM9bJQbzW+r23KYKuk+z7W7vSJuDPcGSAWqztZTM=;
        b=eGpkFEJqAFoWZIrxDV9n/X6TF3HfhEccD+aZUuL0zvMyvVkRJt4qf9I8gpTeb66dyu
         /0QtCtdWPyfaJMmz+MxgJSddgH8Dj0ibNaBPjIuG25XpRDQIZ2O9y1fba5kUM3nSbx2D
         J1piuAaPYWo0liGBhhors63POmBlKR3wmQcc42B/JKN/nJsnJ10U6TlaPPFzkAAEsNYY
         NyTNMC3z16xqlGl/8xtb8MwYtQmXRoM48TvV5IaHWPGQV6wJ4mTvaB/HXhKYvOZoLYrT
         PKzEj4NrTLMW/BKi1gLrgN3s4+T7KG1W6Vq8t3ZNj7YK/vWuLtgYuJ0WrwAYQTVkXFVU
         IyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734424960; x=1735029760;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tnqCM9bJQbzW+r23KYKuk+z7W7vSJuDPcGSAWqztZTM=;
        b=M0fLaCT/+EYHdXN3gfBUCkaCBmQDx1Cq0bPniqJkGzNIiVOLiHYP/DCfIsHsRTLJFT
         XEdXZK6T/lShoVBQVUjRMZcwnjlc4I8T5ClvNY8MX+1uWDm5b7K30QmnVGjVN+T+HHxD
         E//0X6rbqA+W8qUKpRkoKhkEMlRZ8xO64gYJzHJ8qGqW7Ly+AZLwRY7pwmQLSv80y3+D
         njKCU5n7xwNfK4h0fv2vqMWWKDhoVv1Vi8ht+1/OoDtfLHHiJBW1a7yKOYpgSBMZV15i
         vj5psI+AoJbSz4MXO3VLF63N+N5Kwwscqlk3/Y2PtR5ZhspxlnPZHjoYQkg0XoJp9/vO
         naWw==
X-Forwarded-Encrypted: i=1; AJvYcCX2z/EiyxtFQztFWOH+aZlDgYEacY5aYMREQe4mk68w6bwLT8defbfvZFDVQv3m7CfSs1mTPF+m09pyfZtjByI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymS2Vzo0j4YU8Zu1vv3fOgbkGkZ7VGW3dFDpELuZe7Qy1yP2VF
	Yi2/8Nw7zwgYe8BWEIXs3eHcja+9tRF4g5UtfYFAUteKk+OmiHxF3FQepGUOkfwAdxGLTKt/nVx
	d
X-Gm-Gg: ASbGncvZUlEA4cCxLjBTiaFHkiT1AQjlS/cBbprD1NaQcQeocEzTOkRM5NNIBEd7R2a
	3QLyqeZuBpGrYBcIW2C4fNlsA6mvSpNE0ANBeSZkk3CggdUL4tx94pl64tG8bci5kpZs5OSsVBi
	Jm8cU8M+6KjlzZm4zEmG8amMESsqjp5ue1jixJpCnzoX2h3A5MvSH+By7iF3kS8dSJTcSqMwkHJ
	a6Wuun5r0kB/lNl9w29D1HzXW9dOzEHYFsYyJc194uyCU+5sJu6nb4UZDMATQ==
X-Google-Smtp-Source: AGHT+IHjl62rxv5fN8b6+l4bXJbQs4Ut+f08oUNXA0w2flv8RIt0l6xa6LQUMYsprZnWOdR6xiO0iQ==
X-Received: by 2002:a17:906:4788:b0:aa6:93c4:c68f with SMTP id a640c23a62f3a-aab7792d8bfmr1536349166b.21.1734424960284;
        Tue, 17 Dec 2024 00:42:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96087424sm415709366b.83.2024.12.17.00.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 00:42:39 -0800 (PST)
Date: Tue, 17 Dec 2024 11:42:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Steffen Klassert <steffen.klassert@secunet.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] xfrm: prevent some integer overflows in verify_ functions
Message-ID: <92dc4619-7598-439e-8544-4b3b2cf5e597@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The xfrm_alg_len() type functions take the alg->alg_key_len which
is the length in bits and converts it to bytes and add it to
sizeof(*alg).

	return sizeof(*alg) + ((alg->alg_key_len + 7) / 8);

The alg->alg_key_len is type unsigned int.  That means that if we pick
an ->alg_key_len which is greater than "UINT_MAX - 7" it leads to an
integer overflow and the key length is treated as zero.  The result
is that xfrm_alg_len() function will return "sizeof(*alg) + 0".

However, so far as I can see this does not cause a problem.  All the
places which use this length consistently do the same conversion.  The
type of thing I was looking for would be code which uses partial keys
or code which uses a different type instead of u32 for ->alg_key_len.
I didn't find anything like that so I can't see a negative impact from
this bug.  Still fixing it is the right thing to do.

Fixes: 31c26852cb2a ("[IPSEC]: Verify key payload in verify_one_algo")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/xfrm/xfrm_user.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index 08c6d6f0179f..686c6a24d92b 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -45,6 +45,10 @@ static int verify_one_alg(struct nlattr **attrs, enum xfrm_attr_type_t type,
 		return 0;
 
 	algp = nla_data(rt);
+	if (algp->alg_key_len > INT_MAX) {
+		NL_SET_ERR_MSG(extack, "Invalid AUTH/CRYPT/COMP key length");
+		return -EINVAL;
+	}
 	if (nla_len(rt) < (int)xfrm_alg_len(algp)) {
 		NL_SET_ERR_MSG(extack, "Invalid AUTH/CRYPT/COMP attribute length");
 		return -EINVAL;
@@ -75,6 +79,10 @@ static int verify_auth_trunc(struct nlattr **attrs,
 		return 0;
 
 	algp = nla_data(rt);
+	if (algp->alg_key_len > INT_MAX) {
+		NL_SET_ERR_MSG(extack, "Invalid AUTH_TRUNC key length");
+		return -EINVAL;
+	}
 	if (nla_len(rt) < (int)xfrm_alg_auth_len(algp)) {
 		NL_SET_ERR_MSG(extack, "Invalid AUTH_TRUNC attribute length");
 		return -EINVAL;
@@ -93,6 +101,10 @@ static int verify_aead(struct nlattr **attrs, struct netlink_ext_ack *extack)
 		return 0;
 
 	algp = nla_data(rt);
+	if (algp->alg_key_len > INT_MAX) {
+		NL_SET_ERR_MSG(extack, "Invalid AEAD key length");
+		return -EINVAL;
+	}
 	if (nla_len(rt) < (int)aead_len(algp)) {
 		NL_SET_ERR_MSG(extack, "Invalid AEAD attribute length");
 		return -EINVAL;
-- 
2.45.2

