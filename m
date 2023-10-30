Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A7FD505
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 09:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wZpWhut9"
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78E6AB7
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:06 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-507adc3381cso6049183e87.3
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 02:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698656584; x=1699261384; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SRyapUQYnfbbBHiYxr7bXEhk97MYCElvMWksTuUpiBI=;
        b=wZpWhut9utHVScFz/2KXaGxrA3XNOs9Qf5RZgAX2Rn03OVYaYlNvuUvz/wab1szK+r
         w2PxM9812INZI7RV3kQiuCU9gxYdcIUkxrppT3xvwt4F4FL0mDGWwNvHOliYKeWzQOd9
         NN/9gyTb69pP4Dr58hHrXUCZ3j+GbSxUWwQdWUfmckd2JzTWdQbQtK/tdJB400+ypX6F
         +yPt7dK4IauGe9E43jz1puvLIREpChgIeGlyoTJ1sK4T4Vyi5/w2TNPf5X9fxXcfqOhq
         bFQV9c25kEf71kBsC4QKDQ2WuXXbG4oWtzO4AMeeHYCj0sqgKst652HYXQJ0Wph1Lba0
         YIDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698656584; x=1699261384;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRyapUQYnfbbBHiYxr7bXEhk97MYCElvMWksTuUpiBI=;
        b=d9L529rlbbAXEclONCmOQwU1hZ5eYsT3GFxfweRYQh7qT6miXxi49lBvJmRarYBQzT
         SQGuboqa9uY3ODUZRRYvZYcLjsa6DrtN5bkq5Cu9BBw4mgx/rKzIL7H+fQABcN3aiQ+U
         39AVG9cT6fMZlAqcnCXTLEVSJTnEDECKlz1tjssnViXfm9DYPG+T/7ktVFPfqgjJW27Z
         QS5ckzmX06NDrVXTEByBnKReivSiTEK+Pxmx3giH1aq9AYFR++FRPXWgwvVk0nSH8n7Z
         9Dcotu2hv31jIGrpUIyURsbcOROqwLrXJHiQ4Qi2c4adOOuasgDzBgKBZTgF6xKEN+up
         d4zA==
X-Gm-Message-State: AOJu0YxiWJFNswJGUL/+yu+Ho1z7Szo5CxmjBwcLko7W8i985gXShsUP
	f/sPxZQh8dYlAwsjdouzLKhmd90yjT+yeKGzL+w=
X-Google-Smtp-Source: AGHT+IGE99OWNt/zT9E56xEJH4FurSF3jhY8kWnknrKbKIipicriA4DVeO6VjLRCYnBV4zz2JQX+Fg==
X-Received: by 2002:ac2:43c9:0:b0:508:e4b1:a785 with SMTP id u9-20020ac243c9000000b00508e4b1a785mr4581566lfl.62.1698656583893;
        Mon, 30 Oct 2023 02:03:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l12-20020adfe9cc000000b003232380ffd7sm7758694wrn.102.2023.10.30.02.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 02:03:03 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:02:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mahmoud Adam <mngyadam@amazon.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Stephan Mueller <smueller@chronox.de>, linux-crypto@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] crypto: rsa - add a check for allocation failure
Message-ID: <d870c278-3f0e-4386-a58d-c9e2c97a7c6c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Static checkers insist that the mpi_alloc() allocation can fail so add
a check to prevent a NULL dereference.  Small allocations like this
can't actually fail in current kernels, but adding a check is very
simple and makes the static checkers happy.

Fixes: 6637e11e4ad2 ("crypto: rsa - allow only odd e and restrict value in FIPS mode")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 crypto/rsa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/crypto/rsa.c b/crypto/rsa.c
index c79613cdce6e..b9cd11fb7d36 100644
--- a/crypto/rsa.c
+++ b/crypto/rsa.c
@@ -220,6 +220,8 @@ static int rsa_check_exponent_fips(MPI e)
 	}
 
 	e_max = mpi_alloc(0);
+	if (!e_max)
+		return -ENOMEM;
 	mpi_set_bit(e_max, 256);
 
 	if (mpi_cmp(e, e_max) >= 0) {
-- 
2.42.0

