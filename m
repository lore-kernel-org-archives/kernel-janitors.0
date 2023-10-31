Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBED1DDF2
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Y0Rr9HkV"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65021ED
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698761122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=b3+IDD/zfis6WmMbv8JkX7GvGsvp9oF9UGR72Q5DJxI=;
	b=Y0Rr9HkVIIXpimRJxY7e/0P2rCXivEAetP+VXf+8Ydgj8k5DxaHhj1VqZU6JVigZVSH41a
	9DTCeWrNYOtRIQs2FW/E9eqNCqJS+J0HF926E60PfOQx79KjjWa7crurNoYegycjjZoyu+
	2FDj/Sig1dhdaBv0dF8SWOVAapaUhdg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-S0A3J8TjOcuhp5I1_Co7oQ-1; Tue, 31 Oct 2023 10:05:05 -0400
X-MC-Unique: S0A3J8TjOcuhp5I1_Co7oQ-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-543298e3cc8so1652825a12.3
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Oct 2023 07:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761103; x=1699365903;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b3+IDD/zfis6WmMbv8JkX7GvGsvp9oF9UGR72Q5DJxI=;
        b=n1m66Ovh/XqbZ7V0M7bbb1B3vzjtfdLddfsufF1uZr/xuwH33AV+F26n4brp+owEq0
         HR5jks8Em6No3bIuBv4HW4XOqVSyWSqrby3ZPt7qmiExxCCjltyalrb8kqpjAZirL6Ee
         wryTLra9POBj7rLF4TXdYZqAPscnIrkILAigsZX30epSrxjHvq0eC31hF0AKM8sBeOM9
         7OkHv/LL9AO07OM//512m3qi0tWZzfVV+XD8nF6G/PNEoeWlSskDhnuyjf+L099fQokt
         +YKUHHEz3PkIjQ+aVa4vKH7f8Ryc+bTixz4cT4L51uxTOIu/w906kvMu58UjQLrL/UhY
         sm+g==
X-Gm-Message-State: AOJu0YxFTrxg1GS3sZWcfVhgX8BlfO/DCyjbX7mTLTmhSDuNw0EZPnt5
	pPE0Iw6oGFaxh4GZ+1GvGeQhB5xsmBVkKnfetE4dUc7fJuD8437qZ86Q5XBGA3d/m13+F9lXVQo
	n8QVfQayj3zbPDwOd4kUZ/KcOsrk9
X-Received: by 2002:a50:9f21:0:b0:543:5b61:6908 with SMTP id b30-20020a509f21000000b005435b616908mr2688973edf.18.1698761103187;
        Tue, 31 Oct 2023 07:05:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/3bnW3ujZbhhfg09W20sfZCeii3XoDwWmA9FyvDCB0gAGy5rkuqM3n7qS5VM/IUq0Q0gU9Q==
X-Received: by 2002:a50:9f21:0:b0:543:5b61:6908 with SMTP id b30-20020a509f21000000b005435b616908mr2688949edf.18.1698761102840;
        Tue, 31 Oct 2023 07:05:02 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:63a7:c72e:ea0e:6045? ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
        by smtp.googlemail.com with ESMTPSA id f18-20020a50a6d2000000b0053e5f67d637sm1199012edc.9.2023.10.31.07.05.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 07:05:02 -0700 (PDT)
Message-ID: <27596365-7796-4009-9bd1-b4640b03bb5b@redhat.com>
Date: Tue, 31 Oct 2023 15:04:59 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] KVM: Add missing fput() on error path
Content-Language: en-US
To: Sean Christopherson <seanjc@google.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Michael Roth <michael.roth@amd.com>, Ackerley Tng
 <ackerleytng@google.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, kvm@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <64117a7f-ece5-42b1-a88a-3a1412f76dca@moroto.mountain>
 <ZUEJUQYiszUISROL@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <ZUEJUQYiszUISROL@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/23 15:04, Sean Christopherson wrote:
>>   
>>   	if (offset < 0 || !PAGE_ALIGNED(offset))
>> -		return -EINVAL;
>> +		goto err;
> Gah, I messed up when squashing a fix for v13.
> 
> Paolo, assuming you're grabbing all the fixups for v14, please apply this one too.

Yes, it was already on my list. :)

Paolo

