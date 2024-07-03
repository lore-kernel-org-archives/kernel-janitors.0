Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EE82629C
	for <kernel-janitors@vger.kernel.org>; Wed,  3 Jul 2024 04:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719981763; cv=none; b=HdUqB3XHyFT7ZTjAeGVZlWtZghoA7IS9iF8Kj9GqBk+OIr1n80uQj1XoGF0561aJrND9osyzHrwjrsScd/30s7v+sBkfvUehVzvHLNEga3LazZhxJXAuHtqJeHWL/jd1htuu9PmKztRKDumdOEuK1o9vA0yR8AP5WAeC4PSqF+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719981763; c=relaxed/simple;
	bh=gfCaNooUcu+7Qh8mrO7si+zdq0i9sP9mO8mgYEWxGc0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=TZbALXpvbIgOZVH9YqVL9e14QXdhJ13BSJV1LrLqd8oD6ITGTg2izsVhIOFGgvM4bFYl2T0B0bJpssqI+MKVajQ3vC+Io3KEF3SOJN71W3jht3cWHvDq65EZWm37EZTof/kqV2uQ/fDIVk+LefAcVDISJzxlmvj+jUWs73wY01I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ou59dzJ9; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ou59dzJ9"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3d5666a4860so2821303b6e.2
        for <kernel-janitors@vger.kernel.org>; Tue, 02 Jul 2024 21:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1719981761; x=1720586561; darn=vger.kernel.org;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=epCf6Ry7MJxnmW/3hDEgs23ZoiLiMlxZkqJKQQ4BDlA=;
        b=Ou59dzJ93vja51V+8bYoPXC1r29DNOSXzHF060Teyj3Y1uRF8Q9iQfMPV4Lfxx4/6w
         gT80qoO+EarK6pmHqHEfEV40QW6xYmDxaZXnqpVrlMb1CTyXCdee7EV4jfXm/GuHqVit
         YrH3lADp7wQy+GFjVWSglLLFZXBlGbgm2H89I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719981761; x=1720586561;
        h=mime-version:subject:user-agent:references:in-reply-to:message-id
         :date:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epCf6Ry7MJxnmW/3hDEgs23ZoiLiMlxZkqJKQQ4BDlA=;
        b=uvVeHytmwRcqrhfWu+Biezepx6M8zj3zjBgidV63tyirNZrepxt6wYl1iEZHlYz5K6
         C8U/bPIgqCwKgmLbZxu/cj8SLQFeQtRVvp6jWl7uG78mEJH3xsKrHwI+oCAIIsY6SzHA
         Qt40+HI5HEqGwEf+vA1chtskNftRTk6J3ya68ysnb2HqFxq4kp0/JqqyfN7Eicg4w8H6
         EkMFazvktDol4cHRaTJxP/jGcyYyFuemo6nP82JeQi35bhgBbTcd4+d6AXzDTaV2Cp/T
         3Z8uueTDfg9yyVaStalT3MCIVjpx5jwmAE1J+ur07+o1odoaZYK+WbuP1Jl5xw1RyxpG
         IkDw==
X-Forwarded-Encrypted: i=1; AJvYcCXUMuGTiXylNgYv7Wq85Wry9uIc5MJ14iA6/zaEJ1T7OsKnHc1OhfrSZk1MfaPZEBT99YeuV3yqDGhxtu1khiLe5WmgvzDf9sOoVGrwDgdF
X-Gm-Message-State: AOJu0Yy65B8wcBc3/3DY5yl4T0U2Owq9wxFRSjcr8igQuMyj9XdtpmYG
	/yPVc4fepBYe903xMDNzSojvdHyXb59ak0mZ/Fc1ZNqCVhhdfiN9Jf0CYaIaQQ==
X-Google-Smtp-Source: AGHT+IHqz4VoCy/AbrG77KfrwyI2ciGKuFC2HRV0gR/8ofeaeFZNOlIkfZE8oF2QXBdRNJupYTWKVA==
X-Received: by 2002:a05:6808:38c3:b0:3d6:2d2f:d03b with SMTP id 5614622812f47-3d6b2b24ee5mr14720829b6e.10.1719981761064;
        Tue, 02 Jul 2024 21:42:41 -0700 (PDT)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708043b7100sm9700027b3a.142.2024.07.02.21.42.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Jul 2024 21:42:40 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Su Hui <suhui@nfschina.com>, Kalle Valo <kvalo@kernel.org>
CC: Dan Carpenter <dan.carpenter@linaro.org>, <johannes.berg@intel.com>, <kees@kernel.org>, <a@bayrepo.ru>, <marcan@marcan.st>, <quic_alokad@quicinc.com>, <zyytlz.wz@163.com>, <petr.tesarik.ext@huawei.com>, <duoming@zju.edu.cn>, <colin.i.king@gmail.com>, <frankyl@broadcom.com>, <meuleman@broadcom.com>, <phaber@broadcom.com>, <linville@tuxdriver.com>, <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Date: Wed, 03 Jul 2024 06:42:32 +0200
Message-ID: <19076e6bec0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <36cef2a8-10a3-928a-d962-3599333d9ac8@nfschina.com>
References: <36cef2a8-10a3-928a-d962-3599333d9ac8@nfschina.com>
User-Agent: AquaMail/1.51.5 (build: 105105504)
Subject: Re: [PATCH wireless 1/9] wifi: cfg80211: avoid garbage value of 'io_type' in brcmf_cfg80211_attach()
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e84f8d061c507576"

