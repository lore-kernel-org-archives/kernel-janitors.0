Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1721F941A
	for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 09:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737106728; cv=none; b=WxqgSJj/ce0vFmh0d9WGCl9VLrYTK/Vs27S3ms6aKGWE6hd/EgjyCYIkR/dkuLZXl4I8F/zFid3vRjIUcbUOj6x5baMYATnhFcplozTpep1mN8QmVw/GHN0xrK5ofab9DDvoVlI1rEh0R1loIoy0VnzgXjObasCcu4OwoXqZTwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737106728; c=relaxed/simple;
	bh=7PIDeEtvr9uPdcgHVL0bACn5nZLTvKQ8toqwIsMpJu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rMCiIXoq2nsEDrbOL+90/Jn7QnobBYflDTR0+Uoh384YDhP45AqZRfNV3tJSYCxB7TDckQiaUjp51GbAv4rODgHvgZA1JW48du00jfGIayKau/KzaFmPhfToSOQsbSIXvsTYfgYuDxBgTAB7/XMbGkOPKZde3MJfi31qsBkCFko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PWzA/b6y; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PWzA/b6y"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-385d7f19f20so935044f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 17 Jan 2025 01:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737106725; x=1737711525; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVa2rnxV4FahyPJ4tYXvs8063pmYzJqVqaz+tJmn1sU=;
        b=PWzA/b6y1lZ69sZaTvI+Z8mh83kP2vCuyoq+Rs4bBteRPJKMLdkojew3DMQpwBgYgl
         QAPcXg3m1lf/agfhS9LgDnpHhgUgluHvzT6OKZtpYLg56zn1665iXiEgaIZXgfrKwVrd
         SnHmmq52fJ4vssbnuG4BPKdhoixi/JrgUSU3StT/hTJQV6XC8wG1jpHqw6XcbZRZsgYR
         IUsCze1zwYIQD1h7Eln/C9HY5RZwBSdFhCaAuUyXndTlbsyqn4PO/OCxRzJ8gvDfew5T
         C/8avyxfmQUzOrrqRV5RaFrVYVMoBi+J2BCug9/S9PH6cfr2pkQIMAEKISxc8cO8rwOs
         STmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737106725; x=1737711525;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVa2rnxV4FahyPJ4tYXvs8063pmYzJqVqaz+tJmn1sU=;
        b=ftC1+AMQ5hrcrJM9qpsKGwnqDj80B8LMKyUBLRAZOFhxLPhLkJJGnHn/YuObxr1iYj
         91H8McB/hJG4CF2C51A3r8ilzwuqq86HBBcC2cxLvN8MQlq3/NYT/AGHjBbBQwDOXnZb
         TYU4FcpzmW7YPADmBiGXjcAb6oXP0u4x3I81uw/zs//97UBARfnF/TXsrVLxjr16p/kj
         PmulNGvVAjdWn6Cjdc3TdpxFr3UAhjVjyZoOBqqQohPWgvQnT+qgvYf+iXYRQ3sskvAu
         krbD3jrjPu4u3uGGUkAFNpb9JAWNJWotgnB7R8qDRUUQofNtCbZzi3BDcTpEfjZvqTwt
         kZ4w==
X-Forwarded-Encrypted: i=1; AJvYcCVL63BYwTSiAZq5lLjzFK4wmfve+q4oqHa3x2Ak4800O7JSFn7SIKUpph0fkrH4KE97iQF86Jx/ncw1gDhA0Kk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu31cisgyl9tVNyVMzZwQzszgcrqLkUF8t6Fb/jRZe2bvvzC8d
	2qoKHNjPRNEWLCM/ld3KJ8JoUbzE6ecDAUYefd1TEYgFc3dWDSGEAEFWZAoWlBQ=
X-Gm-Gg: ASbGncsYmB6O/J76Vp2ARUh0/sp/3Rx1NW9D9Y9IirP4KST4w+9E1WrgN4ZDsVOch7q
	DMAL2c/6nGtxPjjnSf8MyXBUjf/agAK5LbUrG5MuKYXrv44jUcB4AqE6AhJVweD1Rpu23g9rATu
	seSXqv8CKxp8QrnTwhWP1xUflpXk9G1kAARRQ86xsp/+r78wXdAIqYdEitHpIl7nGJ919tE/fbg
	krOecVfpTnYvyDzjtbeutqtREBLhp9n9p0gJ1taZjiEw618JtW9VrKdB8wcTQ==
X-Google-Smtp-Source: AGHT+IFfhDofhNGp6rNLJ+2OR7B+O+RY4aExqQfShuso+2vT/89CUvI075Q+efQl6cI00ww6Mcwsgw==
X-Received: by 2002:a5d:58ef:0:b0:386:4277:6cf1 with SMTP id ffacd0b85a97d-38bf57b380bmr1503817f8f.39.1737106725381;
        Fri, 17 Jan 2025 01:38:45 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327556dsm2024569f8f.71.2025.01.17.01.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 01:38:44 -0800 (PST)
Date: Fri, 17 Jan 2025 12:38:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe Ricard <christophe.ricard@gmail.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] NFC: nci: Add bounds checking in nci_hci_create_pipe()
Message-ID: <bcf5453b-7204-4297-9c20-4d8c7dacf586@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "pipe" variable is a u8 which comes from the network.  If it's more
than 127, then it results in memory corruption in the caller,
nci_hci_connect_gate().

Cc: stable@vger.kernel.org
Fixes: a1b0b9415817 ("NFC: nci: Create pipe on specific gate in nci_hci_connect_gate")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/nfc/nci/hci.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/nfc/nci/hci.c b/net/nfc/nci/hci.c
index de175318a3a0..082ab66f120b 100644
--- a/net/nfc/nci/hci.c
+++ b/net/nfc/nci/hci.c
@@ -542,6 +542,8 @@ static u8 nci_hci_create_pipe(struct nci_dev *ndev, u8 dest_host,
 
 	pr_debug("pipe created=%d\n", pipe);
 
+	if (pipe >= NCI_HCI_MAX_PIPES)
+		pipe = NCI_HCI_INVALID_PIPE;
 	return pipe;
 }
 
-- 
2.45.2

