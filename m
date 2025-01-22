Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB2C14F70
	for <kernel-janitors@vger.kernel.org>; Wed, 22 Jan 2025 13:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737553764; cv=none; b=sLkUOt+vLm/VDBD8hwRjIKZzbumM3hGyH+05BurUWdJPyQoHu310eZG8XjBOzKLYPz6p51i1JA+uO+vDQZlGyHC/bHmW5K/UvbPnPLHOiYS7Ia+QccLEvtcMnDQiCeeT1lrbaCBPn+Lco16SkAHKfZBT/bgUiMAxnnMemKO+dD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737553764; c=relaxed/simple;
	bh=/o3/l/9afeGTYp17GP2QC2MUMdmrgWfRjZnggaQP8GY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=thWtHtLMNWkKfCPX16k5lIIY1oYR7bl5SXZPb9zmRX6UpAEVuxjDY+UdZS50GK7dqHWN+9BBcL95MXeezKs25XoOltq1AaTOK7QvXtu1HrunzOtj3FCnrUGVvCZOIamBPwP1ME+8cNstCSZnlb5T/IBKsH/VHmNNOO4+Kz0AE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YttRcNa0; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YttRcNa0"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so3740273f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 22 Jan 2025 05:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737553761; x=1738158561; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K51/6g4P9GYdkZ38G8mfX52Y5q+LxzCdwPw5czgkm70=;
        b=YttRcNa0noHwMbSsrzASNuHeMCWT2Fr6Sk06fBYAGoO40fm/2a349KQl5/05SB0XvX
         c+c5kVzd91QlMuIEkXC/fDcf/nxQLmTVXW/bOQEWG+SPzujVD1ncEqRl+5BCtsgp4Rjm
         nusRGYmd05ZPDkRXvYEmIv7g8HaNTuK3HweSxUmwzQtoEZM8apiVMaTTzeOaeAO7fUWD
         SWsD86+qJA25kstpusx/fuvhnE3WfaOsJHFF8S3kt5ERDDgfbMaw65gLYXEGv3dHKjRV
         lIIIQbtU+HKFF1X+TPZ+MUI3qR90CcBIOLD4xfTknP3d6Z1MH6WkfV5lRwJ91qyZF5Rx
         iutw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737553761; x=1738158561;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K51/6g4P9GYdkZ38G8mfX52Y5q+LxzCdwPw5czgkm70=;
        b=rncB5Sw3KWy8mhH4zw2TFjAdErtvkTthUHNJmNliupyM4SSkcUrLp5KXKZMai99nxF
         pA/s6/SY/bGyDBqQotGNFHEPWMRULhWOP07W5INJcdY3pUaNBI89ZtL5Y08PiBgfhdSM
         k9rtafQkOw8/MIxASXfjeDr1OXuHWBoqPjIskVSHNgX78p6PWAHCXJnn7Rg/z8wN6Wv/
         gRilhsRzt7HbI8WvZPsug/oubHbztK0y9kxEn8rRZj6Taz76AGGYwxnITjWseEmB5TJx
         AL2eOGwyFxHawkULVyCq9kxBiCgt8GHzN0Ob26OIJt2FSEULmA8dj+hcF5d8G4sVNBzw
         Rsug==
X-Forwarded-Encrypted: i=1; AJvYcCXj9fsV5tr32D5zPWpzyqg/+oTJxNeJWk2xNdyzyy0PRKBBNyEzcpXMulGKBLiNZXcTj7VqQTUZlJsF9BsjSCc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywu01Oii2w6dOo5uSbpb+M9HEQ7mCz2bz/hzGflaX3aV8Bi3927
	TP01FhoFtEdi2OEUC/GQ/8LxWJAuKZ3+nH1p/FkZmFRbuAuM9ezi4Zuq8aA4IZk=
X-Gm-Gg: ASbGncudV/5wiIjKoECP77fq0KdR4TXb/lIpOo7Qb0g+85wJEW5c0Wj+BnTtdSR7D+c
	BSrHG9xbZb9mU0IP2eOg+M1ULLNi85swWqbnKDeL9COD+rBdn93KQoE0WBy8NgASF1FGXIOxoaX
	2gQnODlgUXWPWxkp1ehgp//98sLLAvH69v4oaC6hb2PlhxE/tmzylQB/vnY0kdMVbA2jq3Ge1f+
	3kf8Y0rc2GMX8eG9wRZ+w6XHO46lhM6Jk4PqKlo7wbpqtTsLwPR2JZgRP1ym7NmIvxzzGcZJ8uq
	/0Pmk491gw==
X-Google-Smtp-Source: AGHT+IE3o4b4BdauC6AlHv26it9Zg4i8+S7clf5AWO2pmyOuXXW5i8JwhMit4b//DvHU4sQvCrgQbw==
X-Received: by 2002:a5d:47cf:0:b0:38c:1270:f961 with SMTP id ffacd0b85a97d-38c1270fabemr8203304f8f.46.1737553760630;
        Wed, 22 Jan 2025 05:49:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3214c5csm16346804f8f.8.2025.01.22.05.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 05:49:20 -0800 (PST)
Date: Wed, 22 Jan 2025 16:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Graf <tgraf@suug.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: netlink: prevent potential integer overflow in
 nlmsg_new()
Message-ID: <58023f9e-555e-48db-9822-283c2c1f6d0e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "payload" variable is type size_t, however the nlmsg_total_size()
function will a few bytes to it and then truncate the result to type
int.  That means that if "payload" is more than UINT_MAX the alloc_skb()
function might allocate a buffer which is smaller than intended.

Cc: stable@vger.kernel.org
Fixes: bfa83a9e03cf ("[NETLINK]: Type-safe netlink messages/attributes interface")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 include/net/netlink.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/net/netlink.h b/include/net/netlink.h
index e015ffbed819..ca7a8152e6d4 100644
--- a/include/net/netlink.h
+++ b/include/net/netlink.h
@@ -1015,6 +1015,8 @@ static inline struct nlmsghdr *nlmsg_put_answer(struct sk_buff *skb,
  */
 static inline struct sk_buff *nlmsg_new(size_t payload, gfp_t flags)
 {
+	if (payload > INT_MAX)
+		return NULL;
 	return alloc_skb(nlmsg_total_size(payload), flags);
 }
 
-- 
2.45.2

