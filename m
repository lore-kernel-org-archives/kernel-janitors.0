Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D3CB646
	for <kernel-janitors@vger.kernel.org>; Fri, 14 Jun 2024 05:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718341264; cv=none; b=R/nmvXlz2pOCrQkLInj0001iQsLxbE9UwJ4RDMLDb7wCzx3v3iSwUxFTKoS2+Jypmj4YzKvOkmi3bwGuLyuPqAweWME+FFUDkfxECjkliy96MUlUrrtTKsswStpujXxWG2TMS1W3PuVhrh3/nwaJA1tHs4F44hnjerilaCSSvig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718341264; c=relaxed/simple;
	bh=unI3L0rqP6h/sPw8j/2gQP67uQSqdIefSCxe/Ukecx4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VOE9sD6ZnVQoa695R5uaE2XUk69sctH+58VqHDjlrogZ3zl2e7h33LaPlSMJ2tAi7GWj28UuV/mVDPxZ8F1RkYIVMRZWLb/62zaiP8KrggMVK/E0qt3jMrETaXt9GUo2btV8RmR6VUq9SxferzvItfAK2Hpv7mK1aDcliksUIGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RSDsRTdp; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RSDsRTdp"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35f1bc63981so1736074f8f.1
        for <kernel-janitors@vger.kernel.org>; Thu, 13 Jun 2024 22:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718341260; x=1718946060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v0HUgUlG9vEDCQkG97tpkj3YnGaT01iQTHtx0RmuTwc=;
        b=RSDsRTdpraAHdlblduBVTZ3l5XTrk+dkZzw4Hbep7eEcs7bo0VWeMM11YK2pIo31No
         B87c/Nr4dReiOGGnz7/mWZbZdF7jWuGbKS4Q/L0FcTqpx3kAioCp6CEYu9UJTkM1iTJp
         uED3KbETZMsn2f0QkItVuAf3aa+n46p5UYkSlg4tJYPziKXgKR6HMmWY8abVsZ9bjhvK
         HbB7ckrA1AdxJMndCA0hVVyDt9cxRMTEUbC7mRdASNOWC+oFF9Eex8BsASZSkyhERBCo
         MV8oBY4rYWaa8qDaw5ZTAV9KW6/wZ8G71lzGHZpQ8jCNIl1Cd2VtR2FnQSlKLd65Vqmq
         KZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718341260; x=1718946060;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v0HUgUlG9vEDCQkG97tpkj3YnGaT01iQTHtx0RmuTwc=;
        b=PlZ0vBYaPEjHmSIlpVUh4Pz9S16o1b/BcWJZkPZTN9TMldvqCjR9xzCau+Ozn5cpuC
         TcOtNm8V/x6HJe6abB18leLS/K8KH5oA0N2T8+5o7HpDyznmI9HIBgtXettgllMAgkUJ
         WNhPDGrO8q6Kuw0y4RZsAY9cvfkn5seDktg0MicaRwVdGvHKOf6ob61+yAmig/BpxS5/
         ij3t5rUmBx/a9xgFRstCG8M0+u2mR0O4Qw5D7MFTc1ujK826yFHHn+LEojHdf91o8SgZ
         Oyo6kohJd/lDgnTUCunhsnE3myGcJD0xE+k4/Jfb9/uSlfo4ujTE+NwIW4U1Z9KFqWwN
         MQIg==
X-Forwarded-Encrypted: i=1; AJvYcCXznsv7dQ+UYTMVEjTLnWp9vo1RlqW7yNnnb4Yf55Aah9ztQ1v/42Gr8KPyttFOkg+HN9DVlU3+mMggL789xbEgpHRESGT8Z/zQ9XVkQPOJ
X-Gm-Message-State: AOJu0Yxesmc8OO0Bk56T98e8SKltz/B7G8CKGTyjPt4VXSX3xx/4Slvl
	bBGZGIWmpyduPwqpirIjitTBsJIp0pRW80Tqfuay9hQeA/35qY16Z1xMQTcejnU=
X-Google-Smtp-Source: AGHT+IGPB1MGLUnBZL8a7B9fGtRl0d/bVZarsDuhFdm934/bCtuNxQOG73AJASrw6TwdGPdoAQ405A==
X-Received: by 2002:a5d:6e10:0:b0:360:728d:8439 with SMTP id ffacd0b85a97d-3607a4c864fmr1464554f8f.2.1718341260141;
        Thu, 13 Jun 2024 22:01:00 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104954sm3274027f8f.99.2024.06.13.22.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 22:00:59 -0700 (PDT)
Date: Fri, 14 Jun 2024 08:00:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Yi Wang <foxywang@tencent.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] KVM: fix an error code in kvm_create_vm()
Message-ID: <29ed61a4-5f06-4c27-aed4-5ac3de3f45ae@moroto.mountain>
References: <02051e0a-09d8-49a2-917f-7c2f278a1ba1@moroto.mountain>
 <ZmuF2PsVot33fS1x@google.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZmuF2PsVot33fS1x@google.com>

On Thu, Jun 13, 2024 at 04:50:48PM -0700, Sean Christopherson wrote:
> On Thu, Jun 13, 2024, Dan Carpenter wrote:
> > This error path used to return -ENOMEM from the where r is initialized
> > at the top of the function.  But a new "r = kvm_init_irq_routing(kvm);"
> > was introduced in the middle of the function so now the error code is
> > not set and it eventually leads to a NULL dereference.  Set the error
> > code back to -ENOMEM.
> > 
> > Fixes: fbe4a7e881d4 ("KVM: Setup empty IRQ routing when creating a VM")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  virt/kvm/kvm_main.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 07ec9b67a202..ea7e32d722c9 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -1212,8 +1212,10 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
> >  	for (i = 0; i < KVM_NR_BUSES; i++) {
> >  		rcu_assign_pointer(kvm->buses[i],
> >  			kzalloc(sizeof(struct kvm_io_bus), GFP_KERNEL_ACCOUNT));
> > -		if (!kvm->buses[i])
> > +		if (!kvm->buses[i]) {
> > +			r = -ENOMEM;
> >  			goto out_err_no_arch_destroy_vm;
> > +		}
> >  	}
> 
> Drat.  Any objection to tweaking this slightly to guard against similar bugs in
> the future?  If not, I'll apply+push the below.

No objections from me.  :)

regards,
dan carpenter

