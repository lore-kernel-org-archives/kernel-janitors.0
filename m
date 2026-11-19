Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795110336;
	b=gCEbrk7FHRJQMcc6sUuMkUpLUuXu6W4nqv6M+lf157Zzpda0r7PK4MlI74D4oJYXhy5R
	 x848b/tkUfH9zWR3fgrKqlfpoVAIrd4H/xbj98JbeE03peMwthBMM9OgtuTyfUUkLjQlQ
	 GvI91V8KSONHYeROJ9Ci1IboKCW722iXWg95toHGHqaM8qG2dFpYj4rRjNncE2RHrNMME
	 gHw4sS/3HHTzwSfKRrnL1Y027B6GEIlZL4gpJ9ce6ZsQRg7yayDo1zSwRVqvf7b+F6+5J
	 AWNwgddVwEzf71YJdpsvtMjsI4vjS+CcTFK/OmJXWeEvkbYNrfdBgOREHVWbsCgKGjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795110336;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-DetectorID-Processed;
	bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
	b=bLqBBCMke1ldJ4FwyUcT60QPLN5b0XZklhvTUPzW3JrQ7wqbJn7cbxlqFs1hUGvPBpT+
	 eieDojqbpkDm3xddJF9sCLYmTTG5wo2wPjt9xECXTqQn3XENFWgUFrWHYZyND9/RNzwH0
	 QENEtAIKtBqLuKvcVRaOuWM7zowPfMnWoWFOMDdSk7IR15tHB7+bCmnYonRP2y8EHh2SC
	 8Oghs0+0oBG8/BqAIYVjhybgSwAFABU/FOeZf8NZhX1IpEYRdkoMOEUX+KT2sYo47UXOC
	 EuX5x5zA7OoVPMFZyjOnHj1NNh3rCNL0F7/mRw+GGcjr+IF+EP+1lspPADkeSBmIW0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=by7CaCeT;
	arc=none smtp.remote-ip=209.85.222.100
Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70EE606A32A
	for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 17:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70EE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=by7CaCeT
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-9908c849564so8739241.3
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 09:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795110335; x=1795715135;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
        b=CHz5nZgMcHs+MWL0ozG6CGU65yoIf/eSanxoLaqUM/NX+jQL2sWHAwzE++ptiqXUSk
         E3R13KXToqmhLK6359/rePW8/xDJtc8gzxrX1NKFAQ/l0so6ylr8mX4ZPkMd901XV/iL
         15GSCN93NH1MBxTHJTOteyzKJ93QvzQTHzONaXmOfSKLhOCdhgGOKwXycy2QZrP+uznw
         dqCRyWYjNUvRbM11yvjMba5y6LkaS8gZT7yxvZsC1vHWzC81nnANpndHtHiTHOVYPZxe
         9VRphEaEKTR3Z4omKo7jUuDI8jbIkoZ0u2QV+Zlj4qTOnGO47K3E46TP8dn+FdGXRH44
         /Erw==
X-Forwarded-Encrypted: i=1; AL+hErHfcvthKbbM9iOZLoaYbuTXijJTBxsnxGIoQCR16is62IjLh2dPndKGYjt3QuIAZ4JdCVUJSXNbjAE8josAIvE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9j7iNcjzvA4PXu4E0tMrrVB9Ta9BNs0Gmh/Uugizk9EmPXiOFp
	pviTC7QiqPf03nq4fj2HvBw8RNhs4Chehsc9/IMSPPP0fhIaT6I1Tvm3NMUu38JpWX0RMYww/aM
	TSTxG7hIzsq8wmFjYnwJwetT5mRb1ASPoE3klEu3aU36+0bKMA8Zu0nSkaevEP33KC2f4OF5lUM
	UaaN4HMkEOYsCtlqt+g/315M7AzJtlruAaDcLzZCbHlZPKHfwXDUVwVeSeU8Jjq+XCfBxfnhgHV
	EYXn57OwiG44yR0C0sfv8gcJhbV
X-Gm-Gg: AYBFou3cYdVOELpDJ7kDOFzAcKsxVRLxXEV26QQGeOjM/sEyur7CoGDs2EOizvhsima
	9wUbxbRAx/fQUwNmb0TKPcPD1OAFCgydkSKu6XTfVtLyJcrFfvoAa0lVPbB5VtkhYLYkiJ0jkiP
	24P5UtSN1EQhpBqB9CExvtjA8P9tLCmuKJPQLi1edh4fVY6nxrpb7o/zd8eBtxYRIhsAo0rxB0n
	f0ghjOasG76RtBgdhPQ3wIcaMikMukqOkGSFnQ1hopuLyoX04z0Z02bB3Kp3qJGXH+PJvR8Jc9T
	kBQZWUktjlik6pVNDB25+vDX9Tol294fMVlleWtFLEjc3oj+Jtu1SNbKR9bs+qersjtkgYL0PBo
	dIe4NEfU81af93uVYUjVjh856scoAO5SKO8gPIt381czM4d3feYXxvgrF///dxPQJhDRQVGs2YV
	c7tVu+EeaYS9Gw04+/gLbdvjbunCfWU5oYoFm9pSCtf6k=
X-Received: by 2002:a05:6102:41a3:b0:7d2:754c:23e7 with SMTP id ada2fe7eead31-7d7396d1b09mr42255137.35.1795110334491;
        Thu, 19 Nov 2026 09:45:34 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e11f276sm56978241.9.2026.11.19.09.45.33
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:45:34 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93e92aad34aso8412385a.0
        for <kernel-janitors@vger.kernel.org>; Thu, 19 Nov 2026 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795110333; x=1795715133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/VO7S31FkGAoSUmTbp7Ige4PXGLZF962QvOeKjSO+ug=;
        b=by7CaCeTprJVkImu3ONyasvW84c1RXHkaofbv8hihSL1ymJXwasmsOPqIz+cqfPdbl
         /rKu+SUPjRVzqfbRr9TRYla9rie5yH+K0BzVf106Vgpuos516Aq93qcq2pWBa6BYzo9L
         NIT8YrMLcixajw9WN2MymqgsgSnJkJeMEC+S0=
X-Forwarded-Encrypted: i=1; AL+hErG9rZJmmPsjypdzuYph3qbBkcTfvPXnKD18H5J1t4tD6CG64GwsowLERVh0Yb2sl+/iTKHA0U/D26LljFZc09I=@vger.kernel.org
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr48357185a.72.1795110333189;
        Thu, 19 Nov 2026 09:45:33 -0800 (PST)
X-Received: by 2002:a05:620a:4443:b0:949:7c8c:54c7 with SMTP id af79cd13be357-949bab7e84dmr48350585a.72.1795110332689;
        Thu, 19 Nov 2026 09:45:32 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb40ea12sm9585485a.35.2026.11.19.09.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 09:45:32 -0800 (PST)
Message-ID: <5c639eb3-f986-48c6-8a09-65d523b79535@broadcom.com>
Date: Thu, 19 Nov 2026 09:45:29 -0800
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: bcm_sf2: Use
 devm_clk_get_optional_enabled() in bcm_sf2_sw_probe()
To: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
Content-Language: en-US, fr-FR
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
In-Reply-To: <d772ca26-d7f4-4857-9278-628b87e2252e@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/19/26 08:37, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 19 Nov 2026 17:30:09 +0100
> 
> Reuse existing functionality from devm_clk_get_optional_enabled()
> instead of keeping duplicate source code.
> 
> The source code was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian
