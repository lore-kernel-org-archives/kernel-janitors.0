Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB0225D91D
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Mar 2025 10:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742813626; cv=none; b=O0nSPzhBgS9jMOHOyy9qXIDTuq8phveOqDQbrXS9+O6sSWkTSupMZThc8ObgWyiSzkl/n4w9c5ipgRnNS//jZOG6gvtXSxMvjyt4hm5X8XDXXMVyBTOMioYAgtP3LPPHXMxvx0vu1dRIAGzVMbhoV+hPgmtN5aJgJoyVfoa4xoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742813626; c=relaxed/simple;
	bh=KjVsYB/6NbKNMWPMw7dJEN7gZajXIZf6BXVWnnRlI4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GpikAH40jzCoTzotnyw8x/g8sa6jeWF/0pTNjyYo5IOMQD2Y+6orerWUzRwYtUo69iGSeS6qcysCtGvwPlW4Pwa1uIkYRMielo30G6O7ZSbM0+G8AzX8BG2eAB8IQYsDi9G0XFy1wqsLvJmXSYNj0WLifPFyBaEONxWyYxnY59U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u2gRqq4x; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u2gRqq4x"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3914a5def6bso2478452f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Mar 2025 03:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742813623; x=1743418423; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zRBBC5Y50DbrnY2KR5VRMIecYWoom7fg1aMey6lzMKw=;
        b=u2gRqq4xM612zQdS3dWg6nQFyzVa10fpHoXTlO+kz3hITmqKAZlltof+qevYCZ1yxc
         DV7eFO3UBTRQPVJoJX5GctNElfwrB/8r1X1KTQZLK0gOkm7bckrrVzotx6dINS/XVwnZ
         SL38Bav8DEUU+4sfETBxHyFD6RnFeQU2NgogmtM45SvtDHtpVPlCUZ3BO21xaKS5v/ge
         AFimaf+puDTnpaAH7gamOUoRo8sU2bZoPZ979FRnhrJyxskeaPQTBEka7QWQmPkPXwrX
         socKWRgglXcGkyrVx74vBkV8gYLs1JDuyAyOXWrr1s6sl7m8TkdLdqOw7YQYQNGDIgfr
         n48A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742813623; x=1743418423;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zRBBC5Y50DbrnY2KR5VRMIecYWoom7fg1aMey6lzMKw=;
        b=hBaL7B7HroWlRTL6hDskRQvvoVcBraOKJGBeR44WEvV5VGR1Yf8YkXxry47ZdITo0a
         k+wkU9prGKEgOhVpNq5Ll7UFyqbs0bH9ZZpu9axKBN766xFp3uJvqlWkGwApxnYvYGkM
         Q3G4k1aS3HmuRLVELdVWUtz0ShHhUeX5cZky121DvALayzJVBmvw+VqZfmH0acyj1WE1
         SJ17QXlsOsJkQuSiVnIrVmt7wxsaIWJW2KM2w9yEGKOkhjkWO4yNCvixAiTGmnvOdnUL
         /0G/1TylL6vSGd4CEp3gm2zDNICeVaI7jH+6+sECz4oT07NIOzxWe/xPSXbhmfy1CmIn
         AggQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiM19/sru9fZ0ZuddeLrHlsI+HacKuWCsXgxXfPo/fhH/STixT1m+FsDXATjrWlBgASqTUUee2s5JHixTw734=@vger.kernel.org
X-Gm-Message-State: AOJu0YwocuYUruhiKJwy/L559AsyCs9IOueHF2qDsnC+imz1SM37pKH0
	Q0w1ocZb8xWLquNy9lcatOnRlrCRGcH2LOIea/U6l/matp7jdjegN/+g1XPbVFA=
X-Gm-Gg: ASbGncuS8xAOcdryS359Th2aCFme2kyJyyZB9VzNC/P9zNZGxMabZjfOhU/3fMCybjp
	DS+XE5IJ9rs+O9OZok6TVWtrsrndoeT6W+LT558a4xTM98Lid4nCftIX0NoL97h8o8fk3628be5
	R/rF2vWC+tE+oJNa00uerB0SWc012kRkmWnsZhqYVNf8zstk5Zhrs3ABvkTzM74G+TQ2HRXqRzD
	HXxWNC0Nrb832HlgJ5XY9e8ENoETut1BHhbeVJDwHMyRoU8XvUGzzmlELWAOl+eBeRBMtFsamIh
	AZ2vKl9H9KtrORWyJPdU/NUGOFQ1DYOMdo6YbRXbPP+GnkWjNw==
X-Google-Smtp-Source: AGHT+IG6+X0RvQWAACJrJUGE18q5oXGZ8dddeugBl2ClpDLyua8TAmKdOcrERT6mZXU5Gy8dfa/gpw==
X-Received: by 2002:a5d:588b:0:b0:38d:de45:bf98 with SMTP id ffacd0b85a97d-3997f8ef175mr10199407f8f.8.1742813622782;
        Mon, 24 Mar 2025 03:53:42 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9b260fsm10435247f8f.43.2025.03.24.03.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 03:53:42 -0700 (PDT)
Date: Mon, 24 Mar 2025 13:53:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] KVM: x86: clean up a return
Message-ID: <7604cbbf-15e6-45a8-afec-cf5be46c2924@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Returning a literal X86EMUL_CONTINUE is slightly clearer than returning
rc.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 arch/x86/kvm/x86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c734ec0d809b..3e963aeb839e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -7998,7 +7998,7 @@ static int emulator_read_write(struct x86_emulate_ctxt *ctxt,
 		return rc;
 
 	if (!vcpu->mmio_nr_fragments)
-		return rc;
+		return X86EMUL_CONTINUE;
 
 	gpa = vcpu->mmio_fragments[0].gpa;
 
-- 
2.47.2

