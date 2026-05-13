Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692433DEAC0
	for <kernel-janitors@vger.kernel.org>; Wed, 13 May 2026 08:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778661716; cv=none; b=mE4Bj5NF0X0qMv0IL5qmS/LIlo8ByMp1U1MtMaeRpXH84x1bCtqMGfop1D1F+K0V9MWMImoAJSba7/rP/DzNdHUQXDkjt2w2oZjLF5c8GimOzgpnPI03uSoxcKF/CoGbmKg4KeUHfJ1MJoApKz5XOOpnt8RQ+XUxmk10BVkzA5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778661716; c=relaxed/simple;
	bh=a/A/QAwYDIuXO9hludzBKfp4iZ9g/WysDQJ6DtbRlFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=On8p5+nMhciKwEnfZ7wbUsaO4wN+2VFxqoUqqIwYlyhUuEBnh2+3tlwVwHoq1PayzG/8oPQdHZt0576b4z73lEp86AekT4/XSdsbV7UyygPDrl6CQrg90l5baTVs5zP4pI9+s/TWZylH8Cbj068ZSTeLgPxDgQ2rd6bGX0lXdZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=FsPG+VKE; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="FsPG+VKE"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-449d6c68ed8so5554088f8f.0
        for <kernel-janitors@vger.kernel.org>; Wed, 13 May 2026 01:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1778661702; x=1779266502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9uV1Ueehf+Jw7EklyWxhA5nqKgG1oWtDFQC5CVmm3Q=;
        b=FsPG+VKEcOxuQpItk/W4IYopCHPJ6IPzYH7Lb/bj8rJ/8XNbSSz21u8zHbMpqMhndC
         NaKkMBgQevq/OfqQsxg7J3C1Mf3qe5Ul8Gggvm/anjk2sQbqHnrvNErlBKBkSybTN4KA
         yDjsqA6xlh5w71RnmYcNXYPT2M6kqEkZke1K2Aqo7VRoHWgy+1rBe29mNU9u0sF8yFAQ
         d5xVKah8CBqXtRyMUZXkuJStO10bN0EBBX3Js10VhYo/uq7rZPJraJLm4QPm9AIL3e8X
         kqwEnGYTlcE85VTw1EJLjbLwmsDrkBGqecVmYBddAykzzdeEr9rLL7SNVEEbjcO43CQS
         wh9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778661702; x=1779266502;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9uV1Ueehf+Jw7EklyWxhA5nqKgG1oWtDFQC5CVmm3Q=;
        b=MS90f9g+vam+BhvuQjJFJFQ+hJT3xfygNMt0T9nR0q7K6DQvSqxvsywJg4k7JXN1Ex
         Kzq5dRMThbq4Sd06CyUPNpX7WJS1kYC/tLVW6wMfc4dDnzxbjQ2NnmVDpfjqKWR984tA
         Vmon133jqA/K1zzytGxlq0dRZYFE3tkUH3dc2FsM5bRbEpgBVAQyjwClkH+8Gzs/X1YG
         Mu6WoqXY/BeEzeYtMiI2BeJtEirDQMQbB0ImdNm7+elCXCIbHuuRQEiA5CD1ljv9F1kI
         vhY40j22eh+NOWkrABip4up66+yxA3zYwuvMmzUZWuPhFwnHV118LLsdkx06rAcuhfde
         P+MA==
X-Gm-Message-State: AOJu0YwQMAX2n0FUv0+uj5ZCxvOMbJw0x0tOemZMw9cchpjxaQY7D0TI
	QgVdX6sYXFP1kulBiTzfE9JjzJbTjL+vf6CTN9OM9elFETsqifK6jgtnvRdFPLJwy9YyBA3Yo3e
	WdNNZJYva8FRoZJuPdnpOQRhnLFPauDj9MnP8yiBiuMCci3ys06aac1UEkLuBXsM=
