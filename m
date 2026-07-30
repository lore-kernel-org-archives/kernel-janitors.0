Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DBA3D1702
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Jul 2026 22:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785450706; cv=none; b=EeEkJO3X14ONM209BwcSDiFhd/2PX+bv/jEtAy7BO1p4CGUiXXiYSKnjBN8YKvnA58QBBIa39TJ4Do3l78SI6OCNrThYO8hb4W0dnuteDYsxcvbn79M8P8duCOK3ncXcWDzanvcqwT3HtPzsukKZCkbd/Cs5j0oE/qOipaRzUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785450706; c=relaxed/simple;
	bh=ORt3zsmR4no2vhvSyjiTQsOa7Q0wCrn/yruJ1guQpeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nVkqmNaX/EmUUvJtFo9lCSdDx5xx6yGyc9YxZDrEdPdkXmYit34Lu780LqQvAi10Xm1KwJC+bIP9eRZKFnxbfv6MCEYSiXZ/vpjXElg5w/Ii1ACsBuiW2UGmAP6NemgY0egjP1iFQ4/dVqbFhd956vt2eOnIsvIgMP++LQOthN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1K6AIt2; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1K6AIt2"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f64ca1c2dso46671f8f.2
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Jul 2026 15:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785450703; x=1786055503; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PlKOnAY10vVaTbHY589tMDEBcYBV0lZutRarK9tzuxA=;
        b=i1K6AIt2oGQK1C/1ULu/lCC2bOkU94JwP7UtXA+NAjdK/PRRW5NekSZXbLT3eWsh7H
         Js42zXn2inUbJdyAv9d0M+QC3zHbp9YX4DeOhg0KWFkWS+/UpSjai0Yu/Krc2RRqLHbv
         9rjPaErrRTuWC8cEBGa0q9NHYFM4MaATtlCyyuegv+s01pcr4U2j39eVnRSl32THE1Yc
         675gabmzwMKIDSvWFGd345fJ/WB/pvNtIOQH0shU6jF/8LRJd+Rr2z2vtfxmuXWeKycj
         enSf7zp5AeGLgAh/9hvAOcj/4Ip4YdtAinxh0M5Y0Cm69wEyUUCl9QF0jGGOlMu7zQrg
         bvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785450703; x=1786055503;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PlKOnAY10vVaTbHY589tMDEBcYBV0lZutRarK9tzuxA=;
        b=TfJngvC8Tm36SmQ/vexpm7mDSD+En3QoVSyQ5RRbK04vSFDCb0u0D9d6nXOYiHGqxK
         h9VjJI8ASVzTSVZyHef5FJWX4Z4ZpTftid8dJL0D8rDqa/Wtk3TZXbh8zwflNW3GS5BS
         +HqL3+urFFTczApgQ+zOLCeakZn9SfQXuyCTehWHv3TiWJRYxk8ZhiGepcF6mmJEesFy
         5GNsmvf/YOhQzrE1+DSir+cz0aQouvP7iNdaH43xAr/VKR4e+nWX3yFwQFej9K5mtiAX
         6zQa2sRQ15fXKUv2WGj8t2K7atbv34xiOthUoAa4sUKV3Wetf9SeNpyAm/JO+Fk6BdTX
         4WCA==
X-Gm-Message-State: AOJu0YwQF9eDwNrAyOggxapf9gTx55S00lwlRW4lmXx8IANkzwQMZfpk
	MOZ1TROobtKsoghMnKNYLzd/xiEtSk+G8jD0RT4MFrGaMxrvPDkvCmemOTqTNbtEZck=
X-Gm-Gg: AR+sD135vb2TjdE20RFnqZ9pESWRpngtrSn+isDydgnD/dmcyUbZHzW3TOIJSgDnBRF
	YsnByuZRNkoXzeE0bxLQFOLMvHB7GMwmRPX+oZGMMh9qZAeSoA3CQZgzWWUgNMwnijOQhgSLSBM
	LzU4/9gCFdnhX3kksZtV6c8ld2fWAtBwUelf6OtyZFQi2dFdmSxgUj1vFhCXQJWg8EdsSKT7d1A
	UqrVPdR3ztVVmVdNIeqph9fmVP7b2k/mxiyDCHtsQhNT2bJyOF+hhFSdm0bllpYojLtQCRWTIAD
	/k1Mat2qE5mqJZvQEVRWpFRicsBffcUE9NiNV0pkPAS7yrfsw7y4dGow4a/vPWz7gUugS/oCPsm
	u6tX50xP/alT7Z4LwMQP+ziGu91e6V0nm4k28gr7KaVVJkgS1IrDt80nWmo7N1iNTrBitW0NfOX
	EfANuqWl9xGcTsFAysqbvC0WiUF4hZOpcEzDOc7ZPmZIYBATey18acuQc68Gg=
X-Received: by 2002:a05:600c:1f90:b0:497:fecd:5b00 with SMTP id 5b1f17b1804b1-49800e74e48mr58540825e9.9.1785450703407;
        Thu, 30 Jul 2026 15:31:43 -0700 (PDT)
Received: from localhost ([5.83.201.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800f1a7f7sm110882175e9.5.2026.07.30.15.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 15:31:42 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ibmvfc: Fix spelling mistake "Deleteing" -> "Deleting"
Date: Thu, 30 Jul 2026 23:29:51 +0100
Message-ID: <20260730222951.352872-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a tgt_dbg message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/scsi/ibmvscsi/ibmvfc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ibmvscsi/ibmvfc-core.c b/drivers/scsi/ibmvscsi/ibmvfc-core.c
index dfa231b6cc47..93b9f699c2e5 100644
--- a/drivers/scsi/ibmvscsi/ibmvfc-core.c
+++ b/drivers/scsi/ibmvscsi/ibmvfc-core.c
@@ -6141,7 +6141,7 @@ static void ibmvfc_do_work(struct ibmvfc_host *vhost)
 
 		list_for_each_entry(tgt, &vhost->nvme_scrqs.targets, queue) {
 			if (tgt->action == IBMVFC_TGT_ACTION_DEL_RPORT) {
-				tgt_dbg(tgt, "Deleteing NVMe rport\n");
+				tgt_dbg(tgt, "Deleting NVMe rport\n");
 				nvme_rport = tgt->nvme_remote_port;
 				list_del(&tgt->queue);
 				ibmvfc_set_tgt_action(tgt, IBMVFC_TGT_ACTION_DELETED_RPORT);
-- 
2.53.0

