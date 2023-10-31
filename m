Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A27D291
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 08:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIRRkAAc"
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8AEAC1
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:58:05 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5079f6efd64so7526856e87.2
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698742684; x=1699347484; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d4STdM0jYEXN+54aJ9JQEaU7mf4zySlUWnw/NPnMyOY=;
        b=lIRRkAAcg+uQNDo+L7xqz+20yba9RZQ55trzNV8YpjJBCjy4NneV5kx1NBy9U5A2iT
         Kzck1Fb6Lnf0XFB1KXYzVDILn72xlZseWGeC1XbDBkKPnM8zdoSyeQ8iBvhB+synZ52L
         H9916lelA8YBHU307XEaHX8XNRFZgiUHjcEBgexfPYTccOI4bpDeJXnCevwaCUcZQ/7A
         xpQfarpj776xq2dz0ssMWUb742NIC+oWh0dEk1wNpz+1HpSmVvjTo11U7Pm2CBeovqdm
         /id6UbqFdCFIsX7BvnoCrF7ayhTJCPxsNI2m3ZCDy8XwYw0FUi1/TZQV0uNgs+7KNgzx
         SXvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698742684; x=1699347484;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d4STdM0jYEXN+54aJ9JQEaU7mf4zySlUWnw/NPnMyOY=;
        b=D5Rp/d0TW0cRRALqdCN3241VIbnKTIUeaUa10hJ3Tmt4RY0wEK0T5R7z6RddhhFyQ5
         nHhUSGZmV6NPn4nTjeh9bqTd3ooUsSSSysflHYnBa6FwN17rbDXJKqfCHO8elWRCZXTl
         hUwmCh0dvfu6/utyV3trfwZkNUvpxg5AocNYPhGdpY0maepVl53adp6Y3Gi1JTMvHhBM
         xcVMYw6+mV6CfSVHEwE3I4g3mAcJMVspjguhwoY9abcym3ePkFxvL+yfkgS0Mw/XNdxQ
         nGWv/5Cr/m4Gu/zgkjLEsc7tFRkoYXCynv68F9jgRXa/Y+kpUqfV7oIb5NiXw3j8RMzN
         oemA==
X-Gm-Message-State: AOJu0YysbidnoHjDRFnVOsIiCMT28xLWS4OoAbt4yNPB8BnFuht9avRW
	UO4TnmtznnLt5GYFcPbq6WzG7ztXt6zE6JVNYH8=
X-Google-Smtp-Source: AGHT+IGpyL5LNThnF9EVE+It32ZKweaZuoUkY2L75q/AthejDBJRPtrL7WQrHmLGI6tPuRs941KE2w==
X-Received: by 2002:ac2:5f51:0:b0:507:9f4c:b72 with SMTP id 17-20020ac25f51000000b005079f4c0b72mr8428895lfz.15.1698742683962;
        Tue, 31 Oct 2023 01:58:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y17-20020adff6d1000000b0032f7d7ec4adsm973923wrp.92.2023.10.31.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:58:03 -0700 (PDT)
Date: Tue, 31 Oct 2023 11:58:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	kvm@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: Add missing fput() on error path
Message-ID: <64117a7f-ece5-42b1-a88a-3a1412f76dca@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Call fput() on this error path.

Fixes: fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 virt/kvm/guest_memfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 7f62abe3df9e..039f1bb70a0c 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -473,7 +473,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	inode = file_inode(file);
 
 	if (offset < 0 || !PAGE_ALIGNED(offset))
-		return -EINVAL;
+		goto err;
 
 	if (offset + size > i_size_read(inode))
 		goto err;
-- 
2.42.0