X-Gm-Gg: Acq92OG9RvCTjYWtW7810b4GyBgqYBr5Ph8NZgAYEHIVG2DxyTf+4z5y80YZZ3DmuUP
	4QmgmYcblWl4DxS1wFOjZ1uGfwfCJrxtQZzhitiX4JUG7wA9bIG12ODZBSvfIuLlBjB1hH8g+Z3
	55Z4LvrYwIGqu+yHZqwTHVbQMumY5Oi6BM1OPwC/ChIDTo7l9Sa2sKC2zdHgkPNr7UMdRXEWscR
	GB7zqKlJjwxDs231KgOfUtKefMEAcouRbhqhjjBnVPkW1duQu51MOVXwYaqiWgn2vtoTAHJJ1cF
	SmVwSxU9PzgdmMXdiB4tvSB9fKir9D377AlMUAwWuEYd2V96EV5h01B8cHbkRfI19EBSARIVgfe
	3gEAOhc5QSEtg4r3WwChto5R03k6AD4JNAXOQFX7njvHS4hgsKz4OtUOVBlNEzeqswfj5ul3WJi
	iIFoZicGxAX7AWLqB1FHEkTNbr2mU3Bs9RUlhqB9CfbBbiBxciS0OvRNJ2sCxqZcXfxg2Hddor
