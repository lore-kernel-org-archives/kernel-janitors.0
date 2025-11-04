Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB371DB13A
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Nov 2025 14:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762266770; cv=none; b=Vipa5BHpRXTELC8z9xncM7XLSIMzTtzdTc82UE3o/LxYmolTbK4APKrMcIs8qVyzzrmy2gZCgd5Z8y8+OLahm3YIP8ph77f7vupxzYYwCEBGVOdAZ7bP2H0A+r8hCsmGJUwZWrcT/E5k+JXjTUlwzGFNVQmXzkSA51RXiCmCBzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762266770; c=relaxed/simple;
	bh=s6xj00J7/R8m5+mYh3Y2P/mCOquMh6MbMiGoIlq9A+g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Buy25P7/XEelgB16NF2fmDVcw7FFrIDJZhhioKZHwaGZSF3H8btR4iyueTTORi9D+U8Kxdgc4pEA0SsHPyWeZCEmlvwSDVM4yzkHZYkxOOZKfXVV4TeUv2wt4URE0qpKMbpR4FV+h1SZH+w4i30AWqdFSa6MPYrKSTIiY/mROAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E4K0r7+T; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=EawEAxwh; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E4K0r7+T";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="EawEAxwh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762266766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
	b=E4K0r7+T/2twvEYYoHvtm0NjLz1hq1Izw47UqVfiNJFkcJuX6xjdbyX9yeg+TExx6Vd0hd
	QRD/3sX+53OZ+FbB/ymR3XqccgD/1xcOw7cEJQrcyOi2FekIoYj0LmvEOnUbXEF8F5ro2J
	PWV40+QZ67cdZb7McflICgH8SodOCR0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-y9I6TPBqOUW7_FL1QihRbQ-1; Tue, 04 Nov 2025 09:32:44 -0500
X-MC-Unique: y9I6TPBqOUW7_FL1QihRbQ-1
X-Mimecast-MFC-AGG-ID: y9I6TPBqOUW7_FL1QihRbQ_1762266764
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-429c5c8ae3bso2844171f8f.0
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Nov 2025 06:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762266763; x=1762871563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
        b=EawEAxwhBYdmAoDecmh4nSkhbY9OH/q4TLNrsHbbe+p5Bdh7HnnZooenv1Uyy/W8aP
         4JGFZKdP6AnNZzJb/BUZ1R2JlITfHAVJRNvdXvFJgGQtxUnQG+ViasGKhjG8/ub0GUOT
         gGdWnRW7Nwbm100I62QoLM/STGsLt9xbJzdJWUs5lyLGXf9kIPxaechPtmiU/dkvTzLW
         a2Nv+/Vn3eJzre+HsrgZhHkn1iO9mvB6uJern6L3oKQUQi2jHTJmCDLP5hV6Yx6aJsDL
         cRocqJXoVmzR00Oi5mHFVUZDmsx8Q8Yg7xx2qm7VPNjF1wJXHUylFLBfBIfJSJw8Ip0j
         12eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762266763; x=1762871563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vEZHRadoqRgO4IgyXPFxluBKZrkdYFiHDtDy5XP6kDo=;
        b=uDsXCXRn7jiYbhtty6DFizQ44zcVkq1wfqYHQaeA2Ax2pvK0LXM7zDgS0jJPJRlVfE
         FjfUh6A/pDCM/tZ9Nai8P7hWmZ4RWuv+iysAZH1rGnsWK5keTouxWyN2V9aJP73NsVVy
         b3lGhWuWRlP8IKeMuVlu23xdrsNd4xaX4/2HLA34AOOUHxdoVxSoAUzP38v9Q0GNFnaW
         saALh5XPVfEgPvu1SoCqCPhJNXwxwKeyOMNNfiRNy5rEfVvye3s96KGQpSyrDGcCAmZn
         oZF2mSQRJXKvCXPijUtbjEQxMddu63Iw2XtrcmaZ3DMGBnUceKrQornPPjuALZL6oXsx
         Ow4Q==
X-Gm-Message-State: AOJu0YyOKLZRnOCfY93Jvvo39rrBEH+EHp1pkmXHT3I8kpTA1gNOGFCq
	FUblERKZUExSSDKYl4cWaKgFvXeqRZw9ct4EAR6B1uVnscs/ASNf8IIXJU651zb1XpuuIixY65A
	Wp7fAzfohtK65+aNDnpDGLu8xu/bMsK1H9y3ti+GMhi9QWsQxhxEIXa/Tzm27x3Vet8+o0w==
X-Gm-Gg: ASbGncviyiaEJ+vFK2rnm1a2aw1/7SiNYwl3px5X2vSiSGJgHemOWZrEJvLX6Mq9wRn
	N9nc3ZblwyhZvIobMGfgIurmVMA4k9MVq3MFwKyyr3A6IRtBtPAIAK2Ci4/aefDbzymIkn2GvpK
	JT5ccVRbA7Yq7XATuXHQPhOZXbKDZCoCJ0xqBSGcHVRJrFLFrHAnopc5zG8a9ATJPq3882eWRE3
	RSg67DqgcZe9EHOKOOVYkZHbJQy6B98JH9JONFFGMeMKgwcWVS7dBGhFy+KiEmoJ/L2GipM4Xln
	C9U1I2My3dvo5AP0/Kc+CI6qsxa1WguYBUmlRfmli+oWCikj9DA8kFmWdareoSbbKFN015ZsegK
	ZcEuMR700H1R5C1KfKyaFDlJlj4p2xm905G1z13RoLbLoN4yT
X-Received: by 2002:a05:600c:820e:b0:475:e007:baf2 with SMTP id 5b1f17b1804b1-477308b6d72mr149701265e9.41.1762266763629;
        Tue, 04 Nov 2025 06:32:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuFO1RurfhxQ8KoSwXSsJCryYZmg5ZaBALPYzQvFuAwcNRk3r60dzVnYtxJMdeRZ/p/LV9eA==
X-Received: by 2002:a05:600c:820e:b0:475:e007:baf2 with SMTP id 5b1f17b1804b1-477308b6d72mr149700945e9.41.1762266763179;
        Tue, 04 Nov 2025 06:32:43 -0800 (PST)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:1622:5a48:afdc:799f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477558d8a1bsm18898635e9.7.2025.11.04.06.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:32:42 -0800 (PST)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] MAINTAINERS: extend file entry in KHO to include subdirectories
Date: Tue,  4 Nov 2025 15:32:38 +0100
Message-ID: <20251104143238.119803-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Commit 3498209ff64e ("Documentation: add documentation for KHO") adds the
file entry for 'Documentation/core-api/kho/*'. The asterisk in the end
means that all files in kho are included, but not files in its
subdirectories below.
Hence, the files under Documentation/core-api/kho/bindings/ are not
considered part of KHO, and get_maintainers.pl does not necessarily add the
KHO maintainers to the recipients of patches to those files. Probably, this
is not intended, though, and it was simply an oversight of the detailed
semantics of such file entries.

Make the file entry to include the subdirectories of
Documentation/core-api/kho/.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 06ff926c5331..499b52d7793f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13836,7 +13836,7 @@ L:	kexec@lists.infradead.org
 L:	linux-mm@kvack.org
 S:	Maintained
 F:	Documentation/admin-guide/mm/kho.rst
-F:	Documentation/core-api/kho/*
+F:	Documentation/core-api/kho/
 F:	include/linux/kexec_handover.h
 F:	kernel/kexec_handover.c
 F:	tools/testing/selftests/kho/
-- 
2.51.1

