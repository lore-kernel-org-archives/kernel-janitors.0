Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F53429B204
	for <kernel-janitors@vger.kernel.org>; Thu,  8 Jan 2026 20:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767902431; cv=none; b=X4q8u1eJPVRE3JSomcZKdTxz3RbMHbKiyrqo3XIBIxVTRnOR2M8HZKahe9gfCP7KihGeMjGduydva/zLbKFaxwmHT/Lsh6ToxHaqQOGw/8PkiGXjCMl7zCqecmXdFH9yZ/xbGmHuGs+vOMxcihscPQuEXk+/h6uTunGOl6mQ8dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767902431; c=relaxed/simple;
	bh=oRS1hAU5OfWdEUW9LOFCO7By8fdkrh8TpGijGee93nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiHj0Dila5j/f9OuLdx6kwHpOOA/R1bnxhni4Nen37gdWd9RMapY7dZ5bN8t5SyUtyVuG81ElbQi+BexKqKEbS/FvFGpPJJdMwGuJndTbfq2Fg4tSg5FixFMCcXD8C32w2uPp1if0LtD0pkteom405JKrTmnoJAsAN+AdGlo1W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qUB+2zV7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qUB+2zV7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so38908835e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 08 Jan 2026 12:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767902428; x=1768507228; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Gcl9W7utZBdw7FMB9g/xVOVl0GPxA6kn4avJQSoGwXc=;
        b=qUB+2zV7Y9u3RmTSqxHCte/PhFJg5AnhugodrVZpp7noiOLyLn/StdqQIj485PWM8G
         PJyAG7N/tz2h3griAfRA+coD5tNHX/jdzsbDb5aRcQibSgBFTIpM4mnD7ZXrhtEcfh+Q
         rM2Ex0QNgfzHEAWMZHcEVMuA+x6mfpTER3ZkWBQkxLlH3jgj9r5erfXT5O7V4/n5Qmt0
         aW7PomzAqjs7nYYv3fHzm62f5xzADZ9tWHNadshVXBtiy1Z2Au+3eXqnjMzATX3QYTqr
         EHcpLufajmdFHp/mk/SqOyvstpqylFOVXd14QYCfY8uoJr6Q9K65g8qQDDGSOU9GN6kb
         ZXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767902428; x=1768507228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gcl9W7utZBdw7FMB9g/xVOVl0GPxA6kn4avJQSoGwXc=;
        b=Pzof2A+U64UMYELY/8Mf5TzJdpc8lj02Ac6f42CWv1d+qHXcSTXciCx190XdN1jzQw
         x00vQM+7RySugrorTJxZVuladC3+IRE1ItjblPJEHir/5AZdQqt0uSS/lCtuMJtFJ2Ua
         G3kdMVyVUZ2kbwR0EvT+pHl2WpJV+8M6DGifnvr7hzCJ5NAnDDUrSk8TM3X7/eRwj7De
         T1lY35P5VxzXTeUScPVpJWa6/QxGRoN4AnGbvPOy1z0eKhVVIWu6I5JNAUTUkNd3cvEL
         HsskefOqa7rpxLYx8zc8w3FWjNiHwV9Wn/38aHdkwqlUZ8DHuCSCR2nLA8ujcxXinHu8
         Rxag==
X-Forwarded-Encrypted: i=1; AJvYcCXGWOiEcrf/IIvAEwH9uBG14jOLSrJZSoM33iGgbvGCMuDzq80hANpTcHqXNWKIBVDaguhIw1cd66dMrpYxF/Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMePvjlIwXlxzL9rRMkS+SlrSXpjQw1HouRfveh0R3WsDvI6O+
	QhntVgR0Eu9Cp4VWJFbJd62+S5nJMxteSph6OsX7hRHuUywQpFFxQOK4DlwXM8DVku8=
X-Gm-Gg: AY/fxX7lLQicRGbreP9P0Au52ctmSZQGWU6kDtNYnqpQZroPvfGXzOs1AzMTdzfgOYg
	AIB/ULHiPkHxDVgq4P6pWfyDsorv6SZOQMxEVb2lNNacjq1N5e7HoC+9J7K6cdIAp95me+3WXoM
	odmcpJNFnXt1+V1Zkc/4T7F2VhZ+PUqWk4Z3lYIPBiqPu85HSkI+hnvX533LxkgltBwyqKG6vuT
	zNpsWFscnzTVXmSOsU8ulGnq3AMt86bfglqMjIeaDbWURI4Gcc3GS5xuIt/l9f7z0zuCejrWcc5
	qaOxFA/A3pVWTLvlu5v+ctBsCCU9sfiEif6xJOCq5b9/oE2MOHVN7bx+NpzZS9YuZgabUgnhXBa
	/hDHq+WHJlLg5aVQJe2O5moZd9qmvrLZ28rV6FiGG+rfYfIdInUUiP2a+iVkILLZMWPv4UGE9tK
	hvn4QPuCL8K/aFkQLi
X-Google-Smtp-Source: AGHT+IFDQfRRHTy8VXJdne5ZZULneM+07+9GSYBN+09fhDGgLXusMoTgHfEjB4HwQ4EFEEDpVfL1QA==
X-Received: by 2002:a05:600c:a48:b0:477:9eb8:97d2 with SMTP id 5b1f17b1804b1-47d84b08652mr86768025e9.8.1767902427872;
        Thu, 08 Jan 2026 12:00:27 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0e16f4sm18895387f8f.11.2026.01.08.12.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 12:00:27 -0800 (PST)
Date: Thu, 8 Jan 2026 23:00:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chunfan Chen <jeffc@marvell.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Kalle Valo <kvalo@kernel.org>,
	Amitkumar Karwar <akarwar@marvell.com>,
	Cathy Luo <cluo@marvell.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] wifi: mwifiex: Fix a loop in mwifiex_update_ampdu_rxwinsize()
Message-ID: <aWAM2MGUWRP0zWUd@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "i" iterator variable is used to count two different things but
unfortunately we can't store two different numbers in the same variable.
Use "i" for the outside loop and "j" for the inside loop.

Cc: stable@vger.kernel.org
Fixes: d219b7eb3792 ("mwifiex: handle BT coex event to adjust Rx BA window size")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This was found via static analysis so I'm not positive on the impact
of this bug.

 drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
index 90831a1350f5..91166b89f918 100644
--- a/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
+++ b/drivers/net/wireless/marvell/mwifiex/11n_rxreorder.c
@@ -826,7 +826,7 @@ void mwifiex_update_rxreor_flags(struct mwifiex_adapter *adapter, u8 flags)
 static void mwifiex_update_ampdu_rxwinsize(struct mwifiex_adapter *adapter,
 					   bool coex_flag)
 {
-	u8 i;
+	u8 i, j;
 	u32 rx_win_size;
 	struct mwifiex_private *priv;
 
@@ -864,8 +864,8 @@ static void mwifiex_update_ampdu_rxwinsize(struct mwifiex_adapter *adapter,
 		if (rx_win_size != priv->add_ba_param.rx_win_size) {
 			if (!priv->media_connected)
 				continue;
-			for (i = 0; i < MAX_NUM_TID; i++)
-				mwifiex_11n_delba(priv, i);
+			for (j = 0; j < MAX_NUM_TID; j++)
+				mwifiex_11n_delba(priv, j);
 		}
 	}
 }
-- 
2.51.0