--000000000000e84f8d061c507576
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On July 3, 2024 3:42:18 AM Su Hui <suhui@nfschina.com> wrote:

> On 2024/7/2 23:39, Arend Van Spriel wrote:
>> On July 2, 2024 5:29:27 PM Kalle Valo <kvalo@kernel.org> wrote:
>>
>>> Arend Van Spriel <arend.vanspriel@broadcom.com> writes:
>>>
>>>> On July 2, 2024 3:57:27 PM Dan Carpenter <dan.carpenter@linaro.org>
>>>> wrote:
>>>>
>>>>> On Tue, Jul 02, 2024 at 08:24:44PM +0800, Su Hui wrote:
>>>>>> brcmf_fil_cmd_int_get() reads the value of 'io_type' and passes it to
>>>>>> brcmf_fil_cmd_data_get(). Initialize 'io_type' to avoid garbage
>>>>>> value.
>>>>>
>>>>> Since you're going to be resending anyway, please delete the space
>>>>> char
>>>>> from the start of the line.
>>>>>
>>>>> It's weird that brcmf_fil_cmd_data_get() uses the uninitialized data.
>>>>> It looks like it just goes to great lengths to preserve the original
>>>>> data in io_type...  So it likely is harmless enough but still a
>>>>> strange
>>>>> and complicated way write a no-op.
>>>>
>>>> Not sure if it helps, but I tried to explain the reason in response to
>>>> patch 0 (cover letter).
>>>
>>> Would it make more sense to have just one patch? It's the same issue
>>> anyway.
>>
>> Yes, but I would solve it in brcmf_fil_* functions (fwil.[ch]).
> It seems you will send a new patch to solve this issue.
> And I guess there is no need for me to resend a v2 patchset or just one
> patch.

I am not entirely sure. If both gcc and clang would warn about using 
uninitialized data I would be fine with these patches rolled into one.

Regards,
Arend



--000000000000e84f8d061c507576
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
2Gzj3QNJRLsZu1TLyOyBBIr/BE7UiY3RabgRzknBGAPmzhS+fmyM8OtM5BYBsFBrSUFtZZO2p/tf
Nbc24J2zf2peoZ8MK+7WQqummYlOnz+FyDkA9EybeNMcS5C+xi/PAgMBAAGjggHdMIIB2TAOBgNV
HQ8BAf8EBAMCBaAwgaMGCCsGAQUFBwEBBIGWMIGTME4GCCsGAQUFBzAChkJodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAyMC5jcnQwQQYI
KwYBBQUHMAGGNWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24y
Y2EyMDIwME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3
dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEkGA1UdHwRCMEAwPqA8oDqG
OGh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3Js
MCcGA1UdEQQgMB6BHGFyZW5kLnZhbnNwcmllbEBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYB
BQUHAwQwHwYDVR0jBBgwFoAUljPR5lgXWzR1ioFWZNW+SN6hj88wHQYDVR0OBBYEFIikAXd8CEtv
ZbDflDRnf3tuStPuMA0GCSqGSIb3DQEBCwUAA4IBAQCdS5XCYx6k2GGZui9DlFsFm75khkqAU7rT
zBX04sJU1+B1wtgmWTVIzW7ugdtDZ4gzaV0S9xRhpDErjJaltxPbCylb1DEsLj+AIvBR34caW6ZG
sQk444t0HPb29HnWYj+OllIGMbdJWr0/P95ZrKk2bP24ub3ZP/8SyzrohfIba9WZKMq6g2nTLZE3
BtkeSGJx/8dy0h8YmRn+adOrxKXHxhSL8BNn8wsmIZyYWe6fRcBtO3Ks2DOLyHCdkoFlN8x9VUQF
N2ulEgqCbRKkx+qNirW86eF138lr1gRxzclu/38ko//MmkAYR/+hP3WnBll7zbpIt0jc9wyFkSqH
p8a1MYICbTCCAmkCAQEwazBbMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1z
YTExMC8GA1UEAxMoR2xvYmFsU2lnbiBHQ0MgUjMgUGVyc29uYWxTaWduIDIgQ0EgMjAyMAIMTv1t
bpIzNUky46LXMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCA4dfioALhLcJ0ExOpp
gh6iZ1rbBShyQfkXdNvqRNmAyjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJ
BTEPFw0yNDA3MDMwNDQyNDFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUDBAEqMAsGCWCGSAFl
AwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAzXNYZXmOPagtvHsPJjYOOVbK77r8/pSzb3+Z
G3sXpwy5Ra/f1CeSh6owsi3Aj2JKhKwXWAgO2IQM0X6eiuE1XwnztOhlpr33Mc94r2MhsGQUk2HU
OHY2HGsAK/B2soAKxtrt3yNLrAOJMCP6AFn4ObD2G2iJO7uKH0mflRtXt1fbIGQseYqERjryHBHQ
IsUhvQa4MmtsPXT13PMj9Ol8l5OfotN17Ycr+I+CrDzj6wxVhS6L5Ccv+3pfVugszHHuivfsNb9G
3uVlIuGYU/GmplPk1FbpAH6yUrFZX0CaXK4qpRKLMWlqMBe14bNRT6EBWQ5FxfxjLyuv4C4AzHDp
BQ==
--000000000000e84f8d061c507576--
