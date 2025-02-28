Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AABC1DFE14
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 23:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740786064; cv=none; b=llUBASWfXn1AOWdZBUiLBWPCp9LVMvyMbSbBogw7hffHj/6C/fF2MomVIA3r1zFWf5CkHFXyW7tuygrWpfQw4DmsUhSSiZVm8ebF1RKTHOjCG80OjDp7c0TxLZtn/cp/ceApHms3uUYl+EMRebLk08NaGiAlr+oqjo0k6V7pF0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740786064; c=relaxed/simple;
	bh=czHtOKFbuWT4IFwIXGB3dzoMikaoJb8csCThNc+R2Tk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=DiRXFFrql7NIahTPFFe1r2sLu68Z7LklvzrqdmdpHV9B+XXqZYJPGXsEpg4iQlYYRAWb+jgIHkAW44lWNJnxgsp9u/miIueRGGD9w5q65xNBew5KQMCnDdNL644xX+/X3q1r42bR544WX78BYKElGxJJlDzXNdDT55+ecjgf9O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Qot7tse1; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Qot7tse1"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2feda472a4aso137249a91.1
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 15:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740786062; x=1741390862; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+Rd2zkA90OfrPC56kZ5TgBkpFyoSsKiSMEhRKLUnwKE=;
        b=Qot7tse1Mzw2ETR/1mp9X6jcUp3fC+TzmauBU+FMS/A0f65iDRuWYD1LCpZ1K9oVDR
         GrMlgrZlt7755lqwkJHquj/f59KFVmaYV7JDFxWSfk2CUBEUvVPfYMnLldrs/wKCWFZP
         /1zaWQkSapYbGWlPOXGjPwyNhS3m8RLgLjNaDWKJgVT1LNiLVbJSv4GJfMmLnwMj8mwp
         DUQyQtouu9TRfoVvXxd1Fsckj6BM1ZkV/Fid5MX0c5tXcqllCFAKy5T2UJYZILKNQIp0
         XQD8SZMM8I1Ovzqdz0TOhOXo7Ki5kH5JD4CNYOsNCBUtleB9W/AZcHyYEig+onmi191p
         a85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740786062; x=1741390862;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Rd2zkA90OfrPC56kZ5TgBkpFyoSsKiSMEhRKLUnwKE=;
        b=vc4po9co7ghECDbpd9RYpvba4ksx/fZITpkMlbuw1rmGxgPLIaWkQBP6ap4475GHW2
         nNg0Vm4hrTJU0bKC8sgWFqDYY5Q52coPWFecJZVS4uAsv/Tcp4KyOmHLQMDnD0vJrcXD
         yGecp5J6ABgXMC5nPSbMfhnp1THwJk+Pk+QLJI88j1N9zGoy0e+AtjNR8kPqz2Pe+X4A
         5RP5+0oP1SBM8ffgsnt5mRhmXz7zYPuqfyhSGMhVm1c7wvInUZu4AN3J79huqc4Q0sIH
         dlABTK8Ae2PkeCVmeW/4aI/WnoRpcovw+zqTXsrWa6wNPy5COEdrpnjLWU1bhrqdbLk/
         CuEg==
X-Gm-Message-State: AOJu0Yz6XUzog7eOVl4FI3XCR8I0yVcu5ipbmBF400LX2hht9IK4Ho+I
	jcHlrI7+3sV44vojyTCnFPznhDV2nui+0jMyDnooKCKQ2a+Fcfazr32kJSzD8iU20O+kDxOfJWn
	25A==
X-Google-Smtp-Source: AGHT+IG7CvYyko2UbVPuAkNZZPDFMXpjB4wXlD6Ru8cf7no7JS4XUdhwodgR3HqRriolKmpqFez0BPUdclk=
X-Received: from pjblb1.prod.google.com ([2002:a17:90b:4a41:b0:2fc:1158:9fe5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4acb:b0:2ee:a583:e616
 with SMTP id 98e67ed59e1d1-2febab3e417mr8593663a91.9.1740786062022; Fri, 28
 Feb 2025 15:41:02 -0800 (PST)
Date: Fri, 28 Feb 2025 15:40:30 -0800
In-Reply-To: <20250227220819.656780-1-colin.i.king@gmail.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250227220819.656780-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
Message-ID: <174076278043.3736049.13548260851648046331.b4-ty@google.com>
Subject: Re: [PATCH]][next] KVM: selftests: Fix spelling mistake
 "UFFDIO_CONINUE" -> "UFFDIO_CONTINUE"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, 27 Feb 2025 22:08:19 +0000, Colin Ian King wrote:
> There is a spelling mistake in a PER_PAGE_DEBUG debug message. Fix it.

Applied to kvm-x86 selftests, thanks!

[1/1] KVM: selftests: Fix spelling mistake "UFFDIO_CONINUE" -> "UFFDIO_CONTINUE"
      https://github.com/kvm-x86/linux/commit/75418e222e30

--
https://github.com/kvm-x86/linux/tree/next
