Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0182D2495
	for <kernel-janitors@vger.kernel.org>; Tue, 14 Oct 2025 06:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760424091; cv=none; b=HqAyaMGRQDd+GTqJnEC7N/vhS9lCNBJL2FhKVR87jaHQdkACosJj6yqWt6rBIsDNVE2Tc4ccv2KddeQlNVOK9CjbfSlCc5Btq2EXPQeWx9pubEc2iWjhoqnvSUJq6lelVdBDiGcncYsHR9I4kV7DoUukUMwsrZM2WOfYDSpk8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760424091; c=relaxed/simple;
	bh=2bp7b8xMX3lCsqrOtDwzTcWHekQK/ojdxzFCW5PavL4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DsaSwSyzaehA+kA15BUdFOORudoZE1H9j2M5UJluLAJ6I02qe/44HMB85wYKaZCIzHWUxC/hg1cvcwef8pSHRObGFeecG85pfePwH5/i6U8GQfTGcuXSPQjri+f2nMWK0kILymCls8hZ3CaqCDP9XrzEgwt9SB/rihx+lsG4uek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VxH+jrR+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VxH+jrR+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760424088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
	b=VxH+jrR+LRXwH/yuKDqGlQNaW4WkgeJu5NYPsuemIuRK5m+I7xy4tHUMwst1+phoLIHeaU
	6RoqEdHBfSwTwcSzELiqSuQ4zngTRKVIpwDF0t76ecMdEAbHa5e273RWhTyrQMx2Ux5/vA
	ZepaIl+iDkWd/cRUFxVsYxaG72XHo6c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-158-6Vd3S-mcNcCNFU25dRXrdw-1; Tue, 14 Oct 2025 02:41:27 -0400
X-MC-Unique: 6Vd3S-mcNcCNFU25dRXrdw-1
X-Mimecast-MFC-AGG-ID: 6Vd3S-mcNcCNFU25dRXrdw_1760424086
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3f42b54d159so5203999f8f.2
        for <kernel-janitors@vger.kernel.org>; Mon, 13 Oct 2025 23:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760424086; x=1761028886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8eo0rdDzh07ckiTBotN/0G7m7UlosQASIFmbI9q9Ybw=;
        b=jLDyMrA/jH6tyy6EAKla3ga+jMzH9966a0tntBeAHYVHAvBdE0fylaWaBVMixgb8e5
         c+cMhvi4VqJbXMXa5S46b6xFO+Af6GC/y3PZe6vQJuN4QbYyED+kp9EMiTsrrR+WKt8Y
         AVK7MGalk2XqvrLGjC11yl6NjqDX3B9Lru747Wf2rjAc3WotIwXkvlaRj/+B6gNd1Hp9
         EiHukEGCqwsP1hhaUA2Afz8yifsd3OuHTSEi1n/1jj1LwW+fCDw6ckrbzJApka74Mh4r
         1r+RKLlSrp3g0OzIYP2xDY6OnOcyU1jTN8ei2/KgTRD5BcQCTx2U3Gssw1ni6kDKNjGb
         3MGQ==
X-Gm-Message-State: AOJu0YwhVZ5Jj5gDlLhR+NFeoRdJE0lbxacDuOAw3gfnOaHra92Lep46
	tiMKZ6D8YgeevC5et5Qp4nlB96QZNfSyUJepIuhXTH83V1/MPgDjEePlav2Gt51BuaD/V7uxwtw
	CPMlILv8JcRsiJ2dNDHE4VNAp/ZP9l/fd6J+rYrp26b79UYesCkBU7rgsRpiwH2v5plEq2oM9he
	wrQw==
X-Gm-Gg: ASbGnct8QduRwWYENXhmdTTFY7oPxr1eIZEWkl5lsDEOyKPTIzZKE6N6W8YitsGKHKe
	a5fmNu/Sr0U2U2VPN4kcUGc0uAVLpGIR2ry631n447dLctb9PlWT2MCc7v+qN6UvAYj1Ol1nZhi
	m5ZVbr43tn9IfKFo6ffAOirhrxUjolR5zz2uR+EfvTj/i4Rub2CxCIHcYwxBKmIxm7tywIlo9bJ
	YnPfIMwWMXyT7+6zWvHqyLoJQG917lratQYcNj2Ej5lN2V58+PiUqKu7GFcG3ajVlsTTwegygMP
	/kZTQVRN/KHeTyYNHGKscZwtUysXf4xMj+lIDz+DqnK0Dfo6sddL3rzA4qe+CYcKyDJQP6lrXzv
	WfhftcdPb0W2sNw==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4266e8f7f58mr14331632f8f.29.1760424085627;
        Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVQ04e7UfQsRRayb/A53UoKDUPQdS7WxAqx3NLzVujqatyY5Y+mwqkqiVt78YRvyiQ00wF5w==
X-Received: by 2002:a5d:5d86:0:b0:3eb:4e88:585 with SMTP id ffacd0b85a97d-4266e8f7f58mr14331606f8f.29.1760424085157;
        Mon, 13 Oct 2025 23:41:25 -0700 (PDT)
Received: from lbulwahn-thinkpadx1carbongen12.rmtde.csb ([2a02:810d:7e01:ef00:ff56:9b88:c93b:ed43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb4982c10sm217369235e9.5.2025.10.13.23.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 23:41:24 -0700 (PDT)
From: Lukas Bulwahn <lbulwahn@redhat.com>
X-Google-Original-From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: [PATCH] rust: drm: remove unneeded handling for config DRM_LEGACY
Date: Tue, 14 Oct 2025 08:41:20 +0200
Message-ID: <20251014064120.263455-1-lukas.bulwahn@redhat.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Since commit 94f8f319cbcb ("drm: Remove Kconfig option for legacy support
(CONFIG_DRM_LEGACY)"), the special handling in the rust drm code for the
config DRM_LEGACY is not needed.

Remove the drm_legacy_fields macro and simply use bindings::drm_driver
unconditionally.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
---
 rust/kernel/drm/device.rs | 33 +--------------------------------
 1 file changed, 1 insertion(+), 32 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 3ce8f62a0056..a1d92d8922a4 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -16,37 +16,6 @@
 };
 use core::{alloc::Layout, mem, ops::Deref, ptr, ptr::NonNull};
 
-#[cfg(CONFIG_DRM_LEGACY)]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*,
-            firstopen: None,
-            preclose: None,
-            dma_ioctl: None,
-            dma_quiescent: None,
-            context_dtor: None,
-            irq_handler: None,
-            irq_preinstall: None,
-            irq_postinstall: None,
-            irq_uninstall: None,
-            get_vblank_counter: None,
-            enable_vblank: None,
-            disable_vblank: None,
-            dev_priv_size: 0,
-        }
-    }
-}
-
-#[cfg(not(CONFIG_DRM_LEGACY))]
-macro_rules! drm_legacy_fields {
-    ( $($field:ident: $val:expr),* $(,)? ) => {
-        bindings::drm_driver {
-            $( $field: $val ),*
-        }
-    }
-}
-
 /// A typed DRM device with a specific `drm::Driver` implementation.
 ///
 /// The device is always reference-counted.
@@ -61,7 +30,7 @@ pub struct Device<T: drm::Driver> {
 }
 
 impl<T: drm::Driver> Device<T> {
-    const VTABLE: bindings::drm_driver = drm_legacy_fields! {
+    const VTABLE: bindings::drm_driver = bindings::drm_driver {
         load: None,
         open: Some(drm::File::<T::File>::open_callback),
         postclose: Some(drm::File::<T::File>::postclose_callback),
-- 
2.51.0

