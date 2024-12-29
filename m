Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89141208AD;
	Sun, 29 Dec 2024 06:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735454408; cv=none; b=WKZ3FoTmWjJCMMV6xXxDTe7iMc4iN5wqsFDEFSCFXBb6P6SPTKgVK0hG6VDWfj9LhoC8BxDQBnAmhvI9JJqrJkB+Mtp0C+Y0t9icW9jyXPxaSA7gMQHI9Xkk6aWaOQmnK371otcsotDWtM/pyQ+1PktxPtEp9+EDSqlccqt3BWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735454408; c=relaxed/simple;
	bh=lWrr23FGGEH+BSZ5R0/lFrLpPLyketsMIiBJrvdnNAo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s7oJjsBcCrDfV/x5TKHjceJnCSTLFNll3jvEONukTRxX5GyMaqqsNgz+j8+2gA9KgM9Z7zWqWyPeolF4eujLjtlzIPT8QSjWTL4icPzVd6Vm8f/aHG7bMsz76M+XYC1GL5cF0GAk6/ocIlyQkn1JdqJ7OEM0l5NjGHTccgJwS2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FRpuQCSb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FRpuQCSb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21654fdd5daso99348445ad.1;
        Sat, 28 Dec 2024 22:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735454406; x=1736059206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7sjL3tMQpPKs7kVWK7kRAWcSXHsD7fTFbrTvdXfa6UU=;
        b=FRpuQCSb9GqXtErbuXxQ7OKQiEUT8wLnWRcHU7xnKMkp7IR3oLl4K3Z2/RLqMS6f06
         otzPS2ulliBP5fNqjukqfcy7cC/pndl0JQwp5zVZfzGNNVgJ2olpLRWi4ZyCbpwOgEun
         A9jA6Te42radYNoqDdnGqDhapi6w48k1Y4fEA42crnWIZ8mol2ahGS44cGV/i7r3CHA7
         jMT/FS3fiF4cqdTGXQ1nxs0u8Zco0aeXHVn2l8MjC8oiG1r/+Mj7iJ7t22LGzJQMLE1M
         0CaRkM/OktTsABN8XFVpEDblFDIn3yQKS/l1riL36Hiy321ornQHMjh5So8+JGm9F6jw
         ee5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735454406; x=1736059206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7sjL3tMQpPKs7kVWK7kRAWcSXHsD7fTFbrTvdXfa6UU=;
        b=eHiZMxicKZ/BtGNnI2RSN7rJI/avOnPCJnxUdgOhXILB2p/czBRB4pPOWIWqfEkOjp
         nf5iQDPlbdtKLRzGG17RKDGOkIyN3aXPimb5PzMV231Tg19KalnpOt1JNDOzFN0btL87
         5x8hJmg9gboVHR6dr65LF7Ft9gyvDWFkHxlQQQ7PH0NO5ChuRh53HXqeGHld17JIbV0L
         C/MEwofCBnjDKTc5Cw0nbAJdOsuvGzZwubPPIbjHAwbN8gXoBJIr0EvZaDiewDj0ZyHf
         dI26pp/6BwZYuaFAraYBpuFkYT/NjT9aASgtZ9vB4GCT5RKsH23e5akdrJZvglYXua40
         8jnQ==
X-Forwarded-Encrypted: i=1; AJvYcCULxsFVQvk0GH2C5N760mAJNcqPiFMVbc5E94C8kUhmFNrGaospCI4LQK14+ebNm9s7s13ofh+Oq4r4XFGlRzU=@vger.kernel.org, AJvYcCVEyBBKBsWH8s58bkOmnbyHWbESggAsU1BSPVXy5nYovFcUNv7RR9/bqpB5P2CBHzdD1fKbdbdC7l/Ltigi@vger.kernel.org
X-Gm-Message-State: AOJu0YxpnsJeA0IVfhX3Uof4vLmhv7iBSqYiNmR+7ig0S8kVS7Jr3b87
	SnXn7o1M4sl++1+gTLKyojwshVz1oZ+dKAg8vyhZqRA1gzPsSwuL
X-Gm-Gg: ASbGnctVXqM6o0VRvt9onUtvPku7vw/nPsXMukyZO7NkheNl+uTohzhcT8GQrSfnG4F
	ndG8iX77WedduCjjtXYoE1jXoKK5FdjyjLaATuGg4EMQ/QukGCnvHKLFXS2/QAn1lCHXDhSzXpj
	q9hb9wxeu3rZjdHNT0X2ytUz8yp1UdXZSgAj03GyUIrSWp/8OvyuN5SlDJ5UPtix1gT/RW/15Cd
	5aILBhUXzqIh4RhTxDDvnibDBDQ1yqOo5yOtlJ9XJdTvx+tHpcx
X-Google-Smtp-Source: AGHT+IGkDUpl4eqzTvDw5PObJToTwrtJwD3A0wNk5+svd3doxM/Xm1bHQdfSr/E1suBt61gbnb5rpA==
X-Received: by 2002:a05:6a20:12d5:b0:1e0:dc7b:4ee9 with SMTP id adf61e73a8af0-1e5e0445d5emr59065912637.8.1735454405837;
        Sat, 28 Dec 2024 22:40:05 -0800 (PST)
Received: from localhost.localdomain ([45.115.0.249])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-842b17273dasm15722872a12.19.2024.12.28.22.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Dec 2024 22:40:05 -0800 (PST)
From: Tanya Agarwal <tanyaagarwal25699@gmail.com>
X-Google-Original-From: Tanya Agarwal <tanyaagarwal25699@gmail.com
To: haren@us.ibm.com
Cc: Markus.Elfring@web.de,
	kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	anupnewsmail@gmail.com,
	tanyaagarwal25699@gmail.com
Subject: [PATCH V2] lib: Fix return check in 842_compress.c
Date: Sun, 29 Dec 2024 12:09:45 +0530
Message-Id: <20241229063944.2252-1-tanyaagarwal25699@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tanya Agarwal <tanyaagarwal25699@gmail.com>

Improve error handling in sw842_compress() for add_repeat_template().
Note that this error case is already properly handled later in other
add_repeat_template() function calls.

CID 1309755: (#1 of 1): Unused value (UNUSED_VALUE)
returned_value: Assigning value from add_repeat_template(p, repeat_count)
to ret here, but that stored value is overwritten before it can be used.

Coverity Link:
https://scan5.scan.coverity.com/#/project-view/63683/10063?selectedIssue=1309755

Fixes: 2da572c959dd ("lib: add software 842 compression/decompression")
Signed-off-by: Tanya Agarwal <tanyaagarwal25699@gmail.com>
---
Changes in V2:
- Updated commit msg
- Link to V1: https://lore.kernel.org/all/20241228074246.3572-1-tanyaagarwal25699@gmail.com
---
 lib/842/842_compress.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/842/842_compress.c b/lib/842/842_compress.c
index c02baa4168e1..055356508d97 100644
--- a/lib/842/842_compress.c
+++ b/lib/842/842_compress.c
@@ -532,6 +532,8 @@ int sw842_compress(const u8 *in, unsigned int ilen,
 		}
 		if (repeat_count) {
 			ret = add_repeat_template(p, repeat_count);
+			if (ret)
+				return ret;
 			repeat_count = 0;
 			if (next == last) /* reached max repeat bits */
 				goto repeat;
-- 
2.39.5

