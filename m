Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFF6410D05
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Mar 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971153; cv=none; b=IrFssB/1ugHPfiawI0Q6j4loc1+x0umOPGQSq84C7ymr4MLyDh/kjEcu+LhUyb/2Smv5rt8Dj5SSuVjYeKV754K+s/sUaX4i1WYUmMrLLewV2Irvq+MFqmGPybxg91NDiEUE5TVyKS64UaNiNa1x7e/7b+d0kTB/LBqWgy4kwYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971153; c=relaxed/simple;
	bh=07COx8t2X+hjjjtUzBkzjAKo5dekCAlvLYFjCV4qPuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=EnL7g8p43UXuVeSDoIRkd8EMnKl1kM/SGsXnVZLRHIgTWHCjzaageTH2C1gJF/T3yWmNH+OMrs5++0gsszv850KJSUpEOTE45LvksbJ/2l9mcev46BvibX+liRvTv/du5KhNFWCXBbJU2BuR+wD4f/fu1R88h2Xsh82W+itctlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jf6BRFSk; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jf6BRFSk"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b93698bb57aso1202866b.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Mar 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774971134; x=1775575934; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CajCLer9zDfIuUqNg+GkOvqWEkudlgIu9Wnppv2wwk=;
        b=jf6BRFSkM5JwT48IR9f3XoHqXCrT6Ii/GhkLk3LJqRZ77Jdr8oH93IPcF5kZHT03Xg
         PgVkMFEd2wZX7k2y4dmvVYnKDevMjGsrf5uQ9ouklZ8Xn8wT/GKjSPWA8aJBlZ8tYLto
         bbYI5Awu0BlFWxFf2nS15ww/8xY9X/Iwq1eqC6JHstWs7hwHn6bflwzNG6nporoXVUr6
         2y2oJprk/tLBfMIk/ElgyELiH+HyFCt28OvGEGBjwgOCI+jJnNAirRiGxgNj4cEE5v/N
         rTp+avCZYDyLmmDGxeew/IYpvQMh/l9Bygabk7N1qKWMzPGRGaeycKqgI9GV34FqDe4J
         UFsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971134; x=1775575934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CajCLer9zDfIuUqNg+GkOvqWEkudlgIu9Wnppv2wwk=;
        b=GManvvQPo5INOSsovPUCFC+Ogrc+YBAqli5wjjAtkh/uhDb60SeXQi7oIbIRJikZ3D
         M093HMadi7SDCX3wnseQXkFycbCY/O4o7fz6osYQtLiqbGf6tXoYhaTzCWEo74xxHhdg
         u1/zBNr6+EUxIo1Oy9UYtLmZeRj9kO8drB4EXEJYdxiunK94QNPGn/WTF3i9AmGJqkUL
         1uC7LTQRWKA6aulgbADxtLpGcDz5inMbAqY8v5rG3yLnc6gB8vYcuEAgE8/cn1QCtho+
         65tLThrlEk4RaFgc8TaQ++Yz28FHNQFZkQY12RWjvjbS7hdHivLrM/uKaVxrUzBLAbNp
         ppzA==
X-Gm-Message-State: AOJu0YyRalipTSzF7I6WJg9EdqCFmmM/OdlIXf+WsoJiQ7S6BSwSuIn0
	cqe3vp5r7ntyIx53IEIqkZTRErnmxHZD1Jy3OpaFpSoKd0BWqg48+F3g
X-Gm-Gg: ATEYQzwaKjRPyZTSECsBNdVVDZCyXU76MAPuOo/pFxlMdqeKh3/iX7LQVAswcpP4Erl
	zYh8g6B+BYAn3sqbIx8wrE0E6FEj3SfK+j1Qaq1c+VFx9pqzEGAaOe8SN0ewXIoSM5O5LZa/m1C
	D1ODKzHc5IEOhqGHUNsYt226QRF5dsnysYfiAXwWYZ0Df/ZU+Dw+Glc7//vRGAYLCiGAV4MQzEi
	kYOAHLiKjQtelxgyjUJhqAPSZmvrsqLL+ENOXDgEsIIqnJm11DM4MHsON/4C3Jnvr4rVcuWLxSW
	jfIxd0bzUuaJ3lzwhLsPgW6OITZwjFxBsyKZXOtjE+vhItJ4XyrHYBcON3DwLsS56cyLxLbSsGq
	BW/QR8JAs446reFO74qTeGZSV0APkLBnsIhuHaxEBn1BQxUkb3wJMKYhosNqH7TABkRAOW5N051
	mb9D8OM6m4USfIVrWo6m/QyA==
X-Received: by 2002:a17:907:d0e:b0:b9b:132c:a590 with SMTP id a640c23a62f3a-b9be835c18cmr238854966b.4.1774971133547;
        Tue, 31 Mar 2026 08:32:13 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e472dsm419536966b.50.2026.03.31.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:32:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	linux-arm-msm@vger.kernel.org,
	linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] scsi: ufs: ufs-qcom: Fix spelling mistake "retore" -> "restore"
Date: Tue, 31 Mar 2026 16:30:49 +0100
Message-ID: <20260331153049.1344957-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a dev_err message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/ufs/host/ufs-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5a58ffef3d27..bc037db46624 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -2810,7 +2810,7 @@ static int ufs_qcom_get_rx_fom(struct ufs_hba *hba,
 	/* Restore Power Mode. */
 	ret = ufshcd_change_power_mode(hba, &old_pwr_info, UFSHCD_PMC_POLICY_FORCE);
 	if (ret) {
-		dev_err(hba->dev, "%s: Failed to retore power mode to HS-G%u: %d\n",
+		dev_err(hba->dev, "%s: Failed to restore power mode to HS-G%u: %d\n",
 			__func__, old_pwr_info.gear_tx, ret);
 		return ret;
 	}
-- 
2.53.0

