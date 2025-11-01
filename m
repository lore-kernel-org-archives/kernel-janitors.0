Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6D0235C01
	for <kernel-janitors@vger.kernel.org>; Sat,  1 Nov 2025 13:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762003611; cv=none; b=YmwsaF/1Ua27UN3dVFIw3w1UI9+OYyZJo9pCzXQlhTM4jR0+/aLHvUh+I6V6oQaiekpEXjzYB9SAK8k8vRuePJjjl9LVsZhrsY4EQndcn2THgEZXR1klE0BdjLi0RiTMrw/fO1aWXJZ4RZ8HLYKwzJS0qmj347EC83Q6/wAGneA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762003611; c=relaxed/simple;
	bh=Mgp89QAtrTjRgM6jWQFTc0jn1YY1UmGe8KsPam+6Ssk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWFHDF1ZeHGH5T/gU+kymlz6mu7VCS0b64X+UP2eIAb9XfustQtJKNIdX2IVKySs+bkOoHEcpKGwD5DA4aFVw0upWUidFtI3iMmB7wJwduXgXW8+1XqFbgmFgxYKE+0yKiqNovI3/araP9e2PLaZbfH7EQyfdxDf+IQwcuuA/aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mXkxOZQL; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mXkxOZQL"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-429bf011e6cso1817103f8f.1
        for <kernel-janitors@vger.kernel.org>; Sat, 01 Nov 2025 06:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762003607; x=1762608407; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eg53ujn5W1DedX1Vyep0yhtifcPEiIbNUDg4dfuJiow=;
        b=mXkxOZQLOo/7v+JkoergXHoljqy4zc1MzpCWRuTLPEdmhjfiTLmQPKSUbxOZA+LCI3
         Lijpx/r4nzNmIBuLh6ZtW17pykbV9+EZ1rR2r5X/OGbpiq0tYgpdTUNb9+p3tyaHmDQj
         zeZ3RyvnM+2ek/MHXY6aQVkwPXdlGB12Lbv+BjJyAkeHWU/NqicXcn/vpYHSSKSDS15N
         DWYG571c8l2HiMiXlzFU0P5FmtO6lFhn3EcRLOI0XJZJaYk83w/vljsx9Mnb/qhkCq30
         dwVDf+gxSikJiNxKpSwAu3pGRtnuK4HCWv8Af6oCjBVpJEYdA5rfh1H+1Zw/MbiuNs5O
         sY0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762003607; x=1762608407;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eg53ujn5W1DedX1Vyep0yhtifcPEiIbNUDg4dfuJiow=;
        b=SK7Fw1AE6SRHVcPMrL+/paWQtHgGQ5F0yu1whRCblR3KaspvAs81lOeNMDmyusoRmn
         upr8pQSDyEdLl8djl1lWk6f9+/YU7p3JBIKV9712AqquwdbRwpaf6FgWNtZFArzgkqnp
         QvxTFQgT6ha2PTynbpB5YagRHenZIIITJj5kVZ0uEuQvP0EO4WA50ecpwxFzKHNWC8Wj
         HnC57dfQUJFpb614Pir2KqGIOpO/GApyvnm0NZqQHwY8YKW9bfkFxL5j4Ei3mHNlRByu
         pGwtjRB48F3n5yyMNKuj9L//YaGgFtAD45Do0JZKdJOvCQEfqj8rHqUnczr2ORnyd0W0
         EcCg==
X-Forwarded-Encrypted: i=1; AJvYcCXy37rhxPF0iE0JYCeROymqwfxf1/CbT6stxcejr33wnh0ub7iaYN6DMIu7PcYbUGEEX5HMvX9bF5IPwuIH8bE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYilFUKgZKCb8pD1TMThGX+xyfCcr0e51zqM8KlQYum3soXPX
	N18CV0pD/+jCovNBoh/fKaRzi6Ey/21JdzBzvOC4kR5eLZapWmzbvyWz8neUQdEp09Q=
X-Gm-Gg: ASbGnct8aS4ioOzQYyTWWNdYuQQUujQ81tqjFeWW7S1I82/Rtr43JUDBRs3dsr40UKp
	64n7HxNz/PbvaptZa23GYUezLUEwhJaNKj2Ie8yRCjLENXuELPAWvgHcvePlL9YgWe/N/UGeIg5
	RRFdLS5/eKiz9g3JyGIxnkCxd1O5VahLbZh2GlVfsFrb7adrX1AddhVuWm9l+V4Otcr8CRnShj+
	gf9sn3xW1RsCBSYSSnHFq/CJHP+CRQ2eKrnlAKP13zSNbEqh5H8YlrEqSDqtcmvS45g1SQc9nJq
	X04Y6yxAz3rCX27+qjNzZhN38eJ4fR8ZunutHH2nOP0gAgu8MQ5JUs4jQMNCYW41tPIJxLHY4ce
	zmo03Tk13Dauogsa0vpBvA02auPVT3vsKVZfrbUW/kzZegzRehmtDw5ZIUWThNCdKiGwIbrHzKK
	qh5QybVpmKvXI+9OzC
X-Google-Smtp-Source: AGHT+IHWklOzm9hRp2MshFHHpjAPX4YwiYbf/S/L+tv28vs/jH3gOqeBv6O9b8sMd6VBVbyb1K/+5A==
X-Received: by 2002:a5d:5888:0:b0:425:7c2f:8f98 with SMTP id ffacd0b85a97d-429bd675fc0mr5343738f8f.1.1762003606366;
        Sat, 01 Nov 2025 06:26:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-429c54498dfsm5711594f8f.34.2025.11.01.06.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 06:26:45 -0700 (PDT)
Date: Sat, 1 Nov 2025 16:26:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Suman Ghosh <sumang@marvell.com>
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	hariprasad <hkelam@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] octeontx2-pf: Fix devm_kcalloc() error checking
Message-ID: <aQYKkrGA12REb2sj@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kcalloc() function never return error pointers, it returns NULL
on failure.  Also delete the netdev_err() printk.  These allocation
functions already have debug output built-in some the extra error message
is not required.

Fixes: efabce290151 ("octeontx2-pf: AF_XDP zero copy receive support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
index 3378be87a473..75ebb17419c4 100644
--- a/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
+++ b/drivers/net/ethernet/marvell/octeontx2/nic/otx2_common.c
@@ -1530,10 +1530,8 @@ int otx2_pool_aq_init(struct otx2_nic *pfvf, u16 pool_id,
 		pool->xdp_cnt = numptrs;
 		pool->xdp = devm_kcalloc(pfvf->dev,
 					 numptrs, sizeof(struct xdp_buff *), GFP_KERNEL);
-		if (IS_ERR(pool->xdp)) {
-			netdev_err(pfvf->netdev, "Creation of xsk pool failed\n");
-			return PTR_ERR(pool->xdp);
-		}
+		if (!pool->xdp)
+			return -ENOMEM;
 	}
 
 	return 0;
-- 
2.51.0

