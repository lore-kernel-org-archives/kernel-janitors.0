Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D8C1F868C;
	Wed,  8 Jan 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736333127; cv=none; b=OqBvWbmKZC4yiDKIiBZJWLHpQnZqdbj3r823R4Wl4sj/VZuKEfN0zhRKvoegt1ORKmmq9FL9yJH26Ka0cF0pQCxnd++QnwzUOa7RruSuHR6k7B65NXUEUcf/fUoSZfW5grRzfFeegZRVgbAPNMjJS0P8FdgQqE7iIRQSxtiOk/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736333127; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qht0dABKxkP+g/4cSX/Fej/Sm/UtA8k+89yAFkMfe33wA1VjgWDBOdUBcT7tDtCcZRphzES4hCfqaqvjY2cfvvnI8AkHOfDV7+L6UgBobL18RWAt2tidUm341Fvno02IFPwG+2ZhfMkpdOwYU7fN3yIT++9F4JAQqtKX1CqaQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e27c75f4so11972878f8f.2;
        Wed, 08 Jan 2025 02:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736333123; x=1736937923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=kKm28Tigtbx7E14Bw4ycFFuX3vugnDJ9LrU4gcoJPo0dHJEK0phqxtCWQegq2XkNF1
         k9etpM+/JGui47xQTs7Q0bWL+6myg8SXrucU5EiMbRpcI1ysmzctNUl07FroyKuYWBxs
         oP9wntbFz57pMpeylyvGtw/PkEpRxXWc5tP5F5H9K31YWFB9ZAvUs1R2+lyr04AFs+z8
         C2Lv3GufnhHE7L+jnR7Jrqm/PBjQMADmFxf6C/3L0DX3R+jlYjOo1pVW1q/qIep63ev1
         BGjXOr0XwyUBekQNsghv9gLgyLhANKONRWbwhh8X5OpFxCSDWT0XRHYlA5pBOP3woBsH
         0T0A==
X-Forwarded-Encrypted: i=1; AJvYcCUTEgRyDGgfYrFTUhun47+k6C6zMeYrTquPwHGe4GZx9a5MWzh6pocIC1GLPnwoNFVT/DyLNtlSAbbknx7R8xg=@vger.kernel.org, AJvYcCXNddyDjUdfp75zKZBlSFLNCZqOhJE3b41Pla2unkMEw6++IpsjkLhf8cnbmrFqO4aYAAGsc0KSQn7NZEQ9@vger.kernel.org
X-Gm-Message-State: AOJu0YxQjkRrgYeDMtcGPPQVzda0M1S/Vd6idKSiAXg0/SLDPnbXkFSe
	yt/ivgUpyzJLVQyW5Xos9rXz9Ywp/85Q4/xgb5uPmkk2NcZA7J5q
X-Gm-Gg: ASbGncuZyHRrBy9R36zbkwQUZ8w0DPbR1NdLtrmTeU8jDsM2wxq8BnmqEiXZ/NLHuRI
	V5sXn7ZZWQCS5/OYSAsBVFO/nB4oONAy81hNN5nBj4jH/T7P2YNbN2gWJAEO6LsIbZ9c6JGKepi
	PsqQiIYrrDoXr3QMBpvnqGNKqsB4Lq75WBw2Ma8HzGqC1So7DGlI+FW9DRNzuOWFrk6ApsJ4mCk
	WoVjqGnOomhfXdnu9fIlRdtQf/oR10JxawSPz/pHbb3/4KBzyBHUOWGGi22C+WrUNxkkLxQl1nY
	7FMRAUvXtQmUcOS7QPlJSNU=
X-Google-Smtp-Source: AGHT+IFC05RsVnDri7hBcipNAiDvv4v04NJxqSjuWjXxYJoiqM5dsFQFv2kFA/if7IL+ERn48ptdsQ==
X-Received: by 2002:adf:a295:0:b0:38a:873f:e31f with SMTP id ffacd0b85a97d-38a873fe683mr1341948f8f.1.1736333122668;
        Wed, 08 Jan 2025 02:45:22 -0800 (PST)
Received: from [10.50.4.206] (bzq-84-110-32-226.static-ip.bezeqint.net. [84.110.32.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e8a326sm16446155e9.35.2025.01.08.02.45.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 02:45:22 -0800 (PST)
Message-ID: <7bf04770-4932-4c46-9b15-1326c05cea23@grimberg.me>
Date: Wed, 8 Jan 2025 12:45:20 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet-auth: fix length calculation in
 nvmet_auth_challenge()
To: Dan Carpenter <dan.carpenter@linaro.org>, Hannes Reinecke <hare@suse.de>
Cc: Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 Jens Axboe <axboe@kernel.dk>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <2abae353-5e30-4dc5-a2cd-26dab4db93d0@stanley.mountain>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <2abae353-5e30-4dc5-a2cd-26dab4db93d0@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
