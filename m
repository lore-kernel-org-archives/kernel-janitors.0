Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6F2FC52
	for <kernel-janitors@vger.kernel.org>; Sat,  2 Nov 2024 10:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730544225; cv=none; b=Rc63N90HspQ0aM31U4RoZNA4U0BaBKlqcMOfkJd3dlhkNqoyD+T1bOh6rCa+YEoenVt5SE6qgQfBmJjF2c0NMn52utH1oUHNSOtQmkJmiO+9zq40mleq7VTVDzYbYAG0vB+1QQqAKhkEQoDqp2xre6CWCnCsPnuiKrsGNDTUTSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730544225; c=relaxed/simple;
	bh=j2a1LW7AkCNYtiAHKl+WpY2EDHs10dxIy/hiRkkE8M8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aPKSlpbe7hLfEa+0sq22IxJypkQT/2W9Mqthz/Z7aQbmWzpMQmoVyI/Slr46XN0wm8r0UzVdBMHU9ColIft49EhK1p+k1NiMv+l6+UY8UH/fZxhJDFx3ADPQKvhSQsYz7Zs7cPXwYzYXWTIRSyyrcyvthcgPE35mkzSVP5ysVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=TRMf/qhZ; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="TRMf/qhZ"
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-83abcfb9fd4so107215039f.3
        for <kernel-janitors@vger.kernel.org>; Sat, 02 Nov 2024 03:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730544220; x=1731149020; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5E+zPbIeW2NpGExKCJwVS0jdkrwjIk/vifgXOVF84OM=;
        b=TRMf/qhZDVDV1+JA3QZJX3Jo3oojkJlo+YaZgI6bbKyIkQIwan9TCFECIPA1shejkE
         nbh2drMzAWPORWtvRj0y1fR3reEjMZi3JhIkhYSh+0uG6zICz3J7Xw+Kvx9DAeqoFlm2
         p5OoWKbsFQ8Aqon+xtAuO0AouR22WvnzRyz1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730544220; x=1731149020;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+zPbIeW2NpGExKCJwVS0jdkrwjIk/vifgXOVF84OM=;
        b=nE2wtcM9sqHLJBvYLIkE8urNpB9dcUvbzW4+UrREsxY1wPGSVJmtgLi3V6T6dRk3ri
         T+x/Fzkl/E0pvkPaPXkEN50UbcL1qwzKX7uKTubUuZMdOyqpMFwatDMaD9sGPr+mMhJG
         fvYpGiHWXV3FwhULZvwysTS2wVhh1jqOLsBNStpXVONSPmr4OZcVLMQnXN15BpThaqQv
         JteUSfK35pT4fuTBIH6fvUZzieEsrFHhd8sUJR5nDXZQrF0YX8IXwWBHZ4SfXiXVbkHG
         fD29aC6rQaHEstRrLZMlucmoXjoTBfAOWPP4sYM4vuI/CLWhkDk31rtyKOPRyfVfe/1V
         EJuw==
X-Forwarded-Encrypted: i=1; AJvYcCVKuHt1QKit4mn9spoCevQ2dSXukZEoE7BPtc1TwtAua1NlQXqVl1bkRHvwNgtr66Iu2dhRHKy9Eeq/KaAdaiI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6Z5V361L472G3qsChfcpyKBneTYKHNQhillfae/4wG/jFqZe
	xxTGSbxt/imVwxN1uwSTSw4Qmj+5kdTtaw0BuYmnRJERZlOS3sH1QfwHaUptYg==
X-Google-Smtp-Source: AGHT+IFIRQe2VBYWUfM1dViJ0/6r91ZBIV79oZXOk0wloU6pWapZrMDRHrlB1fFtFHkqUCgQyhXoAQ==
X-Received: by 2002:a05:6e02:1c2a:b0:3a4:e99a:bd41 with SMTP id e9e14a558f8ab-3a6b02be160mr70648375ab.12.1730544220349;
        Sat, 02 Nov 2024 03:43:40 -0700 (PDT)
Received: from [10.211.55.3] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4de048885absm1114575173.29.2024.11.02.03.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 03:43:39 -0700 (PDT)
Message-ID: <171a7284-100a-4850-989d-63b9f7782db4@ieee.org>
Date: Sat, 2 Nov 2024 05:43:37 -0500
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: Fix a typo
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 greybus-dev@lists.linaro.org
References: <aad9d19c20ea0463974b7652ba7f2f8d9fec1186.1730540152.git.christophe.jaillet@wanadoo.fr>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <aad9d19c20ea0463974b7652ba7f2f8d9fec1186.1730540152.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/24 4:35 AM, Christophe JAILLET wrote:
> s/interfce/interface/
> A 'a' is missing. Add it.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   drivers/greybus/interface.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
> index d022bfb5e95d..a0f3e9422721 100644
> --- a/drivers/greybus/interface.c
> +++ b/drivers/greybus/interface.c
> @@ -780,7 +780,7 @@ const struct device_type greybus_interface_type = {
>    * The position of interface within the Endo is encoded in "interface_id"
>    * argument.
>    *
> - * Returns a pointer to the new interfce or a null pointer if a
> + * Returns a pointer to the new interface or a null pointer if a
>    * failure occurs due to memory exhaustion.
>    */
>   struct gb_interface *gb_interface_create(struct gb_module *module,

