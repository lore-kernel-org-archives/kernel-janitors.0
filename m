Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWIwD9aZ"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D262D6D
	for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:38 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3316bb1303bso3475520f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 28 Nov 2023 06:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701182437; x=1701787237; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SzxEIZ1a0Bbur1zv6Y8NdUQtYhQOEvi3S02asmqf8qI=;
        b=JWIwD9aZZkbBaJM3PC2cCZ5x/2cg+A3QKgvSMCX9Td55/TVXtaEdZMXLYpCU4CijYD
         aIsOA78u0Bmp5qYLiQuuLue9jMVMRTjqLvCUnBvvMcU//v+2r5CRHid4rM/EWWb5jIWd
         BO5fmTcjVffX0hwbZU548zKVn5dsFoLIOSOgCvUQxC/Sz/KF/8XW8rzMCK4JJnmwSPIZ
         D9EJHRax5/Y1m1Tz/JHF92Gxxo/T7+xWfX4iA99QEspWSmN+rgfx4pmt5LbfPo27rlwa
         xYMS7DKPeGEmY614bUOnDb2AJ+7wVeMG2DQeJq0y7xr0CYzHzSTsxv8lmm+LDUSmWMp6
         o6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701182437; x=1701787237;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SzxEIZ1a0Bbur1zv6Y8NdUQtYhQOEvi3S02asmqf8qI=;
        b=ozt+DSfR5IUmqZjLabk9dHeBcqRPPg4D/cnvFmcimIOtUV5qxCk9J+ryxmpabF5sMv
         5goP2VA6q2I3qUmtkivuA7MO86s+7qTzRK/ZyrgK6/baTmrXi1YWvqGNeWB2XY9YlBiZ
         6mTVHutVAERSK3Ze/BPdtO2EFfgRKcrjRskYWKk/gp3XUKyN+p3QKDyKW12027/GwmTf
         C32Fh11RtpLoobkk8psQATWJ0/Ozqv7mt9C07PwpHGVoDhi7NijzjPEzZlvbhxOkU/my
         7wUbZsN1ju6Q58KAETgbBPJ5u38UFrCa51VQb/u0g+zygOL398+XnPWe1a+ji+1g24LX
         Pp1A==
X-Gm-Message-State: AOJu0YzkjlKKfmyS+wyzXTzr/cRKuxHRS33egJYBXdIywNysBcKqrFse
	6q/SYjtdkWtouDWZXpBIfZncpA==
X-Google-Smtp-Source: AGHT+IENp0SUZKfT5lEo40Q/N3qpgq/dOSWXFTJPv+Mkdvm0u5FHqyqCm4RXLe2LodVsnCvM6YUt7g==
X-Received: by 2002:a5d:4843:0:b0:332:fa75:a8ed with SMTP id n3-20020a5d4843000000b00332fa75a8edmr5644553wrs.24.1701182436798;
        Tue, 28 Nov 2023 06:40:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b00332c6a52040sm15053018wrt.100.2023.11.28.06.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 06:40:36 -0800 (PST)
Date: Tue, 28 Nov 2023 17:40:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Qu Wenruo <wqu@suse.com>
Cc: Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>,
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] btrfs: return negative -EFAULT instead of positive
Message-ID: <00bb6e21-484b-47d6-82fa-85c787d71a86@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a typo here and the '-' character was accidentally left off.

Fixes: 2dc8b96809b2 ("btrfs: allow extent buffer helpers to skip cross-page handling")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 fs/btrfs/extent_io.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index f9b47f5d7e3d..62963bc6f61b 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -4085,7 +4085,7 @@ int read_extent_buffer_to_user_nofault(const struct extent_buffer *eb,
 
 	if (eb->addr) {
 		if (copy_to_user_nofault(dstv, eb->addr + start, len))
-			ret = EFAULT;
+			ret = -EFAULT;
 		return ret;
 	}
 
-- 
2.42.0

