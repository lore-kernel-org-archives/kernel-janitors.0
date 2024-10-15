Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4CF81B0F3C
	for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 22:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729031252; cv=none; b=r3Q6VMa7aXO9CSw3eVLqPEUqjoilf2JS7h9CuLYrFhvsS/DYQNjJiL0pVPeaoJlKssPBHTOQtc+FDoQjBe7J8l7NRw4b/T59xtilrKyLhFIAOeLxpBFtWpU20nCKkysNDYwgKIBAMGwf2lQC5mdFRYBatCihKcZVTeiq69uqQ0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729031252; c=relaxed/simple;
	bh=xVhvvC5KYY4SRqxAEOGfcTdYI8AtS4CtPdx9l9AtehY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikrv60HRj0MD3r/A6Vg2qFer5JVz4jvoDv84/FJjy4yjF+A2VRqsXyoAqr2G1InYQGFvxoOxyXRfyzLCxzDLP9JdR6IduGX9VD8QOz1Rwp22NPiHy8a6cUJcfH5XUbx57V6XRuGhziaFJ2K6y53YQfiE0DMCUzAadl8LkiM9aow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UaxgXqsd; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UaxgXqsd"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3a3a6abcbf1so25370125ab.2
        for <kernel-janitors@vger.kernel.org>; Tue, 15 Oct 2024 15:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1729031248; x=1729636048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbqYbvbPHC7jsWcXXkq+myvuos/TZJsUv956mH28u+g=;
        b=UaxgXqsdceQ6joCiLq8pO5hN9qUlKClgJ5UgVX5qWYbQM4pZDD5+j7e7d9fQP5S6ER
         T3QVe0IdHg3HW73r24LR9eYlUFv7ck6b9nKxumZ/YhMZNsVb96RQtakdh7Zs3L4Luwxp
         3Gnq+6hgqC9u1/yuttSgj3zSGEJukEh7/mkoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729031248; x=1729636048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbqYbvbPHC7jsWcXXkq+myvuos/TZJsUv956mH28u+g=;
        b=g3UUJ1MQI9ZMghFSb7vsqBHYcgsXfRPI5PHdt5KgorHD8terlY/3q7XLi1k0vqhpN+
         WYaHHprnDjlsWSWk1L6j3RmRqHt3qC10YPJrtKgQxIChQ8aU50b+2PxBjiixDHQTcmHF
         S+EKXIFBxkQuHXmUXzYlmVFCs49g4KCrAkOCoWo0JR+QNaBgh04VBq1BY2K5V7cmRpir
         rTgL4QlTsGxJfjHjDqGQKodu3Bx/oN2LtD1OWkpkkaxHnoBIKG9rZUX9wEhKRAsuCfRP
         lJsGg/sjaHEUNXUdrKpUHjf9ETXJ7OAzG+0vRuCQRaIrDcBCrG4Azu2tyE8LRY1WVFi2
         rfrw==
X-Gm-Message-State: AOJu0YwOj5yvA6pOfrxKOIVi+M/Ft88/CGsrdmCtm/sft4ha7fDyIaOC
	O4ACcOhFN1cTGEa2beZr1xEHNuaShGLhoIIAlEuMx5msVbZBjGq209pOZYlQegQ=
X-Google-Smtp-Source: AGHT+IE5if0ZnJaMCA5ubjPTpbcHWlT2DX0oWEry1+1YMZ0iEPhjqRzrVg9N4kV0pU85MnDBXLpQPg==
X-Received: by 2002:a05:6e02:160e:b0:396:e8b8:88d with SMTP id e9e14a558f8ab-3a3b5f61a5emr157523925ab.11.1729031248033;
        Tue, 15 Oct 2024 15:27:28 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dbecb38cb5sm515234173.114.2024.10.15.15.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 15:27:27 -0700 (PDT)
Message-ID: <f7c92929-dcda-43f5-a163-9a167abf0de6@linuxfoundation.org>
Date: Tue, 15 Oct 2024 16:27:26 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3][next] Bluetooth: btintel_pcie: Remove structually
 deadcode
To: "Everest K.C." <everestkc@everestkc.com.np>, marcel@holtmann.org,
 luiz.dentz@gmail.com, Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20241015193013.16790-1-everestkc@everestkc.com.np>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241015193013.16790-1-everestkc@everestkc.com.np>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/15/24 13:30, Everest K.C. wrote:
> The switch case statement has a default branch. Thus, the return
> statement at the end of the function can never be reached.
> Fix it by removing the return statement at the end of the
> function.
> 
> This issue was reported by Coverity Scan.

You forgot to fix the typo Dan pointed out in the short log.
Don't forget to include reviewers when you send new version
based on their comments.

+ Adding Dan
> 
> Fixes: 5ea625845b0f ("Bluetooth: btintel_pcie: Add handshake between driver and firmware")
> Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
> ---
> V2 -> V3: - Removed that the change was successfully built
> 	  - Removed the link to Coverity Scan report
> V1 -> V2: - Changed "Fixing" to "Fix" in the changelog
>            - Added that the change was successfully built
>            - Added kernel-janitors mailing list to CC
>   
>   drivers/bluetooth/btintel_pcie.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel_pcie.c
> index e4ae8c898dfd..660496e55276 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -391,7 +391,6 @@ static inline char *btintel_pcie_alivectxt_state2str(u32 alive_intr_ctxt)
>   	default:
>   		return "unknown";
>   	}
> -	return "null";
>   }
>   
>   /* This function handles the MSI-X interrupt for gp0 cause (bit 0 in

With the typo fixed:

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah
