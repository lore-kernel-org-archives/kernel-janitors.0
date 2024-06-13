Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E993140391
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718289204; cv=none; b=u6QXG+wRVm1Zc3OfNqnT7VdwwEoWIlU5BVNzSyZJGvzRLoUb17Ep1oYffGgaCtQ92C0KrjK8NFBr4zDkhQwEIaVCLnkMgbabEzbBs+1bcI/wdSGvdTMqoyxItPOkbKfizHWRBYRTlpuC8r+c/3v8TwWEPJD9hYRRN3ya61X6Ctc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718289204; c=relaxed/simple;
	bh=36k0SvBf/xqZeOaPdRVVmeSGR1kCRx71+MzeGyhBGoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D1ompfl6OZUFwrHW7d63jil6TigJLMeG/Z3JXFpQm61l91QW6SHSJkzkpjMR7v0evxkjvUe+aPEMWXEpdWbH9FWPezdRmH2u6byAWhZomN0jvcExB9xwQ8kuwWPghTO69VDmaPbjL9hA3BYaesXmV5u3mIbPzeW3j3oZyCHq8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sYv5PwDn; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYv5PwDn"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35f1c490c13so1235307f8f.3
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 07:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718289201; x=1718894001; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m6U1CejGzjWUwZtad2oj4Tzh3DOcxhD9vinE0KAneMg=;
        b=sYv5PwDniEjZ5EGlIWZEB+W7R83U/wvW7Sk9WZvBdh9qP0Sqjywc4cuzDPtedNqTqX
         DAKem/ueqwKWiFPwE3jgWOdYCpOfzIFenL2wlV+98OOtsLLCnnBdNBUNNWL9ejtQXfqt
         MZbRIWPS7wQQIRDPcDymXPjKHHDgh5WWYA4/LLrrSTDyeR2nMZ4Kf0dowSVXtiNAwRic
         nYjACNvRJ4oGwzS25zPTwQl3kwqlZPFskWXMkzpy2N7XYCSbQgyYkRrrZiSeAqzIviMV
         HlxTbl1fEEcyhQAvUZBOsKfo7xCTo8qRUd9zQAi2kFhIy/bw3na0D1XMLQKXk2XHS7d9
         MmEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718289201; x=1718894001;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m6U1CejGzjWUwZtad2oj4Tzh3DOcxhD9vinE0KAneMg=;
        b=PnrpXrVi1QW00WEuTdJv6DB5JZimZXa/eTMEvxey8xDdABjY94lJ02y+bnCx19Ukwl
         TEKKKbW7x6u/Z4kWvz1DKWBKE/jux4uAZpTgsKDo5odFdWnFwzMvDEk5gw42g07VXvB/
         LXKelQ7hhXFVfFwHNFGoC6GvEkH+k68xWUMg/4aaQGnAMgYhe29A7CNNV2hKm1caLn2u
         162SWPoclKJdrmTbZ3/zdeCflryhC8ZWmcIm6OvCgFvZ0/6qy35p1eyIBVTfdEfeDqMt
         8X1iG0vKEI3ADkjJ5jhdZcnXq7rqEwr3j1MzrJ9PpsGoodFOsQC8j1UikxAAQfcgFkAM
         l6Iw==
X-Forwarded-Encrypted: i=1; AJvYcCU8UDKXQ+LbqU0kc1Ca04VfcehQ1Oy1QEKlHQmDZEA0ANUY9Bm+PZjU61XknXvgnXfAHoobbVgEtyRKUDpVSSVMt9D87Hp9UwoVWzsbMdKh
X-Gm-Message-State: AOJu0Yz1M8UFKG6JDJyrb/BiPCYvHuaQnlRpyNBL/MAT1JuwenAFHixh
	1oIOtpYDvUvpZTvueFsLAY/SB9OYaSGFhyOuF1Ky0JiVrgfSTCySgeXkQ6MNx4w=
X-Google-Smtp-Source: AGHT+IEL71vJla7SdEu7h2w8oi8ZuIynKyftPuJdsCsgUx9vcPoZ8C1LBzMrSr8Hgt+9Gwu3fYiC3Q==
X-Received: by 2002:a05:6000:dcb:b0:35f:27ec:ffee with SMTP id ffacd0b85a97d-35fe8926a2dmr3951164f8f.45.1718289200747;
        Thu, 13 Jun 2024 07:33:20 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3607509c890sm1905357f8f.28.2024.06.13.07.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 07:33:19 -0700 (PDT)
Date: Thu, 13 Jun 2024 17:33:16 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yi Wang <foxywang@tencent.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: fix an error code in kvm_create_vm()
Message-ID: <02051e0a-09d8-49a2-917f-7c2f278a1ba1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

This error path used to return -ENOMEM from the where r is initialized
at the top of the function.  But a new "r = kvm_init_irq_routing(kvm);"
was introduced in the middle of the function so now the error code is
not set and it eventually leads to a NULL dereference.  Set the error
code back to -ENOMEM.

Fixes: fbe4a7e881d4 ("KVM: Setup empty IRQ routing when creating a VM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 virt/kvm/kvm_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 07ec9b67a202..ea7e32d722c9 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1212,8 +1212,10 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	for (i = 0; i < KVM_NR_BUSES; i++) {
 		rcu_assign_pointer(kvm->buses[i],
 			kzalloc(sizeof(struct kvm_io_bus), GFP_KERNEL_ACCOUNT));
-		if (!kvm->buses[i])
+		if (!kvm->buses[i]) {
+			r = -ENOMEM;
 			goto out_err_no_arch_destroy_vm;
+		}
 	}
 
 	r = kvm_arch_init_vm(kvm, type);
-- 
2.43.0

