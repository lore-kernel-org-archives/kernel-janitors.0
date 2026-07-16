Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7537A400982
	for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211841; cv=none; b=czLThv5eJ9lWp+lSYlOYfMI1v9u/ey1w3eQ1mQBfepfNwZhpRDM7Re9MeyShGwXOtwDqooOanMHZmTsWcZ4X7PC34kA0WKaOK51uxtZtPy+BA4tan6xK5EqkGWSCRPBCyqjAOtIjKswjXb/8d/h88qdV+rGJgdaPqbuInirfbgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211841; c=relaxed/simple;
	bh=feR03yqekQEo+Zds89bk3LTU1v0JcC9FSph94t/3VWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k3Cdotppw6jxef2NFPtrRoNUmA2+A6TG7cOP4k97voqTORxztMWZlhUjsBX4kP5hdetI2W1HNyjBpUuOL+WoeJiw0RU4L+qXQibr54SXj6LFC48WgzJobkCGmzDjm+dxJQEVK97ii6O1RhA1eH8fDvBcVvHCGOWNKQHxtTs93+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L0+8qE0h; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lXG3WfVn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L0+8qE0h";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lXG3WfVn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784211839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
	b=L0+8qE0hfWP1WJg3MH/ZHAW7+3sv/TzZaxKFhuL/SbRMm/5bjohag72MK/mIP/Qoyhb/sS
	9kFqkcpwPfwgAjq85HyzxofJfyRr7e+4OO1+/dPxSSe7w6Wt/lf1+LzhoWBLD/rZvltb7Q
	d0jx9PktfcQu8eF+6f0CqT2SeHNmvF0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-75-4GnSGGcKOfKIym_lAPxS3g-1; Thu, 16 Jul 2026 10:23:58 -0400
X-MC-Unique: 4GnSGGcKOfKIym_lAPxS3g-1
X-Mimecast-MFC-AGG-ID: 4GnSGGcKOfKIym_lAPxS3g_1784211837
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec3314f65fso116041196d6.3
        for <kernel-janitors@vger.kernel.org>; Thu, 16 Jul 2026 07:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784211837; x=1784816637; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
        b=lXG3WfVn3N4nZUB+CZ2eDrddntbPUj1g0PDZnzKUru6vYQhK1YKvHL+e8QLieSHsOO
         d/GxhKvxjkObL4qelfTE/5V40V1cKFYbzp5xj9+uFi6x79AUvcGJVSbw/QHGrt7mUXoE
         xcLshDu7QbozbCYo7Ddd+lJjhPx2A98dqSc/80ULoTSjNT6TxArJPuEkJDQrLMEnLSJ/
         90btGfyS4sJrZ2OM48OmA0TQs5bWFg+Wvp/7kpiLZZrYdSt4o3T1iCy9iQbz3oSGedfw
         DZ+558efQIYmT/+F8z36rMWJCy/c4cFF1+BsifCAIoFH/2aVF84fGSJ10aVQrPJO5Vyy
         SbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784211837; x=1784816637;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=22PyKWT4dqmX4sruE/8FFeaaiF43HFXx7Ngcc5rlNFY=;
        b=YRs3CQQEYN7sNPB4njia31jhCMda3sc4fUaEG5m1m7RTrV0nX/VH3u7F0WIVQ2CEiz
         fyeiAendQASsX6YPAtxFDQx019D8edkjJHzCY/WZ6j6TTSCFF3kaKa8+n5bbMRaJjbr5
         9SQE2UvP3AQ+y7IwRLmjxFfrKnqf30DlZK4u1BuE9Wa31jYz1LajfguP/nP/yO1MOnvo
         qDRqXI2vdFy7N1iJH1LSfhZVBWjR/D0pMqxrxx41NxSEQ3PrBujZArwxerlZBXPDa2J8
         yGowo5s7KQkmdWQzEb1dWalCkKIrGgZYmBX40RRS1dTordbJtgvubV8ZURRli69RgRgl
         tzmA==
X-Forwarded-Encrypted: i=1; AHgh+Rrg09iKa7Q6xxdR59b0GenHehbWdYxsRHI832B6rnlz8DnN+/nOwhM/mbwTBuvmXgkkC/xje4ckqzYO7w2DQ3I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2MCre163ny4DNJ2hRXxPifA1n7mOQvzehXetZHHXueSuTckoH
	4Cq0wXfWfh/BIfJa74/gMM6Lxt3ArUBRO4YqtXsP9W8R0B0fWKzeABd1waKyz98KmfzMnYq0LV6
	MwLT/WV6x88qb98+qMDyJGVHgqje2Rf66IoLATDYhWlnx9Cwc6zNMsH6QkQryM4kj9rV2oA==
X-Gm-Gg: AfdE7cmEIIz0ARnLNdYCyBVXoRwh9+SsytSf6JmSr3S9rhxoQsAcUvdSJbkU0yShmcX
	5/L1b9ZAVl8uU7ORY0dynQPmhePTYN5f4kgdpmJ/8NirmkE9tcvSW7AhxjMSrji6LYZNqO3Q2Di
	rAVrIxl0vyjds25q8NzHZuzfkeHLC6LLyWdbd7GFm5N3fEBrTu59d6k8qV/HQvs+59xl/qXQa4Z
	ujgWjhZYaRt3ZPqcdUmLmf25Zo+v1GH4kfkyqH2EEZOzDOWGOeLRQ6FHNxf8Um3EbFfxAQ46Ivi
	FwnmTGoD2ZYHnjrhQBw7BaEliM2fRlkYfCMbUFgcjr1pEpJARJbWSuxVUMZRgy7jTJG3M9I=
X-Received: by 2002:a05:6214:2025:b0:907:31a6:c24f with SMTP id 6a1803df08f44-90758de66e0mr96745726d6.41.1784211834310;
        Thu, 16 Jul 2026 07:23:54 -0700 (PDT)
X-Received: by 2002:a05:6214:2025:b0:907:31a6:c24f with SMTP id 6a1803df08f44-90758de66e0mr96745136d6.41.1784211833656;
        Thu, 16 Jul 2026 07:23:53 -0700 (PDT)
Received: from redhat.com ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-900a7f8f5d6sm206225996d6.15.2026.07.16.07.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:23:52 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:23:51 -0400
From: Brian Masney <bmasney@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Subject: Re: [PATCH] clk: document that clk_get_parent() returns NULL
Message-ID: <aljpdw6_0tEDF87a@redhat.com>
References: <alZaumcBpsRS9tyS@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alZaumcBpsRS9tyS@stanley.mountain>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Tue, Jul 14, 2026 at 06:50:18PM +0300, Dan Carpenter wrote:
> The documentation in the clk.h file says that clk_get_parent() returns
> error pointers but it doesn't.  It's also not consistent with the
> comments next to the clk_get_parent() implementation which say that
> it returns NULL when the clk is NULL.  Update the comments so they
> are consistent and accurate and say that it returns NULL.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>

