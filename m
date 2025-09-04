Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44C82701DA
	for <kernel-janitors@vger.kernel.org>; Thu,  4 Sep 2025 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012341; cv=none; b=kQK1BvzDN5jvve0X4Uca50iomos6jEdeLwgVn/J+C1XCo14G2mQ/ysprbnJqLUbL0Hoh/CD/sH55k2QoyQP4c4N+A+KNmpoxlsTHvvUh2jrJN3SscCGIyOE+scgpN7srBxPvH0/yQ2pzRna5RPGp+YPFgYv6casSNqP0eYCA57o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012341; c=relaxed/simple;
	bh=uivRpA9HtbBawOeMvgjPRCQa2tnswuXo9Y09mOkTMZI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m+H4BIbY4nynLoXOX40S3OXqNAuLe7Is6ePF20oOZ61dgpnPlJD9h8jGWDH1VXh/jqjngU4g/bqhRhUotdY+sx7hwAun5auaAdY8baPPK9i8/w9UJ2hiIOhrwrZQpEWw8h1MXUGKRhxJjwLd3An3g8tb3OkGUuejeKeyaXCwmao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TuOErrJ3; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TuOErrJ3"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b7d497ab9so13752145e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 04 Sep 2025 11:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757012338; x=1757617138; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H15AtklgMCpkPmsWguobA5odfiBnUJPbrja5Zjg/Sh8=;
        b=TuOErrJ3evnYIuhusxHIBESgFVMAuU22hDoTk68WV0+cFB8pzYSfu7+CfwVWEUUbqt
         Ze8JVRodGi8+IGdDP+/UIaTKi2ziSM6bqIjnaKGGRkQXZ4vshj1SS6R+8LjCGy34BLs+
         n5jWz4LfY4LR4U7k9qtTbFyqg+PYfDgYWBrUz6BEJBJcWI6qnZ29vpBBCjbNtkKwv865
         vappMPUb6Oo8pMln7+bky3V6q6fTecNN5vtbn4Aj2gRb7m0Zeo+6Itna+OB4oFkP43c6
         AdLiM/acKjVyIe5ntaC62HVdiqPP/qk5dJyC6ugcaufjDyBw8o6t+FK6/kMhwKnZidiJ
         enNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757012338; x=1757617138;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H15AtklgMCpkPmsWguobA5odfiBnUJPbrja5Zjg/Sh8=;
        b=kacGb7K7DPylnID5c7znsWM9hw7nz4blFxo8wWWdo3/lyFevoL2iCBEHcggvWFxL8z
         8I46iw8ngLC4Ip0Shs/Y3+BgHwntH9GAOSG17zR6YX7zul5jdIQcP7J15Mfb1rCuOdIb
         DpIuZt8O1hZeRicPPW30q4hHQQnPchz8zj0f7RP8yJer72KiPzcLMo7eOqEf7HXttcCi
         KZgRtRMUcxUFgH8edbPuD3otWFpWhaAoiRw5quGRD5p7iU7W+mwJBOpzHN5udIhnLHqJ
         EE4/2EEQjsFr5u2w9QyBKbKoYIKje+qTwCur9hHUglUqe2or+ma1qcx+POk62lwxmZuv
         Keog==
X-Forwarded-Encrypted: i=1; AJvYcCUC8UUxPR37uy6BWf3rF1u6o3IcVmlLgCuF++LZJW4MLr7htm9zFUSSvDYsArGYM7fPi1eQk3yMAFDUx5GqbS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpUjhNMqKiwQYAUA7r0Sg5NvfysaIvRuipBCxSlgz2CuE5LIcf
	LsoC1mMK6KkZnuRA2PniCe/YDRErJNVZAHQRholaZh09VTns4WRXIwgIr3XeS7d228s=
X-Gm-Gg: ASbGncvGtwd/0TW1z+xIynHpFfVsjPFdDwilYRn2Pn+7DWJ9PFFjv0qDQJVD+0iMZKq
	5ZCF3iBu9ncv1xbOXA9YzFUxaYAQl5dwirFJKPbp4z9d/apP28MyU9WdP3Kz0DQtN4fogpaJGT5
	tu8UapcUZWMJpbX+OczPLoMvZPC4ohzeNFobWtcUuQs4vPXb8E3yjBFNho7R2/k4tWlP2JCPgEs
	aYxeaynTR3375Vc6oaXTqcgS/0mTtuA2FXOYL+HAVmDkVYMQ0dfC5P+zQ9gFaGuHhWXY7BpE+8p
	VnWcUgU0zFOaW9m+Yab2nDzRJGJWKw2m7P8nDAGChoCcpWcW2IcjamZrNvIVRP8V8TdKFjbSGXS
	nF5XfNU/mx24iN30l5MsPwgg8XtQ=
X-Google-Smtp-Source: AGHT+IHv44BQzQPt0SDDcu17yZCqUyKvQjIqrXkJNrOFeUvr/3w7IzlwPeGAssGYkeSJFClhPjyO2w==
X-Received: by 2002:a05:600c:c4b8:b0:45d:d403:332a with SMTP id 5b1f17b1804b1-45dd53df7e4mr12552345e9.32.1757012338151;
        Thu, 04 Sep 2025 11:58:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45dd0aec70dsm22029535e9.0.2025.09.04.11.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 11:58:57 -0700 (PDT)
Date: Thu, 4 Sep 2025 21:58:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: keembay: fix double free in
 keembay_build_functions()
Message-ID: <aLnhbpfeweBI1H4N@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This kfree() was accidentally left over when we converted to devm_
and it would lead to a double free.  Delete it.

Fixes: 995bc9f4826e ("pinctrl: keembay: release allocated memory in detach path")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pinctrl/pinctrl-keembay.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-keembay.c b/drivers/pinctrl/pinctrl-keembay.c
index 30122ca90cbe..3241d3ae6219 100644
--- a/drivers/pinctrl/pinctrl-keembay.c
+++ b/drivers/pinctrl/pinctrl-keembay.c
@@ -1643,10 +1643,8 @@ static int keembay_build_functions(struct keembay_pinctrl *kpc)
 	new_funcs = devm_krealloc_array(kpc->dev, keembay_funcs,
 					kpc->nfuncs, sizeof(*new_funcs),
 					GFP_KERNEL);
-	if (!new_funcs) {
-		kfree(keembay_funcs);
+	if (!new_funcs)
 		return -ENOMEM;
-	}
 
 	return keembay_add_functions(kpc, new_funcs);
 }
-- 
2.47.2

