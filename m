Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82A7333446
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764351539; cv=none; b=U1lGQwbCQA25pxCyqi6VJgColVvLdkjiZyHpBlyzb33gS6SwI6NTf8lJRk4/ABpH25qZ6Anrb3HsgtxX8PEbAvhfFUe0zjvw08lZKH+puTJuRDnaqmX4ADKXj2IoCvhEASdzk4gb4f2P5C7ErvOxwMVBtjBV+ykNwjfWpO+WYCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764351539; c=relaxed/simple;
	bh=QUnXh9qGetYUOjtOOcXn3XHKSE/rNqBL6HF7oEFfcz0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pyMcEEgZ+XKgSjDkp2rHxdxrwPicHCvWxFLKeDgDT4AD2UTg+SKrBuyr0+ZVuR/h26je47WA/7Hf2rOcCxFe78tFkO0ATtGPS1B00ynmz5my0N+wN4vZ9o/reN545dne4dbHEkAQl/Ks6wtoJSJjjwNYH2Uah215MJnrNw2XJ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFcoUDTj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFcoUDTj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47774d3536dso17392985e9.0
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Nov 2025 09:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764351536; x=1764956336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xjEu74j7ESkiTPga1dBh7HPK92+GF0ak6Eb0e4LqHbI=;
        b=OFcoUDTjIavuLVQ3rwAh/RgglkZdsUkZEV5lWeMzidvVC6ESKxeN9IX1O/Lo6j2nLu
         euUFL1uen2TxGDuMm2xS8GcFsBXo1Dh0BHoEzEIFvtAUwbXSCTchW87ynCm7JTaqBOr9
         RFQq/qlEvZKwHAeSKccSPGQYzM8Cgg4aRNUy9Imuu9jzyjDyNiWGnNhtPJ5VjueTYPyI
         oq15K4ZSznkyY+w972xnxGm3mytai1bRfL94lJv2F1Y6+3gyNX9NMh2+nYv8spYgrXlr
         KHYAPE0sjps54HKpYoJ8CElSxxQ0MuUmNN7u+0h8VxJR3P/5Fx7tM85Xh+6LolFXhTRP
         EJ3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764351536; x=1764956336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjEu74j7ESkiTPga1dBh7HPK92+GF0ak6Eb0e4LqHbI=;
        b=kKYuZL4fl3Bu53q/krZ0tz+/Rp6nATetXjYUndXHvIgkLSYu47TbOJf7zzp3LGY4Io
         HW1x73Qh5A646M3nDifyEqdv2oWTpHKMbiwxnCG2cETV7Hj7vs9TwDrfWq5iJ0RcpghM
         1iX2+qf6L374bzaiq+pu5QcY8D9PAvEAX/ip8qJ8z7bV7sHexKx8Kw215I04bpiWzjqM
         xUNkHxe4VHdVrajGqjUF2G9bvk2z2CgEYMsJd+HtBdnum+qWKUbNvmYfdg/brQUcJNrD
         0G1h82NZ+Q6jp4tRj/QbuPD05r8CZ2T2gjpUAHUUM1aFZyF5ImK70eykzxfGnmf6E5FP
         YRsw==
X-Gm-Message-State: AOJu0YzRdajfPw80hIBFzfeqqGUopCc5GJNb/rvbBm5/7nLQJRH8AeWV
	GEiTJlT5dmsBX06vSM1PsCJq5sxT0PPuRTUmm5S5g5dtr1Enj+zcRI0OB3c4sg==
X-Gm-Gg: ASbGncvVJ+fLq4U/i5rkg4IzW0MNd6+4YP+g4Av9rEfcxlSQadNKSOdxlEB58wH+8nD
	+Y6hn3hePAoLmVDAM90DxnyIstUMMl1e3LuIp7BdFKmtN9pYOCFxJgoKZE/57LJhzcI5ag7qh2x
	fQgiyZ9Oqjb0QsdIDSp7bXiQzfinslWISBtW1x/FEEwVKgLi9cJdZZY9fgq4aw2ohgu0ElOW9Zn
	wQ83uhoywHq+HR9bI1013Dk4i6nWqT5OhvFNcf7uyX6AqqHsyHWuI0yjOvHm1p0tvRUS+DF5oDZ
	HG9RqIEOnwvl05zoJAQGH6iM38G4xrCag1fIg+rLRONCn4Hh8nqS+kXhF3JVfTQPSYW1/Q4+84c
	/WEIsCfSH6YxEWnDi/WH+DcHVSgRngO5pl333i9X6aN+CuA6lVwmBd8Um+IJH8TFiPxKTj/cfC8
	dGsd83hWM1gfNZBlSTpj5M
X-Google-Smtp-Source: AGHT+IFfI8+LhNUchm6lNdP3OTNYYfpmwebmq+D8mt8pAS1EWBIP+ZRllpr/kZ9Vk7Z8yD9n85j8lg==
X-Received: by 2002:a05:600d:17:b0:477:9cec:c83e with SMTP id 5b1f17b1804b1-477b9ea35b6mr255404735e9.1.1764351536093;
        Fri, 28 Nov 2025 09:38:56 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4791163e3dasm96851735e9.11.2025.11.28.09.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 09:38:55 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Donald Hunter <donald.hunter@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ynl: samples: Fix spelling mistake "failedq" -> "failed"
Date: Fri, 28 Nov 2025 17:38:02 +0000
Message-ID: <20251128173802.318520-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in an error message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 tools/net/ynl/samples/tc-filter-add.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/net/ynl/samples/tc-filter-add.c b/tools/net/ynl/samples/tc-filter-add.c
index 1f9cd3f62df6..97871e9e9edc 100644
--- a/tools/net/ynl/samples/tc-filter-add.c
+++ b/tools/net/ynl/samples/tc-filter-add.c
@@ -207,7 +207,7 @@ static int tc_filter_del(struct ynl_sock *ys, int ifi)
 
 	req = tc_deltfilter_req_alloc();
 	if (!req) {
-		fprintf(stderr, "tc_deltfilter_req_alloc failedq\n");
+		fprintf(stderr, "tc_deltfilter_req_alloc failed\n");
 		return -1;
 	}
 	memset(req, 0, sizeof(*req));
-- 
2.51.0

