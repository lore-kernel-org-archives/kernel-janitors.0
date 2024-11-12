Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E8E20A5ED
	for <kernel-janitors@vger.kernel.org>; Tue, 12 Nov 2024 06:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731392466; cv=none; b=eTwx3yIssvGO+/sU4yCqZ2NgYUrYG1bMcwp1nExcpjQinVzEGVmNQbH6OTWryLZ2YvUOrSrhbXLyd1+Z+3NIdmm5fIvyQtkiejeIDZ12KVNYv4Ax03FKCIScPXfOVNjyuAD6stOMUsBVvdn3frtO+v/k1cE/0kr/lHKW1eKrFPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731392466; c=relaxed/simple;
	bh=TzHTdzwk7zTY0se/BQ/SFDSmn9zWc3nyNaLqvq8TUtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2nR+lzeNyppSE675f1qDuPXp07TFbZ9cKJnBVS5fF4qBg3MdvLur5RJxSfIC0qM2LRgddZo0MQY7SwtFytyl/CvKJahTSJcX/DfpB3U7oDurnagrTYJsyO4rZGK+2iUbqjO6bstReEc7NHTxSg/Wx3I31ohxqFiMA/wwK9w9C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NeGBryjT; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NeGBryjT"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6cd7a2ed34bso39053196d6.2
        for <kernel-janitors@vger.kernel.org>; Mon, 11 Nov 2024 22:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731392464; x=1731997264; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8lMzHP/kbvIsGVyQJsmvMM8YR6+X2/bxWzc8OovaMHM=;
        b=NeGBryjTsw8qTOzHcNefwpsy03HfBr9b1qK/1Emb7laAiUvktA43aDiPZcl665Jd4H
         AHlvWEnAEZhSn3ARMpTa7LGKNJZSkMPcibQdgedBhe0jANPc07gsVqBmo3m0Sc1w4Woo
         gerXr31H7ca6lymWV2lnzjcweSsRT7RoAzeFSxFCF0i4Kz76Gew4xS8UcHWGeaA37Y4V
         lbo1bDF4C8ZDZgno5wUEU0BuksUVbW46SCnfjlBbd+Szkb610AS2FV6h2QXHWkNwcx/V
         PiONnRn9OLZ5xTrMxeH3eQbquFn3WL20cXBNmhPWE0uwQxJan6rK8h0GzTU1SpegNz7t
         Y5wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731392464; x=1731997264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lMzHP/kbvIsGVyQJsmvMM8YR6+X2/bxWzc8OovaMHM=;
        b=Un8fPudSZ3y3DD01XvEVlufmBYBfCuAN8NqGVXzzk+mcGL/7Ro0EPS/07ED4gPZwEV
         IItS8exURPcxX9iXdPVTSogXs504ZEcVAav9AiV6lwkln55kP3K4CeElfPOigsJsXSfn
         v8gxI1rcDw3hqzMbG0urHTFb0w4haoDbd5wGiLuBM0Lqu4x4DNMUHuqoIp8BDM1qcq4c
         PSZOqqVXA+UCoxPf2saIz4TkZW3wvFz7WlT5EpIyA6sZIpMiHmPPGEsbUYSjRxzKeewE
         JhsfRio8LNYxE7N/ZHhAgo6M1yrI6WqZohQWUyYdhnjFxbOl6HgzcmgBhlUqgxPPbBJH
         dyhQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2aB2GOLEVT0Eyjbq/HB39gTzLGHoSrgtRuOUrNRHPTbfwG3JCeCLbusFyupmRwCRIZEzC+ptWXlfNxKwkt44=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEAtFdUXO7OtyM+v3i6acJUl/Jvu1h+X9h6RgTOV1fUywsXmor
	X/AaR4vKR1mDZ2ZgxCspUV7FYIK0shBoSMKLmu2AoxFZ8jtEvu4M1LkOaxbu0L7uCuJT9e6PDLl
	zaNzYy7RSa6f7BgSI5IV1thE8uganM0lhW3Bd
X-Google-Smtp-Source: AGHT+IE0d/yjDqITmMY8S62aKDn3asVyolmQpJJuztKvsbiJ0oMrHOedDr9sxCakEb5BbifcvMWQlvk5khXsADjAPg4=
X-Received: by 2002:a05:6214:570d:b0:6d3:67df:5f97 with SMTP id
 6a1803df08f44-6d39e0f74f2mr256586926d6.7.1731392459042; Mon, 11 Nov 2024
 22:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b31a16ef-382f-4b8f-b4d5-1c4d93803779@stanley.mountain>
