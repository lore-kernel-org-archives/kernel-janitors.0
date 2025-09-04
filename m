Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0C263C91
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 18:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012378; cv=none; b=pvYEOAAMdzpLrbb+HbldZPa+L7QpaUAE1qFVqG2MSUX1L3t4wneX/Gw/BgOZJqPZubwWh8fDwwuCwRRdS+0FGw4s+YnKivhotgYz/z4d2qKlnyOBgpWhXmt/m0AfyCVyjwVsRDj1h8Lht2WP20pazHB9klV9kNtojgeQlBpSr8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012378; c=relaxed/simple;
	bh=hl7UzHlA38V4Bluawkwxwy+Rq2dwVuzKGOkhwZEGe7g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GqMMxCGcr11pqgyIeozMvVRbPBBY6R0D4Cl9FWLNPvaGETR2b9KwjnbPxy6fxrEnlBhDhyLGBVrJ283yVRdLInuhXQAGJpQz8OWhwIqHmCAS1PDEOijyt8uhkOmmT/lW9e7hSyLShhZ5PYLg1YscttFuHBOiaDcZ6vjplSUpuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NnEc1ysI; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NnEc1ysI"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3df15fdf0caso1069816f8f.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012374; x=1757617174; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nWB4qwgbKVqfMW1WmVN2/rZ5+FIZKuDCGHJqFvd3HhU=;
        b=NnEc1ysIVFU8Vkyh5N+4Y0QCfIFALGQjVEJD3HeIOxLPNnGGtg23H6Ez1mKyrbM5jY
         U9FV8ya6o5MD2QklYYMFVO8LBUC544+VECkAzCvbYjAZxsWTjRamajH1SaYoBd/erAN0
         Hk8eZ2jk6D3vOry9FasFfwfURSI722amFs/EkbtKRYDycrK0E8THfC4pLj6E6jYQQgc9
         bkdOiGcub+tAhVb5px4lEzuFco1mnWjiVn1aeG/YW5c+5Zin8joQNAH1SOvaEkFR6Alj
         p2zj0Msq9rsFvBYnWMxX+g0opHoDxis7xkRS9dPtE1MfaPeMvPn9zQbGkTAzE5GNoFLy
         II2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012374; x=1757617174;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWB4qwgbKVqfMW1WmVN2/rZ5+FIZKuDCGHJqFvd3HhU=;
        b=rEw7ompgfUIXjgZb4CFhRJkPkK2H7ARIosifxbJhZHY8oeagZiCeF/wb5M0qP+SLln
         E1H8kudrlF22piqAVV4MP3qxMCjgDmSa3rklu4YSH5u6JheBjF1JSyl+MXy0ku9XFoSr
         ksHm510/kvKBBCEGza2upziMIKItMsUANWpIxqkZgM7xNfb98Zaf2Xh4F6V96ODRQ46U
         RbXXA0k2lXdzesVQ71Q2ub76D+75VoADHTsr5Zw0G2C0sZJ1d8qVLN3jabT80Rdo7iKN
         hzDLNCYM1mt7Ed9GqPdufZeN4hjLds31TtmAWuJ6sN003z9r03CA7NGYuyzue11j0Qjb
         6XNw==
X-Forwarded-Encrypted: i=1; AJvYcCWQc/AQ4/GJKKbLgD4wIyZ7LbYnLSLER5+VOcrS9k7hCX4wN6D//F+uhcH+iTQ4ofxXwsCyHbaNY3zJbBzBxJ0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnG24qDCcxnalArNo3ysllI8d/9IhktV6xSU7PV2+UV0YOSdUV
	ReFNgABbybeuJgQU97hX+9buo5+u1xAfoeyr7uVb0xZbEiL+dAe/QWNKm9DxNi6ckVU=
X-Gm-Gg: ASbGncvZ4GKf+RG865KK0nIkqS+GlGQztZghaLfjBjUmagqMlxWWV+zGYrfqNCEcg1l
	1Sdd7uYIff/58f8YGOyeJGo3C5P/seMp8XYrmIuzPAVxKShZ7mHnWEddqNyOlBmAoVJvQqi7IsD
	A6enG22lGxyhfaD8RtQA6A++nTZdr24uZY1cjNzMUSm/sfSnz7lwkpGAZanIog7sG/OB8+H9yTx
	XRAmhAiuEegDcXao8ZEIQG4VRy9b5JaqirivoMCNWwco7HxgyYXpuxm99xDq85QLwu1bJmG5WUW
	UGa8OUd8IgvDt42Vz6Ng4NDUXCs6F+fIQoblyhHsIa8lrHt4irxL8Zr3FVVCWbOWx3j6Scxl80O
	a42C374rM/19UquOWR2qph8sTEVU=
X-Google-Smtp-Source: AGHT+IHZZPprzS9mbuO41DYFLAmvIcfpOdVZu+bM1xROID69orUBhGlsV7b4geCS+yXzO5UlL5rZ+Q==
X-Received: by 2002:a05:6000:178b:b0:3da:d8a1:9b6b with SMTP id ffacd0b85a97d-3dad8a1a85emr7222669f8f.3.1757012374584;
        Thu, 04 Sep 2025 11:59:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3d1007c0dc8sm27028606f8f.53.2025.09.04.11.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:59:34 -0700 (PDT)
Date: Thu, 4 Sep 2025 21:59:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Scott Mayhew <smayhew@redhat.com>
Cc: Chuck Lever <chuck.lever@oracle.com>, Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] nfsd: delete unnecessary NULL check in __fh_verify()
Message-ID: <aLnhkm7q1Di0IiIu@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

In commit 4a0de50a44bb ("nfsd: decouple the xprtsec policy check from
check_nfsd_access()") we added a NULL check on "rqstp" to earlier in
the function.  This check is no longer required so delete it.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/nfsd/nfsfh.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/nfsd/nfsfh.c b/fs/nfsd/nfsfh.c
index 062cfc18d8c6..3edccc38db42 100644
--- a/fs/nfsd/nfsfh.c
+++ b/fs/nfsd/nfsfh.c
@@ -403,9 +403,7 @@ __fh_verify(struct svc_rqst *rqstp,
 	if (error)
 		goto out;
 
-	/* During LOCALIO call to fh_verify will be called with a NULL rqstp */
-	if (rqstp)
-		svc_xprt_set_valid(rqstp->rq_xprt);
+	svc_xprt_set_valid(rqstp->rq_xprt);
 
 check_permissions:
 	/* Finally, check access permissions. */
-- 
2.47.2

