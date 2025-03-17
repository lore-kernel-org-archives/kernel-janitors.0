Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07179191F8C
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 18:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742237441; cv=none; b=LBYT9gc4F8TyBPOov/qhxoTfokJBrXUOuWWXiYL6vb4HZuDyCYOM14/2WEx84S0g3WpCx6QokRYjta8w7haisEsMKR7zA9/wF/WUXUSDdIeJxUSTtONWuww6j5HPOWVHRcaghh/yXibmi4KlQioB1s30n0AJaVAz8qEHTrVwVhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742237441; c=relaxed/simple;
	bh=iWJ4xAGHyAnE6QbuCInfzYRvbLTef5OOVfOJYBo5i+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VHYrKU5dFe/4omItv1T4/+0UZRRWJ1ydUNaDn25YE5UKOzNNB+X1wKhT6oDcOSqaWc76qeVmq5wxfToZNBTwiBlsPuI+rRtBhcx4frYjCRAO8WSbrhP29+aWJW/r7K+G3Ww9jUdxv/NuR3S1yexbQMGVcBk0WY2ffLwSAYtU3iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=W5dmuvfI; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="W5dmuvfI"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60009c5dd51so1110753eaf.1
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Mar 2025 11:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1742237435; x=1742842235; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=y9YporYfSyQzR9fHjG0FSGyAoboGZe4a/zGZZOFS0qU=;
        b=W5dmuvfI/IIBtciftBFwehHACOIXudYVpuUFeVXSX7iu1VsU65VuvKOn60qdWydB3N
         BLFusKmTI+kGWN6jHuGTneG509Y7vm0UH76paHNfgPYkp65KP9fP2GEcFQda3qvlDwrz
         gAr2q8CUKbEDj0gzoogstJKyX0Udgn9jtlXGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742237435; x=1742842235;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y9YporYfSyQzR9fHjG0FSGyAoboGZe4a/zGZZOFS0qU=;
        b=xEMPiVBkzpWw5GLhJ+gMimGyVL/vZxl7mIWJ5nSksxOhLseTn6Vdh+0BFkBEJylPE9
         x6GRpe/NUim23R/9WoSMLQnXSCa9LifCqI/megiT4lUv4aQROFlQLbKH7bXt6pOtYJsy
         S1qK2HvN/+K00LQOnBR/l5w3DtyQY6wXdAIdqbNbAX+nCz2kITcta7aNyJO8cf7ggP9k
         C3dq6rM3v/ryAAAjd14Gbof9jDsULlpN2P9MkDHMtS5t8M8dP4tgP2nIxvpl7oX99Ipi
         YWPrrtCcoh0L7uDCUviX5+GH4dr7SyeB5/K2cjkdqTiLrr/0Go3FIkJhaNP9g5CQVeW9
         TQEA==
X-Gm-Message-State: AOJu0YxKYYcjUPgKd9oy67K6CmvJ8Yi0m/zFT6JKg5xqRnX2jRau77go
	c+Qz8pH50WZFl3cPPNJaXZ5LOuuaE8PBosvconA7JqCN3xqonQ6A1pa8lLQE0g==
X-Gm-Gg: ASbGncuMUL2TM2WKbUHIThTkoE63I8rGJDnrDBOl3ixvS1Pyz8zBwX3JkqUHrAjMmDL
	Q/91aN2epW2TPfVCrX/c3cb/mLBjV/kM7tjwJcxQXFo/76MLDNgA6DLkwhp3f36CxPUjvgxMoGi
	ZYsqxOPx2NYL4OXtMI1jRkrukPPgP52i/cbqF4J12sKEz0W0BQaDKrkV3aABTrmyg9fcqwEoO/o
	xaxts+29al1UfukiTh6aBKnRx/KE0FPMWGd8jozO5vG9Fjfd/GX7RIwBitN2Br2zGO0p5gUjC2l
	DUnUkIDPNLMnaasu3s28zRAd9Sc7jiwdypWmuCJ6OGoePf9VPvG7wgvBlB1wz+bfvqgj6rUSm5O
	SiXf75E3c
X-Google-Smtp-Source: AGHT+IGxL8qq8K6CPc1NqDH20ecuw/Yp8JNEr5ICv2xc9Jo0XclrfeIZlq6cbKg4apj7kSkvgGBfPw==
X-Received: by 2002:a05:6808:2289:b0:3fc:11a6:7433 with SMTP id 5614622812f47-3fdf0646c85mr6999830b6e.36.1742237434979;
        Mon, 17 Mar 2025 11:50:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3fcd452130fsm1887803b6e.14.2025.03.17.11.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 11:50:33 -0700 (PDT)
Message-ID: <60ee6fd4-1cc6-4d77-8359-9215e1d604c3@broadcom.com>
Date: Mon, 17 Mar 2025 11:50:31 -0700
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] PCI: brcmstb: make const read-only arrays static
To: Colin Ian King <colin.i.king@gmail.com>,
 Jim Quinlan <jim2101024@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250317143456.477901-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250317143456.477901-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/17/25 07:34, Colin Ian King wrote:
> Don't populate the const read-only arrays data and regs on the stack at
> run time, instead make them static.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

