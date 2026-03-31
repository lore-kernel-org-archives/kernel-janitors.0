Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8113E122C
	for <kernel-janitors@vger.kernel.org>; Tue, 31 Mar 2026 12:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960832; cv=none; b=h+oElhNQ4KIEM0MX93zdkrGm06WHdJtPlioBCix+OWeeQjP4KpQj7DsODaPjnZHWM6AV2ypePRHWf1hSaX1Dg6i3hRGoQUTbxwOaI2CrzIJdrLosvessZIyGClRaZ3ZhHS+6UjGTjO9y4x5znoSJRm+nOwB0Z406H6ST35vJvfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960832; c=relaxed/simple;
	bh=8pRQ3eacAOC2POnpW0I7/i/Sp8gs+ggqFZSKHlfZdKY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eJneOkc1zyCGsj4TNvADAl22U9xpJ1CmefSmMlehrXLmeDTlSySM860DtVikLnGfS4RKDznvXrcdj/5wDavfOjKjJ72d50QrVcGpLVPmgOjnBoXDdQ1UqQ683qdMCB/SOVTOfOLlZDECzlfdmptQZo4nbNjr6ZdCc0MfpkF3O7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tr0vnnIw; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cMrE+vo8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tr0vnnIw";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cMrE+vo8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774960830;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S8NjDAbsu+6RKz2WffUnh7lNrSqDMbfpxA63M0QQ7pQ=;
	b=Tr0vnnIwtLqZ3K0D4X2sCHCrKONrC2P7U/A4/tFhOJh3ZhR5eUmdBSP+V594z5+S7qlgbR
	hF28q9fu1v2txxnbaqYfdy2vEElh3mkLMpQ3drvHqtPcG0PQ/yh1NKDPjc4bCnt0lRbkGU
	0R7wI40NaIPA9AApQSuT01koS1ihKf8=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-dmt_JBG0O4eHGWe5m8LWhw-1; Tue, 31 Mar 2026 08:40:28 -0400
X-MC-Unique: dmt_JBG0O4eHGWe5m8LWhw-1
X-Mimecast-MFC-AGG-ID: dmt_JBG0O4eHGWe5m8LWhw_1774960828
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfc1bc572cso1630115585a.3
        for <kernel-janitors@vger.kernel.org>; Tue, 31 Mar 2026 05:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774960828; x=1775565628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8NjDAbsu+6RKz2WffUnh7lNrSqDMbfpxA63M0QQ7pQ=;
        b=cMrE+vo8cQnsHdMghR2zIfGQQkN7m2Fzzpvzpj+k0G3ZHVyVnod1/5bW3gdoRhGajK
         Vaj2T7BdERKEY9Wu9MAcOg4DHXOrcdfSKPTsZHaOOdZ0FgNKOXQ1RSXufzNj2D9mVaSF
         h334F7YWZ7mplH8aBtFxs/YE8Sm+9Ql+UW5a8wQI+0UKYwWC/fFBkkFHxToSOoKVzLvn
         AK79UVwUq/NyaxXjzvOolpTcuiQXl6EcV612m3VDu0HHOP1qx7XvU3D2p1mKOsb+4nbk
         cKawjjZKVifz0c/eEKPHE9ZBScN2Bpe2qThsqiwIoD1ryQL7BM/gtWyl/0AcyBHahcZW
         eOTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774960828; x=1775565628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S8NjDAbsu+6RKz2WffUnh7lNrSqDMbfpxA63M0QQ7pQ=;
        b=aXILvi/X+lN//0rSIYEJ4uqTET4Wp3rV0j8ZpigA3MeF2jlwSG0m8UXQyK1z05m7Ot
         mEkHp97CbTp8vt925srXc3XMuYwwU7YYwYC0sToEG+tKPePhJz9q0W19dfmo//V4tIqp
         82qCifVfCqF9g9iIDRBzvGakLkN5wpOEuczJjADA+k/7aIkH9pRDGnT+gtlPlpKb6hQK
         kd7f3Dx9Rsie/TI6sgJOlb1ffxsVHUCJn3f8LtB+S5QFadL4/pWPxIbqQGQZOtntPfsH
         MXuU8L13ersedKZMnW9q/Vtysh3c+rgMfKGOy94w86f3i99ifZ2j6JZRG/eb93di88Pq
         t7nA==
