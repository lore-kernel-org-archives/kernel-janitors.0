Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288AC370AE4
	for <kernel-janitors@vger.kernel.org>; Mon,  8 Jun 2026 12:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780921211; cv=none; b=inzrfx/XTKRRPIVzBiM2YrDFEZ+ONEHhRHK2k7uEdCRsanue9NiG8ys3YZIQ4BsHfpIwL1gB0SEWQLS91fJj/DSOLphc2OnbiqdPK148O9KeHMo9Cfs1tEri3zyWRKbO1bYbiDciWYk0ZoGO7cg/mLNev58XMVc7gGKGz3T8KxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780921211; c=relaxed/simple;
	bh=8Oi1ZNabz6ivVcx7FnkiWY6VwxVK9IKtr28z5yyrbl8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cR350TyJhZm//bpFD9bKhbN9mqt0rkCP2r/sZu3dyrOeHx/Nq3xyJAixxKSSuaGw0g1yoJ41nLzriXqxKwWUoQYEzqgdNSoBl8TIbli5dEnKFKtACEuH9Ngz5OQIcSF77nTeV2B845zRfD4kYINRgn3rPUozbnUxB1rdlnRdJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RfniGzfb; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RfniGzfb"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490a76757e5so27158105e9.2
        for <kernel-janitors@vger.kernel.org>; Mon, 08 Jun 2026 05:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780921208; x=1781526008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ohRW9gG8lyl3LlFf2CuuLurz89yotsvIxB/I8LMv+rA=;
        b=RfniGzfbPWGcR4wgP2VeOZmMvJD+T+/K4y0UgECX4lJ+lWfqbl3OhZMjNspLPLi5u4
         opJnjrAavy0AYL7vTHRP561WaZNPOtFsThwFYBB6xQKt2V6lscOlX8otRAkHA05POIOy
         CRGJZVLnX3H6uIQBoxOemtfG2wdH4IwAeOqps3A0EpmJQPLMkXYmjinys4ekZjlDgWj3
         LjfUF9lg3hLdXmyf0JoZ4jWDver8TQp6xK78pvkHLFx4mCNpp0rXUKyYZv5+jNJlk5fV
         ANqt7+xhgn/VnLDKphCgt7bm5bYb2aNY57hFHQPTPXuepvZdGP9XQVOETqVy1jTmEqMx
         G6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780921208; x=1781526008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ohRW9gG8lyl3LlFf2CuuLurz89yotsvIxB/I8LMv+rA=;
        b=M5UuerGeYGwOIfjN8zzsCy56UZT7KH4ZuGxoQzFj15RvKs/CJUGkV8zktd/mcNnbMt
         jfu2NwHYHXrpXr1Ab6I/cLRw71b00EoCsYzuec5atOoaFJ6ct+8wkA/TBYqQiflplCtM
         cYhZF8noNMwrmVikQqZN6wa4eRpZSzFYXbHD59FIhJGotbK05d8YYbHGGtUdgXHfdPe1
         A3dIfUFeLucmPwl3+l65+zHJ7OV8ttzy2ime+rC5gsoCPjFgy8hcT3cIRDHnVO2+h/XH
         UEbePgSRq7x/hgXG9aDpuT96afJ5JwsNQP5vA5qwX7tca8QaleCrE75AxVgD8vXj94Wv
         vSkg==
X-Gm-Message-State: AOJu0Yz6bpOmGlNNI7lvp8kBsbCtZxgqT0P2n37HHBHG/FzSmbfIVMIs
	wzFtMYZnwdGi1TBqJzX3VvGnFIPbKR2+dHZNBDHtTpL6e8BKE2ZbJXrs
X-Gm-Gg: Acq92OFLAEg6Jekf82zBTJ1ar4Qp0duZu9AfT4g1vFafNnJe/B0+Y/cisv0ke6q1iyD
	SPuifMPvi8CGT8e6AM6biu4rU5eJcjkxFWGI6LhXRTS48YPRZ/pml2HUuRu9Bz1OVOykMQI0ckN
	+BUI7XeEDItPak7Ef4omb9cop+b/9fN5uIXG3FilYt0ey+cXuExsh+3W0ObhqV2U8dcM4+vYJF9
	sgPaY3mA6dhRDp7Fhakdm04u7Qrdz338Y4HL2Xj8ocVJr0n+IHvNC4xl7dslzJR8AiLOfK1Dyfe
	7BmiM5aXwXVqtIb1pilmXj0VD6kRv0J2u+EeBQQnyBpaK3CliYjBq/tl/uQxdmsPn4YcJJq3s9w
	tGHl3cW8H17IQLASKG5h9hHi6aFAL4WUVGxWwxf/+jsYSoVRPU0uuQV2n+ehrlblJ50Fc7drtMj
	3p6zSfWQ0iPs73PJ+d+qjnH5bSeKNLwSJd
X-Received: by 2002:a05:600c:5248:b0:490:c024:2ec8 with SMTP id 5b1f17b1804b1-490c2522657mr251577045e9.0.1780921208481;
        Mon, 08 Jun 2026 05:20:08 -0700 (PDT)
Received: from localhost ([87.254.0.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc23394asm386889605e9.0.2026.06.08.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 05:20:08 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Koby Elbaz <koby.elbaz@intel.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Ariel Suller <ariel.suller@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] accel/habanalabs: make read-only array edma_queues_id static const
Date: Mon,  8 Jun 2026 13:18:37 +0100
Message-ID: <20260608121838.48011-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array edma_queues_id on the stack at run
time, instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/accel/habanalabs/gaudi2/gaudi2.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/habanalabs/gaudi2/gaudi2.c b/drivers/accel/habanalabs/gaudi2/gaudi2.c
index 5d9c6f0698b7..1d4154cebcff 100644
--- a/drivers/accel/habanalabs/gaudi2/gaudi2.c
+++ b/drivers/accel/habanalabs/gaudi2/gaudi2.c
@@ -10668,10 +10668,12 @@ static int gaudi2_memset_memory_chunk_using_edma_qm(struct hl_device *hdev,
 
 static int gaudi2_memset_device_memory(struct hl_device *hdev, u64 addr, u64 size, u64 val)
 {
-	u32 edma_queues_id[] = {GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
-					GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0};
+	static const u32 edma_queues_id[] = {
+		GAUDI2_QUEUE_ID_DCORE0_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE1_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE2_EDMA_0_0,
+		GAUDI2_QUEUE_ID_DCORE3_EDMA_0_0
+	};
 	u32 chunk_size, dcore, edma_idx, sob_offset, sob_addr, comp_val,
 		old_mmubp, mmubp, num_of_pkts, busy, pkt_size, cb_len;
 	u64 comp_addr, cur_addr = addr, end_addr = addr + size;
-- 
2.53.0

