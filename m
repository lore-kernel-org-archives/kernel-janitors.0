Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4073C0B
	for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2025 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730152; cv=none; b=kOm4s4gBk6zD/dikWFZW3oVVDz2SGDMujo7JDkXgeZueaWIKi06DN/TnUIJ+BqBqYD+4xCpEdws+RmwwYkAyDF1Ev6LJWpTp6+/bwCrEfSVCyWKM54xGy8181+vlaVcIUBOrFPIsXvCfCtUTpRBee4wCgOBuJ0W8LA2AKv1rEZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730152; c=relaxed/simple;
	bh=NydxaqTP6EDkgEiMRsHp+UOOwmDSujay0sykB5esncE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cJC0EiK7E86uVQZe2N4ZvaVl7mRAI2g63BIlbXlA2Si4WPHKKEV4oaN3rCbBCAYn2Q739e6ntCE6LW5CRz1f1p1kxtmAV7dDroML7t7yd9tyPwh/Laq7GympqgpO1nulqtT7jXMd4AuYDgnGTZSlbpaRh7bD9CRhTeySb2l8bVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JfHvaCro; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JfHvaCro"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-436281c8a38so15660635e9.3
        for <kernel-janitors@vger.kernel.org>; Fri, 24 Jan 2025 06:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737730149; x=1738334949; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eMkuRdm7dMRfIqCxtB5bKSUeXy3ZdBxZh7yMlRtwENM=;
        b=JfHvaCrotFxm9c1I7INCx8GEipqinY+truHUK5gAvBakqZ8GZSiBZMDKupviSi+tmJ
         Cfwhgeg96ASoMuR1tfwbJwhs0d2a/i62aOR2gGw9MmtuJFiFZVYwZ5/lGVrK6YR4GlMq
         Iq7cn2oMytPXCvavphWgsKfZgN6Al9npXznOteFrgZpwn5qXgK8AbLU92k8LKZgDyquG
         7CEs3zjrEshn2s2kbTa0rGoLpV2JJ4HLEAhUiHwoGr8kcOOOQp+eDU2TQ4qAjapqSb0z
         4HeqxgPYdFd0yUKVmK0PfHhp+VuZEMkXaeC8M9GlTglK48p5HwK+kj+Zeenk3cpsSuK1
         RjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737730149; x=1738334949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eMkuRdm7dMRfIqCxtB5bKSUeXy3ZdBxZh7yMlRtwENM=;
        b=QHQoGBkY/+P4/0W8a4f5Z48IyXRdPpM9qVhSgrL2UkM3mvGCvmqs2e1xV4YS4/CemQ
         RYUM+jayk/f3JbHqchSJqYI2Q51bFWP030V4NwnvD3jzFw/TNTbWBhLe8xrVDDI7Tmdg
         lhd+ydKY6Gt5MCI6VNH7WioOAo1J5gK0uXr+V3NxopMCZ1EmuyuV4nDwoF1Y8aY0SZiC
         MajV/iqIVVQ5rJ/lJhs2PT8Fy6Td7YSULOxc6IsBR4ktf9tXNWzC5fzZPsAqZlp21d3V
         Z8Y09IoGA28/eQ4x6Zsfe9z63S5NQkMtx5h1QHadKWUlLJ064zUZCJ9ZuIQH/4xkbHMI
         kP/g==
X-Forwarded-Encrypted: i=1; AJvYcCUJcgzfbw39M8aPUsiv6pqIXkowh3e9xB+v3v5mp+tsvkUTzDzo/nLjrtoYWBhcyIdDVwSyB+GZHCGP7iYGBUU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yze/OLJupaIcoDuCj1PmDhjeAzBDXMrgubvfyOClXToEhr7k4k3
	qtoFDPMeWwmOpAFhPdRdfE/PzNSS9dPDcniqMQkyZ6U38nphY2BztdXERqPICNk=
X-Gm-Gg: ASbGnctj8jmmdgf7iBMxHZnFUWMuiLUtItgz2UPIEaXgePHbC9UmFUN1/SRSofXfbZg
	xF6WtaAkM+VcXX55JcOmswJBdHsx2+Ju1xAmFbpqx/f1LnlDZe5D8JWwQvM5ltWwSW9C9o7gXMf
	3+maE5tEsf2tezGMmFNZcyftls/ULRLL3FVgE3/MUfTkG3cITiJ9a5luBWg7/7r52vZqjkbWnKj
	Da/S8Nj8X5LJZ4MlfwwWNLEnoY843K4XKzKFZULo2KvpqrgZFfCQxhvZkwkzDRhOCycTPAUsiAL
	04agTYYcag==
X-Google-Smtp-Source: AGHT+IEgUTZS8mCn7dY7aS1e3HW4uNtkQsxfIiRO3BnkLr8VQ2g9RvGQrurzRlcy0FFiD4+EtIbf7Q==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr264487745e9.22.1737730149323;
        Fri, 24 Jan 2025 06:49:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a188bf5sm2964758f8f.50.2025.01.24.06.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 06:49:09 -0800 (PST)
Date: Fri, 24 Jan 2025 17:49:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: William Tu <u9012063@gmail.com>
Cc: Pravin B Shelar <pshelar@ovn.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org,
	dev@openvswitch.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ovs: prevent underflow in queue_userspace_packet()
Message-ID: <4d6d9d9e-b4d9-42f1-aa78-1a5979679b2e@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

If "hlen" less than "cutlen" then when we call upcall_msg_size()
the "hlen - cutlen" parameter will be a very high positive
number.

Later in the function we use "skb->len - cutlen" but this change
addresses that potential underflow since skb->len is always going to
be greater than or equal to hlen.

Fixes: f2a4d086ed4c ("openvswitch: Add packet truncation support.")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From code review not testing.

 net/openvswitch/datapath.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
index 225f6048867f..bb25a2bbe8a0 100644
--- a/net/openvswitch/datapath.c
+++ b/net/openvswitch/datapath.c
@@ -477,6 +477,11 @@ static int queue_userspace_packet(struct datapath *dp, struct sk_buff *skb,
 	else
 		hlen = skb->len;
 
+	if (hlen < cutlen) {
+		err = -EINVAL;
+		goto out;
+	}
+
 	len = upcall_msg_size(upcall_info, hlen - cutlen,
 			      OVS_CB(skb)->acts_origlen);
 	user_skb = genlmsg_new(len, GFP_ATOMIC);
-- 
2.45.2

