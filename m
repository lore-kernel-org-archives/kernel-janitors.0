Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259992BAF9
	for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739806307; cv=none; b=ul4R2n7T+SH4RVjagwfUp7eDSqK+I8tnXP7+SDDlSLyjblX62p41B9DTahcJyMTeBNeHW5bFtFRhhAmcq0k4gqOHjc4q/yX4AiBu6qlJCwN3FXVyMfFXpaZWgKntMKIUaCfNAzohyGfg9qZvTmqQOYZrkYZSt03JcLBm80s0014=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739806307; c=relaxed/simple;
	bh=i4cD0V8+nfCJgVSaBV4TSFCD+HZ8bi6YcjwUGYdl3Qk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lnEl9hg+d+Z/3+Qb+jvLNa13S7M8/kjI0pjngK0TSXqCW8SXcVFfLBWm3bHmcpZwgLqKOfZzXqoPV/LkRBTWhcimAOvFoz0HEv5g7XcER/6WcFAcZENgoBtFdFNBpkYNiIcOScbbeuFzCRb9fT0nTC02QZ59X3rU1jQOsOj+uII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=auzi/rSO; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="auzi/rSO"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2aa17010cbcso3599829fac.3
        for <kernel-janitors@vger.kernel.org>; Mon, 17 Feb 2025 07:31:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739806303; x=1740411103; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hLy6tCidb31UtJbepHKM6tCxizCfttBLfmcun9Z57EU=;
        b=auzi/rSOT7lrk01fYLwijlvQnQLpts2nKb7Vj6exFCNMH/k9dd8/oOLdD11bEUZzH2
         V22jAQPIaafhqfK5LeS7KaueOtzUM5q4qZ9/L4VK1DDr04fhOdLjaVQp82YZyLvJls5H
         GyB4CAsa0BtB77j6X9tz+AfvNWQWrjBDpbdXL3ai/UucYJLv/XR5iXaiklmxqhtZp+ey
         jB+RejG7V35CglT4BEVcRuHQJZ3mEJZdrGKSJsu9Tgg9H8Y61VJ1m4dlm8srbwEU+SGm
         RswIQEGQNyZ5q+iXS2uZhJRpKxESsW9VRv+sjy1Jh4TJ6DekerSX6e0R2CSl3r66zj/U
         hAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739806303; x=1740411103;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLy6tCidb31UtJbepHKM6tCxizCfttBLfmcun9Z57EU=;
        b=t6Jl5ANja92nNe7KOvZQblHcwV2Tblp39ieQRGSZgvhgfFAc9hE2O4k5d6c/MjSiDN
         REL9fVrMIuaDzBCTuTOiZLVoXSA7aeXR5igpEMqhY03OuBryvVAhV+xse88R3RadIrEP
         XHvZinXWE1QbBWWafs6lH/qepzPPuHY1fHoi91Nunroyli+UqBMr+0lWjDP89TbM8VPa
         /GaeZW7+10iXfsQB5DU+kSJGIdSodGx64tLzC4mkmEsGBQgpDzN6GFZznLCwoLvINUya
         Q7YtBN1viWUpzB37zEkr7QAJMuHLXWpEIlKTynJzMkFJ8j8BtQz8qtSVulHZHFV7DT3L
         RKIA==
X-Gm-Message-State: AOJu0YzvRuBj9rgn9u9q9mY21mdt74KkzBTqzZ/KrPZdWU52rnNp5ux6
	gxb6PiTiAH6mpioZ36NiiDTy01cdIGVKhh3Do1SMAwdfkUlm9rvCj8gQJvKnmFb0ut5x2QwYsok
	X
X-Gm-Gg: ASbGnctHdJbEzkazxxTN66PDVS5fYxiah8/m5mVAQrumtkOSg/VfX6+Dz7+Za/3uSgu
	zgn6y1RmN5N2OH1Gw47jEd0+Zsm0V8hP1Kr4mvFvUJMno+zPfDwbsFYDDXZZSkgeOBEP69x+tc3
	TlrYHl8nW0wneLujgZvQ9dPdeZj3qgksakBARyyvVXELvOgIf224AiF3sVcPTyk6HG6xhx+4iLo
	CmHGGYJ+2EJWm+1LdB6uFAbU2Ssb7k+sOWYTba/1T9rXVF6EEvJKHWhTJ7a45KuW48gLcS5M3Xv
	jUxKe4MdkECa8OU6PZai+A8wPYZDiFxKU4c2+1UiKrYnpZP56tHf
X-Google-Smtp-Source: AGHT+IGNFQrTrIxdPZwMWpXCPOJVGNSy4LIlCpINievqrtoFIHd9q6fEfiQqQaF94LwUcwd34eFBIQ==
X-Received: by 2002:a05:6870:912b:b0:296:a67c:d239 with SMTP id 586e51a60fabf-2bc99abc0ffmr5808371fac.12.1739806303211;
        Mon, 17 Feb 2025 07:31:43 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2b9548205d6sm4061410fac.4.2025.02.17.07.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 07:31:41 -0800 (PST)
Message-ID: <7f0689d4-e940-4889-a29f-4fcbe8a32676@baylibre.com>
Date: Mon, 17 Feb 2025 09:31:39 -0600
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust the file entry in SPI OFFLOAD
To: Lukas Bulwahn <lbulwahn@redhat.com>, Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Nuno Sa
 <nuno.sa@analog.com>, linux-spi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250217092851.17619-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20250217092851.17619-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/17/25 3:28 AM, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 8e02d1886988 ("spi: add basic support for SPI offloading") adds a
> new MAINTAINERS section referring to the non-existent file
> include/linux/spi/spi-offload.h rather than referring to the files added
> with this commit in the directory include/linux/spi/offload/.
> 
> Adjust the file reference to the intended directory.
> 
> Fixes: 8e02d1886988 ("spi: add basic support for SPI offloading")
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a54d8510ea6e..53cf3cbf33c9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22402,7 +22402,7 @@ SPI OFFLOAD
>  R:	David Lechner <dlechner@baylibre.com>
>  F:	drivers/spi/spi-offload-trigger-pwm.c
>  F:	drivers/spi/spi-offload.c
> -F:	include/linux/spi/spi-offload.h
> +F:	include/linux/spi/offload/
>  K:	spi_offload
>  
>  SPI SUBSYSTEM

Thanks for fixing that.

Reviewed-by: David Lechner <dlechner@baylibre.com>

