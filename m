Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7029E15350A
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 16:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713803018; cv=none; b=VIdU1GIPFrUtNLHUsjPZxs8NVPhZvrFhZDksexvphYLuIqNS50ljPye7ugjZQm4qkz2xoaTXqe6A6wEKJpu1XELnEnuOVJ32kADhzNyK2NO51byOcQp+J3BNB5G9VqAK6A3mK83SzMR1jxMT904kYZzkmK8vgXZd7SVVSW6/LTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713803018; c=relaxed/simple;
	bh=gqAW7fj3sgPiDcoedoxjzT94bBENsJV3N5K7VEiaRyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qIfAZXPvNfKAxCRzCByV+O+yIyIjeer5XAXD8Cu07/GQ34bIEvzc4lFtSYysnKoxkxGlJk2an309VdNkjfy1aRKfEkohjfEomY3E811+WKkud3t/9/BshHystcmnSQrWe/RAyVW5cDjyIwPGHf/ifTeE3t1rsEtsilsZ6T4KM4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rXN1Gn0U; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rXN1Gn0U"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a559b919303so238443966b.1
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 09:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713803015; x=1714407815; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2Gdo6hcLZXgF9GvYlYr9IKBTKZTq045vqCsZKtFOJU=;
        b=rXN1Gn0U4rIil6Kl1u41s8budwzML064Epq+/m4lm2zb5Ix1SyWd2FMdMipa0d7Bvn
         479gxxq0X0UhU6WxHKR/iDBtXis5sGDvhMnllXXbyvh/prD26+Ymvom2c9vRipzArxPT
         iOCIiOpe6lscY4aZAsxNIWtBd0REXM8Q3jdyU6jv1ii4PwQlhrIqOAH8Ie7p4WPmhikE
         xlV46C2hrgKfBYeoq9l8iHw+FQrDAZ2kqTvv1hBNVlB+46lmYbcEQYkomF4qMTai0Etv
         HBKV+grPj6or+UXOOwHwNw9tt1TKqf21RDyRD5C5J5Wjd8Oz6vfvuj5qxgVjbVX4jR8o
         9MjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713803015; x=1714407815;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2Gdo6hcLZXgF9GvYlYr9IKBTKZTq045vqCsZKtFOJU=;
        b=u4vPGa+FSb3CrUW6hDa0W1BVQIarHzMowh74mk0Bc2kfFCriMEnwb0kY1YbjXEs57o
         AvC+hijNobe3kzjGtr4x8Oomm1Vqkapcby2VtRBqRJOC272zXWd7mkWEoCVaEF/Ym5AZ
         QYePeJCi230mFzsyQwXIroBOE5QiYXb+GC4gwYI2DvvXZPrFWb+g4kP8ctgYCGU1nd3c
         YDKOv4he6vyMcoTyAh4LD0eoG+EB9s7BlFgMtFhzVwj6AX6fe1JG1hlgZ8+6dhmxG7rn
         eRQkTmePX2oS6d7P5DCP+fssFQ9V0UBbLxddD6waluao+FO80OvOimI4wvGfLBahnz7d
         u2Dw==
X-Forwarded-Encrypted: i=1; AJvYcCXtkcw/mclu+BA3cQUk1L0AxbJ9Ac5suFlh3Q4tI6iEy1nuIwdh48K85zA5QN3NdWvld00WAUweiuhVuuIuK7QZZkpr8pIFSiTK0J5Y6RhT
X-Gm-Message-State: AOJu0Yx70nhfd4GritDb98zdxC0SHPj/GTcloTBMT+jshSW8BTkd52nA
	jbsA2LQpkPGDGHcM8PHyg0KaTjD6ci3CrdLT7NnpZAtB9tGHnwR5+JojntWFiiI=
X-Google-Smtp-Source: AGHT+IGb3tPKIR9iF0L1avzReD6Mvwqc3ppr1BDLASz06MR3UMXIn/UmsJyjK9xZIyrnuqWwhkPifw==
X-Received: by 2002:a17:906:17cf:b0:a55:5ddd:ec0f with SMTP id u15-20020a17090617cf00b00a555dddec0fmr7102481eje.12.1713803014742;
        Mon, 22 Apr 2024 09:23:34 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a10-20020a1709066d4a00b00a52567ca1b6sm5924253ejt.94.2024.04.22.09.23.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:23:34 -0700 (PDT)
Message-ID: <e1f44931-41f2-40e7-84a6-9e7685b3d4c4@linaro.org>
Date: Mon, 22 Apr 2024 18:23:32 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal/drivers/qcom: Remove some unused fields in struct
 qpnp_tm_chip
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <d1c3a3c455f485dae46290e3488daf1dcc1d355a.1712687589.git.christophe.jaillet@wanadoo.fr>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <d1c3a3c455f485dae46290e3488daf1dcc1d355a.1712687589.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2024 21:56, Christophe JAILLET wrote:
> In "struct qpnp_tm_chip", the 'prev_stage' field is unused.
> Remove it.
> 
> Found with cppcheck, unusedStructMember.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

