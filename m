Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A8930499A
	for <kernel-janitors@vger.kernel.org>; Sat, 25 Apr 2026 09:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777108179; cv=none; b=eGA8L2e6M5OhNbpSMrjwczERWS/8Sz5u9DOmwP4R/vI63hzr1EsKHfd0zrd4qu0oQMJ2tOWBMGYWbat36PViwFZVWJ5QNoz8p4XqF7kP0G8qJOi2UTuTraglOk/+px/4YCPvoXPYR0pvbNH6XYFklfZHZa8msFIb50dtRYitbFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777108179; c=relaxed/simple;
	bh=yn0n7unySXi2xE38g0Fs5uwMd71BZF2HOYgbp6bbEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cnoTMooX4hHmgvXnUJI3G2tuQGcpE0IqXc2mNZmZMNURt51dpN674+4q5BWWmu1cMtAtU9UfrLDVrTX3AQF2MhAqz4Ec5FwkLC1I7hiRfZYs/t6Vyprw5KJMFoFV/8fWSMB4mfA/ZHpZ+UKmpqmOYOQ1i2TtPnrZ5Mmpv9elA8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jqETPIQb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jqETPIQb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4896c22fcbaso57481125e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 25 Apr 2026 02:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777108176; x=1777712976; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1GuYWc9nESbYSG7ThORlI5mhNLyHqE9tuWw4BPRuJSI=;
        b=jqETPIQbJ+ORypc0Yu7mYdfEGjcTZvVecsV3RMS1Qdaby40HZFVhdHeWoiX0jAvSBs
         XTj7PXMxBvNf2JuBOPppeQkjbw4obkjtQN2NRfr5g2qcQHMVzum3D3/53fT5Wi8X3vds
         /gZ7bI3oWp0NTzUtNj2NAGVrqVou/PJQ9p+EOuTO9hYv/dtDDneMqlCBy662jLJnkj6d
         gMLq5PmdfiKDR2e9wZYbtM3sdmHA7wJc3RFZy+RehR6UMzBgddWNLYZh6bCdmcUFYX8B
         zL52xKQQWXwhUiWDzxVc78IHD6u5ZCamj9iY8qv74HjhMXHLKqEjh2v0wd04anzyEmLK
         l7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777108176; x=1777712976;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1GuYWc9nESbYSG7ThORlI5mhNLyHqE9tuWw4BPRuJSI=;
        b=Ud/TvWuCrT2DP3Uqexzf+IUsDWcJ5p73g6Ey1cf3S+3Hv3H/uOBiJ/ovDEA2n+SFwh
         55Ld51NxX6eyFbBWahPkVitIIByUho4HDdFAaO7XDV2gI3bXws8Ptuadj2Yll4MyGo7A
         3PTXJ2uSiOKTzaWXABWgZ6/5UlcLuL1Ed//G5GMcHm0cFHLM43EybEpiU2oonWVxYJBq
         sp1jSl+Gcp0jLn/WrOO/BfOmaX7CbnqWWUv/NckTxMqjNZEKFqM5N/YUGxIbd3gWwWVs
         mBdQa7qe1kmK6FK78LiU5vmQ1FfuxAj47PPdLjSVWmAKunNk7MW83nqWaBLQe8toJmLb
         akyg==
X-Forwarded-Encrypted: i=1; AFNElJ+z4/byBT+B8wtE9OZ8HSWrNxt3Q0rYCrLQHl6Js4kRJ2vW3sQJZA5qn+dl2oaXkKWIwyESEyGEx24hq1cAt60=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqyNpKdaRHtpS2nlr12TPVFuKzLQYNCosDit8dedO84XrecPXG
	qqFDJHh0pFgB9XUigtgeAicL4A1ss2QAhm2mdcK32rnY7yT7gw8OrCqO
X-Gm-Gg: AeBDiesR6V766P6bTgjpsR4/QA3Eu/H9NZLtjgmq29hWxfMe16tX4HxZWv3dTEQSft2
	kPy43/cgPOKA9n59iyrsqgeYyjoh3EJk3QvjYkosuE98lJ+KlwiHvkkUXhsb3zS4cSmM8P2xfr3
	DKDH4LK7lw4zDs/V4Cuq1DYNl7UyGyqGs/L3avNQdxiYaX7sihbkoz89dhEBbokRbTOhBUcZh9T
	aJjeXwZ2RjLf9S9Jr6/Q/FufpEqAKNSaifAFsTQx5+0Hg9+ZzzndIVr/5r1f/D+ww/kBRmSefD+
	b0REiCSqAmrUBL/0YR1p29cQFa2XeDs/porKKsZJ8/3lUQ7fUMJlrDJ8uRVdEMSWj8PFrra+Vgr
	1/2euPnowlM5sKfPnib5aa+b0QXn/UjJPL2xfTJVO5ty5JeYlsVzNau4ddqlS7y7Dr0Y9IA7yON
	zcs5AT1gdJ4L0k8GSbDlmZfsybjnXqCqGhhnlxygJO
X-Received: by 2002:a05:600c:888b:b0:485:4bd1:4c64 with SMTP id 5b1f17b1804b1-488fb796f95mr416216655e9.31.1777108176309;
        Sat, 25 Apr 2026 02:09:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891c08faffsm782163945e9.1.2026.04.25.02.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 02:09:35 -0700 (PDT)
Date: Sat, 25 Apr 2026 12:09:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alejandro Lucero <alejandro.lucero-palau@amd.com>
Cc: Edward Cree <ecree.xilinx@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Martin Habets <habetsm.xilinx@gmail.com>,
	Jiri Pirko <jiri@resnulli.us>, netdev@vger.kernel.org,
	linux-net-drivers@amd.com, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net] sfc: fix error code in
 efx_devlink_info_running_versions()
Message-ID: <aeyEzO6C-v6J1VHH@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -EINVAL if efx_mcdi_rpc() doesn't return enough space.

Fixes: 14743ddd2495 ("sfc: add devlink info support for ef100")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/net/ethernet/sfc/efx_devlink.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/efx_devlink.c b/drivers/net/ethernet/sfc/efx_devlink.c
index d842c60dfc10..45f412bb9b5d 100644
--- a/drivers/net/ethernet/sfc/efx_devlink.c
+++ b/drivers/net/ethernet/sfc/efx_devlink.c
@@ -531,7 +531,7 @@ static int efx_devlink_info_running_versions(struct efx_nic *efx,
 	if (rc || outlength < MC_CMD_GET_VERSION_OUT_LEN) {
 		netif_err(efx, drv, efx->net_dev,
 			  "mcdi MC_CMD_GET_VERSION failed\n");
-		return rc;
+		return rc ?: -EINVAL;
 	}
 
 	/* Handle previous output */
-- 
2.53.0

