Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1F9C147
	for <kernel-janitors@vger.kernel.org>; Tue,  4 Jun 2024 14:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717511476; cv=none; b=eQjUNBx/poIBTA6VyoouajjuWvTd7g0VyJntOd/W+9Ac24Qsb33gdr/wxsOfwwKPxtIgugcL7YybFKwxVJjA1mbAhZG6m/1QSlJXkxJVz+VwsQc9CuBhn+C77L0iHc2VAjd9awY83HMD/7/ql2DKdOibxcugm8PgS41aB4mv/TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717511476; c=relaxed/simple;
	bh=wyePXwAxkMqCXIcx+41jHRC/gZYDXyThMt5kNSMQuZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oq5pnuJnobOewS1xIQsb8JXWweLEhZcH/qZ0ndSABhiJz+r4JRjw0eUFWA0aEqkmCZjX8empLmbVVhexNR1iPvU2JY2YnsldOqJBa9QkdJZ7Txf9Vi8O/M+i74ccMnAYGti6aoUx4UXMh+N+YnMkIGCsUghhDRJsV29CQA2spQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FnGAeiu2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FnGAeiu2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717511472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gzSWB1uu8SnFXUqQQbZ1ZdBme8dM2DhgxeTgLVp11LI=;
	b=FnGAeiu2b0kd7cpv+1+dL+GKz/zdv8QG3YYL1wV9+V5cw2YbV7zGgD7UdwYz7QcSubIOtL
	OanDNIMKqOxZRPOpM6zcG93oDdIcaBFGQ7u+q27EtMjCbLP8OxL77bsNzu7iOO9NjK3ZQY
	yDdqE/ddDOUhu8B1dh7VXjfz+areulA=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-rFbyE4SrMDuRTdKbYfb0og-1; Tue, 04 Jun 2024 10:31:10 -0400
X-MC-Unique: rFbyE4SrMDuRTdKbYfb0og-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-57a7946685aso869096a12.2
        for <kernel-janitors@vger.kernel.org>; Tue, 04 Jun 2024 07:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717511469; x=1718116269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gzSWB1uu8SnFXUqQQbZ1ZdBme8dM2DhgxeTgLVp11LI=;
        b=BRvkHJfOq39TQaIVZ774rXHTW/3OCvr82sOBd/koXHmTJQa+W/D1bFY8DVxlwbhpjm
         fq2lHghxpRwRMuqyE3QouYMQm2brLSCsBLYQSHcI9k8jra7QRrXxR97EwdRsSM7gAGfa
         Ft2CqO0CJxMds+I1IyPjrj/dbplq3hz9WC0eAVGxy5gC/3NOo2eP4AZw50oGVgh6zhPG
         o6nySSPIPT1HFvd0EgzVB+ZyXhhOcjvPJ+s075gfebhs0SZZciX8kxQ00OYzaZJmpuIo
         NOI5uXPjqCOObAQOmRBKyZdBo4eoKUsGgBsarRaAjvLWBAzE34H8jwT1qZ89TcNWX/t/
         8DnA==
X-Forwarded-Encrypted: i=1; AJvYcCUOqB1ijdUTvWJcSjVSwI/+OjWqSLrQu41JR5UoEakavlRA0z6Enu6UCM4LxPnJozwghkWejIbhmW27c5YcBSvKveFWFKB5vNqnKyuklXbY
X-Gm-Message-State: AOJu0YynSOdAackEuyPRQ+3ldf3pI4sTLKne9Gk7zb1HHUBjPVA6bodO
	2mKUPIVcbwWsefUjdyL9I1XQRRrgsqmdM0gXcUeD2prOS/v+0VCqK/9V8Y4iazhvQa0/wFt/mvE
	CSN1e3zOwJCLK2r7o4fVxFR8++WM8LfV5zB0bZc9S7vycRQbb65oLTRS9KyCwImuq9RGswNCsmA
	==
X-Received: by 2002:a50:f616:0:b0:572:4041:5637 with SMTP id 4fb4d7f45d1cf-57a3638f302mr7897279a12.19.1717511468902;
        Tue, 04 Jun 2024 07:31:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKz9ykShYqx98nKzJWNWXfA6S3FKbkIGe+3J3S5MNrtNmnUpiyilWNsHcrQEEB+GSK2sKi9g==
X-Received: by 2002:a50:f616:0:b0:572:4041:5637 with SMTP id 4fb4d7f45d1cf-57a3638f302mr7897258a12.19.1717511468461;
        Tue, 04 Jun 2024 07:31:08 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:e7a9:b143:57e6:261b? (2001-1c00-2a07-3a01-e7a9-b143-57e6-261b.cable.dynamic.v6.ziggo.nl. [2001:1c00:2a07:3a01:e7a9:b143:57e6:261b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a66ed0d68sm3377025a12.63.2024.06.04.07.31.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 07:31:08 -0700 (PDT)
Message-ID: <85109720-0d0e-4c35-8cf5-02d8c883f13a@redhat.com>
Date: Tue, 4 Jun 2024 16:31:07 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] HID: letsketch: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <20240604-md-hid-letsketch-v1-1-ff38ae7b4cb0@quicinc.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240604-md-hid-letsketch-v1-1-ff38ae7b4cb0@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/4/24 4:20 PM, Jeff Johnson wrote:
> make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-letsketch.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/hid/hid-letsketch.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hid/hid-letsketch.c b/drivers/hid/hid-letsketch.c
> index 97f047f18136..229820fda960 100644
> --- a/drivers/hid/hid-letsketch.c
> +++ b/drivers/hid/hid-letsketch.c
> @@ -319,4 +319,5 @@ static struct hid_driver letsketch_driver = {
>  module_hid_driver(letsketch_driver);
>  
>  MODULE_AUTHOR("Hans de Goede <hdegoede@redhat.com>");
> +MODULE_DESCRIPTION("Driver for the LetSketch / VSON WP9620N drawing tablet");
>  MODULE_LICENSE("GPL");
> 
> ---
> base-commit: a693b9c95abd4947c2d06e05733de5d470ab6586
> change-id: 20240604-md-hid-letsketch-53206a0faa79
> 

