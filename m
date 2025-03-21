Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E30815CD74
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742567579; cv=none; b=hp6B4eT72CiEorUZX/KHfE8YZakwgdMNGtxARvhA7lH4qvkiosXzkVk90b4Au/tpDAJQ1CpkyMSKrLT1WXdTsIlxzkqD86rnGfiXz0r9Q5mAOHOf/ndz7ZLmdEap8iLGOFPHMIYeTfa9gBeRrjrQBARFkJe6oHCBLbPre4K/2LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742567579; c=relaxed/simple;
	bh=+LDlUo8we7HXs412riW2XVXscOex6Sq1qjsJfiM5m7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0gHZOk8a+MeWp7xShIlmKMVOVUqtvJO4F4xbj7cT/dyOlvyi4C0Az8pgFqANovhoHJO6229ZgFN/4tk+C22YUzxLJ4/1/Dj5sLcdmKVEIWyKeMnee2SOfZEMmLrIvh8NRigi7EcXgVo4Wg+qfu3IrfpAzAFDrX3RuHfhUseEQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFi/D4Yz; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFi/D4Yz"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so12816105e9.1
        for <kernel-janitors@vger.kernel.org>; Fri, 21 Mar 2025 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742567575; x=1743172375; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MzFQfhx5F8dx0RL9AvvQYwg76iw5NXa4lMy+vsdeqMg=;
        b=kFi/D4YzOt770w/wvjc7ZyU62UJBn2euObrJKUlP60/QTnDz0WjYNyRKXyenjj3+d+
         8AZk3BM6HBEhEuboEEWBdaPijot2KJk1R+mOkr/H2hAabQl1NOd8ELA/Kl6wLzjp3oCE
         IQS4KvAYfhJhHX3vNTbRQ45jI04kVFtmuoFZ4sBeuddZ/kmc1iXJHZwePNhOfdULDkny
         SkrHecAg8qF0Y1r4LiI6qYbEg7biHopf4dE11IDR31/F71iIP9Wf7vCeaN5gGqCnh9Af
         KDhGkmBACtb8vNrH4I8mFFoVQUwY5gm059dGJMQT/7vZ7WJhZiJQdq1vWCauE8RtREL1
         t0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742567575; x=1743172375;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MzFQfhx5F8dx0RL9AvvQYwg76iw5NXa4lMy+vsdeqMg=;
        b=wTFo39Hy+nHf76bzB6Mdrsg3NTTYoL3IeX66R11hjefM+NfD3rgvhneQ3zyk2wPOQk
         TOoZH7dMPrTy8n4zscaN989mXyybj8fYy1wCFrUtjlFjK/na/OZA04Rwh+jSLKXqUwUS
         uaABF1qNPK/Gk45JY31J+YvlEyl+tUCfGsnWlh3V66kEfNzswZ8EjpRtSKnT2/taTiE5
         5mxr++Os4MiDYy4pNXzD99Gfc5Qel2cWK9wkcuD7/WS/vzZQPwe7bBjGQ3B78fo5UNsv
         +hRmlw5FXb+e4xwjaMF7u6G0QySa7i2bmuXXBtfUBrksk5SKiv/8rmy3cMZLSH4SfUEj
         QOTw==
X-Forwarded-Encrypted: i=1; AJvYcCUxn46pnEyv52gXHYfaHJzjb2LYxW+h4G+DjZGhIZnCVnK7P8zy8h8VtgBy0iKZ48Blb09o8HfU7MUaC59sZ6o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3D3T2utD2HCCzXVxTsbGNmM7r2f5njL/4pGABu/HhHKRtc7JQ
	v50cU6QvE8x56xdPyGgIIXuIAK4azePz3gSDuOnBGL6+D1th9VDqMHelBTtjRSg=
X-Gm-Gg: ASbGnctMRIoQ1f6IzCzBk9979pXCECqX5VHZRAfq0+Pc6yUM8byyNpOlf3OpuqHke1b
	6Lp/A4N+hXaTxcAOVyB6PyoBXFrIoS6VafP5eA3DVLB9Fhwv0mfko+Vp0hrrzO4Lp4joSTsLjGX
	+GqLExPwzSHDbvCBZ+ZSHWefKROLofqKeqY1BKH/TRvCheMSP9IZoRWHnRt9oo+ituKdxy7W99M
	CzTdN5Saxguze04Lnaf8oo3y9OSZHqzUgCqimAp1JUJ6xHKpzqQ+sYQiFKUsCFBjTcdQ9m39I9H
	8dEAvk23ZZzS83Smuej/JtCF6q1dv7EdLcptMPOc7fcwiiM6xQ==
X-Google-Smtp-Source: AGHT+IFdHgCx4C5nFq7a41Rl1TdfpLB7mC6eqzVe1FxFvJX3eQdkfF3U3LPtyEx8bVlfn1VSsrBleA==
X-Received: by 2002:a05:600c:1c02:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-43d52a08ed8mr22225315e9.11.1742567575525;
        Fri, 21 Mar 2025 07:32:55 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d4fd27980sm28845345e9.21.2025.03.21.07.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 07:32:55 -0700 (PDT)
Date: Fri, 21 Mar 2025 17:32:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Koller <ricarkol@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	Andrew Jones <drjones@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: selftests: Fix a couple "prio" signedness bugs
Message-ID: <ca579322-dc9d-4300-bd74-7e9240e930c7@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is an assert which relies on "prio" to be signed.

	GUEST_ASSERT(prio >= 0);

Change the type from uint32_t to int.

Fixes: 728fcc46d2c2 ("KVM: selftests: aarch64: Add test for restoring active IRQs")
Fixes: 0ad3ff4a6adc ("KVM: selftests: aarch64: Add preemption tests in vgic_irq")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index f4ac28d53747..e89c0fc5eef3 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -294,7 +294,8 @@ static void guest_restore_active(struct test_args *args,
 		uint32_t first_intid, uint32_t num,
 		kvm_inject_cmd cmd)
 {
-	uint32_t prio, intid, ap1r;
+	uint32_t intid, ap1r;
+	int prio;
 	int i;
 
 	/*
@@ -362,7 +363,8 @@ static void test_inject_preemption(struct test_args *args,
 		uint32_t first_intid, int num,
 		kvm_inject_cmd cmd)
 {
-	uint32_t intid, prio, step = KVM_PRIO_STEPS;
+	uint32_t intid, step = KVM_PRIO_STEPS;
+	int prio;
 	int i;
 
 	/* Set the priorities of the first (KVM_NUM_PRIOS - 1) IRQs
-- 
2.47.2

