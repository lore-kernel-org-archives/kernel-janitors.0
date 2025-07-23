Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CAC1FBCA7
	for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 17:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753290054; cv=none; b=NUwtqAtK6Ku7xUpkoxeqtZelQpP72tJV7z2zroQcKfr4lTD1/62RF+52+oMuICLZ6B9opBx26JeNCK0unCbbQWQ7+59B6eSObDX/A1XKeoNVLI7KTfyhBMstLe5epZ1my1LNtbfCGCElN9y6hnQCAwexCEggc6zYrA65+VmVQjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753290054; c=relaxed/simple;
	bh=iRwGsir/WS19R8zzyQIzHgcHO3Kn/7CJJeeg7cROVuk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MwDm44OgdACOKJpn879Jg688t3npTrxsv9C+xSeImDFzvSQ4nAyHJAAotG08jLvQkKkPDlxqXUuQPY3tIZ7oEU+IoQK6JbgQlz2ubWKFiBI3q7Ajmn4uTfz2EaxN3LrSpC2wx5tPtFoE8iSqmfwkDH/eBHgnpSIQr3HNpRNEWhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NHbXjZbD; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NHbXjZbD"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7e182e4171bso9859785a.3
        for <kernel-janitors@vger.kernel.org>; Wed, 23 Jul 2025 10:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1753290052; x=1753894852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAA4uKDvogNFqPIVx5Z2Wi5tvRUB0/yTR+8w1NV0hk0=;
        b=NHbXjZbDGDUfBfHJbjVCCTEpctn4bQcs9A9Y46VsX/IE4tbyrOuL+fRKl3juS1PxK5
         7OsSkdQLLmV1L1qgMtS0EnhHN7BXL55ahU8iRRYldn2XpKI8x1EigyfWfb2GtXGtiwsp
         /c0Lba8Hh+XWnQmD+II/9kRB52+rpGR+FGUv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753290052; x=1753894852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAA4uKDvogNFqPIVx5Z2Wi5tvRUB0/yTR+8w1NV0hk0=;
        b=OGjKZn8Mnl/uxf3WE4pG1SmCRb20rNmWR4R5ZkS7jD3PnZExCZpisEj24wtbNyGTMn
         2KzzetRo11gAdLfh0idZBzbF4AbuNdNyC55A5lXg/Tr+TRGegkE9uLMKovASUjVRkgLw
         7EU/XEW5G9+MA0vjZqfF6h/C44hDBRp31n6sVQbjWvkLpIHgViketmMDGKInJRUspWli
         AXT5UltKYl4JXkSd9YarkUV1UjtuaJvFtE/mbpYq7krWLikXY0pdW26Sho3xfsjsqbh5
         YkA7F6i7Bz0C4v0p6pMUbLQgsBCd1dgMrRiZmbwxhK5VmXOd/dMU3XURzcYP25rFZ2WK
         I5og==
X-Gm-Message-State: AOJu0YwTOw2Wu5Lb0PrN1fniSZ+XRNH6e65MrcpLUHPyfeuf+4Nd0KFs
	7FMY7Ur2Kd5rigE89DbhjIdyUtsYMhTcbKYKq8aCasA3fuvVTKp61DyryDQ33Sxr+g==
X-Gm-Gg: ASbGncsEBIhQVtZJior4e9/1xKHvqkrBIvm9BFENJiliFTqXXRH5M8TNYnk2dVzfNdZ
	Y47udfYQlB60pFOAX7nQm0Cq8NGlgxSdn7Ys+b1UrhP1Xyd7rsC4W62eXO6Bo3c0jEfIK09VghF
	4oMJ9wRtTRy4G5A3wcyDV0MveeSFSOZKQLA4hIYOr/Xpj+kwU1ty9biQSvNrb1Ki9KgTK6WMjky
	0HUyIDCL566y+yaKYfcJvjVRPFEf0GpwbUIvcAWuUc6dNFKi7lbNT09zXnWvSW7TEl1sTSWzLVb
	wQk8VmYjtlWAWDKnaHpl0JXuci9KNimaOETyp0DOvDajiRFjMtVg7RRAphjMt8WG2zjcOD44P5B
	O7WeQMC19GZ53J2u1w3LiV9Yf2iYqJVZX+Yjf3HHiH6f9Epi1IvWrShMMXQgEMJm/YTE=
X-Google-Smtp-Source: AGHT+IHR/pIYFUXjIhcVQC11znP3yVLpRzPulMmcdzaK/tiosFIczetxhU6bAr+Fw0aFbrPOIY4giA==
X-Received: by 2002:a05:620a:4546:b0:7e2:3a27:a120 with SMTP id af79cd13be357-7e62a1a7909mr526750785a.54.1753290047833;
        Wed, 23 Jul 2025 10:00:47 -0700 (PDT)
Received: from [10.69.65.106] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e356c77a1bsm687374785a.85.2025.07.23.10.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 10:00:47 -0700 (PDT)
Message-ID: <80d282ef-aa14-4bcb-b118-fa8b237c1621@broadcom.com>
Date: Wed, 23 Jul 2025 10:00:45 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] mailbox: bcm74110: Fix spelling mistake "braodcom"
 -> "broadcom"
To: Colin Ian King <colin.i.king@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250723095315.3999463-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Justin Chen <justin.chen@broadcom.com>
In-Reply-To: <20250723095315.3999463-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/23/25 2:53 AM, Colin Ian King wrote:
> There is a spelling mistake in the author's email address. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Justin Chen <justin.chen@broadcom.com>
