Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48BE14D71E
	for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 23:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718322653; cv=none; b=dnZNop8Aofq/RiOaFjvb+PPKv0NiZTiTqo3eA5wI7l6MY128uiSKzgHI2+N+5X2Pz5stmUxytuMeK9I9R91HVL8WgZXUcm3v8QhIm2eJx0YhTOejwvUI2SMhFi9g0rhipw/Xym/yw0G+DrXHzaGxb+bWxgqR6sXSWis0rHhrOfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718322653; c=relaxed/simple;
	bh=ahRoGy5moLopddVlGfclLvv26he0ry7BCYTrh8QCNpc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AZIVGwQBVUFm0OihY48Ez19fOmaYXYcy66zF9cZ1rcd7kVkajbBY9z19z+WCwXezrOw1vVxV/ajCeOzdLoSazcEc7K5jTOHELerB8RQK/Q/+bDZjPWgwCatanLL1+BlKF6O/B9rJuCPCMnZYEThkgBar4bzfHlaJj4YJDjwIHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TUtAKIc6; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TUtAKIc6"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dfdfe3d9fc8so2926865276.3
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 16:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718322650; x=1718927450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=q/2GD2P1P7CEf4LO1djLMe1zjWvI2Hkpb11N2GxkTnU=;
        b=TUtAKIc6Q/bwQn/MFPoxJzZfU0sMRrTfbZBgwm1+0ctTj7WUUus7DO9LlNjo8jScjQ
         fQ2SAwV0XEc4UeY5tsE0NTVJYB7OFEIgKwsYNAPuVbw+kZwczIrqy8sEXJa/DVZeHblc
         pFbfbmpuh+UlkcFikqnTrrpmHVZCU1u8k5JGR1Ua4F9Thl+1UyzeGSLaZiwe6DUeXAXn
         T3xCiO5kwqdzuVuTIZIipyEGvKfmvn0P4DPNtP9rSQ6vRXmKkRwvKG4FWD0KmUFxL4lO
         OZVqbngfJMLqv7gNEYRxciCmiVcLm4W5QCRFKwNEm/5oZEnJH/ri8xlgSIOPBrpgXPRJ
         8YBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718322650; x=1718927450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q/2GD2P1P7CEf4LO1djLMe1zjWvI2Hkpb11N2GxkTnU=;
        b=egd4glKBR1a9SmugMTW6lBJeFlIHTq5vwXyejMwZzVu1UUHuL1D80CWVN0khDKEDIZ
         R4BqhTJoPKgYIFM6kdSTvUqLdp5BtssBSZ6aNZ09bAEiGzXnGX/o3W9IFccO2r795bnp
         3LjAzh4AdfDBo7A4PyFoP/KMPGIEaHXokiGRAMNNgGwAiRkhIYy6nrTIrKR+3YaWG4NC
         5cqetVE7DIQMcA1dGzkn2koUCf8R37ZIG4ULbyN3oNkILRL1tNbcKjDdRKkEXyY0ok11
         sE8WWQHjTHRfgcWVW3EMk17p3uyC7YbOoGzXvqDRav4pSpmqXkhMf/mfexH7q8oigQNO
         y6oA==
X-Forwarded-Encrypted: i=1; AJvYcCV/FW355zw/LXcV5zsE8dAXIdbLmWX3r65+xjdPORQQLhimwKpYbXxJBlnNePCHxUym/eNTSbY23vox8DqacYMnj8aWisYZbV88mZKOhXSh
X-Gm-Message-State: AOJu0YwitBdBJlauWaJax1p0hEOz0cbVRmy61w/xOJJGAT9nUKk5wrCx
	4FPCb4B7SHS1q8EXVFL6enE8IqvIgGnOzdDwQEufKrhngW3kIQWnWGecXU88xG1jJ6bmMPFcTTY
	vbA==
