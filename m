Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D653115381E
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 16:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804261; cv=none; b=Cu062aTDZlJ1cLjC7YGvKXUbgEPZTYX1nhYAtbF8ljj7qjdOt2ALehbEcKt6MWUx7JlhLzH6YrvORMrj0QyToUfsnTsluQ8bG4NF0cBeET39e2NDKPjV67bILx88QQOJGn9R2wubwR0ZkUQd5E9HJa81UsPdtzS0FhdAD2S1NhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804261; c=relaxed/simple;
	bh=OLIXdSdWyYDbVVGKfMKB5COs4TOKhQUHpd4n73zkPmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VwcAjL24NUfmfCjjWnfxDEVjV6OBt6Hto362u/KhwEvxVZwoIxwVgddEnUwmeJXQbjk75bRW5HyOkQQfYrIG2gjltzgxxrxXjkyoLT91pKkdT3sSqhCZYH+TQSvtrOl0Wth1sHxWt5tCCB2e0MAMdUhDmTi2UciTrmlp5+JUSFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ClmOenp0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ClmOenp0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-346406a5fb9so3722012f8f.1
        for <kernel-janitors@vger.kernel.org>; Mon, 22 Apr 2024 09:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713804257; x=1714409057; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z6Igkul0EwY2j/aQPEzUDfSBugLceVua3YOJOdTVDis=;
        b=ClmOenp0YzTqL6CvF3y0p5zORolypxIV0C+NopHZUi6RkUdgzcjzePk3gs5WVveTI1
         Uo6iP+WGTGq6X/lS65dIdAicQlANZH5rQjC8lzj+4wF8XLO6yjFGwyOHXOXndCkNfgGp
         z5mjYZBn0+Paw6gnrbYKl2IuycnT5gbHJbRq24yBLc+gboWC1wgs5vTtp1AlQE387xHj
         n2g46hFrlYGwHuMqDoNmALsNsoBXbk6FgHgZJ9dDquFNp6L31y+FTbWqUThAD1y1ZSIA
         xUaMIRAI8WEBCw77R+95aUEPSDBz/gOjylu37HOfSunW29Vl+NFcTT8+IRTw+2EQNGnz
         zicQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713804257; x=1714409057;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z6Igkul0EwY2j/aQPEzUDfSBugLceVua3YOJOdTVDis=;
        b=GBIz9k/1BAA9lhxQPe6Kxgoke1oz7h9HKYIy13508ysScdwJjKUxgRADGOfFWIPJgt
         SWym1L6/KhwPiYQUT7fvG7JBL8Nx8WIW5wOuKldTqOKbOBGO3q7x9O7jTAjMZQvnZaq5
         8HpLWjp7YN3F3RV/HqzXMqfna2/raA3HO6f7v575r0cq2xLzbJgzrlPCSitoCz91s3CR
         MCBTunf+BOVKo8t/MJakrldil1NBZeLmvZm+joaAmg0vXriNA23O3O2RuZDmeN7bkvEU
         P0yjMlnkqmqAZJrOcdSiKwpgZxAI8DzT13qrSi4IbC5kIbAYsUIICDBFhJgKmcgkgsGW
         RJbg==
X-Forwarded-Encrypted: i=1; AJvYcCXlb6EAeNTMVjeHazlgbtcDL02spATkTdU9qN2/4kDeGYh7isQq6yp7L8iprYqMbmhvVqljGc6hFEYeGPZp87Tx9mYxyEfqLojxxz246kJn
X-Gm-Message-State: AOJu0Yxctg6Y+xzM9ceeMel8WogGVHwoKDF5Ungqv2ANO73mD0MDQPzY
	9WPKnlxmUJWheGjO6UOok334SGuCCBnH7k+VpH8q9pKko0Om7MbpTwW+6IAIFvw=
X-Google-Smtp-Source: AGHT+IF2L5+lrLgaqC7ydR1b2YumbNI161DVVAbfMpg1U1grbIoqOICMThHm60FmuT1h116XNolFUw==
X-Received: by 2002:a5d:6acf:0:b0:346:d2c0:7682 with SMTP id u15-20020a5d6acf000000b00346d2c07682mr5989895wrw.30.1713804257244;
        Mon, 22 Apr 2024 09:44:17 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id d4-20020a5d6dc4000000b00341ce80ea66sm12414035wrz.82.2024.04.22.09.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Apr 2024 09:44:16 -0700 (PDT)
Message-ID: <8fcac485-d280-4753-88af-b9b8c58bbb64@linaro.org>
Date: Mon, 22 Apr 2024 18:44:16 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] thermal: k3_bandgap: Remove some unused fields in struct
 k3_bandgap
Content-Language: en-US
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <206d39bed9ec6df9b4d80b1fc064e499389fc7fc.1712687420.git.christophe.jaillet@wanadoo.fr>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <206d39bed9ec6df9b4d80b1fc064e499389fc7fc.1712687420.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2024 21:56, Christophe JAILLET wrote:
> In "struct k3_bandgap", the 'conf' field is unused.
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

