Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79671F80C3
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729020709; cv=none; b=NpHcFHrEKGVcyCzY8A7fvFL6YZZ9Zlwn34SwlK093trf98BYglw+q85HX/1HP74CSt70zPgYY7sDN8Z00tYkyRLnxx+S12JI5Sf/TFvm63SB5pXRvXkkxek9uvDS6peB6Akc1DdIm+F6975Xt26Fpd94Uyx6BsHeWKoMY+gJ/g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729020709; c=relaxed/simple;
	bh=3MPzAc5mm/Td1wN/0LfJ7lxh6mw6E65klofZVkDNSj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KFdFrhCtBxkr29lRDKcq7mJQA131urcrRUSxbXayh6uVBj1aQCDuC0DxOXozCL5ULS7XJHNcuuE2o68+wg5QA0oIF8Vqn+Sjqxv2SupW39WNRA5JbFoG5NA93Edz3dQr43FXIQS9d6Bnb4k0WJ9ePgQP9Gk/FeBLP5vRslV5jSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np; spf=pass smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=0anlkkK6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="0anlkkK6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-207115e3056so47530545ad.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 12:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1729020707; x=1729625507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=paWX0vjIceTNHtj5M3qpnChYLs9Zim+rhn02WroKkm4=;
        b=0anlkkK6UWUBOpVcjh8ziyb4NXmWm35Wqc9wUT9f81ug1Jec7rgj4OmsC1bAx1j26K
         yuADvMdRutwEt6zx8hdm50Mqv5Kdj7iQmUn1hCILaBbjd5+QJ34R9BckrR1VamEbVE5i
         nbmtMiNbl0VYm1u2E2BJmFF9ea6n0TOWzZkRjrNTWUDKmayOj2PQQG4tBQYxUZrUx2lt
         ppP8vvL8yAtPp3pCg+4eKw+9FPEnQS8wiAwrJowiTDuD3geYnJ22eFzr92dFfRMI/6Bc
         uZJYqPcxi89A7Hb4xuGyfUkTH/ynoXE2enryUyoyqCj1QHmR+gYPG431NDOjCCTarQtk
         6JXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729020707; x=1729625507;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paWX0vjIceTNHtj5M3qpnChYLs9Zim+rhn02WroKkm4=;
        b=CzLjx+rR+0Zsp4j7YcQAPtC41OLy63o5PGQFV/9RpJCYyZK50hvWtK+sA6dx9IPPrN
         kP70oixZjnE3OeOuDwCtmlEi55rSy/yFER0CkiPP4EKB4i6gq6sqbJkO8rfuXFjYP/vZ
         iFtTag15OTfKXeXVoSIqk1lYyZYUBMgODx3UVt/BjiW+sj3pBM/PZQWCFSPmYQ0x8fm9
         DvoHA22uwZHW+a0X6BWI5aLky9/UiMYDCElFO4iyffeaXSw3ybhoHcBEmDEkO2JBgI9E
         vkPE/QsZaNT06F0TBBqkJCpnHuLd0SP/sLdwUug7p5owK0En2tEH6c4DfP8bJ0QltHtC
         5YAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs4HdsJeRv/W8j3S/12ahG22LV96Rk1gxZtIFhgPQsF9euMjJxVUIfXQXQ+gEtVxd6rxofPX0sKhe050+FrpE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9ZOPRb3hPxauRBVxENI+YH734UFRY/joOeP9OeWekQaOPgQh3
	LBYEH2Cp2eEKC1f+1bV1zRNO5EI3d/WHYtwYrpkLYj0pwNBa/ywkacb6a+2aL9o=
X-Google-Smtp-Source: AGHT+IHtLTfDwQo39Vgb1mIVfVhDjaIFxsNNkqLBR7YB7rOsqgXVh2R0uxlTOXo63nSKZ/Yc5F25Xw==
X-Received: by 2002:a17:903:244b:b0:20c:eb89:4881 with SMTP id d9443c01a7336-20d27f1cbc0mr17589345ad.37.1729020706961;
        Tue, 15 Oct 2024 12:31:46 -0700 (PDT)
Received: from localhost.localdomain ([81.17.122.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-20d17f84e22sm15472335ad.52.2024.10.15.12.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 12:31:46 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	skhan@linuxfoundation.org,
	kernel-janitors@vger.kernel.org,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V3][next] Bluetooth: btintel_pcie: Remove structually deadcode
Date: Tue, 15 Oct 2024 13:30:12 -0600
Message-ID: <20241015193013.16790-1-everestkc@everestkc.com.np>
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

This issue was reported by Coverity Scan.

Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
V2 -> V3: - Removed that the change was successfully built
	  - Removed the link to Coverity Scan report
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

