Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B161026F47E
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 08:17:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396278; cv=none; b=t3DsPMm9gzdzx9V7RmQ1HGQ5U9jyFiuwrjUSmEVZ+Sk4zBVWMCIanuJ4tTMEgD5CrlCgHECXx/KEJDAGYJrm59esZiDIKoJFfOBhSAPlGhDtbfi7KV9VXrZBABlyEg1AMoN3bgxjOD49FBbTZqE0JnDHJiHic4FwA1iLV+T7RSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396278; c=relaxed/simple;
	bh=oj5Razb0evj7qw4mlQSndhKoTaML66NQzQjFs2IHgj0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hEIzZcphdKfIEAKNlobfP/9lTe8RbcLoZ634bSc2B4T/0lKsKGU1TqLh7RSuXsL08sl5kM7l3Opap0p06Im8nf3i7Pna5tUHXOMm9fDAuXbRCIgw3wLqNOa4ADJW8BPml/BMXzUywUF7YvQPwA19rrNyobxXoP+UsvDsoPycZpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nbNcV99f; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nbNcV99f"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39ac9aea656so7684559f8f.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Apr 2025 01:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745396275; x=1746001075; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eJlsow9pFCETuSY99miJym+mwybzmiktgCsSrbNRcQE=;
        b=nbNcV99f3Ge2+RvsUzIS+KXozOhDCyHgqrm4E0UY94qA3WuYLz2Q/f0v1sd2+FuMYe
         Px3UQxcVCOyl2VNRaXMyjMgZ72CDecXBDkzmAJRsdrcbFGJEKy9AAxh/U8pVbfxT3LL7
         e2MS8TuChfC8UTgMVl/cjGsYX6VXv8AkzhxtrqzWT0zyoEEskVITY4QAylOVC/LzQ+K2
         0SX2ukAr6f/vmdcYGCRv37h8UD4FyZ+G2IWQH4bcdMliRJKANS2vdcQ+z8MOxPFbJUsl
         /KiKzOR4W2Gdrl8+lNWMQBweHNdtCoEetjWyzoO4XSZuypi9M+Ap68L6uN+k02n7vCgw
         eAWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745396275; x=1746001075;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJlsow9pFCETuSY99miJym+mwybzmiktgCsSrbNRcQE=;
        b=L7qW4lz4hjZuuduy7hvGlgkCfjFUfHN35rcAUZDMd8T5qxfq3mPRh6v2xGiJ1yHm90
         fbqbm/EEV8ENNojecsff5V/h6Jg3vk3xQKGpYwbFDQ+aKWVXfJ/GaLxuCZGNHj183Yp6
         eeIyrbvYYhUHL2jVCOd1wRi4talRJP1NIYdvf1d/jNZcHwWYMBmjjw4/qfmAMEAurMOH
         +8jeo6/rZzhdYen4FhmxRHU9ddofaVRapfAvdWvJgtx1eW8CHnYyy3Dd8xGzSu+Mzocf
         InqaNljROlEclUgZPLYy1CItYRzviaaVrvSuJ7OK/00tnfx1G51kinNdoCQM4Vq7uayQ
         OTPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlHSBvS15013rd0RGQfrAuO8YPUG0j++rANlC78ct4SFSqFJPew0UH9zCScaNN+uB/YATqDmtPVYufwdTMtPA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1NT9Uu8DV4Da0dCSdRTioW4NTyzGukIwSpMzLPI7PxdTOu4wA
	wG+ZPQFNRzH07wczo46u9irZPiF0dMwZ8zJFGg/amgRLbXmTGa7HjGiqjVRZhOjfV7aMDiawU+H
	n
X-Gm-Gg: ASbGnctEi7dJRxVyBvPFLI0ZagU5mCIKNgD83MxsL49YjXWp1XYPfiYL3ZPo0baQiMZ
	yKDHxAk5MuIUsQNdvkFphIoZNnFNlt48TbzvS+F9QJC5bZH1/COHqqNkHYeaYijLNNT285puZm8
	5AY6L7sYReRDtFCNSeig0qCbCWnTxK+AUzeecIi599lZCc7ZFFizIIL0pv2zAxMaBslJSAPOGDb
	W1ByFzhqWMtuVjlgypBWrsb+C/aUSlg5VgWkYZVZl3ywDsXnsamNSlk/B52c3UUyLoRbuo8MyAO
	W3gELJSbdcf5M882rcBcy/QezJBDxj/DehneBF4gSMC2dA==
X-Google-Smtp-Source: AGHT+IGFDsGRWEWEl41iqXxk8aBjeIQESD7eXixSYt8kxgOh7t6MkCbRrpyXFS7pLyu3bxpPdPkSyg==
X-Received: by 2002:a5d:584e:0:b0:391:41c9:7a87 with SMTP id ffacd0b85a97d-39efbaf5562mr15384290f8f.51.1745396275079;
        Wed, 23 Apr 2025 01:17:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39efa433170sm17690531f8f.25.2025.04.23.01.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 01:17:54 -0700 (PDT)
Date: Wed, 23 Apr 2025 11:17:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] driver core: auxiliary bus: Fix IS_ERR() vs NULL check
 in __devm_auxiliary_device_create()
Message-ID: <aAiiLzqVulfGDPsl@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The auxiliary_device_create() function returns NULL.  It doesn't return
error pointers.  Update the checking to match.

Fixes: eaa0d30216c1 ("driver core: auxiliary bus: add device creation helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/base/auxiliary.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
index 810b6105a75d..61b876d90b7f 100644
--- a/drivers/base/auxiliary.c
+++ b/drivers/base/auxiliary.c
@@ -491,8 +491,8 @@ struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
 	int ret;
 
 	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
-	if (IS_ERR(auxdev))
-		return auxdev;
+	if (!auxdev)
+		return ERR_PTR(-ENOMEM);
 
 	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
 				       auxdev);
-- 
2.47.2

