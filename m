Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CD0521B427
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 23:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731454675; cv=none; b=uPb2HJ2WuXgaHIIeC3XcVHGHibAo+4sNn6MHVSdSoEgdxfLCElgrJKF6S77MZEPSkYC0ofLz0lKxIM9hOMdJkysc4M9IudxhyZkFHOeiepsmuXAx3GLzbIYxaj7IOZC2hG0vespM+R8aYN2iuf1UdMdKc7NQeZdamMGSQ47AT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731454675; c=relaxed/simple;
	bh=NS0oEJGLQMzwsxiRqjLbzLHQvzAKQUI4puz5ttzO3ks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BTKT3rwcMhFQJdb1Gq1+MxcFX4AmSvVJvz14NHtj0vMaq7zzLTkJvu2TV+hrD+SPDlHqYDjdjQjQe0b4h8u8AyXgEyp4CepHHZT+V1FPzlMpUCZs7uQ7DpbRb9ymqR/qPMFJUtiN2YFVqS84VDOwjK5l5pm1DYKFtVBeC8PplaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=UkuUvAje; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="UkuUvAje"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20cbcd71012so73274955ad.3
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 15:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1731454673; x=1732059473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YqXhkb9k4iQOMcnVT7rmgsvdL5//NXM53qxV9Inaccs=;
        b=UkuUvAjedCivHk8wUefarjgCbvX6sxpQhad9uSYvae4Y7SCA6LsaaAbncBANSPycIP
         25xFVgUpBGbzAoYX1LShImqwlWtjLW6BsyYi42Ip3HBqfPueFt0hPrBtz8HPi5Rv/tnL
         PegsAl58dcohWZUF/GkVeBrsHknReeK+PdyFF860CA376W3jNEj7qfxWfY4guJSb9NWJ
         sGS7ZDbnnm0FqzEaCaUim6ExSFfM80ZWQnUprQzBBFTcyj4sCRytd9l3670iWpn3U5qr
         u5JW2f5Q4DDPLSwh8ajthDHEo7f0G8U7XlMbMN2TxiakNZhOwwc39FfMZGL5UfBuuh+T
         Qz/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731454673; x=1732059473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YqXhkb9k4iQOMcnVT7rmgsvdL5//NXM53qxV9Inaccs=;
        b=JJcAjjscr3jKQfqCXBBAdXARMYdACmnPF35NKCjFUDbfFtitU6iXw4sYo9ZzZb/G2o
         kcVqOf9JJ+BhI+e+BABMHdv8Jb/Bvw9A9tbhQzDf1DRCd0zbuuQRikNiWvOUYg7owHtX
         1NM3GdseKR7cEHAXDaFt5b0NaA8+q1LrQ0/c/8UzARYuMgXZaYlvDVyi80b6oQI+V6ol
         PD0Hwyl/QFchei6kjigcf9pVWB6nkFPHmRgRthMIT61dDMy7uMQn8zOEe2MkCpuyHbpy
         SbYSYv1BD8dg9PI3y6S6/09U2Th2hJ29Bl67zOwk1f+ZAvYY0hqC3MKJGMfsdsuR57T8
         UfAA==
X-Forwarded-Encrypted: i=1; AJvYcCXjmqszlVRWjw1oQKjj/HK/DMu6NJihvwb2A+C8/vScB6fHGdLZJOHgPW2fPA7aRZ7Zj2wy8pTHbhEJWzvhR2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyl4xUO8ffpZNSMsfMRvfgPQJT7Bu609OuKxYLfmwXgzollo0rX
	FoJIgKlwc+9n0fhCRfMXjXP7psfaoMjfD0iSg/q4uB4vmPOwh82iDWNHOUAA8fY=
X-Google-Smtp-Source: AGHT+IGASecOiEAWmurWKnj+5DHPb4A0So/iYD/w6/x8Nel5WVXfgUdx9n98XhVQcCgEmMcc4HQFpA==
X-Received: by 2002:a17:903:1246:b0:20b:ab6a:3a18 with SMTP id d9443c01a7336-2118350d16fmr263060925ad.17.1731454673455;
        Tue, 12 Nov 2024 15:37:53 -0800 (PST)
Received: from localhost.localdomain ([91.196.220.163])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-21177e419a4sm99549815ad.149.2024.11.12.15.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 15:37:52 -0800 (PST)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] xfrm: Add error handling when nla_put_u32() returns an error
Date: Tue, 12 Nov 2024 16:36:06 -0700
Message-ID: <20241112233613.6444-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Error handling is missing when call to nla_put_u32() fails.
Handle the error when the call to nla_put_u32() returns an error.

The error was reported by Coverity Scan.
Report:
CID 1601525: (#1 of 1): Unused value (UNUSED_VALUE)
returned_value: Assigning value from nla_put_u32(skb, XFRMA_SA_PCPU, x->pcpu_num)
to err here, but that stored value is overwritten before it can be used

Fixes: 1ddf9916ac09 ("xfrm: Add support for per cpu xfrm state handling.")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 net/xfrm/xfrm_user.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index f0ee0c7a59dd..a784598cc7cf 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -2607,9 +2607,12 @@ static int build_aevent(struct sk_buff *skb, struct xfrm_state *x, const struct
 	err = xfrm_if_id_put(skb, x->if_id);
 	if (err)
 		goto out_cancel;
-	if (x->pcpu_num != UINT_MAX)
+	if (x->pcpu_num != UINT_MAX) {
 		err = nla_put_u32(skb, XFRMA_SA_PCPU, x->pcpu_num);
-
+		if (err)
+			goto out_cancel;
+	}
+
 	if (x->dir) {
 		err = nla_put_u8(skb, XFRMA_SA_DIR, x->dir);
 		if (err)
-- 
2.43.0

