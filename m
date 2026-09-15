Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94D4AE8A4
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 16:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789490272; cv=none; b=OIc49sBDM9FLnizSmqwmftuHJu/Xr0orQQbHhDNWCVC7UNajNRjG9WDPvTHxsjgGrmP8x0tCIp6KGW/IHQu0EeM2aPnFQDxYcbWzgDxx0hVX2XrqtFKEYfbh0Hd/Dh9COYX2qsXsAKiuusbGJo1lXolVYdLD1Y/qEsL7pM3nFOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789490272; c=relaxed/simple;
	bh=LXL+w18lkOtne/sr3GuHDqvBiI0kfwdWK82QJvZUHxc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E11Nn+ViVnTVUlp/irsog8GRxKxwh4bG90qxiuSlZqkjVfJDLvycaHFZjSJ18S1/e0hsbaV/6wTZHCCIRHfB6inquQrIsF8isOaVTY77HqkxGOpp6Bv5go4SqmUqyBx+S4BnnDib1QfHlnRnUKANOUxMxkdqFZVMmjUDiJrMGcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV0sS91C; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV0sS91C"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ece3so403059f8f.3
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Sep 2026 09:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789490269; x=1790095069; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uyYww1vw22YFRnFO2kz8YhlMFLNE8VmPnf3mijbwEdw=;
        b=WV0sS91CSUfnJqBy133iH8zinKhen12VFMMkJxBj7NTnyosApypRvMGXEpsdaCe6uk
         bAvwAUoRPcEfdzIqyC6Hw2V0zfnryTQOtm8qZU1CJAYqxzv9Gj+1o6z/7bizr7Wqul4E
         eqrVqZJOudpxSCZyisX8Ad/A3RK5KDhdls6/wlwmJsOViatsFh0fB90Z/aX27oRinX/m
         uReEda+6qVgh+OKMdL/1GM/SOqKDwan9sj6GXOj+1ruRoe8K9rTB53F8pOQgS6wB+5di
         aH8eAM90rg4Pc3R6o1Tcknq+KGZeqqqQzfEm/nZ2KSJaKgAFjrd60u0H5n9Oz0r/4iOe
         8UfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789490269; x=1790095069;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uyYww1vw22YFRnFO2kz8YhlMFLNE8VmPnf3mijbwEdw=;
        b=MmYNSe/ju3WMsUiooiXzYdfDYziOWeDRBe5T7/2cCRX6pUc/r9FKaQcUasSfNnP++U
         /fYPkikEaccsFYtGxA/we0L0ZrDVpSC8201WGV5cuWaN1h+V3LQz/eCOqKx5upI3cbZj
         4rPRyoxIBDP2h0b1/Em4SH4j4c0UmLjj0x4c+CSEdVzMdsIt46B2I8qjekJqrL2R3lTJ
         P0mQJkloUT06e2hgE+SCAxz+/+4Qg7OL3X9S0PpnLC8re+NvuiMEKJbVn5naHrxzN2Gh
         QXk6sg8Z2RTHmq++QUdNICSxVl0GGa4psU9mc/gGuxUmf59a8dNayObG+ulH/vbIL70I
         3QcA==
X-Forwarded-Encrypted: i=1; AKwUvBwCf0wV6dsEKE7rZe1I8E//BCKme5MPA0wYEBh5d1Os3nRHlm0mH+tvpDCqe+Ut3MI6BYGWDo7hGE3qwrwjDBw=@vger.kernel.org
X-Gm-Message-State: AFuF++n3dEf+Go9RcfA364Vwh7y7Gmr2K3ZC0dEmXQ0bxPlik4h9mijL
	CabTrH5/7EpOl8+HP0/3Ns/+v5GII2T8vuoscmjqTu7MnHwq8GvKd5RP
X-Gm-Gg: AYBFou1ubW2CSdL7jb6N9YiHvQ+wolnvBVUbbwz024EWzthk8zd0oYme8gPEcwQ6aJy
	SnozXfPRKaN59lWKGg0fXSNJYjq6RmUdRmBWa49IhvYGyRF9wZNkA2TTgj8czvInBtxv6imn0DV
	wAsqDKS9NbcPT0xNh6jSatdlhcO/OPcEmgkoyobQLwmArMZGHIeA0835v/fYyTwgfP47tFSEdBJ
	FYbT/DgO7MKoTpKISs5rA++ZBlOP2hk1ookTvdp/uEcbrucfvCX5PDcltmXTn4wL9O2D0Ykjkau
	6REguiPvg17YXgkBcOqidBa0O5Se2/wPDUbVT1qgoqwNaI36VJ8nP2bn0O4gA/ogmD5DxXl8JES
	fbdNJwn62g9kg12nBxncDI9ZMff7aLwGSEjAif7PDalunJgHd1gp2258GmXFiO/Vos2hXF9wSMG
	j4maUrninr/cOUUYsnO823ZjUsze8yPiVCZWN1QtzM6WNeyTmA1t3rbedPAudXqe02zxlOZ/owl
	8i3Xw==
X-Received: by 2002:a05:6000:310f:b0:486:e9b7:cb9 with SMTP id ffacd0b85a97d-4870a9dd928mr2076898f8f.45.1789490268678;
        Tue, 15 Sep 2026 09:37:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf1fa70sm256434f8f.9.2026.09.15.09.37.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 09:37:47 -0700 (PDT)
Date: Tue, 15 Sep 2026 19:37:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Yang Wang <kevinyang.wang@amd.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Lijo Lazar <lijo.lazar@amd.com>, Asad Kamal <asad.kamal@amd.com>,
	Kevin Wang <kevin.wang@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amd/pm: delete a stray tab
Message-ID: <aql0WF8CnlzgS4nz@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This tab was accidentally added in commit 6c9e0328d1de ("drm/amd/pm:
refactor PPT limits by controller and power source").  Delete it.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
index a29e76b03476..6beafabf1306 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
+++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0_0_ppt.c
@@ -3077,7 +3077,7 @@ static int smu_v13_0_0_set_ppt_limit(struct smu_context *smu,
 				return ret;
 			}
 		}
-			return smu_v13_0_set_ppt_limit(smu, limit_type, limit);
+		return smu_v13_0_set_ppt_limit(smu, limit_type, limit);
 	} else if (smu->od_enabled) {
 		ret = smu_v13_0_set_ppt_limit(smu, limit_type, msg_limit);
 		if (ret)
-- 
2.53.0

