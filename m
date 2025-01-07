Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B840B78F3E
	for <kernel-janitors@vger.kernel.org>; Tue,  7 Jan 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267941; cv=none; b=flxGnM/gyM+Dz1Vkc+7kvTmVqRBvNQdDljh7ptCTukc3Rm1+BYPoBZ2BFfB/DSmwP91ZnYXrk6IsIinzWRnRO0XXfnmyG4IFkv9mCSCrHKe7gxCQ+Hy1i0AtA1J+kZViUrte3gE41ttU9GBZUQ13xrK+7NNC05hLD3ZmO+wAK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267941; c=relaxed/simple;
	bh=GoDNtrZDxsXSWtj8t/K/TIsigdGXol/y8d9ouSWenmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fRi0PLhAPt5f8RBefIwHsQiG9RuzSpDr2EaOcygmY7IjNP03jvTV0zs4Pc3fupwiI3fybn7H6cfwRqHBqWb2cLbDUxhkY4DTPk8G5n5wq3hW0jeJpP5CaAOK8vzsSuf4WTrBxX91kxpS2ZPelMuxNmtp3WBot+Paql+DLUYqCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vezwtMdu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vezwtMdu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436202dd730so113104655e9.2
        for <kernel-janitors@vger.kernel.org>; Tue, 07 Jan 2025 08:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736267938; x=1736872738; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YKyRSMjlbkMSx1IUGYBwAJ/UdMWvgHqDVv7GKEniMKI=;
        b=vezwtMduM+qeknh3tdFosJ/q2D08wwvfYZ+rzQJ2sH5BmGWQNjV67uhf+ytzjsv79n
         Kj5SfqpF9vX8G7FcNwX9DVGK1wIMqWXxHk77AhvWtIYt9nCZqkGb5mq3QcCgglF1Vo37
         nilyiECqZp6m55V9WX4Q4zafP5sVVUWDnVgIr/p1GbYvjJ5ZjPD+T5YCXWWf1UegaOCC
         LvjYOu7zE5fxWfUncwtSqz3juf2+v++prRI+Qq25yWsjWD+tjo6J6JtUlKty5k3Wi0Y7
         hOvwfv0092AvoBM+oieGxde1dJusl5TIXMceB4+8b0RU1afDLVZYGBZVXlwQny5UUVQC
         Xmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736267938; x=1736872738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YKyRSMjlbkMSx1IUGYBwAJ/UdMWvgHqDVv7GKEniMKI=;
        b=tp0MALclsBkREN+DWeZEeMorIQ7oaXO7EuiIihiR4meZ2hTWcWia+oXiFxo6ZWMNDw
         BYPrxYmGkw2uSNHLCicr4twLvMBHJq8FM0v/hJefAIyYN/zzbeu6toT9EPvCCKKQuz8b
         DAoRy57Z1ZN2odeZSeDUJlK6XhGsBs3xKnVb65YVJQgj6Xu5qCprJ4+Z0d4qeHnZhJbt
         KlBYCoTVcQ0+bIxHlveeEajwC3dGbWxonjuqW/bXj9HFQJSHkcICFOcU5sBeLrIdWO4o
         L/uStzqtTMGaiZDtdqExoLUhMRv/6hy/KqJ48CR/K9SLYVgFOX3r6r0jgdJ94lj8Zvtf
         kVaQ==
X-Gm-Message-State: AOJu0Yxyp5x7AOQOJrCHPpigGOXpDHg7LSDYE2iTjYtCpPg3bMxo3h61
	RAgsco9BZgS9FPPjMU11wZEQ0Ol2OGdTu4KrARGcgeSqBsgQX7YIk9FuotXOUlE=
X-Gm-Gg: ASbGncvjQeDGDNuHPj7U9HKxCGkasjzWQOjtydHbApTJIdZphkkHGm5y/1Uph5RrSH2
	r1CRUqga20zy8m5vFJ7WAJeZZJVVk+SxfdukmaOAISHro4fgWdUw+Balh5FOjucBIyzNEk9OJh/
	vMLcup2B9J6lhPg1D/+RqveFOKtGVjFFLTv20c6h+CZi/+70xuwFVZ2aX1tgOs2um3KIl7G3xt4
	tUAPbRcJL5Md4BWh8xqB776vbFx3iCuPa99aRNbGa5J6aMi5gyJxiyBXgIZRg==
X-Google-Smtp-Source: AGHT+IGXuA9g6ANgh6IfjJf7QUgux2u1e93+CkTWo0qXxeR0bMO1+Pt0oS7SpZzVu4sPLERybn7Zcw==
X-Received: by 2002:a5d:584c:0:b0:386:2ebe:7ae2 with SMTP id ffacd0b85a97d-38a223f7248mr56993680f8f.45.1736267938010;
        Tue, 07 Jan 2025 08:38:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b4274csm638887105e9.38.2025.01.07.08.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:38:57 -0800 (PST)
Date: Tue, 7 Jan 2025 19:38:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: Kernel Janitor Project <kernel-janitors@vger.kernel.org>
Subject: Re: How to fill "Fixes" when sending a patch
Message-ID: <b077d03e-2c06-4f21-bed9-44bb8ada825f@stanley.mountain>
References: <cjh33awxfhtt3sgck6rrh4zf3ewn6z6svrj36el5ky4kg66y6o@b37k3hj5hosp>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cjh33awxfhtt3sgck6rrh4zf3ewn6z6svrj36el5ky4kg66y6o@b37k3hj5hosp>

On Tue, Jan 07, 2025 at 05:28:43PM +0100, Paolo Perego wrote:
> Hi all, I'm new to the kernel development world. I submitted
> successfully the first patch last November but I'm trying to improve my
> kernel development workflow.
> 
> My question is about the "Fixes" git commit hash. How can easily find
> where the piece of code I'm patching was first introduced?
> 

Do a `git log --follow -p` to find the proper commit?

If that doesn't work, then send us your patch and we can help you find
the commit.

regards,
dan carpenter



