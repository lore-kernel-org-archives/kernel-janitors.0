Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9564179B9
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 14:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IKTVjo5q"
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98BFCDE
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:04:03 -0700 (PDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5ae5b12227fso61262507b3.0
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761043; x=1699365843; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RpWaNlcLLfkPWZLt7oK1Vb3R9g/2Gax2njJPURnY0QA=;
        b=IKTVjo5qcZwLBGCOkVYaqCHUYlZRz37zfp7SDd7ROtUJXvs7nvZ174x46pcLZKVbHv
         81wPVyYg45hcmWrUO6mHSAvbnDSoookqEJ45nUdRLIw4uFh7UNGAlOZ4lUT/m0Xg7fLN
         /XB6fzZOd5nIKLA10XfwOgoMDdHD/xfvZCNe6YxcRsI+5CNT7k1tydoif335M1nB5WQG
         LzLMzjs16RRLP4XMNEzGVwUcMGZgFqDW5Ju9QWdQ/SuHFxIsxOXR1d3scKIJJS8J8VMq
         Xzb+WplK1wFKfbv6iYRKpGN6YYzzMqz/r3P8yt7n9PQKylg4PxLM77C+pZ7AxvlDaAll
         HoAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761043; x=1699365843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RpWaNlcLLfkPWZLt7oK1Vb3R9g/2Gax2njJPURnY0QA=;
        b=QE4YmOz16+AiXBE+19uh6w0Hd1GwLwVvXJOBSEEGR/SLAgOXL+rF9qf9es4Cgf2A8u
         Yv6bKxq/UZvRbHh5S49tQLZTvqJxdj5dmxWacAw9lHcjayIrN0U/MqqPdJKGhud6ABvT
         9BtHU6aF2jBu0HSJIwAGWwDgxs2eVl4Qk9HklAxccutxBy0SAI3upYAHEdoZ/VBZW3j5
         XbenT8mXqVNthnAVZDKEbrhSuhlyttoNuGfymqTQ2NLPs84rOhoti4U52bCn8uBWTtEY
         A6DwupQ+iJ7ZD5RN818fmd3k+/4wRZEcL2OUdvF9Y2vWokIH0DbZZLZHiQXptzCc883q
         OFgg==
X-Gm-Message-State: AOJu0Yz4exAG1PzurPtbeCcf1wN3YiYkDwLh7QK2LgF4QT+fahxSi0++
	A5rZFjeESLAzo6mRu0XSvgiwRnr0XSQ=
X-Google-Smtp-Source: AGHT+IH+CPWz6UmGD8cP1qNuuCQbvW8wR/1CXncCouXe1uOW7A0Q3ZOeDwKA9lry9teZ5YePKhwNHaNBuZc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:552:0:b0:d9a:6658:1781 with SMTP id
 79-20020a250552000000b00d9a66581781mr226601ybf.10.1698761042663; Tue, 31 Oct
 2023 07:04:02 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:04:01 -0700
In-Reply-To: <64117a7f-ece5-42b1-a88a-3a1412f76dca@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <64117a7f-ece5-42b1-a88a-3a1412f76dca@moroto.mountain>
Message-ID: <ZUEJUQYiszUISROL@google.com>
Subject: Re: [PATCH] KVM: Add missing fput() on error path
From: Sean Christopherson <seanjc@google.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>, 
	Ackerley Tng <ackerleytng@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Tue, Oct 31, 2023, Dan Carpenter wrote:
> Call fput() on this error path.
> 
> Fixes: fcbef1e5e5d2 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  virt/kvm/guest_memfd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 7f62abe3df9e..039f1bb70a0c 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -473,7 +473,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
>  	inode = file_inode(file);
>  
>  	if (offset < 0 || !PAGE_ALIGNED(offset))
> -		return -EINVAL;
> +		goto err;

Gah, I messed up when squashing a fix for v13.

Paolo, assuming you're grabbing all the fixups for v14, please apply this one too.
