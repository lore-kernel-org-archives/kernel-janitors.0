Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F66533A014
	for <kernel-janitors@vger.kernel.org>; Thu, 29 Jan 2026 16:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703138; cv=none; b=Ssm2eCRtWXJplZuwqYX6bEngPy3wnGckGaqr6EXsZztkNg+syHCBqk7NyE/EKKTq+XkmL5Fda6Wi6+PfvsPlqfA2g8YGb+QPaBOuS4Q0t3wV7dWANRqgdVZ4I3tMD/QDw/VbBG513iN9SptaK6EspCuc6mCjxq7PWVhygodkDec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703138; c=relaxed/simple;
	bh=QH40RDUeKpt5r31k8MiwmTN5CwlPV8u/qUOIpL2Opbg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gVu5yie2bX6AXxi81vhFzcy46y/ZsyrAlcb/Zh9q8RAmJXIiXvbrBSkGRHXZxhABxZ4QKjTXiKzjsFxiCuE6azSUxku9h/epsEdJwa/vjcMV6hFZTyds/k7T92MlfH8lfO6hq2Yhtm6btSpIkx2474r1A+oaw2rriA328/NawsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z65dhBKU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z65dhBKU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee0291921so10739425e9.3
        for <kernel-janitors@vger.kernel.org>; Thu, 29 Jan 2026 08:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769703134; x=1770307934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T54lN/2f0AojvVlsbKqfRuQ4ek75UA0m33GBdVgd0ok=;
        b=Z65dhBKUzNVABn3Igv4BWuFO18tBdX0zmxYXh1e39vbcGoOmGxwxVRAzlGcR40tHYE
         6tnZNGL0vNi6zmpsOPZvluipCkNnhxm+OZ5ENE7iaz74hhPZMTD/dIJyB0NRbli0RwNr
         vFk3hR89Zh+4nmJRGwGJXcI4vqfQZRL95fHFs4uQxakoRQ86UAZ6w2FkQKttk+10ibSR
         GZ9rpCl5vPICWmdT7eSmddl4NvHSz5XKU/RXCYTAh+C4xD2eIJQFUBzF/S9bK/A/IXHb
         8LEoWPXxbGjimYczI+afArCGYtuZPoRqD9hO7gCTjMgTPbatVz/hxJbP919/oR7FfaNK
         GbAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703134; x=1770307934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T54lN/2f0AojvVlsbKqfRuQ4ek75UA0m33GBdVgd0ok=;
        b=ig0KuSXYRsXYpDhuXeveyG4qPwiWSoy9JnXgnHxUYeoqmH7LtOKx1zgsgLQarXP4CN
         kZC2A5yutFATqPqamTTKgPzCCPIW3Lfekust7UZGUAMCIEbno3uEuFeH3MGBHJ0KzUmE
         DynhGkA4yPvZxBsEN4FAEjftevm6P/84kQ+c4u93t+15lbWn7zOX53OkBaJpjuVQ8i+X
         D1OCxyp+abKP+06NGT/QHhu5thQ9SRVEnh9lRvT7O7zUftY5wxswtj46ikNgs3bULY4W
         W8O5EdpNfButuIMc9EsF5qq6ifI7yn1hTXgChXcDSjyQrIl2Z2SqDj+NoyENeA6kVxAs
         LkLw==
X-Gm-Message-State: AOJu0Ywkkfi2iMXGsaZTnGXO17kgmqvD6aCpEZBiXaRjhaV/6kWPmeJB
	Qy3BZ0fr3g2Q0Oc/oV+b53N2xxMuioG89o3HPEwDptW1q7UWPCEtfo5h
X-Gm-Gg: AZuq6aItw414PUPM0D/bhS30E4H5k8nDhfNg5G7ksyieZtFZkqd8Ghm3dsmvlFOtFSy
	M+D2ZtYiIFCk/No+PzG8qpbZvmEm3woUcP+52OJFG2LkSydYJRMC7qko3sP861O8CvXfFgDZ4Ih
	MJ4ou0OpP0L8s4sBC7upZMsaVHyh6KLeiV49eyCHeR39yueSC3Whax66hhQYDI6WwjPKrx3AKS5
	ULCW0RWROY+3hhDI6hmRLtIOVXmlCQbXUtfzEuQbNRqaENI2LuOhtDqltBiJG24Us6qtToMxd+8
	+3pWdqIrxdh64AhRZkcmMZCF6cdYIsAAqjBkqbez4l+rAWj/XhltLJ0+eVqUoO4rh9UyhsPQuNE
	WnzoSTIpydQFZVRbHMOBfJ7KczIqpoxIsQn5/nrUHnbov/FhBsfkwacDDOQ80hwvZLUkaDIsM9P
	JL6R7QiwbhrA==
X-Received: by 2002:a05:600c:530c:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-48069ca23e3mr129097865e9.31.1769703133577;
        Thu, 29 Jan 2026 08:12:13 -0800 (PST)
Received: from localhost ([87.254.0.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-481a5dc8d41sm11135e9.13.2026.01.29.08.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:12:13 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove redundant check on status
Date: Thu, 29 Jan 2026 16:10:58 +0000
Message-ID: <20260129161058.197372-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The check on status can be removed because all previous
assignments on status are followed by a goto statement that
bypasses the status check. This minor issue was detected with
Coverity Scan static analysis. Remove the redundant check and
some empty lines.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 884fcce50d9c..606fc6726155 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1265,19 +1265,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	else
 		pstat->flags &= ~WLAN_STA_SHORT_PREAMBLE;
 
-
-
-	if (status != WLAN_STATUS_SUCCESS)
-		goto OnAssocReqFail;
-
 	/* TODO: identify_proprietary_vendor_ie(); */
 	/*  Realtek proprietary IE */
 	/*  identify if this is Broadcom sta */
 	/*  identify if this is ralink sta */
 	/*  Customer proprietary IE */
 
-
-
 	/* get a unique AID */
 	if (pstat->aid == 0) {
 		for (pstat->aid = 1; pstat->aid <= NUM_STA; pstat->aid++)
-- 
2.51.0