X-Google-Smtp-Source: AGHT+IGdwT4otzma8gQNBf9ykyP8JCZXHjwasEwBqEvekHLX0RYn2KS31UOPwPFM3LcoNrjyVrWpomgD6Og=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:2e13:b0:dfb:bf0:59cd with SMTP id
 3f1490d57ef6-dff153b2e10mr184365276.7.1718322649837; Thu, 13 Jun 2024
 16:50:49 -0700 (PDT)
Date: Thu, 13 Jun 2024 16:50:48 -0700
In-Reply-To: <02051e0a-09d8-49a2-917f-7c2f278a1ba1@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <02051e0a-09d8-49a2-917f-7c2f278a1ba1@moroto.mountain>
Message-ID: <ZmuF2PsVot33fS1x@google.com>
Subject: Re: [PATCH] KVM: fix an error code in kvm_create_vm()
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yi Wang <foxywang@tencent.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 13, 2024, Dan Carpenter wrote:
> This error path used to return -ENOMEM from the where r is initialized
> at the top of the function.  But a new "r = kvm_init_irq_routing(kvm);"
> was introduced in the middle of the function so now the error code is
> not set and it eventually leads to a NULL dereference.  Set the error
> code back to -ENOMEM.
> 
> Fixes: fbe4a7e881d4 ("KVM: Setup empty IRQ routing when creating a VM")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  virt/kvm/kvm_main.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 07ec9b67a202..ea7e32d722c9 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1212,8 +1212,10 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
>  	for (i = 0; i < KVM_NR_BUSES; i++) {
>  		rcu_assign_pointer(kvm->buses[i],
>  			kzalloc(sizeof(struct kvm_io_bus), GFP_KERNEL_ACCOUNT));
> -		if (!kvm->buses[i])
> +		if (!kvm->buses[i]) {
> +			r = -ENOMEM;
>  			goto out_err_no_arch_destroy_vm;
> +		}
>  	}

Drat.  Any objection to tweaking this slightly to guard against similar bugs in
the future?  If not, I'll apply+push the below.

Thanks!

--
From: Dan Carpenter <dan.carpenter@linaro.org>
Date: Thu, 13 Jun 2024 17:33:16 +0300
Subject: [PATCH] KVM: fix an error code in kvm_create_vm()

This error path used to return -ENOMEM from the where r is initialized
at the top of the function.  But a new "r = kvm_init_irq_routing(kvm);"
was introduced in the middle of the function so now the error code is
not set and it eventually leads to a NULL dereference.  Set the error
code back to -ENOMEM.

Opportunistically tweak the logic to pre-set "r = -ENOMEM" immediately
before the flows that can fail due to memory allocation failure to make
it less likely that the bug recurs in the future.

Fixes: fbe4a7e881d4 ("KVM: Setup empty IRQ routing when creating a VM")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Link: https://lore.kernel.org/r/02051e0a-09d8-49a2-917f-7c2f278a1ba1@moroto.mountain
[sean: tweak all of the "r = -ENOMEM" sites]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index b60186b9c1d3..436ca41f61e5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1143,8 +1143,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 {
 	struct kvm *kvm = kvm_arch_alloc_vm();
 	struct kvm_memslots *slots;
-	int r = -ENOMEM;
-	int i, j;
+	int r, i, j;
 
 	if (!kvm)
 		return ERR_PTR(-ENOMEM);
@@ -1181,6 +1180,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 	snprintf(kvm->stats_id, sizeof(kvm->stats_id), "kvm-%d",
 		 task_pid_nr(current));
 
+	r = -ENOMEM;
 	if (init_srcu_struct(&kvm->srcu))
 		goto out_err_no_srcu;
 	if (init_srcu_struct(&kvm->irq_srcu))
@@ -1209,6 +1209,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 		rcu_assign_pointer(kvm->memslots[i], &kvm->__memslots[i][0]);
 	}
 
+	r = -ENOMEM;
 	for (i = 0; i < KVM_NR_BUSES; i++) {
 		rcu_assign_pointer(kvm->buses[i],
 			kzalloc(sizeof(struct kvm_io_bus), GFP_KERNEL_ACCOUNT));

base-commit: 3dee3b187499b317a6587e2b8e9bf3d5050e5288
-- 
