Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6127C12B79
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 09:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710582371; cv=none; b=fVmO7cVbxbJTKDsBqPYUZaJm+nFTR7cKowTUVgOjdUz0UDoJAdt2o8dLnDBGLmj8fJMj29E0xxiIpEO4v0Bf9gh4R6hYmce478HJKQBzf1QONLE+AG/pv1gKDXNn6Ug9JYC52dbLgBJT+F8RqHqAP+RUaS2KCE1K4OHC6F015f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710582371; c=relaxed/simple;
	bh=RT+XZPRzwFZFTgFvITaOrYfXlyrwyyKF/JKHV/iD79g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RhL62fFsr25Ovj0yARffV5ogKgW8m6vkW4C76n6YthxZz5d9MTArd3iOKZjWGkBI/LrgYbmQByrlVvIz/cr2j3zvqxA/PMS//SOZiu17GWvR414f3x6yFKi/RhPUZxEJ3CItNRLA52erLragNhu4GaSbM4neP4OXrtq2bWgfN/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wc6W/u8U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wc6W/u8U"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-414023d288cso8748155e9.2
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Mar 2024 02:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710582368; x=1711187168; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fd/UYSinQFLXB7b7RayERbmP2J/ErjoE+16L+UoVOvU=;
        b=wc6W/u8UuZmXLyU3DULmxVaEGUnQ/O7XY7mEQKquCEfowMBtuK/dUE1RkCyB0WOFc9
         9kud/r5KlFisRzKBY+cpsVAqlPTsYD/NfgdUTEW6E9u55EQhvWPBiW0kL+qKuzStWH7y
         Ecp4MmkG+iIKqDrLhVNeC/BmgoLjxWNeJ5nbOGl/+qDe9jc9WEe3QSVU0gpACmEaCuDw
         Ms5EuEa1FAQRqvBevylhb0/gN3WOz+9x57TsKh5sfUzMO8d4rkWnniNJJESsY7YeO2yS
         CdJD8QADtgHFwzEnswxxT3QKafUBhhiA6W6zz4IgBr7mqrLaoC0xmLa9enaNcaQoU6P7
         mTYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710582368; x=1711187168;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fd/UYSinQFLXB7b7RayERbmP2J/ErjoE+16L+UoVOvU=;
        b=bQloakyokTTmgn1H0zrtPr6g2gKz5eB/rb7eFN8a4R/T+sigWph34GEDWK7L8W6VgG
         psZSa6gQreV6Se+qD/OXTSgiMGe+yoXFbqlMlY3vzv3M8G22If+5mP1qQ2VcOO4cmNqD
         Xm4aAwTSM9djGt4ZkR4rlALOzMrSWn1/dd9PQvpiRMl6gqiZKZle20t9yvXnV1V4tZoQ
         fpI5dmJgVokr5vy1STWNtdFFfE4m5yUJK5EdFdI3lIU/lgnXeI0mNiOrV3Zjo3qXX4mF
         r0HzNANC0sxem0kMhElScTlIjDFXIyx9UMzgvpuyVV3EJ0cjFksSbQZhtJqJsufCD62D
         Lvgg==
X-Forwarded-Encrypted: i=1; AJvYcCVkVvJBkuGFhwuxSuTZcOh6td3dC/3Jl4YFMvarowTUui5PZs9Ml1YwvKqjWZABWqWZ7zUgLErQvjjh/Ffwrs0vgV+fJKL+1iUSYxT4fX7x
X-Gm-Message-State: AOJu0Yy09hYX51Pu7MXBnXk056OcHq8Dka3z9Nulfb0Z8HTktUCp4f49
	LQwJOP9ooEWlVplwWlo8pyUzGJQIELH29i8D7ucGefJW3Ys1R1+XoUGOXQXW0qw=
X-Google-Smtp-Source: AGHT+IGFOTlS9lxuq3HAgMjbB2h84JYJpY5dbc3qOKbWAN2V/LTfz7RhwItxNXIBOHi/hk1KkO123g==
X-Received: by 2002:a05:600c:1c08:b0:413:fe9d:eaa5 with SMTP id j8-20020a05600c1c0800b00413fe9deaa5mr3500066wms.26.1710582367577;
        Sat, 16 Mar 2024 02:46:07 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id e15-20020a05600c4e4f00b004140893c0dbsm1026028wmq.17.2024.03.16.02.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Mar 2024 02:46:07 -0700 (PDT)
Date: Sat, 16 Mar 2024 12:46:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ido Schimmel <idosch@nvidia.com>
Cc: David Ahern <dsahern@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Petr Machata <petrm@nvidia.com>, Kees Cook <keescook@chromium.org>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] nexthop: fix uninitialized variable in
 nla_put_nh_group_stats()
Message-ID: <b2578acd-9838-45b6-a50d-96a86171b20e@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The nh_grp_hw_stats_update() function doesn't always set "hw_stats_used"
so it could be used without being initialized.  Set it to false.

Fixes: 5072ae00aea4 ("net: nexthop: Expose nexthop group HW stats to user space")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/ipv4/nexthop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/nexthop.c b/net/ipv4/nexthop.c
index 74928a9d1aa4..c25bfdf4e25f 100644
--- a/net/ipv4/nexthop.c
+++ b/net/ipv4/nexthop.c
@@ -824,8 +824,8 @@ static int nla_put_nh_group_stats(struct sk_buff *skb, struct nexthop *nh,
 				  u32 op_flags)
 {
 	struct nh_group *nhg = rtnl_dereference(nh->nh_grp);
+	bool hw_stats_used = false;
 	struct nlattr *nest;
-	bool hw_stats_used;
 	int err;
 	int i;
 
-- 
2.43.0

