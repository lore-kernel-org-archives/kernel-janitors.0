Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E712E52
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Mar 2024 08:30:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709368251; cv=none; b=R7NhQmBK4f5h5RMD8dkZz3CR5u746ObikOXesE7dQ9xqasn+ViuFyud1BDgw496GeT4BRBXZyyrH8UWWrhUoxPvW/evzOClRMAbWa6A01cAcCtnmFuHeXnvN//q/rNHgsxbB/Ng5N4mHjLfJm1pW165b6SNk4u6yeKPNVR3OSN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709368251; c=relaxed/simple;
	bh=FhJw75e257Az8mxXeRR41uutfZ0ZnhQWt5by0FdTv/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MElDkffWlwR9tMnfhWNSsqmppjxzf32/ROY69bwP3afYDMxiIUc3fAPm/jxU++O/+D57p3v1A/QLZpHk2/4hSMMUvSf1GCbLhBDcN2ncaAAjlEmRmN1VZQ6tWKeBB7UMF60+KeXIPsfP8RYwRD0361HQir3PHrSMZN+SEawU07M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IYmCr8Ja; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IYmCr8Ja"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412cad778afso6729395e9.0
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Mar 2024 00:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709368248; x=1709973048; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LOcsM9bK++g0t5d/3L0FrYxkOtpdjx7QFD2VwrE7ApY=;
        b=IYmCr8JasAluwetgH8FdyW04hsAf/kM8vPOMOBVoifM86/Xfpyf1q23pRefkYNGJDe
         eNt2WrAxLdnrmYkZbgg5hy8DH2Qma/0MhQtk83N8wDljaXCTcdC66LdZB+TjGilVUZrG
         oQV4+Dst8vVFS5niFD596zOlKvtfRcSvIMCZthO0LsX7boiX5Tw/DjX+efTRSrJqpXd0
         s4EHHzKhSCJvG1DrqwW9sbs2/hmD8iGddO0NMjqbw0wlgyTvyMtSQhVAE0clDCjiJufg
         NN+uuFVu4DBqv8B5s3jmF6p7gmcbSFKxVQgjHnnY180KnsmkbzqgOKfxxBkeJ/kPLIEn
         gMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709368248; x=1709973048;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LOcsM9bK++g0t5d/3L0FrYxkOtpdjx7QFD2VwrE7ApY=;
        b=fxQxE18h7rsf3mZiIx/Y+Qx1K8JQYNhZ3zifZQE1DjWtF3dR+m9Xi4raTjA4PwQrNS
         UHq87uKXx5CX3+X1FpKcnewzZTqd7xIhVLLloyEvzUKLXRQBmzYiTJRhX7qwKoaJgEn0
         EJn005MMyYdMrSa3ndtRuP+fKmJcB8pBQrTRtm5JA2F1KXevYgu5VJJklHPub3g6U2ZO
         K9tyrR6zQTvi6sfHb0wGSWXpRIOY+9OmkkugF4M1DJ5AaGbZhO49cjtQEjBffwULxur+
         T9tp7Vjc9csM9ts9FecPoOoB91gBBlzLqIoXkz0qgOcU59VMd0BvAbdFBGC3HOE5WRRG
         kzOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZyaQMyMmUPd+n4HMOWXmBwgYc7drbjq/Pu7oS5E56qqAR/p6XoWgHnTg5ahEGedupPAvCQVH8zmhv6CJL+7f7RrTa6E8XSqQ+l0jxXXE
X-Gm-Message-State: AOJu0YxRb7spxrJfE5U9gQsgMsuP2bxIEF8h/AnDPKQT3B4Vz7w4fh4B
	XCwP7CJ1ARzyFpStie39bmD2M3N9gQBRaVF5oSDxB4Ze7P1ygeZ853PCs6+dGyU=
X-Google-Smtp-Source: AGHT+IGHC6HfBXM5nrYJHQLRoXksV5gxN2hyd8vm2fltZWuTwZWskF98EeISwQKVDYPxh9Y3tIt5Ng==
X-Received: by 2002:a05:600c:5024:b0:412:d0ab:a6f2 with SMTP id n36-20020a05600c502400b00412d0aba6f2mr1129766wmr.39.1709368248431;
        Sat, 02 Mar 2024 00:30:48 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id l18-20020adfb112000000b0033d4deb2356sm6729168wra.56.2024.03.02.00.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Mar 2024 00:30:47 -0800 (PST)
Date: Sat, 2 Mar 2024 11:30:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] Bluetooth: ISO: Clean up returns values in iso_connect_ind()
Message-ID: <5f73d9d7-61d7-49ab-a5e3-adda72685122@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This function either returns 0 or HCI_LM_ACCEPT.  Make it clearer which
returns are which and delete the "lm" variable because it is no longer
required.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/bluetooth/iso.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/net/bluetooth/iso.c b/net/bluetooth/iso.c
index 30c777c469f9..8af75d37b14c 100644
--- a/net/bluetooth/iso.c
+++ b/net/bluetooth/iso.c
@@ -1910,7 +1910,6 @@ int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 	struct hci_evt_le_big_info_adv_report *ev2;
 	struct hci_ev_le_per_adv_report *ev3;
 	struct sock *sk;
-	int lm = 0;
 
 	bt_dev_dbg(hdev, "bdaddr %pMR", bdaddr);
 
@@ -1954,7 +1953,7 @@ int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 
 			if (sk && test_bit(BT_SK_PA_SYNC_TERM,
 					   &iso_pi(sk)->flags))
-				return lm;
+				return 0;
 		}
 
 		if (sk) {
@@ -2041,16 +2040,14 @@ int iso_connect_ind(struct hci_dev *hdev, bdaddr_t *bdaddr, __u8 *flags)
 
 done:
 	if (!sk)
-		return lm;
-
-	lm |= HCI_LM_ACCEPT;
+		return 0;
 
 	if (test_bit(BT_SK_DEFER_SETUP, &bt_sk(sk)->flags))
 		*flags |= HCI_PROTO_DEFER;
 
 	sock_put(sk);
 
-	return lm;
+	return HCI_LM_ACCEPT;
 }
 
 static void iso_connect_cfm(struct hci_conn *hcon, __u8 status)
-- 
2.43.0

