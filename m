Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31762FB965
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Feb 2026 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771491766; cv=none; b=qWPRaDGICg2q3JmB3dDckvmnC6FyxAxwWNLqRlHVZfsVSi6GVQW8EeaJRPDyGhJsCQ9r0D0QtT8FmDuFRqvgMi4dwC0ILIWHRPbkh4J+fplTPXcmm0K7ihPalK81a5vUuarNTwFWf7y6k1HTw3M9GB8vSaxd1zfDRbJFcGJGYnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771491766; c=relaxed/simple;
	bh=x4m5N0xkK1VAOmJGsckz4FS7UXmOUVgb2CRC1Z3Btxg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i+03zvRKhMkT4RBazdP9ABrqwjutUVm5qlrFbz7ZvAfvVvxrv6wGhB9ZrTBGiCh5l5s/jprdZMPTtomzQQKsJoPV7YHfDihDRzGQUmcEFY5INCbux/3Rbztm/u37QTclCFXBI3uHyTZ5tLykJi13cb++bT4mwEL+zi6yvYBw4yU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Px1IMb43; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px1IMb43"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a8a7269547so6505975ad.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Feb 2026 01:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771491765; x=1772096565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FdCAN6g0YtElyjxGqQjQ19PdmFtnzKPpjCD9MmgGuxw=;
        b=Px1IMb43ihaNmt7yoB3bw/myrUaiZ/7W6lLJfRhUZJsZCM3axOOpOz9v0pvaCKSxwM
         5JJP16wn5kKjiWL/O+Qjm7gcVj96jWJ55YPpPFyvNNubpZDW4kP/A4ex+TQDklcB9L02
         QKdogFsd+WM45ma0/FetPCQf7yl5/NUxn6riG2l4SaQvrMRg5QzFy3ZQohjxspbrGEk0
         vgavgJSREnr0ME2FHXynK70V4ybkwGavic15znb/sEgHBITpJqIrIF5OZRHV7JtHV50R
         TiqF0SBGwD/wqVBPAQSz57Tg4GaatWhZB2SjWPPl0zG3LaYILVKTWU0yVMg3WNF4Hw4U
         fVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771491765; x=1772096565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FdCAN6g0YtElyjxGqQjQ19PdmFtnzKPpjCD9MmgGuxw=;
        b=Vma04KSKD8brnW8jgnLCPOaGyWCUAyXX/GrBNnlxYm5nyZXNtaoXPgCqzPWUPb6p8Y
         KT3BfEipNwcNa8556KTUPogZQi1XTgToXKnYVlTDM9T1BbGJ7bO/7wElg75KrESNhIWL
         Lx/S2wajkujniytpY+d0vE+Wi5ljYqL+KovL11tFas6XsOuh15PmYRiPNUDtm5T9cNqm
         23lWYFknFHfaA91a263/aoI+MH0HBuD945TOIIz+I6abhhURr7eYyr7G9N0/70iq8P7C
         hdOjA9AoDHExWvcJOrykR9nNjwruxtV0n2gq+T44vUCPA8jEdNmmIS9pzG4sDP36QZ3W
         IGKA==
X-Forwarded-Encrypted: i=1; AJvYcCXjjHqae3e9k7dVYpFp4OscAKMNqBaqEVH2Xc2JadVuGHNrchdFqYPez/ZWCXu6QVthR27URxO0TxTR8q/42zU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmmUTwXUwryjPYQfUsMP5+h7WFHUdYCzbqfGkPuhpdkWKVaMv
	Wlv6z4P9tHdHShAntxPEli3rRvMWFfkvjK2K55aaaxPLgMZNaopDC9+O
X-Gm-Gg: AZuq6aKf3CvdVHVzKwrLSdSvBs5NDUa8vIzh1XleHdTxwKtjhg5khB/aaYEV6mt2CjK
	SSLHtRT69rDPxkTyEQN8Nz+PtfcQdYrjt2xw+/KLT0/mu50CIslBNeV26Gr17ZPgSb5UwvYkt8r
	ZXMMFaRIZXPXoTYFnZMeGRZxicWBl7Oa2JVEU/ENbG8T63/D0y4eQnNFwgvno9ZocpYQiLPIMpk
	e5e0tfk8RaPNEJ5orgnJE0fsEUaI3wDC4HTqaHPOXDu+/iJKbenZ7FZFci4qSpRBkNL5ZVJKj/A
	CNNFvGrPWpgAJU3zOjNQCPh9C5TW1CdJxe4/HKZQZwwtxLinZlrFX9YoL8KFOqCPBqiWGLImZ0R
	DJOzmhdbvbd7uLlHaBtuRqpz2QmqWL8rFKiFpxys8VFkNNfDnlvSIPVII5CypfCEEDlPRIR44Mk
	6eQOaLQzKi7QEarPzZJdaarjx3bBKXGwVQQx1t4LPU3vR03aHb+LWig+NV2iUTrOx+Obti
X-Received: by 2002:a17:903:11ce:b0:2aa:d287:693d with SMTP id d9443c01a7336-2ab4cf94770mr209786915ad.20.1771491765191;
        Thu, 19 Feb 2026 01:02:45 -0800 (PST)
Received: from zeeshan-Standard-PC-Q35-ICH9-2009.. ([110.93.227.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713675sm221090545ad.27.2026.02.19.01.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 01:02:44 -0800 (PST)
From: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
To: Sridhar Samudrala <sridhar.samudrala@intel.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@google.com>
Cc: netdev@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
Subject: [PATCH net-next v1] net: core: fix logical inconsistency in failover_slave_register()
Date: Thu, 19 Feb 2026 14:02:16 +0500
Message-ID: <20260219090216.12884-1-zeeshanahmad022019@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Smatch warns that 'fops' is dereferenced at line 66 before being checked
for NULL at line 85.

The current code inconsistently assumes 'fops' might be NULL at lines 62
and 85, while dereferencing it without a check at line 66.

Move the NULL check to the beginning of the function immediately after
'fops' is initialized. This ensures safety for all subsequent
dereferences and allows the removal of redundant checks.

Signed-off-by: Zeeshan Ahmad <zeeshanahmad022019@gmail.com>
---
 net/core/failover.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/core/failover.c b/net/core/failover.c
index 2a140b3ea669..88e376be0255 100644
--- a/net/core/failover.c
+++ b/net/core/failover.c
@@ -56,10 +56,10 @@ static int failover_slave_register(struct net_device *slave_dev)
 	ASSERT_RTNL();
 
 	failover_dev = failover_get_bymac(slave_dev->perm_addr, &fops);
-	if (!failover_dev)
+	if (!failover_dev || !fops)
 		goto done;
 
-	if (fops && fops->slave_pre_register &&
+	if (fops->slave_pre_register &&
 	    fops->slave_pre_register(slave_dev, failover_dev))
 		goto done;
 
@@ -82,7 +82,7 @@ static int failover_slave_register(struct net_device *slave_dev)
 
 	slave_dev->priv_flags |= (IFF_FAILOVER_SLAVE | IFF_NO_ADDRCONF);
 
-	if (fops && fops->slave_register &&
+	if (fops->slave_register &&
 	    !fops->slave_register(slave_dev, failover_dev))
 		return NOTIFY_OK;
 
-- 
2.43.0

