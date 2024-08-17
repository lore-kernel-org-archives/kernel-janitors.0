Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB81E884
	for <kernel-janitors@vger.kernel.org>; Sat, 17 Aug 2024 06:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723877588; cv=none; b=EZDqIliA4cuTPPa6ZCAbKq2I68S/igFb2umuMcJF403TeWRwyXY5evIOOux9s5FT+YQjMAjMzg+gzmgDPG/A3nDABjydakWr6rt5BQCvJx4ltJXe03RDU5lDOABdnKlawwEX00iIrnwYYmBNWB0FpccTq59y63XOeFt773IrnAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723877588; c=relaxed/simple;
	bh=R/8YyrIfZKHgYGBXukI9UeQIKlSORBCM5fo04b/ljWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrVlhZdPsIEi00gUEw4Ft9PXb8yaRn444yWfQXhf5hlqgsnfIySyqQbY/1GiPtpmV7yO2sPmWsasoqqYH9X4hLw8LcN1UfdP7HlL35D8FFgWc+OFtV4Gfy3N5iQ9frXj82v7xAVbHh+bjBkPcL9w8zL8Bk88OOkxpeefKsNYuC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rVIXv9Dq; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rVIXv9Dq"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3719753d365so775753f8f.2
        for <kernel-janitors@vger.kernel.org>; Fri, 16 Aug 2024 23:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723877585; x=1724482385; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cAeSKqQh2Tnjar9xz/fkxklPD6a3oc84i5Dn6WTmQ4k=;
        b=rVIXv9DqcuZI9tdGLCAOqNJjwHRMjAMGVC4FHqNI5ki876va3u1bCsBpm6NJUZFRMA
         XNtO9ue4Gg9cMVNP1OV33plG+78WaRw4dIMUEMNoGmW4zc20JdnilE9xdRVuBMx5KtcG
         VSVYDJexvngz3Da59FIOY6sp5jWsPyS9FzDxKpF8wFuSKKHkPULCEl/uZh6mDcQKUQWe
         6k7TyU2rh99zu+JCcOUviPvMcatmIi1Byz0d4+RDG8KAO7BngC1PP5GGSeZpFMYaYz0m
         Q5EDJybhJH462leLNgVCvaqrwzUuiXHvPs2777fe2UAK+8qadAYqOOqt7yX/1Dd87gpy
         G51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723877585; x=1724482385;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cAeSKqQh2Tnjar9xz/fkxklPD6a3oc84i5Dn6WTmQ4k=;
        b=xCam6fiALaEPMb7iHt0VkOtjvsAVzzlcwxfGOaJTDUKHAF0kmvamsl8d8KMGiGUaS1
         04siuf9I5e6J8u03PVA4zvunqQlWW3PfASDH2oecM2L9o1Tt4Az5Wgwpwr3dJvMv7RgD
         ZHl5aV4jFlGbb2yocA29V+pD0J1JL/Gfa1bNWgbJj+1Es2JOzwi6pWhH2j9YCKHHHzj2
         o1rLU4RJqwCumFSqptcyBrzqcvuRFYSbG8q5NngyQd9AiiqcKigT5LEEGb0ZwHYAjK4P
         oHIzRGerl8XSWPOn6BMsjmhht3mceJwnp50FbqruWwUQETVwwe2T1BvyFEicWZz5rdzt
         +rDQ==
X-Gm-Message-State: AOJu0YxYoljafrA6o3MPTR1VDMi3dOYzx+l3vOfsvk9lDdt0RxiY2BGo
	5mrPOumNaNnhKs91P8TNies1b4xwCJnsqDeh9rrlcyFrbD/2UsyEzbyE+WHBWcY=
X-Google-Smtp-Source: AGHT+IFllWouYzhgFu8GCw8rhr0KLkgdvyi5zmN2dZNEUROkVt+eIrHW+8L5dyz3vpR3GUvva2UqGQ==
X-Received: by 2002:adf:f103:0:b0:363:e0e2:eeff with SMTP id ffacd0b85a97d-371944524aemr2982391f8f.20.1723877584835;
        Fri, 16 Aug 2024 23:53:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37189897034sm5165782f8f.67.2024.08.16.23.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 23:53:04 -0700 (PDT)
Date: Sat, 17 Aug 2024 09:53:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Thompson <davthompson@nvidia.com>
Cc: kernel-janitors@vger.kernel.org
Subject: [bug report] mlxbf_gige: disable RX filters until RX path initialized
Message-ID: <9f301498-d8d6-4ff8-8208-6b86b557f2e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello David Thompson,

Commit df934abb185c ("mlxbf_gige: disable RX filters until RX path
initialized") from Aug 9, 2024 (linux-next), leads to the following
Smatch static checker warning:

drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:30 mlxbf_gige_disable_multicast_rx() warn: was expecting a 64 bit value instead of '((((1))) << (1))'
drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c:54 mlxbf_gige_disable_mac_rx_filter() warn: was expecting a 64 bit value instead of '(((((1))) << (4)) << index)'

drivers/net/ethernet/mellanox/mlxbf_gige/mlxbf_gige_rx.c
    24 void mlxbf_gige_disable_multicast_rx(struct mlxbf_gige *priv)
    25 {
    26         void __iomem *base = priv->base;
    27         u64 data;
    28 
    29         data = readq(base + MLXBF_GIGE_RX_MAC_FILTER_GENERAL);
--> 30         data &= ~MLXBF_GIGE_RX_MAC_FILTER_EN_MULTICAST;

I don't know what's stored in "data", but it's a type u64.  The type of
MLXBF_GIGE_RX_MAC_FILTER_EN_MULTICAST is unsigned long.  This means that on a
32bit system, the &= will zero out the top 32 bits as well as the MULICAST bit.
Use BIT_ULL() to fix this bug?

    31         writeq(data, base + MLXBF_GIGE_RX_MAC_FILTER_GENERAL);
    32 }

regards,
dan carpenter
