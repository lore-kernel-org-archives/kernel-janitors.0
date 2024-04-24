Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6AA911CA9
	for <kernel-janitors@vger.kernel.org>; Wed, 24 Apr 2024 01:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713922847; cv=none; b=Q/yIimfXe9m2HlJ3ukDxPw8yJllAIFfHlflnXm4KPUyDfC05COdAyeT/k8v69wKOiwczyWHfLPDULJUazJzHpAN14/W0LO7Bj1UjNZN5LATkjOu7hEdCpAlbE+ZT1DhfJKZLBnWW6WTJ5xflO726WcEoxgEsWb7367P1trw4BlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713922847; c=relaxed/simple;
	bh=cjugTrkq9EQuinxIy1ewahKvQw/H2yFnY2sSql1JwWA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NUwGTRwHF537AeSEKzepo7sAV8cb9E62gGuR+7TnWIcEW82x+x1ZrZbtx9lkcPyxeBdJMffbdKhOl4W65CqpJ8w0wLd3wDV/U2W5c7hY/+l8R5/DvMkPl3YpMvayFtEw2yUXz+3AbarrLUmWIH0FbSSeVR91IAukcckxfYQ0MkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UmsAtxFE; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UmsAtxFE"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2dd041acff1so50010321fa.1
        for <kernel-janitors@vger.kernel.org>; Tue, 23 Apr 2024 18:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713922842; x=1714527642; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DPIL1irM9g2LEJoNKgmmO+T5p0jXWSH5GlZLc/wT9xw=;
        b=UmsAtxFE6YvEXvhZ5gpYqa/CJX0ce17C3C7ftIkAbLCbRJUWII6CfoRqP1MmKocD0T
         JlC81TXud1uYK7eKDXaFIJn3UMERy40B66YtVQBQzT6AOEdhwFm662abbzWDuIsffHKq
         ev8rEj3xm8cWxzQtpGMkz7/Wen1FCx470uuy9HXf22IBhBPtotqkqWlKCU11ipbAeVkP
         isd5F0bQGN592wAVnc4ZGj/ElI1svfUSUMHRDuWBv1qu95oDmgmmpLcYdCOU6ZkRH/lA
         3EmtOOTs1whwKFAXFtuOojDBRek1bt7W5z9rz0X/5TeOvqQQHfITTU96cAj3y6vTneIX
         ZtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713922842; x=1714527642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DPIL1irM9g2LEJoNKgmmO+T5p0jXWSH5GlZLc/wT9xw=;
        b=kf7Y4ArpM6nBseFfZQf9y3NbEQCRphmnCrRwympzd9YcBP7kKWSxrf/NglzIH8nTtj
         u4iQzlm5StxMyGU3I/SyKnXxHAGwkUvhF9mF572iprVSwNvzWDJZ6FNngs5PLOE2kj3R
         i/KQLb3bpzWVlt5VF80ZL6jkcSs0cFxoe78AFECLnpl3kYky7VCMU6cAVKqMtGhnK1Bj
         wHcmmDbBshr6dPQp5f/2/jAE6CSslxoU6NzZfalAqQLnggoemyJ+A6eo/EnjlNqqbPce
         z5cc1DWd1tNFrK6V7Z1jdktcQTS250PDYCdAoGP8YxYGCfYVTdLmt8in8fJN+HPhniEG
         kUtw==
X-Gm-Message-State: AOJu0YwyLFcMczu25HWF2TEkELGHw8TSDjQP0iQr0QHDCRqTpms7kFCY
	ShIC2f9UqNDjo3aS70ztQE6T513AideUlr533MIVRdRcVyvAJMeN3ZfoWEhebZyvs7paZO7pLoU
	A
X-Google-Smtp-Source: AGHT+IHsyT6umzLMRcLfvPzpfv8xgCe5bd2QZPyaJv4bVGU76feTF13GDko9UUig/6qcN/TMchQpPg==
X-Received: by 2002:a2e:9b17:0:b0:2d8:a98d:18e with SMTP id u23-20020a2e9b17000000b002d8a98d018emr498878lji.8.1713922837392;
        Tue, 23 Apr 2024 18:40:37 -0700 (PDT)
Received: from [10.202.0.23] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id jy15-20020a17090342cf00b001e0d9dcae91sm10669806plb.279.2024.04.23.18.40.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Apr 2024 18:40:36 -0700 (PDT)
Message-ID: <8e22e6d4-4c62-4b78-9809-5648537af775@suse.com>
Date: Wed, 24 Apr 2024 09:40:33 +0800
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ocfs2: remove redundant assignment to variable
 status
To: Colin Ian King <colin.i.king@gmail.com>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: kernel-janitors@vger.kernel.org, ocfs2-devel@lists.linux.dev
References: <20240423223018.1573213-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Heming Zhao <heming.zhao@suse.com>
In-Reply-To: <20240423223018.1573213-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/24/24 06:30, Colin Ian King wrote:
> Variable status is being assigned and error code that is never read, it is
> being assigned inside of a do-while loop. The assignment is redundant and
> can be removed.
> 
> Cleans up clang scan build warning:
> fs/ocfs2/dlm/dlmdomain.c:1530:2: warning: Value stored to 'status' is never
> read [deadcode.DeadStores]
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   fs/ocfs2/dlm/dlmdomain.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/ocfs2/dlm/dlmdomain.c b/fs/ocfs2/dlm/dlmdomain.c
> index 2e0a2f338282..2018501b2249 100644
> --- a/fs/ocfs2/dlm/dlmdomain.c
> +++ b/fs/ocfs2/dlm/dlmdomain.c
> @@ -1527,7 +1527,6 @@ static void dlm_send_join_asserts(struct dlm_ctxt *dlm,
>   {
>   	int status, node, live;
>   
> -	status = 0;
>   	node = -1;
>   	while ((node = find_next_bit(node_map, O2NM_MAX_NODES,
>   				     node + 1)) < O2NM_MAX_NODES) {

This mail cc linux-kernel@vger.kernel.org, it would be better to only
cc ocfs2-devel next time.

This patch is correct, but it's a very trivial fix. I am not sure if
Joseph is willing to take time to push to mainline kernel.

Thanks,
Heming
