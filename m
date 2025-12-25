Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660803398A
	for <kernel-janitors@vger.kernel.org>; Thu, 25 Dec 2025 12:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766666798; cv=none; b=p8X5khpSlN1ISN+mk6VwACgqAaVB4hSufj5iNTpv+OrB6MCMVfojbL3fiNvacPWFZbBmeIolbRrZ32Q2l28qe7vaVR0uB5hTXi5XStlQxvINdc4/2/OpIzJB6u/4mGx+DBIf7htvO16brI2ngOrwGD/GBd7CfJVT+ku5THN5v+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766666798; c=relaxed/simple;
	bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iCkJQSPZEw54K4fkgPuJHxB3XHgeKyaCPB212NSnHy+OfcZAZ9FI/yy3n3DjMGxvPfL1PxHOxt35X7/sP1AC0X6geMmGdbdjVGHw3lDWUzS8P/wn/O29z/uuDZLqLsy8cCiUHn0pTl1hk7l4Zv90RHdAHmIUzBtJKfAyX06gNIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=grimberg.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47774d3536dso51719795e9.0
        for <kernel-janitors@vger.kernel.org>; Thu, 25 Dec 2025 04:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766666795; x=1767271595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWpDQmZNg8zKVk12QskQ7NNS05C4fI/JmZBKLdKyu8Q=;
        b=NxQUbPL/ePT6VqonZvGzv/5VEHTYce2ggOGD13E4NwzweuUKpxo6hP8q5jFXTLutD9
         hsygsCJRxV6DUpRvo9We7rD64fZMKz25J6LR+mbGTb2UYjFZHJHmav4OAk15uCRUx6aY
         h27oPDcRL1NVSO84XrMbds4ICP8kpRlGCCGGY/2vWD0qTjespX/MnU2aadd8aiOIFhKO
         2XAssNCiAy3zeN2o004AAVbeWDlOMO/oMb1MFYfHO2eMafHvtXqEXQzjecIEfcHZfHQr
         a9LyV24ry1c3YRKtwhCciXq/WbTySK9etT3jHhiXa7nZuMUzXw6lMIU9rYF8paFZIkkR
         gvVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsfL4AArBqPCs+eGWz1WD5WZPr7NjVx33fPXHFGgjorkmmta3WU3QO3DESe10o7c0eSIMAjzkz6ayWT38O21s=@vger.kernel.org
X-Gm-Message-State: AOJu0YweHDLfCaA0n53wErHU6K25iCDo9hEoQaU3Sjy+JKnHFxUkpmCj
	0wC33evkXHWgmrSHnxY3Sw0DWpDZ2I2v7cG3dOXjrFHtbI3J4jhhaQI2
X-Gm-Gg: AY/fxX4WP1nUNcCkk5m5sg7K/XWXg8Pr26zC+64Hb/I8ZaCy7NnsfP9Z9MDd0VInL/8
	wL59EWUBj7N9r8PrDTbHKEUFjBzvmyu9vMK64kCvDBf20XgwX1LbJDVdZys6i1kuALRjVGDSvX+
	9vqNTfxmTJQhWrH8hu3JEFpFuNz90Eo2+2FycVBd3nAyYJ5YcE18byt5YhPvlcD8QnQ4FEeKpZj
	LeGC5Igd3jinnYY0hVhJEi4JKdF6HPgcy1mN/fnFHmBSAMOgHJwjg89BTMMaE/jC2+MqFdD7g9B
	znDOzBAQR0+8vcY6qugLntrEMpokNBeGWac5eADkkvbjbl8CfUh7QKJjKf0vlXP+P0i8eS4n/j3
	ptygXU1nFkBvLHmLOjt7+a4zNW1YUoWMYDYnnoVnVoTn/NKsRasMuO9oycOFYwUta9if96c9744
	QX6puXJ2ZsX0JxVbnRML8llPdFEcWfKnxjI9arcGZ/otdIAw==
X-Google-Smtp-Source: AGHT+IFMtQ1sqZdBUrgI0SJXLgWsJAarACSScxm7CXp343IWCyeVA4MPu5bOnedvwQOS60f6G3wRGw==
X-Received: by 2002:a05:600c:8b82:b0:47b:deb9:163d with SMTP id 5b1f17b1804b1-47d18b99b99mr200246125e9.7.1766666794684;
        Thu, 25 Dec 2025 04:46:34 -0800 (PST)
Received: from [10.100.102.74] (89-138-78-197.bb.netvision.net.il. [89.138.78.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d1936d220sm371990775e9.8.2025.12.25.04.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Dec 2025 04:46:34 -0800 (PST)
Message-ID: <fad46b60-f7e9-43d1-9d4e-8007a5b312f1@grimberg.me>
Date: Thu, 25 Dec 2025 14:46:33 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvmet: Constify struct configfs_item_operations and
 configfs_group_operations
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-nvme@lists.infradead.org
References: <82fd284cf70cffd374f5889a5c2a1f3800bafab3.1766495484.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Sagi Grimberg <sagi@grimberg.me>
In-Reply-To: <82fd284cf70cffd374f5889a5c2a1f3800bafab3.1766495484.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
