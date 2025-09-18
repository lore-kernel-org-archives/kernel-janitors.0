Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2584283FD7
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 09:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189034; cv=none; b=G2nLukZACFGCLi+l3RwiiLtlujAXrNaOi/ecdoM86UiuNB28TYHKnzjBc4oKC1InnRz0VCdOriZt2iPFoYiwnmU2KJ76csWB18+Nt+Bn/Wax5vh5UNEVYlF5VhZvZVlN0CxBc/EOi5uqY896wwV0xJxpEmDIdD7nPD1faTjpG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189034; c=relaxed/simple;
	bh=qHLJX/TtpVtJetIsYqyBWRD9Yy9lM9oH0njdixetFrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o1CVT4kBSVzzwDfRPgms3DeRIXxpUP3kRD0LFB3R7GmhXngbuiSu/5jfcE/9pgbxug7l88HMOxewEpJePI+B6BTganz0vszVBWjpbFrp1oja/53t+IXufCsCuXZkPK2q1MF2fesQgPjW1TfojSdowsvZKRYFPQ0GQoaa84lP3yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cm3gFDaL; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cm3gFDaL"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3ebf23c0d27so470077f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 18 Sep 2025 02:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758189030; x=1758793830; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQwKqTQzxVu8vPTkPS6AVCaGBlFPjm0mxCJ88MPBe7I=;
        b=cm3gFDaL0oJjGb4Xa0O12OWm/ZzkJJkpTchRc9XSNEEJ5168AitPEYTZ9qx2o+JwZd
         7RBIwOka/wkQCsAlYtbCIIBftfAlh0vey9KBFPKllUZ/Z1aLPei0elc78W3zC+1zWBgS
         /j+Ypdpr/gxDpgzQ6q/MN3ii18TXCQWm4dIz5Zzz9eZ0jX5FallIpoNldIIJH60RfYug
         N0yH0DFaOeTGPnv70Jq8USf8GQF+fU3zuQhjXbZgcaZobO7oxMoQnZDblht5HHk3RzpO
         GGDO1IuNZ3V0Cd9OOOOxTTbmO6u7vAypoos5ojI65P2QQENXYRoVV7Dytm1N/Nk6ExE/
         mmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758189030; x=1758793830;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQwKqTQzxVu8vPTkPS6AVCaGBlFPjm0mxCJ88MPBe7I=;
        b=NZ7wt2ym/20p6zQKNI2YAFej4HD5w+sHTSGGaAyK562miqrWF8obevjEKm4pFb4WcQ
         TjjD11z2VUJkkUPHXEdIki+B94uceq4FLXkuGEaUX4oJc8oGDIuwalop1mOR4j1Sl3VB
         o5rtHCBGIwi8qlnyKeOsG8lGaysJ7krvXvzHF9Ru3IVDz0Esy/bF8aZPsSqZbHRvAvWB
         tQPPjbssOlc2btH6C01fvTEZcFkIDKqjlrlJF8OG1MW6AEEqfxDlN0W7m5chV8mcpcbW
         L7PVYxfnXTxmn9K1i5dO9gsUnGIokFExFId3OqHtJ3AoDLTseDV91osEeEHF11oVhRKD
         WEtg==
X-Forwarded-Encrypted: i=1; AJvYcCWzA4fY3E2UeouJPaM33zPjORNNpbz5vhMh57LHueLA2DfEiY2RfSYSTh0GlDiGboVgGiTB+pvJ7aRGiDjet9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7UGA6CWyiIXt/2QdwU0rzLGY0mDfL1GAcNrSFuK+W8RLNQB6
	pxdcAJARLiZ2LkphnNzOS2uA5IZ9ji082uCMYcKbf9dbTfyKT0IZ6Mg1P2h8CEVjnRQ=
X-Gm-Gg: ASbGncu3vITFHdaIzEOe6/VZaNwhGpJb+/VLCJfuefUS+XpIlKa/3Z1EpkLxzcO70EP
	uQkzQ3EVzu3S6/gePmzK829r952kP6B/WBb5aW20R6aG2KiUEKdzrp3IMJvkfvwt/JV8Ua+yIVb
	/+kZhSiL13zlYWGlJrHGB0V6lhx6NrSuPK+d8Yn/Wr42MThWEOqdBdGLZAB7RKzAXZ3Si03aKB5
	b4wzQJNvpMvDJUCkKhD85OIW4zcD17q/ZvNrpsvx0NkluOswXW3Ulg0qzbXIideN0MF4MQ1N3vH
	5/z4adIVUcH4pkyHB39jdxgeYn8uWYV1v45t9hTv5d/vCUFB3hld6ZAvawxaNxFs16fm340rdtX
	+LrWVS0mdGRo35SSys9tyivGP5xHE3xKWxkyF5UKcuBZlNw==
X-Google-Smtp-Source: AGHT+IGoCMIZSYVGVdr+LonBDIWcYYTv19TLhpipu3kLj9HY+JsSF6G9ZNs6lLtq6lsBFQeD0PjV6w==
X-Received: by 2002:a05:6000:1a8e:b0:3e7:ff70:1b41 with SMTP id ffacd0b85a97d-3ecdf9c9fc7mr4630089f8f.25.1758189030108;
        Thu, 18 Sep 2025 02:50:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ee0fbc7107sm3078259f8f.30.2025.09.18.02.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 02:50:29 -0700 (PDT)
Date: Thu, 18 Sep 2025 12:50:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] tee: qcom: prevent potential off by one read
Message-ID: <aMvV4kK386Sni10i@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Re-order these checks to check if "i" is a valid array index before using
it.  This prevents a potential off by one read access.

Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/tee/qcomtee/call.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/qcomtee/call.c b/drivers/tee/qcomtee/call.c
index cc17a48d0ab7..ac134452cc9c 100644
--- a/drivers/tee/qcomtee/call.c
+++ b/drivers/tee/qcomtee/call.c
@@ -308,7 +308,7 @@ static int qcomtee_params_from_args(struct tee_param *params,
 	}
 
 	/* Release any IO and OO objects not processed. */
-	for (; u[i].type && i < num_params; i++) {
+	for (; i < num_params && u[i].type; i++) {
 		if (u[i].type == QCOMTEE_ARG_TYPE_OO ||
 		    u[i].type == QCOMTEE_ARG_TYPE_IO)
 			qcomtee_object_put(u[i].o);
-- 
2.51.0

