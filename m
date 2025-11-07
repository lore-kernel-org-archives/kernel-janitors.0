Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584A6320CB8
	for <kernel-janitors@vger.kernel.org>; Fri,  7 Nov 2025 13:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762523847; cv=none; b=ANsXjxcHv4w+CrQuTJb/fsB/VRvCeLkv/h3iBa007lbt2vfSbIddusmvTLSXgSqsNXeFWfNRu8P2/GcEuB8l8uTkvkkv/ppkneceoT9PauCo7ra7zy+Gw/JCzIRhVuBAgMHi7powOh6rp901iRtfHQA59yO7UzzEzioJqIc0rec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762523847; c=relaxed/simple;
	bh=pU1/d3gTQ3oOdrNMuwLNWQMPQlhrormAWhdG+nQqqZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IcqLVlJ7gtzhrK/9fNTkkJdS6Qp/1Sznb+K8nl/aLALg77fzs2gvchxego0TpWbYfLo09biOCZZ/EU6G3+9cM3eMOBu2bV1/nrKYS/HNL/VgXDKMCbbzRRetRCJd+Dnp/tZRb7KiPwNGM8DxPOcYR3Btr6Ue1fg8Gwpwtn6DVDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m54AXq6O; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m54AXq6O"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-378cfd75fb0so6940321fa.1
        for <kernel-janitors@vger.kernel.org>; Fri, 07 Nov 2025 05:57:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762523843; x=1763128643; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZmTmsZO+E5ineqtVbOXnuX3qzTxvM93F9HyZ2/MV6QE=;
        b=m54AXq6OPUT/DAxGH4PVrpXzN0MqFPPWaCfBPchovIRCdVYeGUcPBSKroXiNMY/1JF
         vcnFJTBbhEpnewuMK3IG6Kv5e/51bgUfk7ZmlSfGWOddsX7sbgY1LxZ2X2M+mYuftXk9
         ReAucveDqxqK2pxoK1nrbylv+nbYdRe0kPvGhJBhJ0Z/TshFvP1pkSaKfYa+h8v/Qpvn
         5RUbppmEBthm+uw7uxj2N+bPLYT1pgXwgKdUQwZgsLmHo6p5MrE1VlTM6hr7zS4axNbB
         i+SJ67Pj7B8JTPHy3Dos5eoft1g/g7DJmHOC256vP3Y6jp4wKwBbekRCQhBQXSXpOVJm
         FIdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762523843; x=1763128643;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZmTmsZO+E5ineqtVbOXnuX3qzTxvM93F9HyZ2/MV6QE=;
        b=jBrM6JjCk809bI7ZOBZCo/Pp7ahWR3yobQrb1KHjPuRlOt9V1Rd5ZlS1iKnGPYECPI
         wosDTMWl6YO38+mT/8i98GOO62Ug8jgX8Wkx9QLj8GUQ8jRiIgoxgNgYL+k25Yd3BE4A
         da9kBPnQjNbqfsTNbuSYp4FGK7y2dG5BhSGJfrhMwlHBOucEsfDDHoHPGFATfJ4PzYeL
         eRv+wTnvAjE048sCW+RbYtFgnYycOmmmiJs6VGPBsweuoI4Qf0Ajxn7+ZoYsVYC8WhdP
         cdxIAUAFxN5euMamRIdNFAb1XsrtrAH5e2sm/04Amo1oc62carOH0R07lPFfvHnTPGx6
         EqwQ==
X-Gm-Message-State: AOJu0YwNAMZZ1sd2zRXG/pvVto5gzTOLH+DriA4djCCsUA2PGxp5w5ZT
	vBI5bs9+sG/egiZOpe24r5VQK5fnk72Zm52IDVNKV0s0CdYytUAI4f4h
X-Gm-Gg: ASbGncudavLn+Yg69BLegQ0Pjq+bg+61U8e4tfucQiAhfvIL4wOUf4BjS+ygsccmxSL
	R4sFBPhTigbLrDpTgpmkJYVvSrvWop2JXih1lG5kcHCnNA2VBcp8MkjnRfEULO3DblWO4QwITh6
	Fui7LLshnG8s7B7ksdH8GWH+BzQnxLKN+R1FsBKPZdevX4YCsqk7mElk9gHG+npE/hSiU4Bpxdw
	iIAQ+0zK4solMA87BLs3hBEQ5l8oPoqgzBS07SvT0UsLo7+1oZDl33iukPZhrcQ4uoVf+KEQ/gf
	p7zpjx+fHYRN97Vaqlm56QjIXMNq/GVHhfzlkT5bi2yQKX8d0O4fomUKiadJ+Yzzs2CRC2Wx7eH
	Fjn64MZpzlbsUnBRAtjYw2yRRkgOoOlvcb/28ayZyoRxGvhMiD1e9c7pUrgai4wJ6qg7S/4ckPp
	mJAroQLCLimLHPxGqjW7rXxKYMy8fAdjUnNbVkuFXJ3ikpmuVQ2FS5YTYl3w==
X-Google-Smtp-Source: AGHT+IGuna97US5S+FEJvdQXB1ZSmKd9d9FBrPTuZIikplId7oOFsTN/OD71KzPyK4H+bf41lFXeyA==
X-Received: by 2002:a05:651c:110f:b0:378:ec26:bac with SMTP id 38308e7fff4ca-37a7312d659mr6724151fa.15.1762523843126;
        Fri, 07 Nov 2025 05:57:23 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a5f0790a7sm13094511fa.22.2025.11.07.05.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 05:57:22 -0800 (PST)
Message-ID: <5189f05c-136f-4ad9-b309-159607e6e930@gmail.com>
Date: Fri, 7 Nov 2025 15:57:21 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in ROHM BD71828 CHARGER
To: Lukas Bulwahn <lbulwahn@redhat.com>,
 Andreas Kemnade <andreas@kemnade.info>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20251107123621.425633-1-lukas.bulwahn@redhat.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251107123621.425633-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/11/2025 14:36, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 5bff79dad20a ("power: supply: Add bd718(15/28/78) charger driver")
> adds the file bd71828-power.c in drivers/power/supply/, whereas commit
> b838cecc2291 ("MAINTAINERS: Add entry for BD71828 charger") from the same
> patch series, adds a section referring to the non-existing file
> bd71828-charger.c in the directory above.
> 
> Adjust the file entry to refer to the intended existing file.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Reviewed-by: Matti Vaittinen <mazziesaccount@gmail.com>

Thanks!

Yours,
	-- Matti