X-Received: by 2002:a5d:5f45:0:b0:45c:1c89:b1c6 with SMTP id ffacd0b85a97d-45c5a0ae380mr3497610f8f.33.1778661702032;
        Wed, 13 May 2026 01:41:42 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:1f37:1bce:f581:7f7f? ([2001:67c:2fbc:1:1f37:1bce:f581:7f7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6cd75sm37584116f8f.16.2026.05.13.01.41.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:41:41 -0700 (PDT)
Message-ID: <aad4cfba-6781-4a74-81a8-9fc635f44aa3@openvpn.net>
Date: Wed, 13 May 2026 10:41:40 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ovpn: implement packet processing
To: Dan Carpenter <error27@gmail.com>
Cc: kernel-janitors@vger.kernel.org
References: <agLovl_hlXHNhnLi@stanley.mountain>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 xsFNBFN3k+ABEADEvXdJZVUfqxGOKByfkExNpKzFzAwHYjhOb3MTlzSLlVKLRIHxe/Etj13I
 X6tcViNYiIiJxmeHAH7FUj/yAISW56lynAEt7OdkGpZf3HGXRQz1Xi0PWuUINa4QW+ipaKmv
 voR4b1wZQ9cZ787KLmu10VF1duHW/IewDx9GUQIzChqQVI3lSHRCo90Z/NQ75ZL/rbR3UHB+
 EWLIh8Lz1cdE47VaVyX6f0yr3Itx0ZuyIWPrctlHwV5bUdA4JnyY3QvJh4yJPYh9I69HZWsj
 qplU2WxEfM6+OlaM9iKOUhVxjpkFXheD57EGdVkuG0YhizVF4p9MKGB42D70pfS3EiYdTaKf
 WzbiFUunOHLJ4hyAi75d4ugxU02DsUjw/0t0kfHtj2V0x1169Hp/NTW1jkqgPWtIsjn+dkde
 dG9mXk5QrvbpihgpcmNbtloSdkRZ02lsxkUzpG8U64X8WK6LuRz7BZ7p5t/WzaR/hCdOiQCG
 RNup2UTNDrZpWxpwadXMnJsyJcVX4BAKaWGsm5IQyXXBUdguHVa7To/JIBlhjlKackKWoBnI
 Ojl8VQhVLcD551iJ61w4aQH6bHxdTjz65MT2OrW/mFZbtIwWSeif6axrYpVCyERIDEKrX5AV
 rOmGEaUGsCd16FueoaM2Hf96BH3SI3/q2w+g058RedLOZVZtyQARAQABzSdBbnRvbmlvIFF1
 YXJ0dWxsaSA8YW50b25pb0BvcGVudnBuLm5ldD7Cwa0EEwEIAFcCGwMFCwkIBwMFFQoJCAsF
 FgIDAQACHgECF4AYGGhrcHM6Ly9rZXlzLm9wZW5wZ3Aub3JnFiEEyr2hKCAXwmchmIXHSPDM
 to9Z0UwFAmj3PEoFCShLq0sACgkQSPDMto9Z0Uw7/BAAtMIP/wzpiYn+Di0TWwNAEqDUcGnv
 JQ0CrFu8WzdtNo1TvEh5oqSLyO0xWaiGeDcC5bQOAAumN+0Aa8NPqhCH5O0eKslzP69cz247
 4Yfx/lpNejqDaeu0Gh3kybbT84M+yFJWwbjeT9zPwfSDyoyDfBHbSb46FGoTqXR+YBp9t/CV
 MuXryL/vn+RmH/R8+s1T/wF2cXpQr3uXuV3e0ccKw33CugxQJsS4pqbaCmYKilLmwNBSHNrD
 77BnGkml15Hd6XFFvbmxIAJVnH9ZceLln1DpjVvg5pg4BRPeWiZwf5/7UwOw+tksSIoNllUH
 4z/VgsIcRw/5QyjVpUQLPY5kdr57ywieSh0agJ160fP8s/okUqqn6UQV5fE8/HBIloIbf7yW
 LDE5mYqmcxDzTUqdstKZzIi91QRVLgXgoi7WOeLF2WjITCWd1YcrmX/SEPnOWkK0oNr5ykb0
 4XuLLzK9l9MzFkwTOwOWiQNFcxXZ9CdW2sC7G+uxhQ+x8AQW+WoLkKJF2vbREMjLqctPU1A4
 557A9xZBI2xg0xWVaaOWr4eyd4vpfKY3VFlxLT7zMy/IKtsm6N01ekXwui1Zb9oWtsP3OaRx
 gZ5bmW8qwhk5XnNgbSfjehOO7EphsyCBgKkQZtjFyQqQZaDdQ+GTo1t6xnfBB6/TwS7pNpf2
 ZvLulFbOOARoRsrsEgorBgEEAZdVAQUBAQdAyD3gsxqcxX256G9lLJ+NFhi7BQpchUat6mSA
 Pb+1yCQDAQgHwsF8BBgBCAAmFiEEyr2hKCAXwmchmIXHSPDMto9Z0UwFAmhGyuwCGwwFCQHh
 M4AACgkQSPDMto9Z0UwymQ//Z1tIZaaJM7CH8npDlnbzrI938cE0Ry5acrw2EWd0aGGUaW+L
 +lu6N1kTOVZiU6rnkjib+9FXwW1LhAUiLYYn2OlVpVT1kBSniR00L3oE62UpFgZbD3hr5S/i
 o4+ZB8fffAfD6llKxbRWNED9UrfiVh02EgYYS2Jmy+V4BT8+KJGyxNFv0LFSJjwb8zQZ5vVZ
 5FPYsSQ5JQdAzYNmA99cbLlNpyHbzbHr2bXr4t8b/ri04Swn+Kzpo+811W/rkq/mI1v+yM/6
 o7+0586l1MQ9m0LMj6vLXrBDN0ioGa1/97GhP8LtLE4Hlh+S8jPSDn+8BkSB4+4IpijQKtrA
 qVTaiP4v3Y6faqJArPch5FHKgu+rn7bMqoipKjVzKGUXroGoUHwjzeaOnnnwYMvkDIwHiAW6
 XgzE5ZREn2ffEsSnVPzA4QkjP+QX/5RZoH1983gb7eOXbP/KQhiH6SO1UBAmgPKSKQGRAYYt
 cJX1bHWYQHTtefBGoKrbkzksL5ZvTdNRcC44/Z5u4yhNmAsq4K6wDQu0JbADv69J56jPaCM+
 gg9NWuSR3XNVOui/0JRVx4qd3SnsnwsuF5xy+fD0ocYBLuksVmHa4FsJq9113Or2fM+10t1m
 yBIZwIDEBLu9zxGUYLenla/gHde+UnSs+mycN0sya9ahOBTG/57k7w/aQLc=
Organization: OpenVPN Inc.
In-Reply-To: <agLovl_hlXHNhnLi@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello Dan,

On 12/05/2026 10:45, Dan Carpenter wrote:
> Hello Antonio Quartulli,
> 
> Commit 8534731dbf2d ("ovpn: implement packet processing") from Apr
> 15, 2025 (linux-next), leads to the following Smatch static checker
> warning:
> 
> drivers/net/ovpn/io.c:207 ovpn_decrypt_post() warn: variable dereferenced before check 'peer' (see line 148)
> drivers/net/ovpn/io.c:305 ovpn_encrypt_post() warn: variable dereferenced before check 'peer' (see line 304)
> 

Thanks for this report.
It is valid and I will indeed remove the NULL checks.

What/who should I credit in the Reported-by tag?

On a side note: from time to time I also run smatch on the ovpn code, 
but I haven't caught these ones. Any clue?
I just ran kchecker on the ovpn folder after build_kernel_data.sh.

Regards,


-- 
Antonio Quartulli
OpenVPN Inc.

