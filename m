Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5331019DF97
	for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 09:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726307913; cv=none; b=JiNwyNba2VzGkePlNumvnPcQUNqilJr412sAUgu+ehp6gW+8vLEjxtTPKR1nvzKa3hvGcPVDvqJQN3FqQ7JHCG2vurrqLE19SWXuurd+TmiIhT7ubYFX/GAqNmSfaYpC9g6kG1IlC9wYBLD8fVhjmDnORqsbygcl64XkQCuTfvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726307913; c=relaxed/simple;
	bh=ya7/LjfmKpMsoE5aQBDX5qZQrPs7t0zo+9KUYJNQStI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BIGstWvRWe/uNihpVEcshccUnLQYJoYJoaI5lwYpabYiLiDZ5aGIY/poYO1FwqIglf/HrW3y8syv3L1iHUstFXZaiTYIU5Uma7s4W2BAs95OrRDqxZ83xiVz7dmONFXH1vTfxsjFaZ+bb42WxRT85OTu/NsKk6t5ilaNjF2JhGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vTnNCeHW; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vTnNCeHW"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c3ca32971cso3742118a12.0
        for <kernel-janitors@vger.kernel.org>; Sat, 14 Sep 2024 02:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726307911; x=1726912711; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fdccIKzjZeBA+TQzTuhi7PDMeQ4nYvxBAZIlCMJ8mnI=;
        b=vTnNCeHWFAfU0LmCfnv/tvrG5P/re32LBV94Lvc/WUEXelnBWOh67l0Dkg5dvDfrZo
         tOidpEmCDf+cpmvTOdGZ5wDNnGDMW/145L2XVRcXviN39ADSZRX7ReRcpD9sn7N1gHx6
         m+MMSqcdfbUl2/vGuFzczv1z6Je3uPMizntJMkc0+JOIh20o8OMJvRsVUfJEB7o9PXKm
         Id0J6YSO6S2zWmuOtahkN3+FtZYM19sxRKxivNyWnqqLzMmXciXQ+CSV2PjXoxjRwIsk
         0sqwTyS1/acHhyUEG9/vKQjKWJPlAUeX40cQu99/v/QIvbzpTIE1ZaSF2mj61SeF0akx
         /UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726307911; x=1726912711;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fdccIKzjZeBA+TQzTuhi7PDMeQ4nYvxBAZIlCMJ8mnI=;
        b=uck/g3sJAzYw6y+hFDTUnC04ka24lsbnahSVueUw60YD0+SttDrurn1sY03fLq1TSG
         AtJDnWHzo4z5NXCwblmtGuIy5VEpYVjw3PWvIB9eXDyzyCt2h0MvRWuEewIghGOykj4+
         S+KH4Fo4nxqoaK3OyAT0UNZ6zjm3RJKa3z+OW/eoCAJ37wmOI4O6llMxVoxsHF681rPM
         SLsKQnqwq4PGjarZH6DiwFhohPWMOwlW2t0PneZ64YLh9LT6DWGtgFcJw0Gnu8VO+oqM
         xEvYgu+ZxP8ghFtCTMQ4klAybrM8/vu8qGK7W8Bzo4gw0h6BDeFCkWDZStrxQdvSxXOs
         FnNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2V2/3ppQG8YBjeP7bJy0Q9su7oVwrdp7ScsdYrQSG9f7uHFiVNFIBZ5mTxEt/hzRD6Rk+yvhBXt2MiGA7hjk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi1Sffjc5Y6ipU3G2rbv08R44qewuS4mD/iu3mmdyznPiMFGl+
	NkSB377bNwGxQEcvCldNJnU0BI7Ss2cUeseCRjWBFDLwSZhKrWzn86//FcIZbvA=
X-Google-Smtp-Source: AGHT+IFJrSTGbj6IkzPSkz0zqYy3lgixlfvOUhv6EL9dyvHz+N7B9GcrOxAec6RJljG6MrVvxkq3eg==
X-Received: by 2002:a05:6402:26cc:b0:5c4:2d7d:9759 with SMTP id 4fb4d7f45d1cf-5c42d7d9a77mr783746a12.10.1726307910740;
        Sat, 14 Sep 2024 02:58:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb89d44sm499739a12.70.2024.09.14.02.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 02:58:30 -0700 (PDT)
Date: Sat, 14 Sep 2024 12:58:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yevgeny Kliteynik <kliteyn@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>,
	Tariq Toukan <tariqt@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Itamar Gozlan <igozlan@nvidia.com>, netdev@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net/mlx5: HWS, check the correct variable in
 hws_send_ring_alloc_sq()
Message-ID: <da822315-02b7-4f5b-9c86-0d5176c5069d@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug so this code checks "sq->dep_wqe" where
"sq->wr_priv" was intended.  It could result in a NULL pointer
dereference.

Fixes: 2ca62599aa0b ("net/mlx5: HWS, added send engine and context handling")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 .../net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.c b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.c
index fb97a15c041a..a1adbb48735c 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/steering/hws/mlx5hws_send.c
@@ -584,7 +584,7 @@ static int hws_send_ring_alloc_sq(struct mlx5_core_dev *mdev,
 	}
 
 	sq->wr_priv = kzalloc(sizeof(*sq->wr_priv) * buf_sz, GFP_KERNEL);
-	if (!sq->dep_wqe) {
+	if (!sq->wr_priv) {
 		err = -ENOMEM;
 		goto free_dep_wqe;
 	}
-- 
2.45.2

