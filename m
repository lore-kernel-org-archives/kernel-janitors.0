Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583F92DA771
	for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 22:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766181604; cv=none; b=FqeImrm9QScniyJmBMWc9G8kyS01AuKs01Uk26MUvulcz1bwKiTi7hr/mZoAtjtaAIFNp/kUcg3pyVdLg+nHJ5TdNC53nRPYPTkiB9j3i3BUalAJFssIXsz09+bnGEq/rzfTmBmjdq/cmIECrd/IsM8OVd/MpJGUbuGTs27dEY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766181604; c=relaxed/simple;
	bh=p5ZBx2fO8dMf8JhJxD/15gLwQL2iG+/xA9SMwVPva7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GA9xbRTdiEk6rP8HhQIQQoOfJNIoIx3gRwJR4dTl5oP0n2pGh7Oq+X68Qgp6MFIowMM5pPoHtxHn6W4eSuLXG+y8LKZRDez5uCgi8gUPWNyOSi5OrkJOkKz6ukBBjgWkIR7WuwWa83Sqts6NmR/zltRJDY1xMoPA+VpYMTgiihs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSV1GRxN; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSV1GRxN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42e2e628f8aso964030f8f.1
        for <kernel-janitors@vger.kernel.org>; Fri, 19 Dec 2025 14:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766181600; x=1766786400; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bz/5KtDyRfV7d2ZpZVgNC/lWm9kf2lu1z7gPSFjPPXQ=;
        b=LSV1GRxNdXYYzhgcVUJ8xdY/gZSC1wgszBeyrBz6TDvJ3D9edX8S6DrczgLmK6LdSX
         7RvDwSC4IcFKzDER/N7P6MLG/KI/K5fVMEQ2/nQRwmAn1XlBZW8ZRGK5rWPiM5QqTPig
         5HvVEWd13hDdWb8cQfSUPccXAji6FioQe4xePSZARTcvss5vTmHFth3YJMj0nrTuGwLy
         N6MqoK/K9mPwrbRYCmN70xf2dLD1CCr6D0zgemFL+GPEAg4o61mJfKMeHZb+QnvpkafT
         3RfrWTj+KUmF0Gu36d0liQArJhcztxg1YhmF7WnyJI56rXfJvqwoVdjGL1tB0uOBxExh
         c3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766181600; x=1766786400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bz/5KtDyRfV7d2ZpZVgNC/lWm9kf2lu1z7gPSFjPPXQ=;
        b=TqFf+8LYweK1BxdrIPgSktlOOKQTN/yuleK2OcbZIQPf41gNseMG4gX33m4idI4gFq
         bhqOe2l3PRAH6i2KIOrptV4dyj4E1UxN9SaCwsP6oMv0mxOcQOOqsbl7AXUlprgoGAr8
         AayvxMWKFM3+ZLSjJliR3kAJiVnKSR2PshG5XfJhFtqS4jp77KRMJEgfsHnX/7EGwaGR
         StwQfJIur8dRvdXiQdULVhQVpBot1mp7YYu/YVvnM6a58h4zzseqyo2hsjLu+wYsls0/
         /m6j+BVuVTa/kpUruPaGIM3JwyE+3+ruNZfhggW/xRpMqhOQDGILH2j0hnrJkpoqljhj
         58cQ==
X-Gm-Message-State: AOJu0YwZWYbpO7d14b5Lyth62YTkCLYuuJ62R1bv+OBgSGHkVquzpMzt
	psE2wf9IUu3XnCb7dgUZGyKowOEPSeR/3D8cHNOG+12e1dEeCWJ2Trfn
X-Gm-Gg: AY/fxX4sLmHuGv7KMsf/gaoiCVTriAQ/DmZxvcLC5JU5BMYW358neIYmz7323r/CUJ0
	W0dUMBh1HPe0HsnEcALredBa1OetjJ7JGGOb/QBmbmUQUhs4exHzwgIu+YgUkbpbflSUfbve473
	gVUMlgZWXh0IhI/74K9QZHhwmTURaHabmIg5pMPUSPudKbEF4j9PvTHd1jcV+AXX7e5e2E8yJ3d
	032EF9B61ef5TDn5OrsccYbJVjGOhutZZnmnpHgJxtlmhzxg37fhWVfF7AizQR9magQVSf9Etln
	x5jkJES9FlrW6gTQRR2BOh7eshPiXIM/XPsoHGljdSrLObC92zyChtUklHCwm0fYcW8M9Gzse7J
	jxAVLS6UqayhK+b/BG8+xzp76K4KOJdraTPiVczhm1jn9b3J4VluhNHO8fLF2aqU8e0pCqQstf9
	kfzHTOpNWMQpfXx1IgXFWD
X-Google-Smtp-Source: AGHT+IHa4QBBFGtyb79vsIJvGHrCndRLRO0iu/waUiiuJ/ecEaNRWqeL9eRxWmgxsvmevKs3pD56mw==
X-Received: by 2002:a05:6000:1ca:b0:431:7a0:dbc2 with SMTP id ffacd0b85a97d-4324e5035dcmr3998214f8f.31.1766181599315;
        Fri, 19 Dec 2025 13:59:59 -0800 (PST)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea82fddsm7154835f8f.25.2025.12.19.13.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 13:59:59 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Hanjun Guo <guohanjun@huawei.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ACPI: APEI: EINJ: make read-only array non_mmio_desc static const
Date: Fri, 19 Dec 2025 21:59:00 +0000
Message-ID: <20251219215900.494211-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array non_mmio_desc on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/acpi/apei/einj-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/apei/einj-core.c b/drivers/acpi/apei/einj-core.c
index 305c240a303f..f5bfdffe1e43 100644
--- a/drivers/acpi/apei/einj-core.c
+++ b/drivers/acpi/apei/einj-core.c
@@ -679,7 +679,7 @@ static bool is_allowed_range(u64 base_addr, u64 size)
 	 * region intersects with known resource. So do an allow list check for
 	 * IORES_DESCs that definitely or most likely not MMIO.
 	 */
-	int non_mmio_desc[] = {
+	static const int non_mmio_desc[] = {
 		IORES_DESC_CRASH_KERNEL,
 		IORES_DESC_ACPI_TABLES,
 		IORES_DESC_ACPI_NV_STORAGE,
-- 
2.51.0

