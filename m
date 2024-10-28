Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5661DEFD2
	for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 16:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730133655; cv=none; b=PLV+w9yKk4Kua/Q9DLpvOg5LQ3S8BbXp2wC5IwcVaLaxuZl5VO45sLwP4ldAQU2u5IQqqeeWqq3Utn033rdxzJDCHz/suBQab9B2PL+eQBT5gnqg4ydC75roSCYrOL1EYSE+B/KY82DFoF4N5BsRJo7fiNa/GWH5KORAO+69JiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730133655; c=relaxed/simple;
	bh=FuzDX4w5ksbOtt62LrKHOv6t3WZNEVlMo5Jwg+lRz8A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=emLO3Bx1oqqGvEjysOAZNywvr7PVsxQ5Kmh71eQADt4tDTDrVb/O2UNdGFS6cOJQeH5YbB7Ld1pNgm9r8Xw8aSo2EX80h1aa6jqqeSFldSX/mNRGQd9GuEHQmnXECMXbJpvNjmiDu+AIe8iuWwjZGCFt5VUna7kKMyCIyXtZZZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GXJfc0l7; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GXJfc0l7"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4315c1c7392so46152825e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 28 Oct 2024 09:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730133652; x=1730738452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=GXJfc0l7cQvGwu0u5KVA2QMyWdlIL/+5sPnDNkIEGzfJ0K/yBybzljcg+zBwCyKmeW
         3OZauka0LjvOXLAfL/IpbtsCUxEHUrTgduduxxRxCwPZ7cu9UPn27QrrY9enXjbPn9BZ
         3eNlGhLzNZ+HU4E/+Y5ZXI/MoxnBAWrqyfGVdVY8APtd5NKn5RTZe29W23/w8kzCJwvq
         FBDBQ/o+zf3vDwk8JeMX3Fcn2akpnfiZDyDgZdIMwFRSatWlvccB2vdlemROIGa9x6sA
         U0PkvWvHZiMf8YjIW7PWFPuNMhbeibGGIAiMXmGvfB+yrfvebHHtK2v616gruO8cETeA
         /GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730133652; x=1730738452;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z7H7MOZKwUSVXW/SZzObgRj+x6rST0JwI+YL7Wp/UUE=;
        b=wKtbOfRdz05b+EcCxvH7ulhdyKls8mwb80rQWA5z3vloOi/cPxv9XRkxg2PZDlX4d/
         t32iK5PYoXczpQiDPeBXY8X9nUPL5CjyDzTliJFpMeaWL1GfwIz6JOM5pH15Zu0zfdSG
         vkG9/gG0YsZbVOjN6caATbmVQNjecVpQnrhwwbylGGJEwzKDVIc9fteH9CEctEG9Ddhc
         vWP7hG2sXI8E+TGrDgOaamJUOh4yMkiGn6AQ/u/1P/cGoYrnbci1OdCOaJuMnuzV2zpQ
         o0o4erANg2uoQSQBV9HC/m98rSzTyo11n0l0z/hg9vKegaieH6Vc6W8vR/ILGNrN828s
         eMMw==
X-Gm-Message-State: AOJu0YyPlzaii+CmYHnBHWElkq7mpdb/HY3SBh5fHwT4CbPy7yw8sKyK
	mQzmF6jXxEPQ70BPdPGfWhNiN6qgvkiAq9QNQDtQRmtpX80K7WNtnf8g7Ij7Pfo=
X-Google-Smtp-Source: AGHT+IHD7ecehSeRSersefttuZxWWc/yvJLPk3kslyGa7nuUur+ExAiKbF2BIlY7ADLI6KIVbs9TAw==
X-Received: by 2002:a05:600c:4fce:b0:431:54d9:da57 with SMTP id 5b1f17b1804b1-4319ad20fb6mr68256455e9.30.1730133651812;
        Mon, 28 Oct 2024 09:40:51 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4318b5433f2sm146420585e9.1.2024.10.28.09.40.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 09:40:50 -0700 (PDT)
Message-ID: <0f626477-7af1-4f8e-a770-39f69d9b6cbb@linaro.org>
Date: Mon, 28 Oct 2024 17:40:50 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] thermal/drivers/mediatek/lvts_thermal: make
 read-only arrays static const
To: Colin Ian King <colin.i.king@gmail.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Nicolas Pitre <npitre@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20241022184622.1296044-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/10/2024 20:46, Colin Ian King wrote:
> Don't populate the read-only arrays on the stack at run time, instead
> make them static const.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
