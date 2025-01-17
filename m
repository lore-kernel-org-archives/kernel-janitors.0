Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A8F1F941A
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 09:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737106580; cv=none; b=D01ihQO5cQ/Dz5SGniJaOfGVNTivyqEymnFHDHosDx+SNUjjVDVmTjTAGyr/8CzEeEjB1PmgNse4/4wtJHJ916W3EQ6Jb4hcYPz+8dZZazWB+SJ/v5OHj6kKmcuVRfl84Md5t0MfuiLe/t+KXwQjClZL20C8TEpwZlJjM9CvtQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737106580; c=relaxed/simple;
	bh=H+FhnTGuFT5UOXr7qIHtnGqAh1+qkO7Xh2Yqjl00IFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCyqOIjjd2Em9ojaPzHc9fC7feWkYBpDWSDgMA+6afwSzOP5xuj5H/INPxMBaKZAlZ3jsJ8IhwR0P40k8BmnfDVnTxny2QrqJPMKkjYsUlxdkt3aYV5TrB9SZ1E0UtHIMxANcE9UBNJKWHt7c1gkPHi8RiS+qWgQvFlQPvB643s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uQIicy/X; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uQIicy/X"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso17982665e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 01:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737106577; x=1737711377; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dirbEAQ7TpkYOTZ9TBmIZ+8lIOorFd5YMgxh1YmdvBI=;
        b=uQIicy/XGx1/GD+z8/EdsiMlrsn4Ta/gkJhjUNkDZM1mBWK45nSVUMz80CvyTrQGvU
         vN4edeyWeCV6BujLJn3q82RqSMDPpNdRVd1wUsKJkI9ADcm59S8IuKmjDtZXLDKN9rAI
         vaxbR0ivrgasOfR88GHZnMZxrib/GNZ4kU8Gdiz7xmzud00RbLYVIyD7UuTvKiVBC4/W
         KMPmTQl+BeIG50c1cFdjDmcpo6eNTcQciF/Q2iVC2SOemyLAzQCxE82DP2tiPYYmCvPs
         xGYfosblCD0TS28CpLAEWH3Bkx9ZNU4vK3pUU8Z4uTaxEXF2o+84PidW4Oh3HQ0+IIkp
         V+7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737106577; x=1737711377;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dirbEAQ7TpkYOTZ9TBmIZ+8lIOorFd5YMgxh1YmdvBI=;
        b=RdxtmCpla0nGkq83hUvoMZIpRTSeDZMIXyOVAz8wcNqy+oeho2+pCdhb/hkixDG1jL
         yZ6hUqal5+C2zmGR6BZ8W2nJ9zGj5/1FwKIj1kqF1yC6X8A2VCtRcQ8n9JLiitKCZRA9
         cTgp8uw8flqv4kOIJ6RtGF0lrWKuZPz0guNyoVty3qcJgyQPhNJxQP14IElFSxdajjkm
         4nQhryWFe6Mag+h4k9o/nJVku7Pr8Qh17SRReZKWpJreC3SaqCd2w9R4kB+wMOjHaLs4
         y43angAnuw1qM4tKypO50dkLHN3H1t45m6Vq1HwbCdHywVYVM49KZJoDKfw4T3ivZ/E6
         +pYg==
X-Forwarded-Encrypted: i=1; AJvYcCWE1J7ywcVYzflLQV3X6YleUFzwY1OKNFy+IH+vTPzmsYHMHeoLlYEP57Ff6WQ+LEaesAoQovzNjLM+BhuCF5o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6N0Al20T/u+UKWduVboQwsf1MSlsYiGDvTz3AQpqxOV+XL6Xc
	7Cfsujam1MS3EFmuo9HgbPCK4WJ5HPpLgjyxsSc54nF3o9XC4I9rTz82BGDUUNg=
X-Gm-Gg: ASbGnctylz1JYJoAQrNbPbTkawdIQhduy2egZhIxwdRV9XpjF+s7759CXFSDWIkvqIH
	8BcH0sN9dl2vh9lDIVl4WTo75Xfg2/yhJYfhMqQphnZ9ybuadHcWQ1IZnxlKVtbyHMDUGwpTgBF
	anbFS6VfDyxLR4/hr83gzMXqcK0ojrjuYzPEy21qoezk4WLDSBXtdcuBJc2nbfE2d54dlnGVRN2
	lfCxx94g3VmuqwhQh8UPpPnaeZeX63Hssj3acaplo6fjAt6FfOe12Iy/HyvdA==
X-Google-Smtp-Source: AGHT+IHBC8ZKB6uvv0nxI6PfIPl0cg315iXRGrXvLFhaitipFvwZL0qXSwpAFvCqWeg/C7bXlU5hmQ==
X-Received: by 2002:a05:600c:a01:b0:436:ed38:5c7f with SMTP id 5b1f17b1804b1-438913db8b0mr17966025e9.12.1737106577494;
        Fri, 17 Jan 2025 01:36:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm88940665e9.1.2025.01.17.01.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 01:36:16 -0800 (PST)
Date: Fri, 17 Jan 2025 12:36:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jon Maloy <jmaloy@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] tipc: re-order conditions in tipc_crypto_key_rcv()
Message-ID: <88aa0d3a-ce5d-4ad2-bd16-324ee1aedba6@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

On a 32bit system the "keylen + sizeof(struct tipc_aead_key)" math could
have an integer wrapping issue.  It doesn't matter because the "keylen"
is checked on the next line, but just to make life easier for static
analysis tools, let's re-order these conditions and avoid the integer
overflow.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/tipc/crypto.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/tipc/crypto.c b/net/tipc/crypto.c
index 43c3f1c971b8..c524421ec652 100644
--- a/net/tipc/crypto.c
+++ b/net/tipc/crypto.c
@@ -2293,8 +2293,8 @@ static bool tipc_crypto_key_rcv(struct tipc_crypto *rx, struct tipc_msg *hdr)
 	keylen = ntohl(*((__be32 *)(data + TIPC_AEAD_ALG_NAME)));
 
 	/* Verify the supplied size values */
-	if (unlikely(size != keylen + sizeof(struct tipc_aead_key) ||
-		     keylen > TIPC_AEAD_KEY_SIZE_MAX)) {
+	if (unlikely(keylen > TIPC_AEAD_KEY_SIZE_MAX ||
+		     size != keylen + sizeof(struct tipc_aead_key))) {
 		pr_debug("%s: invalid MSG_CRYPTO key size\n", rx->name);
 		goto exit;
 	}
-- 
2.45.2

