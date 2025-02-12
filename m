Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F90D214A8F
	for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739378438; cv=none; b=tMgeiKGaqMqCVH3Qh4wP2IS6TaDe6Edgck+g+QaJnwGnEgQqtqlIt+5986FSzH401gbyBPC3KyQE2fLPAJjWYJMQU94x38yUD1hC/+ZboMA6BGaBzp1sRR04vh4oGghJ6KFCxHiBsDIpxIbODhb0ayTbv54WgyvsW7y/ebH85d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739378438; c=relaxed/simple;
	bh=fIvihShcE39cxMOgvzvAE4sHjptoKE7mi4lhmy0B4f0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rcx5sfzCWr5S1lsPWVh3KgghtPi/4SMZA0cFkQ1QP5v2SgI2ZuIceyTRkh5xn38kvCB50PfHp6sUMT7uZ/6gY6vfpmr/Eqylurv7PIZi6ak0f96RMRh0WSe1Sb+c79pYDQCQLh/6h4cEiDFMdzdpXrdwDhQck/ImVk6eD25ezsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MjV59ihk; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MjV59ihk"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5dea50ee572so2990635a12.1
        for <kernel-janitors@vger.kernel.org>; Wed, 12 Feb 2025 08:40:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739378434; x=1739983234; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ypsXxYmlUDNAgS7vll0CP7szhdB/OHfZFzs1nsbbuTk=;
        b=MjV59ihkdzLi+A18alBCA9M/pl8qcWykYSoTS/yohdfWRFby4TGv7imNQVrw/S6Rl+
         DwMfxZKoJOU7ZHiise1pEN8+nNXH1iv8i4IUuiRGBJfjSnE2Tz3I0mUIsQEryR2fIPek
         DMAoN+Jfywkb///gIf6AzMhkRg/EoS/+FZpD8V8JE/iCqvVP82q5CXZ7xybyvmdkZm52
         KDVtR7dD95CW6mFjeUV6IBLPvdaaDHbIWgY6t4rbbPdU/Ox4GipKs0GwrCq7d43s/DVU
         RHGk+DZFagmT5ACeud3MSOQF8PTo5TWSArVCSJL0u4XSxOvRCzke0Nw52HAL5SLodmpr
         gC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739378434; x=1739983234;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypsXxYmlUDNAgS7vll0CP7szhdB/OHfZFzs1nsbbuTk=;
        b=r49tkBNT2lIjRCrTIUdPeafZLVu/EG4rPvf6FcCyREcOPIyy+ClbO518ESwcCtd/xu
         JeNmMBsgbGDuL2JfkXN3HEhwTFVJ4VFuDpaX6tFfb0eF00p0KRCXijovdNTxLT/EqbhO
         RzkNYEzQro9zc4XsXSFp8v1mB0pp4q4eaQMYgpiHucO4pyQHpeWPHcguvSsYsAU2LCny
         +smGqWv85HtYb44ufX4ZW1hGiHtTNOuaY7AhMYDjN4Z15TIRdXZJxiZ4mcL5afjNfSZY
         UNe8G74ebjxyb9ZwWObWJYA8CfvIqX+NQI9njmrKFv0k7dq+nc5YXMUq8i6vt11Jk7bc
         hWeA==
X-Forwarded-Encrypted: i=1; AJvYcCWWYHumNHafwGY3bJDKPUgLyJTb4LMd7oe2lyJnNBrh6mOnSAyPxjUmPUBuFWewePQFY33VodhgXFZpnLHCeLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzdZzNXmX0KJ3OLtNQhMpKCuk69ngP5dN0Xbhcn8sV83aqX5Ta3
	DpBP0Isx0Q0NnBLfIZqDqAMHIHYdJdSv8L99Dyr1w1p/5ZO08oIRpbEWXPV0EJQ=
X-Gm-Gg: ASbGncs4qb2dsoboAAeV4CL7Kn4Eb3qNVhsUZpA3sQpIQOveSF2dqmC/OZZGwqEcjsT
	65PAJvzqwWH9mOfDuDNKPIohooTP15islLvqgF6kDX+qB7yUPq7+31i3zCyGkltQhZaOIzNgHso
	YRBinBf5NPNQACnbP09Bh/iUhnrx96DOrDsRm91SwTa0z6a0Vn2jbcetkoT2KFbcIsL9qZmzaAV
	P//Ryx99TBid/7C7yVrOnvlNP3qam14BHOkHyQEXpTBoOkU5NJo4TaIzGbqd8rQVZIbK7cj/Xt0
	q2xQrj4wLvk4kKBtcbKT
X-Google-Smtp-Source: AGHT+IEMax/OSHUJltNQhKyJlOjabg9OH0ij65Z9dSRbXrh3omUujr+vpFNHmyS95enTpRBK7kAIBg==
X-Received: by 2002:a05:6402:2688:b0:5dc:d913:f896 with SMTP id 4fb4d7f45d1cf-5deadd75028mr3104581a12.4.1739378434362;
        Wed, 12 Feb 2025 08:40:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5de4cbdb434sm10348391a12.20.2025.02.12.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 08:40:34 -0800 (PST)
Date: Wed, 12 Feb 2025 19:40:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] Bluetooth: L2CAP: Fix NULL dereference in
 l2cap_recv_acldata()
Message-ID: <f9975604-6a65-4bcc-b532-15fcaa6da0e5@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "conn" pointer is NULL so this "goto drop;" will lead to a NULL
dereference when we call mutex_unlock(&conn->lock). Free the skb and
return directly instead.

Fixes: dd6367916d2d ("Bluetooth: L2CAP: Fix corrupted list in hci_chan_del")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 net/bluetooth/l2cap_core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
index 6cdc1dc3a7f9..fec11e576f31 100644
--- a/net/bluetooth/l2cap_core.c
+++ b/net/bluetooth/l2cap_core.c
@@ -7456,8 +7456,10 @@ void l2cap_recv_acldata(struct hci_conn *hcon, struct sk_buff *skb, u16 flags)
 
 	hci_dev_unlock(hcon->hdev);
 
-	if (!conn)
-		goto drop;
+	if (!conn) {
+		kfree_skb(skb);
+		return;
+	}
 
 	BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
 
-- 
2.47.2

