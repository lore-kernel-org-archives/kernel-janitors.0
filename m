Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D308627A
	for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 14:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711032152; cv=none; b=MTVSvwwom7Q1jSj2kGH9aNcIPuUKb96D99oS4k4dr5sN908SsFPb6irPHaffKpOu+q5BuNlcM63akVREUXoXajUPv9ACek0fvqBwNn211JkQfk8N0dnrTXS2GAjLJCOHStlVxLL/eJWmsooCSFnjFVA2CommGbpzMXuXSaUGccU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711032152; c=relaxed/simple;
	bh=mvVCHoV3WyhbYPzYm8+AWnGsZAbyA7SkY5eLDIVysB0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B0UpmVjQkvcX48N4TZ7Lxjpa0pPVCT+IHZS0AvufsW60/5oQMvkxSwNivHXxEydl0Crf7uh1ehzCG33IukTChg9on2EtYBVPJonTjnqOEAG2+M4leqxggDXv3tKnf200LwrEc2MfVXVcV7sn0K5vv4pZkCj4o//vPh1XACcrqjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7uRLLfM; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7uRLLfM"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4140aadfe2eso7488785e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 21 Mar 2024 07:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711032149; x=1711636949; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vlpyW/qJGkbtizkhGO1yqBNzqS2/ma5JoZfKsAcPkIM=;
        b=a7uRLLfMM756YNW7mB9hZUcZK9H0LXBDzI49/OUWjPnCAakg88BNKpfTCizCsg/qxf
         OEkQwJ/0TM+U74XsOE+D03WO/0T+FDamWGrPHQ1gYWvbeBUIkNfg08oeaAutfzEdMJkS
         gb2IerjjfMMKCGuUY8qJA/nbLt5GIc1u1Cdf6HO3m0LJfVYzBGvE1fXBS7jZqVUi9bCx
         A4UkKC0ElWyyi2FtwLtHJAMl52HtslA/8QOCT8bMxQ2W0Yw5ZXQuWijYjKT9oR+7J2GJ
         e2x8PEudnqwOqQrKB+ZE+7Q3mBLwcqya1KYIiM3vGJuulmsX2umlcIdt60SCvB6h/jZn
         cbKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711032149; x=1711636949;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vlpyW/qJGkbtizkhGO1yqBNzqS2/ma5JoZfKsAcPkIM=;
        b=JJ//+eA2ip9Si3d7UPExUNulBTEZ7oyvwE7WKdXDkRikeWdP5be4K+dSXBV2WlPmQK
         cP8jphnQKQ/3x/ZsQLgG5HkI2NoPAbEm1UGz+SejF8QgFMcTG+x3M4YVMIa4GbsIH0QG
         mLRwMZimdZWQ14eJmKdwb2nofvPn2AYSE2K1VJh2scpeCNY4VZZxWCKu/UbEOMYdIWnF
         tdmCNJmHtLYyo39yqQUuVufg1WXeEEt+Uj/Nhgib1rVSPmx6TEy06sQbexgZPIhG962m
         T/O8MXuo8iWwWjyAXp/BxYwmctznKPpCW6W+yMBIVQnH3ITvAx5JNd0uexptQ2dZRTOn
         E4jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPYzp99Uk4TYvqJwl0CTK6xG6h2uLBDmtO6dkwhc2pn5bZgXlsxztXGYWs0NthQC2s8IrW4M8ZEUnAq3JC7gtzMWuYMf2w9AOLq6TUWmep
X-Gm-Message-State: AOJu0Yw8Mjeynr8aYy6I6vAAqsfF5h1+njVoInqsHv8bqJRBGjl92VxY
	0WL7vu7zhR39ndC5y+Rb8gBLzZDICtFLgrW+EbQp10fu6vOsRO6DaMQ8fSEYUWo=
X-Google-Smtp-Source: AGHT+IGqM5LRTTAcA+6N8Hep2ZWFfY82O2I9PKGnkuA08prM+u9q7FCVn8y1OgI4tWJo9PIjBFq0MQ==
X-Received: by 2002:adf:fd0d:0:b0:33e:a29d:9672 with SMTP id e13-20020adffd0d000000b0033ea29d9672mr15509211wrr.51.1711032148752;
        Thu, 21 Mar 2024 07:42:28 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id z18-20020adfec92000000b0033e7de97214sm17328972wrn.40.2024.03.21.07.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Mar 2024 07:42:28 -0700 (PDT)
Date: Thu, 21 Mar 2024 17:42:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH v2 net] nexthop: fix uninitialized variable in
 nla_put_nh_group_stats()
Message-ID: <f08ac289-d57f-4a1a-830f-cf9a0563cb9c@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "*hw_stats_used" value needs to be set on the success paths to prevent
an uninitialized variable bug in the caller, nla_put_nh_group_stats().

Fixes: 5072ae00aea4 ("net: nexthop: Expose nexthop group HW stats to user space")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Set the variable in nh_grp_hw_stats_update() instead of
    nla_put_nh_group_stats().

 net/ipv4/nexthop.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 74928a9d1aa4..535856b0f0ed 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -768,8 +768,10 @@ static int nh_grp_hw_stats_update(struct nexthop *nh, bool *hw_stats_used)
 	struct net *net = nh->net;
 	int err;
 
-	if (nexthop_notifiers_is_empty(net))
+	if (nexthop_notifiers_is_empty(net)) {
+		*hw_stats_used = false;
 		return 0;
+	}
 
 	err = nh_notifier_grp_hw_stats_init(&info, nh);
 	if (err)
-- 
2.43.0

