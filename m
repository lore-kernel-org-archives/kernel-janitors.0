Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF99423394C
	for <kernel-janitors@vger.kernel.org>; Wed, 20 May 2026 06:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779256831; cv=none; b=Pw9CI4zx9NKJWHV8KJ7d46ku04s15ml8ua+9sm4FO3hAu7EZ781Alv+F58sCunj7+O3nHcipP4/SdEnRImRVIeCFnYBwWqR7DME+Q+HjomTsTBEz30yorc4qsSex2snYF6cdYv/ea4nbHwQ8+pZiurWtb7SK+fCqN0pdqU9ebpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779256831; c=relaxed/simple;
	bh=ehA4ttutELSmlyGVel+w9zKQl/Ae6wxB/zvQoA5zHg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iY5nkcYxG1WQqFsOx0pJkiYyrr9YYJ6VQaySMR2ycljumE0cB5kcUIeZCUqS3RnrUxJ+23QgE0FMOKvX52eSJkC+yvEkxOaTZRBOgqm9etH6Ye7ro/R4dQEg0eSUZ03W9DuYt55kh+wLFyEPkLgQmlhI5g9EhvNNzjExOVbGUf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RO1eSLOM; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RO1eSLOM"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-44e1860558fso2690855f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 19 May 2026 23:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779256827; x=1779861627; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S4BraLHhw1khrduXE2WhX+9/5GdBOzVf9xcCtOVB8Kk=;
        b=RO1eSLOMCxZFQ+rXdpPPfUaLJCdpMx53y+G14zsebdyPXPwwQSk+ubATRtxsCjsf4o
         b+F93p/cWGn/vMf1HYrz93ieF8+w3Mc+8+dMBSzzmwEC/213KamKaGDo6baui0M5MHAo
         G7nnlDYnf0stqDOkKCoJqPzVoq4g/hFk4pYonhDj5bA73YLF7fZqODJOnFzn2Gx+1lUS
         KXI7rqQzIyu7c9QON+7vbot0/vuD6QEcQ69zReb7MawT1+eg4RORoArY6xWxkIvyk01W
         64s8qieO4l44aRzhJ3F/VSvoIQZ5mjmWeYmTkhtLPp+KFGBctYgpTYwavyt6KQwAOyAZ
         zUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779256827; x=1779861627;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S4BraLHhw1khrduXE2WhX+9/5GdBOzVf9xcCtOVB8Kk=;
        b=qxkl9PP7vk36drKd8sK2at/4Ce02x68Yh5dLMHJ7eUrmN1r1KY8dj3Me+5oKkXG4qU
         w3Mbg5c0+CksdvkDiHhED4lMorGnODdyBYElXNhZzDgFAASsHFptO1uAXjAxH7gXVEZ2
         LIpcwWQdXPtJoaHvIR6fru2H5VnQxrkNhxf1+mX2IACWq967xud0+Il5nXQY5cdwcMgU
         9UKdfiHL8Q/7WjUn9NvnJPPwEtqZfb00Datkeif3/A1xmEcEgpQGqVyC8r3hSMdv3QJS
         AzuYGiUR/8e7pLo7SdNmXveTmLAOrl04Qt/fms2t0Hp0fpzcHQFGIxINhhmTZi/3+2w5
         gEsw==
X-Forwarded-Encrypted: i=1; AFNElJ82p8EFEYEOwUNH2jla1Vty6FK56HjcTUWV60kuG7MH+pIQRcDQdXQR1kZ4JKLGK9eroBNrPDrW/2d37BD0PM4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEWF6SU2bdLvq/foPyYZy/UlQH1eBAg8KzB79Zx6g7ZcO5gpMh
	nwelo6lm9vtFVFchh32uSQ2Ga3ecGWO2zE9tqHmw6BJlgl20vLNd0NfN
X-Gm-Gg: Acq92OFxqcALyH2Eusnb65/iuRcdHKHafGgChaBJKsNRtsQfBUXaMEsqrgMhMsZu94a
	Gt6PTzls4AnZx62I/GqA/fY8Zp3BPPen1Ew4PfAxBEkTI1snnVtNBwaCPxnfcqoDiX3iJiI6B5G
	Kd+o0xUrlDyNBb3rUe4NPVXmbmYe2Sb4Mpthhbd/opKysFkl/YkatQF775hkVEKYZFtUHOUmMA0
	zPvLmZJLRUK5RJsSSffhKR1/oXYJu9QxyC7nOk0emV03mBPnKp6AywMNeumPVeIgJfXuPcvNRXW
	6PLL1FCtWq+smF0PuGbZszVRgRFc2vinyJiyrCeN+lmIU9F5svmEDgD7PV/DFJOQySpnkI85pD/
	IUaDa+/QGmDJ3dVblg+LcnDTq50+Hr7FmeftM/CIlpgYP7YMvBymwp4OTkfkRpieOcmYxvhn1BS
	m+oXNddQn54FFtIkBuBNopZyI=
X-Received: by 2002:a05:6000:4205:b0:44f:9b70:2996 with SMTP id ffacd0b85a97d-45e5c5bfba8mr35320532f8f.21.1779256827186;
        Tue, 19 May 2026 23:00:27 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a562dsm52007643f8f.33.2026.05.19.23.00.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 23:00:26 -0700 (PDT)
Date: Wed, 20 May 2026 09:00:23 +0300
From: Dan Carpenter <error27@gmail.com>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] iommu/vsi: Use list_for_each_entry()
Message-ID: <ag1N99H-xnmSh-hc@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Smatch complains about the NULL check on "iommu" because list_entry()
can't be NULL.  Clean up this code by using list_for_each_entry().

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Untested, but it compiled on the first try (no typos!)

 drivers/iommu/vsi-iommu.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/vsi-iommu.c b/drivers/iommu/vsi-iommu.c
index 5d0721bd2c7a..9954ed414526 100644
--- a/drivers/iommu/vsi-iommu.c
+++ b/drivers/iommu/vsi-iommu.c
@@ -366,15 +366,9 @@ static int vsi_iommu_map_iova(struct vsi_iommu_domain *vsi_domain, u32 *pte_addr
 static void vsi_iommu_flush_tlb(struct iommu_domain *domain)
 {
 	struct vsi_iommu_domain *vsi_domain = to_vsi_domain(domain);
-	struct list_head *pos;
-
-	list_for_each(pos, &vsi_domain->iommus) {
-		struct vsi_iommu *iommu;
-
-		iommu = list_entry(pos, struct vsi_iommu, node);
-		if (!iommu)
-			continue;
+	struct vsi_iommu *iommu;
 
+	list_for_each_entry(iommu, &vsi_domain->iommus, node) {
 		if (pm_runtime_get(iommu->dev) < 0)
 			continue;
 
-- 
2.53.0

