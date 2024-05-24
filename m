Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998AE85923
	for <kernel-janitors@vger.kernel.org>; Fri, 24 May 2024 10:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716545651; cv=none; b=p1PzHEIE11rOVGzBqaDH65Rm8YSLmuKVYs7SS6DoN2IB5jlctsFpynKmJ+NerUT1ojBxlV+JhxorNoTvA4fGhiPoJGjyjZGfqu3c2ju0fiDcwcvOasMCA0zN6NhPiNuzpaxMwBt/XZCsq3AuGomvWli1uMGKcOScNovIai62f6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716545651; c=relaxed/simple;
	bh=sDQFYTVbNT2/K9iVIl5y4i/52Li/sV3v7epjRryjwUc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qq02nXpLcbUhhzkxJ6f7YU4QSoszGUVK4YxdG2t5c+kNf3Q2JyTX2aaomtt+iAEcyTwvcCt8Sk5eZ6zqIXAOat4HQcl17bV74RfI7FsmnqDeugEyvi6nbKp4rkA0koF9fIBYzLwKzKHiWRVLP2sUhzr1/RS44zF4awJ+IxiKCJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NIhCGedn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NIhCGedn"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42011507a57so66318185e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 24 May 2024 03:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716545647; x=1717150447; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IM+l9b+Ddr6zhT1mzkxDkWWP6YYG+wKMelFtyjWWBDQ=;
        b=NIhCGednBxy/TivUBT20zMCtZTtJE2oeeglyMkW8Lx+QRDznGRUa3ntltDS30L22fp
         XGjjpAvx3B+SXCVH9z+VvvU8rnu8cEoiGURcCfppYw8UB76P/IL8UHgzJxeUY/mgtzib
         AeRJV2TYl88rame2w6i9cvFWevaMNrR+p6tGlyvoa+MjIVpVNx5RHUXIY3B35nWLz06c
         G4i3A85kfzEx8rNKns3L4jL9G9YwEuXsmpGcCmaX8RvzJidjeE6ZgEu78/oAxHb38iNd
         OOWeAesmljUOnu+X/X+e7o88IkUC2fn8WxE3cKQAsXcRPbK+/PoN6dW9GcBzBlWQHGGL
         AiAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716545647; x=1717150447;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IM+l9b+Ddr6zhT1mzkxDkWWP6YYG+wKMelFtyjWWBDQ=;
        b=VuHuYrcEA1+wP4bzRMKYWNm7QFFvT3GAIltYnEIHA4Dzg6w+uJ6nNeciO0FzCKyMok
         sb5+ZXYynCnziHISE6DCRV5sOrsAXYRd5nuQ1X9lwRFWu4BUGL9hIwAJQPai3QoccOFK
         YRmzYY8WxF9nkPA0XiFrRCa/e2uzLB20u97yiwDMjGZ8+2gRUVulfXY7Ze2Rz6Yc25kR
         s4T8blRnwF6wntKM3BCBfWQ/NQ1U+xX82g/wOYHwHEFKcJtt3UoCeEgwmlujd/FSFsay
         k5coiPZbJYVGfw23CbGTotA9K/qsEI8cPxQhw6Xy/VqlsFjRiKWP67Lm4hY1CE/c4NGu
         VcdA==
X-Forwarded-Encrypted: i=1; AJvYcCU1HCDz3SNLFP2Cv2VP0OBjNq/8XolByHK+f745ijNDXawjjWMqVLOodaKXSERhvbFNai3RalR5dnXQGfVWbP0VOP8rZQTqCrugb2G51mcx
X-Gm-Message-State: AOJu0YxIH5V89t5GGBO2pgYv9ZtGERY/BPZEhh4C97JDIClPsl0JccwP
	JnH70lLhI0To0QnndU3VSBT18a/PQKWpG3VFEr4t2AxYVt95RicR1pRgoCbDE9c=
X-Google-Smtp-Source: AGHT+IFCqr13Uicxve2AP2QOtfOfD7tHQdd+OMCD8G33EQHCrhyPN3FgroHGrS3bmoEBT/VkcRutVQ==
X-Received: by 2002:a05:600c:444e:b0:420:14fb:de1f with SMTP id 5b1f17b1804b1-42108a5965fmr11697145e9.14.1716545646781;
        Fri, 24 May 2024 03:14:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f759f0sm48224445e9.28.2024.05.24.03.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 03:14:06 -0700 (PDT)
Date: Fri, 24 May 2024 13:14:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Bluetooth:  MGMT: Uninitialized variable in load_conn_param()
Message-ID: <819ed9b8-8790-4d15-b2a0-20929328d582@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "update" variable needs to be initialized to false.

Fixes: 831be422f3bb ("Bluetooth: MGMT: Make MGMT_OP_LOAD_CONN_PARAM update existing connection")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/bluetooth/mgmt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
index 20eca8a9c681..3ab1558ff391 100644
--- a/net/bluetooth/mgmt.c
+++ b/net/bluetooth/mgmt.c
@@ -7865,8 +7865,8 @@ static int load_conn_param(struct sock *sk, struct hci_dev *hdev, void *data,
 		struct mgmt_conn_param *param = &cp->params[i];
 		struct hci_conn_params *hci_param;
 		u16 min, max, latency, timeout;
+		bool update = false;
 		u8 addr_type;
-		bool update;
 
 		bt_dev_dbg(hdev, "Adding %pMR (type %u)", &param->addr.bdaddr,
 			   param->addr.type);
-- 
2.43.0

