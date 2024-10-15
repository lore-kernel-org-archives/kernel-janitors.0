Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6D916DEDF
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 05:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728968412; cv=none; b=f7N2Zfwmxkn103I3fHltubI4xED4ej5LZTglZkDjBXOPh/e/k5MmLoox0hHgF+Dtakm2AErpYGez6GQx8bqgZg/RlJr7btkNbmx0vcLfeL9sYqW7NG4Upc/RQb+1Em7Tpfm3goU0jAbrCp3mXOAszizzcJS6mbxFNV2DcXqCHTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728968412; c=relaxed/simple;
	bh=nMXhqh4HzokCG/i4LxOBg3hOYxhW1ngv6Tb8E8kN4Wo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eed32JvDrjNoKOuteg0sVVisMSh02CcFrJH35EgxxfVftGmA+1L5RszbUkiu5egD409+Lovpm055bEmvY9Fa6AyVvj0amO+F7EQ03Y4cjowBbEk41XHzcchfz/MgfTw6LXaSYjGrAkRJ8sQDw5yBR+jN+C90jEMUgdvJtBrIZwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=g2C4DFKy; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="g2C4DFKy"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-71e49ef3b2bso2293278b3a.2
        for <kernel-janitors@vger.kernel.org>; Mon, 14 Oct 2024 22:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1728968410; x=1729573210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UDE8ae4KGAACvTonZkpDinm//oEQtAd/MtLLCfcVh7M=;
        b=g2C4DFKyDe3l+Fzyu7zFErMJ3To8sKhu16V1BPylJQ7vw5WY4FNcCZQ2/YYYsZuCdo
         aY/6Sd04H4QxEYNKi2+PuZ4AmcHq9Y8Kd3HFnuWg+3OjeghaoOnFYOd9Q30Np7Jg54h4
         iTvf9otptP1Q+NOlBC5CgC9rE4vqh3BMAgDwqKSrWlsh6/Bk9xoBJZScKebIe8uzK17u
         pxobPNjJyvNXXU6k3/nB8/3Xx0otXeV/Ib7V3to3yOVVzMKTUe5KU0IqpBD7T/tkt15Q
         0xsUv5+WR7+nKpgr+Exv2UyS1QnYqr1ELsKLXtF6xecpWistpmXRnm7+U0wNPyUZ6BSY
         Tk8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728968410; x=1729573210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UDE8ae4KGAACvTonZkpDinm//oEQtAd/MtLLCfcVh7M=;
        b=XrjWEFNZV3HEOy4g9eU3buxw/htBQZ7xLYpX4A8YByiqOWbltwTSLjROXZ28PXyTTi
         524Rg+ZjmIROBAUGffoc1oIyEK9BCegrTwHW2GVaS3IOnBngTo+I7J/Bb29qkvAMT9Y/
         Sqs9tBvSsWXOJiTNl0Di/WgC8DHgZmpqMyAJL37kEMXvywXTHMpMVzRWXavzCwp3iNpJ
         Uv9Myo4shQlGCv7FbXPlyFzDf2qpv53Fn3JjUlAPAfAMfI6hcOiVAm0uKN2G3Se64o7X
         fg0/AwdbhJJ3tbqSG30uEFV4968uncJffmiVn0IbwaeV4ZbdueO34CCnKVsbcDThEKT/
         80nw==
X-Forwarded-Encrypted: i=1; AJvYcCXjdsHeY7GRDTg5ZEHdFe7fHhOC29+9kHUu6I9ShDPceTakpAy/PfIXtlVGDGpsGBqtBwFuFgCtMxuDzkiufaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdVK4R4+QnDKK8bLkRi6Yh+n/y/AG8gCOGi1/rnLjtH/w4d4lx
	dglcigFDxASMcyi03t9k2/DDX1eZyGFU+43n60v42zotUiKHAoY3m+spFR+ntUs=
X-Google-Smtp-Source: AGHT+IGPdj8U1y9DYvRNnq4n+Baw1Zig5U/2Z3A5zNqzr6z2E57ek3/4AKtQDKOOKtFDMh3GKw4CrQ==
X-Received: by 2002:a05:6a00:3e25:b0:71e:6489:d06 with SMTP id d2e1a72fcca58-71e6489127amr9511479b3a.0.1728968409796;
        Mon, 14 Oct 2024 22:00:09 -0700 (PDT)
Received: from localhost.localdomain ([138.199.9.153])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-7ea9c61c839sm439758a12.0.2024.10.14.22.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 22:00:09 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2][next] Bluetooth: btintel_pcie: Remove structually deadcode
Date: Mon, 14 Oct 2024 22:58:41 -0600
Message-ID: <20241015045843.20134-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The switch case statement has a default branch. Thus, the return
statement at the end of the function can never be reached.
Fix it by removing the return statement at the end of the
function.
The intel bluetooth module was successfully built after the change
without any errors.

This issue was reported by Coverity Scan.
https://scan7.scan.coverity.com/#/project-view/51525/11354?selectedIssue=1600709

Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
V1 -> V2: - Changed "Fixing" to "Fix" in the changelog
          - Added that the change was successfully built
          - Added kernel-janitors mailing list to CC
 
 drivers/bluetooth/btintel_pcie.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
index e4ae8c898dfd..660496e55276 100644
--- a/drivers/bluetooth/btintel_pcie.c
+++ b/drivers/bluetooth/btintel_pcie.c
@@ -391,7 +391,6 @@ static inline char *btintel_pcie_alivectxt_state2str(u32 alive_intr_ctxt)
 	default:
 		return "unknown";
 	}
-	return "null";
 }
 
 /* This function handles the MSI-X interrupt for gp0 cause (bit 0 in
-- 
2.43.0

