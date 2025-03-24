Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417E325D91A
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Mar 2025 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813495; cv=none; b=jf4MwXO2SvyPLb6k/PFmI923UeGNIEBz4VEmzAeu5KSeSTYPq2XJyyyy/QN0XbsvHn6M9nN5Jx8IyEnORv0AgsfVC/4bYUfi4aHsz8+w2V6wQXjcINQZHiPlsp3op4nRu5V2pcw2PkLLUIf69NjUUU3Tzw5SloXTQaf/4uNj54E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813495; c=relaxed/simple;
	bh=DcUNwbRdPnow83kHtle77XVYOEVPg7rrZhWsXAiAdvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3X6dSlBhIjSJItVvWxEoC47DOwMmLrQKs5xHX9LmzwObSHQPG5X9PU2IQgdqdHhYdNG07Xp7UjzazKxiZIle+iLkWTnFeT+I0ACoJd184awqIP261gkBequ+TiZ32m9U843ax/zY0QRxuv3v+JrFHp2R9B/b1ursmDUUzGEm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t6Tsjqmr; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t6Tsjqmr"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so27579185e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Mar 2025 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742813491; x=1743418291; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9XBugaXb0XfXOq/Pw2aaFS10qYW8sYB+YovrYm1of0M=;
        b=t6TsjqmraRQZ1DQ8ONd6zW7pki7uVKNfXUwsL437JhTlQwqIq0RMdRbyNy4xytvPEl
         7oD41CupVEoD0yVlTN+zsc8lDK4JSZv03fEa5+YyTQECNbuIalkO8qgUidVKQ8XhrUjq
         iWtf2yOs/xKPqby6UBGvZye3JN/RFVOpTHpp++r/ObWVy0T/5zqtBlLXT2sU5LQvIAaQ
         9YrQc8qipWXkSlMOUMTv/Yxp7skz/IE+me6yF4s3M9SIgPOsm700JAY5gGsm2XORpbNd
         DTtgSbybDr1T8zFKoS7NcXg6xD17e7tDcaPBS8OmNU8EiXT8qubAlBCljZwucTpnPWL0
         WbCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813491; x=1743418291;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9XBugaXb0XfXOq/Pw2aaFS10qYW8sYB+YovrYm1of0M=;
        b=eRuS2ukeyhZrDhB6KW/FY1CwitS4HO2W1T9xkRpk0+Jpw3j2HalbjSAFihMCjsgniT
         vExK7GFP1g3XKGgNt2gUYtouUlb1KQv759u2xE7KMPs1IYXc4MFzBz+o2qpgq2CSeOci
         3zlxIwFbLqeD3mu/j9MH/LXXtKjnUF8xPykZPh72UUeqtAPqscX0G5bQyir322JTZmSS
         1pjVgUQibXTLIWWhwlh9b+vRslmrsD4N2G7HjkLy5/Yz41VWFUuKOpgrfyxWoQS3s/Br
         EMTaMruI0S8EIjP1SLIacITz2k4m45c39P7AmteBl2wbPXqEzXxKFU8sRnZfZCfByP7c
         qk/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVCKv/AbgYeyPfGJpliqg0a7jX9/iE/wrXPgx+z516VxMvJsiUnPVVoisA+zY0jRhuoszeP+PWS+rUzy1thZYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ9rLgSK6PV+AWvQTT8xkhaYTFfH6RJ4M2dZxYslQuGLTlKFkr
	MBlcGLP/a4UQanr1uMU0vuvzv72xrwB3/UMY04R/cl71nGOOpzxIoVZdNwUytOU=
X-Gm-Gg: ASbGncsTih6MwJjn4tKfD/vvZGe5M7zIJrU0ual6NV2W2rssV0zvdsGdFLf6N9TWKBL
	0AhLdR4KnDr4TAS3nJ2PNnub+521f4a0NHOjN1Nph5HmesX47Jm+7YLc1udH209NUG+3ovDCv/t
	buMYZbFeqIjZm6+9KXdPAtogJWluOnKOwR9PKn5C3e9xfFTzYCh6q/S26OlKR4sjA3u2tAeWKOf
	/tIs0vRnl1eUV/sRFBNCpU1L0L/AlqwJHcEOcRy92n+QG/cXMDuoDnee6kcZNUEOUCHVLQW5oGp
	HKi3m/cVXlAoUeiIwm0Wccr0X2bVuIeEjKJntGskoJtR04eRwg==
X-Google-Smtp-Source: AGHT+IExcAE5hR9WRBPjbbJe1A3tT2LgZRn6kn5d7CfZGvAe25QU3/LL5pLa+ilmFxLgUVsdLqKbPg==
X-Received: by 2002:a5d:64cb:0:b0:391:42f2:5c7b with SMTP id ffacd0b85a97d-3997f8fea8bmr12460729f8f.16.1742813491455;
        Mon, 24 Mar 2025 03:51:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9e65casm10745004f8f.69.2025.03.24.03.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:51:30 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:51:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Pankaj Gupta <pankaj.gupta@amd.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] KVM: x86: Check that the high 32bits are clear in
 kvm_arch_vcpu_ioctl_run()
Message-ID: <ec25aad1-113e-4c6e-8941-43d432251398@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "kvm_run->kvm_valid_regs" and "kvm_run->kvm_dirty_regs" variables are
u64 type.  We are only using the lowest 3 bits but we want to ensure that
the users are not passing invalid bits so that we can use the remaining
bits in the future.

However "sync_valid_fields" and kvm_sync_valid_fields() are u32 type so
the check only ensures that the lower 32 bits are clear.  Fix this by
changing the types to u64.

Fixes: 74c1807f6c4f ("KVM: x86: block KVM_CAP_SYNC_REGS if guest state is protected")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/x86/kvm/x86.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c841817a914a..c734ec0d809b 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4597,7 +4597,7 @@ static bool kvm_is_vm_type_supported(unsigned long type)
 	return type < 32 && (kvm_caps.supported_vm_types & BIT(type));
 }
 
-static inline u32 kvm_sync_valid_fields(struct kvm *kvm)
+static inline u64 kvm_sync_valid_fields(struct kvm *kvm)
 {
 	return kvm && kvm->arch.has_protected_state ? 0 : KVM_SYNC_X86_VALID_FIELDS;
 }
@@ -11492,7 +11492,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
 	struct kvm_queued_exception *ex = &vcpu->arch.exception;
 	struct kvm_run *kvm_run = vcpu->run;
-	u32 sync_valid_fields;
+	u64 sync_valid_fields;
 	int r;
 
 	r = kvm_mmu_post_init_vm(vcpu->kvm);
-- 
2.47.2

