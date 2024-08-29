Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC60A1B86F2
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724959362; cv=none; b=A8c+lejRgoTPLNL0loggm8rIKbjXRAJ2Qi9hLV/7QhRoV1OjdtUvPCrb0fLZEk5DiAdo10zSFkaITYorrHTidfEcukdX+G26mCKhxbefI1dQBYyeVoVBP92TwtEU63VdiFebugmUe5DuxGwmSIWKxcVocTnupnMXPEIE/bwL4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724959362; c=relaxed/simple;
	bh=qm19Gvoz82XJIblwayPtkbMrwDBs9ju0c2xYk5h7T9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LW2UEFmMU3T/pbNhec0GJVsnUikMBN9WWCbMRJ59Q/ZkeNcfMIKJBMUOkWG+qQrl9DanbQxcZjuuqMbrQ4SLeqMPuCGARExW/EbuAbSWntP8CRfl1D654igd1AQ19hURT3s+CzFhvxEFh9hWWfa9SsF1VUOMOXb7g3VYLMB2Fh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JsKlCMUy; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JsKlCMUy"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42bb8c6e250so5574485e9.1
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Aug 2024 12:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724959359; x=1725564159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7hIZjb11n3DqyAA9+P4eJZLp72biRJ3AAbi9kWILsZ0=;
        b=JsKlCMUyICUC04SoUZs2LyYmTJ7lryHd95jPzMWyQXhaCeWQlVwBDVaPuCNMoixJZU
         71Ka2Gs9JqMwCTL1T+DhhBFEo5UZAyUNZ8vQAVDwpl7thB6PHlz3gYo1cMW9u6yTq0dQ
         VngGxCHTmVP2aDr6eM//PLJ2TkIplXhHDv4DFJSrddAWQ8G7Zu7Ej2JzL15+mqAZCl4B
         GlA8xf0vIaQ3A0IqPQUtTw5S+qbEqcXHRN8xvgAmFzL67eUhJHdE7kMuooq7aHSrqsXS
         Vwn8vwaZ9vIKHfwifhQhKSLd0sRsohDnuj10aXka6WZACyahQrQtnHs+K/WvKE8MU/1R
         sWNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724959359; x=1725564159;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hIZjb11n3DqyAA9+P4eJZLp72biRJ3AAbi9kWILsZ0=;
        b=twV6asnfbS4s6u1hmUGl1AcCyzU0AZA6+pLiOH1iqoL4OuwsPI6Hrzn/+QStYJRIe9
         oPbnTmFhZLmaGg1sTRO1Uc9k75ebHBkJz8+6ScUcof8Pinwy248mlxlO/FrIBPEbfHIC
         Vgx2D3rDBfrOewrpCsvaoZYnU1AD+h8HwenotOCMmqMo3IjYUILUsv3L37vyX4HGr3a8
         s9SSqBCEozzmj4Vsge8oyiwxRLLT/hYhj9xhDy4aDBzAxvWV6ueQnOwhHyGGzM1CfVMi
         diwdmQCTi+o760ugzr/K24Yre39Of65i63S9u7aj1M2+q5n8yQrXBfVGXnQPa2UAZev5
         4fUA==
X-Forwarded-Encrypted: i=1; AJvYcCUbL7uZmush3obcVYZyoDekx4bNIiFGoZePXkNIkFa028XNDhZJQiZ2qQfnt3TvyFeE4y8oj5rATEM2caFIrVc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmVqBy4k7vWAEND0jO2DG2unBiajBQPbP2Hdw5lPzLPQ5hHPQ3
	W1xcgSz3Tm1Wt6d/MQU/KCd4VoR6TJIqmCCdTJPAoC13nEWDfo4jnPFmpgHRRRc=
X-Google-Smtp-Source: AGHT+IGTymteNaS4QWlAktRpMUvs68NdpmgcKtVmjCHiVHP/sCFsHOFzLywZcr2xcxkbNPQRnu+rOg==
X-Received: by 2002:a05:600c:3596:b0:426:629f:154e with SMTP id 5b1f17b1804b1-42bb02d970dmr25349155e9.30.1724959359098;
        Thu, 29 Aug 2024 12:22:39 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba642593asm59424265e9.39.2024.08.29.12.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:22:38 -0700 (PDT)
Date: Thu, 29 Aug 2024 22:22:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Namjae Jeon <namjae.jeon@samsung.com>
Cc: Namjae Jeon <linkinjeon@kernel.org>, Steve French <sfrench@samba.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>, Hyunchul Lee <hyc.lee@gmail.com>,
	Ronnie Sahlberg <lsahlber@redhat.com>, linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ksmbd: Unlock on in ksmbd_tcp_set_interfaces()
Message-ID: <89c440a9-27bd-45d9-9d5b-5b4bf51ec950@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Unlock before returning an error code if this allocation fails.

Fixes: 0626e6641f6b ("cifsd: add server handler for central processing and tranport layers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/smb/server/transport_tcp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/smb/server/transport_tcp.c b/fs/smb/server/transport_tcp.c
index a84788396daa..aaed9e293b2e 100644
--- a/fs/smb/server/transport_tcp.c
+++ b/fs/smb/server/transport_tcp.c
@@ -624,8 +624,10 @@ int ksmbd_tcp_set_interfaces(char *ifc_list, int ifc_list_sz)
 		for_each_netdev(&init_net, netdev) {
 			if (netif_is_bridge_port(netdev))
 				continue;
-			if (!alloc_iface(kstrdup(netdev->name, GFP_KERNEL)))
+			if (!alloc_iface(kstrdup(netdev->name, GFP_KERNEL))) {
+				rtnl_unlock();
 				return -ENOMEM;
+			}
 		}
 		rtnl_unlock();
 		bind_additional_ifaces = 1;
-- 
2.45.2