In-Reply-To: <b31a16ef-382f-4b8f-b4d5-1c4d93803779@stanley.mountain>
From: David Gow <davidgow@google.com>
Date: Tue, 12 Nov 2024 14:20:44 +0800
Message-ID: <CABVgOS=75EZMhcifFTdLiO_6TQXnRxfz+CRnae2OV5n21qSUGw@mail.gmail.com>
Subject: Re: [PATCH] kunit: skb: add gfp to kernel doc for kunit_zalloc_skb()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <rmoar@google.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000cd55ea0626b138f1"

--000000000000cd55ea0626b138f1
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Nov 2024 at 18:54, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Kuan-Wei Chiu pointed out that the kernel doc for kunit_zalloc_skb()
> needs to include the @gfp information.  Add it.
>
> Reported-by: Kuan-Wei Chiu <visitorckw@gmail.com>
> Closes: https://lore.kernel.org/all/Zy+VIXDPuU613fFd@visitorckw-System-Product-Name/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  include/kunit/skbuff.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/kunit/skbuff.h b/include/kunit/skbuff.h
> index 345e1e8f0312..07784694357c 100644
> --- a/include/kunit/skbuff.h
> +++ b/include/kunit/skbuff.h
> @@ -20,8 +20,9 @@ static void kunit_action_kfree_skb(void *p)
>   * kunit_zalloc_skb() - Allocate and initialize a resource managed skb.
>   * @test: The test case to which the skb belongs
>   * @len: size to allocate
> + * @gfp: allocation flags
>   *
> - * Allocate a new struct sk_buff with GFP_KERNEL, zero fill the give length
> + * Allocate a new struct sk_buff with gfp flags, zero fill the given length
>   * and add it as a resource to the kunit test for automatic cleanup.
>   *
>   * Returns: newly allocated SKB, or %NULL on error
> --

Thanks for fixing this.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

> 2.45.2
>

--000000000000cd55ea0626b138f1
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUqgYJKoZIhvcNAQcCoIIUmzCCFJcCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
erg7AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFKFQnbTpSq0q
cOYnlrbegXJIIvA6MFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBR
nRJBmUP+IpudtmSQ/R55Sv0qv8TO9zHTlIdsIf2Gc/zeCi0SamUQkFWb01d7Q+20kcpxNzwV6M7y
hDRk5uuVFvtVxOrmbhflCo0uBpD9vz/symtfJYZLNyvSDi1PIVrwGNpyRrD0W6VQJxzzsBTwsO+S
XWN3+x70+QDf7+zovW7KF0/y8QYD6PIN7Y9LRUXct0HKhatkHmO3w6MSJatnqSvsjffIwpNecUMo
h10c6Etz17b7tbGdxdxLw8njN+UnfoFp3v4irrafB6jkArRfsR5TscZUUKej0ihl7mXEKUBmClkP
ndcbXHFxS6WTkpjvl7Jjja8DdWJSJmdEWUnFjnQnDrqLqvYjeVMS/8IBF57eyT6yEPrMzA+Zd+f5
hnM7HuBSGvVHv+c/rlHVp0S364DBGXj11obl7nKgL9D59QwC5/kNJ1whoKwsATUSepanzALdOTn3
BavXUVE38e4c90il44T1bphqtLfmHZ1T5ZwxjtjzNMKy0Mb9j/jcFxfibCISYbnk661FBe38bhYj
0DhqINx2fw0bwhpfFGADOZDe5DVhI7AIW/kEMHuIgAJ/HPgyn1+tldOPWiFLQbTNNBnfGv9sDPz0
hWV2vSAXq35i+JS06BCkbGfE5ci6zFy4pt8fmqMGKFH/t3ELCTYo116lqUTDcVC8DAWN8E55aDGC
AmowggJmAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAZ6Vqszmp/3gGFW0sCFu
eDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQgQo5s2DlGK7Whn3hJ3Iw7VMVUycU1
EzMhsBITSy1Tf8swGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQx
MTEyMDYyMTA0WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG9w0BAQcwCwYJYIZIAWUD
BAIBMA0GCSqGSIb3DQEBAQUABIIBAI3CozmBOiqKq6D4sPaqqmP8adK7/bf5k9dK+RdyzoeFPtPQ
h2myV8InuksVQys0m4lLKPw+V/wMk9gAIRLglBi2XOlKHU2OzKJ6gfMEfr1NKF/IQdyFuKlghR9r
BfhXAkbaj4v15ZCoV9RG9fQ3DXT/RN3umeYRCxqu+UJ24NzVmkB+nUgI3hhdNLARHeeW9//rzLv1
J7EvFueNNYiQi8V/DOYjVAicsmdd+5cNHuzPwIUnqzNixv9MUAKlbg8bs66jo6uytbeC+J0PB6e2
W+LSklUhbSkwe7+v7tplvF+sc6Mn5lN+27svdNysdjfqbNeX4txlmMOl4+n/dmWN3HY=
--000000000000cd55ea0626b138f1--