X-Gm-Message-State: AOJu0Yxz45SUdG+D4GFRKNaOKZc+HkbcyBnmj+P0lVZE5IJeWTTdOLhA
	edzUoJkcvRftnZ/Vmr+p7vm1lOdapiorthKjdQz2YvR2gPxBy3ovgYhm7VW6dmuh1O/sRmgu5a2
	9L1MZJAjIZAAiaQrTOYe1YEQjJkE+oWgkVJyN2oP10uTH52KoP9yzBD95YqY9FjzsVD6XEirh00
	Z4HsaDJ4g=
X-Gm-Gg: ATEYQzzp9qK3YY8ESQF5QjsjIah2SqaEKWlPR/qNZNWnD/iYIlTYmsEC0Z38vynht/F
	m75hXhyukIwK4+1Xd/klDoTqVWNV6VUtB1kbDP3d7yWfQ2D3+1XWDEUtBzpwpwftYwbuLz0LNXK
	vszBKtAvCYybabq8cj2V3UxHxzLHwRIhlydXC/GS8gpHcybFWIXmV4Dxdxm4ntQF72onD+jGTSy
	GiKEth0rkfvwrH3oY/l5zLllvxYBN2pMoub/WwNMkXzikuphR19GnoP45qUDiV+3kJs+j6HU4Xt
	HvSO1iSQ7J2bWywTjzWd/n5NMVcGRscXRZ4Rvh0ZSoC0FaSVG0R4/BQVIVxOIcI1vNWaOtLas2K
	Px93QD4CgSfoyLoAVASQ1I2zx6zwYr9/SuRN1gt0uyFNy7UifOBTnVpI+oi8DHAOAikRsFQ==
X-Received: by 2002:a05:620a:170f:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d01c7dfce9mr2000972185a.54.1774960828126;
        Tue, 31 Mar 2026 05:40:28 -0700 (PDT)
X-Received: by 2002:a05:620a:170f:b0:8cf:be85:ba84 with SMTP id af79cd13be357-8d01c7dfce9mr2000968085a.54.1774960827621;
        Tue, 31 Mar 2026 05:40:27 -0700 (PDT)
Received: from ?IPV6:2600:4040:530f:2500:540d:8da2:f197:6711? ([2600:4040:530f:2500:540d:8da2:f197:6711])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d028095097sm864634485a.46.2026.03.31.05.40.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 05:40:27 -0700 (PDT)
Message-ID: <854702a9-a3ae-46c8-a3d6-88dfbc4fe97b@redhat.com>
Date: Tue, 31 Mar 2026 08:40:26 -0400
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] dm vdo: Fix spelling mistake "postive" ->
 "positive"
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>, dm-devel@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260328123320.657837-1-colin.i.king@gmail.com>
From: Matthew Sakai <msakai@redhat.com>
In-Reply-To: <20260328123320.657837-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/28/26 8:33 AM, Colin Ian King wrote:
> There is a spelling mistake in a vdo_log_error message. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Matthew Sakai <msakai@redhat.com>

Since this is a change to Bruce's recent series, it might make sense to 
fold this into one of those patches instead of applying it as a 
standalone patch.

Matt

> ---
>   drivers/md/dm-vdo/dm-vdo-target.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/md/dm-vdo/dm-vdo-target.c b/drivers/md/dm-vdo/dm-vdo-target.c
> index 0135a6f941fd..1d8375cc3c3e 100644
> --- a/drivers/md/dm-vdo/dm-vdo-target.c
> +++ b/drivers/md/dm-vdo/dm-vdo-target.c
> @@ -412,7 +412,7 @@ static int __must_check parse_memory(const char *memory_str,
>   
>   		result = kstrtouint(memory_str, 10, &value);
>   		if (result) {
> -			vdo_log_error("optional parameter error: invalid memory size, must be a postive integer");
> +			vdo_log_error("optional parameter error: invalid memory size, must be a positive integer");
>   			return -EINVAL;
>   		}
>   

