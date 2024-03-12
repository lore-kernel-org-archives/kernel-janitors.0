Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157671428FD
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Mar 2024 18:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710268696; cv=none; b=tmnY7XTFTL7NBNYs8xqCKvof7fn3Ds7xEskpiPziUZHp/c+Y0ON7XWxPCh69aw2z/EWeyeVKyu7MFq1QDYUU3BtGLlXs7aFmZPWlbS8PAZlVky8HV70UbPkcYZAGteiIjepWQCercZ054Dqo+eJWkgEB6wVEqiBH9+0fdPuZ1ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710268696; c=relaxed/simple;
	bh=wYX4U4mgWZDDTAVNg6/c0mwBAAO7KZiivCc6MfSMAN0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WcJRyvJ+Ax4CMdfW3qnOHnfvwqJj1oInQZFEJM1OS1HtkCfmaEgeW5VCG8FM5DxcA7ETDUdoiO2nPQrFZkWMSO8kk1Kt1ct6PMIEAb01TzgkBGPYWVZwG8tmA4fG6ks7GM01ktWxIXjaGI1Q3wWZo9oJ6Jqmt94EqjpLBGN16iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vP4DvnHD; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vP4DvnHD"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1dd7d6495d8so22505025ad.0
        for <kernel-janitors@vger.kernel.org>; Tue, 12 Mar 2024 11:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710268694; x=1710873494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kcNw7BbBTvDVZigmwhGYQ/p09R6CDgjmySJUJxjAXMQ=;
        b=vP4DvnHDTUkfquUVXNOhtR4snNzWYxhhefeuYo664upQcJcp8vSuZ5x6uuGIohSYEI
         4AT1tPiam+BYeXUBrqBDUM8KLyxsy1ZsfPqey/qr0SHCVLtfhWb0GKkdnibTIaV+Ilyf
         PZbTt2/hWuhheexirbnprTSLvF5BSvLdMg1/iWp9LbnAeaqOQlaxaM8Ab8VrmDJQ6JBZ
         gPnRb3v3mTBJ/YlA+K1S/wVpbeF7FhcDd+LLAbU7YLHArnjjvMlyjokJzcyDmONq9h7C
         g7KT8LJJWz+VCdMLBzADIPipb9FwEQ7vO1TpQdnyqouigWiexZnEb98/4+8YOGC2Gxly
         uFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710268694; x=1710873494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kcNw7BbBTvDVZigmwhGYQ/p09R6CDgjmySJUJxjAXMQ=;
        b=QchfwUzDENoampjv2PYa8YlljR8x4GnKzyd+WMXe1WiBKaVZHMfBQmvOZppL9udsZ8
         TbaRP2HUMmq+sds1rs5F0ahd9PglMZ6sJZOX1FO8p8DH67aazdNsk3temrt+D1iHsiHk
         0hScjMzblkV1N36YLlSsT/Cd1slZxE2cWKvrX8khuy2uUVqGVfssx/njLQk7lUIiu5Fn
         2KCY3Lo9VwRod3TTil358NWuJ2sY1vdSSwfB++HTd1EJ4ztBoVr4kB9aOjx4XVGRd9rP
         WLRN7hZlhFSVyVrlOywh73q3dFaYvh/ePE6NTrUN3YkB6fScBDWRtmd1+7uZtYRGC+LW
         PYvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIfqSI3E9+bvr/pi9qF8xNt/KLd3gZVD9Rs6dgOnscghS/7WEa0chZTvX0ctyEOipQ2G0fGyMf8Tpw1szxAJrJgxBCTCNP7sYUEKc6GXSR
X-Gm-Message-State: AOJu0Yxd1EjoUUz+OeYJl1xy+jJ5Z8yoazOiOAnsL4URJwl506LieLC1
	aUaUkhk3NVzVVuYltO8OeC/rnPNPBvaRnwnbF5Uop/yZ5d3sIWICdP/6pQwI2MumpFdmKGS/edA
	ePg==
X-Google-Smtp-Source: AGHT+IHnTaoY80kiWglVX7HwtJTr9eNN/Iw0syp/e7CC8QvlnR6x+Dku2AN4fdTbxKX2GWg/wBPcHMFJMdE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ecc2:b0:1dd:8360:df97 with SMTP id
 a2-20020a170902ecc200b001dd8360df97mr664667plh.13.1710268694242; Tue, 12 Mar
 2024 11:38:14 -0700 (PDT)
Date: Tue, 12 Mar 2024 11:38:09 -0700
In-Reply-To: <c7619a3d3cbb36463531a7c73ccbde9db587986c.1710004509.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <c7619a3d3cbb36463531a7c73ccbde9db587986c.1710004509.git.christophe.jaillet@wanadoo.fr>
Message-ID: <ZfChEaiQ29qYzFaq@google.com>
Subject: Re: [PATCH] KVM: SVM: Remove a useless zeroing of allocated memory
From: Sean Christopherson <seanjc@google.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Mar 09, 2024, Christophe JAILLET wrote:
> Depending of the memory size needed, we clear or not the allocated memory.
> This is not consistent.
> 
> So remove the zeroing of the memory in the __vmalloc() case.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This is just a guess.
> 
> I don't know this code at all, but because of KVM, it is maybe safer to
> clear the memory in both cases?
> So, maybe it is better to use kzalloc() in the other path.

Not zeroing should be totally fine, the array is only used to hold kernel pointers,
if KVM leaks that state and/or accesses uninitialized data, we have bigger problems :-)
