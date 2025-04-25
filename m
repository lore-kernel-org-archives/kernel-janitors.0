Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C86028FFED
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 22:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745619528; cv=none; b=Labugb9lnpBBLIwr/IXsEnBX60NEv8rsbv3TIWaSQpu6wRNjYXA3xeS7g0LLndosQaouuchYP80zGs3BFl7KEYmgEABUtVzWX3Sq4J2iLnKIRcfCCq1EbMQei1d8EwqK/xLzhVYKMukVmL5IB13AeM+GEimrojjShRvhS9km9uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745619528; c=relaxed/simple;
	bh=79khmCilj28Bw9iPJB9I+5VFOyP4giXQADVnconMfmI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cNPofSctgyxzBBQoRFKl4VUdSgXZsjDCMY4GAoRosx53RCTrgmRF4YtMKCnF/axx9hsroMaOmdnf6Y3HmDIPi1Fi5eaHCm1pc1u6gsHzBdBCVQbH30oUDHALTfodUFdZVqnzBe4iZ2fYSw1CwpAvtoiIqiHO4sV9/tvfuHnfD8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y3TtrpGE; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y3TtrpGE"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3055f2e1486so3886921a91.0
        for <kernel-janitors@vger.kernel.org>; Fri, 25 Apr 2025 15:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745619525; x=1746224325; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c79mghSvLDh48/eN+ylfXjUf7C+oTHXfrsGjYdtgeRg=;
        b=y3TtrpGE5Fu2Ntuptv0hBl+1HDwM2Ia59LIxELTzVIQVFTRS8ZwKIU6R02NepFzmMY
         jc7ghGzAekTgUNeeL4GjzlpvHMEiteQvnZ64YXF3jVbJlvXW8NNpOiF5cGEu64zQ6XEA
         UuwvRfbtgKGGrztkxzxxR6bFAUBDpEKq58dKvTnjOefV5JqYaWja7UrfNPRHg+375wiQ
         UktINWZdaNib6LSNs2u3TMdhFIXfqXu8izhBUJp8BDhnia4v8Qa/fhi2yx5wZIXF1oaU
         XdDPz/GYjSUV/8uvkz++vEp213T7sWyRDYiQT8IoxJWEG/1JZPqfLgqoxAMrxHLXD3Da
         qw1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745619525; x=1746224325;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c79mghSvLDh48/eN+ylfXjUf7C+oTHXfrsGjYdtgeRg=;
        b=cm2HrN7MlrTpZ2G4auSayIF/TAyhDpotm0eJk9Nj9OH2MYfrQ6m7BHa94VhnqEBiGa
         m09Avezro4KaP/OlBQsdDnqTzd7Cdv2VK6g8+y3oKwmoE0zN0fSge3X2iMzN77Hmg+uc
         3S4dhK8X85XZ4jPry25z+IJcYLByqnZO01di7ic7Tq4t5ocOgAK3mHn2c67Yau6eS744
         l4WTGejIdclDzC92vJeM0iP6LS1il7+3btdT2IWuyPvmRNFRreVaq/UsWjFfUUZRgMY9
         V7h8zVLRwy69aWYL8T4kbMn2Mj3dujmg46i7wPmTw9E7jLqGbKMZC+/HHFFJs1A/bAJN
         EP3A==
X-Forwarded-Encrypted: i=1; AJvYcCVn4yT9UNGxWCh9yL5z9j6O3gLUcr3qJZ5RLxljqAj+WM14lCpmp8ARY3LFbka4XVNqYaeqfj96q6O+zlbNIGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEg/yj/uqc3qhGqS2CY3GC5w7hKgVw5C/Tw7+0CTiv979HvZ9f
	y4o7SRBHbhqak0qOJHiXl17zAzpgCZNGYQ44EHrx7YQiGH+cdrDbgHlKDriZPaVP/z6T/SqK0Cg
	R/A==
X-Google-Smtp-Source: AGHT+IFAchsJLO7/uMp7rAAyJLviGsYQWW/6iJZ/bglJ7sMum2UgV5vjC+rx1FqdI0bNNfPq3hywGuT2vOo=
X-Received: from pjbee16.prod.google.com ([2002:a17:90a:fc50:b0:301:1ea9:63b0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2705:b0:2f9:cf97:56a6
 with SMTP id 98e67ed59e1d1-30a01329418mr1651850a91.14.1745619525691; Fri, 25
 Apr 2025 15:18:45 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:09:04 -0700
In-Reply-To: <7604cbbf-15e6-45a8-afec-cf5be46c2924@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <7604cbbf-15e6-45a8-afec-cf5be46c2924@stanley.mountain>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559676107.891772.3803946137571196074.b4-ty@google.com>
Subject: Re: [PATCH] KVM: x86: clean up a return
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, 24 Mar 2025 13:53:39 +0300, Dan Carpenter wrote:
> Returning a literal X86EMUL_CONTINUE is slightly clearer than returning
> rc.

Applied to kvm-x86 misc, thanks!

[1/1] KVM: x86: clean up a return
      commit: f804dc6aa20f2ce504456ffbaafc95db646c211b

--
https://github.com/kvm-x86/linux/tree/next
