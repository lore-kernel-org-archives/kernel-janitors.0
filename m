Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AA516C860
	for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 11:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724672360; cv=none; b=jPkAJ03V4ar2ENJhS6x6cMbXB0l+MJi9UUuj6KV1CtCfwiMJcpJrNzqfFym03QF8+btOW7tQYS/G9A5Awb7C0WC6SMjTyYhCSanRADtHuRMXoE2mmb1xFNlV36ACooTD6q7QLecm7aGR79Je+Eo9B3i9PhazlO6uDzhEwqqJsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724672360; c=relaxed/simple;
	bh=Rwh2LwwBpzKTgvRHzVQ3gWwFNixZmyAVwJLMdtAh/0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b77oFVK02J0gphFAmq3ZYoJ+hCPNZdIKDWoercZEutyVRqAnYCb82OZ2q8v1CKEO4oc9LjdrFOuMjaxAe1D8An3nltgshUQwgJjfYhbL8NXVUbKUYjKPpLmGD6WS2fG719hc0X/FgfOuFBh77ol92Bk6b9qVpGG4/23RdkRNRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O+dZUjqK; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O+dZUjqK"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e165825ebfdso4119555276.0
        for <kernel-janitors@vger.kernel.org>; Mon, 26 Aug 2024 04:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724672358; x=1725277158; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lj1uhnFdqDXbAdE4f2Y9iYQuc3TxJEK7JxbQMv0Akk4=;
        b=O+dZUjqKJFA17hOrP3C4AKHUwSiStp9HKQUV7PO3qsuh6AREzSbJiSVLGsPmMHDNEv
         uuMqKDH0zJc2GwpCn8k1edfe+SR+T1gu9E04GTfqTFjO5O8XMNOh0/km+JzZWoZGX3pY
         albD8QKQey2uQI8hfS/RMZZnV8tqtfqsdtYS9MgQELDPgk6SMnpvUYNsbsuSffyE4HMH
         UOjXab1ALUfWH0zwW7VhRw33GxBSDflLh2DzkcMxFIVqOBWw0apklcQrSL+tnAPqymu7
         pLNhvuUmUWNGhOVTAVlFzwanQtgEApr7JdSZKntH/OVUZUP4r3W6iLTltbXYn6TrRpEe
         ueUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724672358; x=1725277158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lj1uhnFdqDXbAdE4f2Y9iYQuc3TxJEK7JxbQMv0Akk4=;
        b=UmXirKvlsv+BK1fTdMFVjMLdAgxIliZiG/6NmYGb1YR/B7ZOQ8HoeARrVSKVOE9jfv
         nlqGjNsYJp+zWdEgJybMzFHdVZCR6UF4eLsozyOUZi2mysyZCPZPLdD68vUDaFvEni8J
         /9d4aYrRjdpC7eegR7t+d0rOE/GRuMyfG4wMhoIbVRESvEPJoEHRKuTmWSoVBqWDIBan
         JsNy/EHNW+uEChyuNeiHnEsvb2OxTihib9Edb+2kg/aOG05C2qMEZfUzAz3sB9RqFL0k
         tpSYvQtFUxEY0zgAnE+xG21Q+3FFGL980Xtcb+t8HwbZGA1bMPWnaIGE0WRDZM2lJ8ee
         f8Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUiQyxUDzkn2e4OnC4OJuzIw7iKUoMSdMh50UwZ4MrlgCu/DGYz0ZkW7LYyc4ROxSZ1Q1gwdYDmZjd5edIgIDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9rXd+VJYIh0exTf5WBywFI/o/ZIheAJo38izgO2OX2pqCyqMo
	M57+du/WWzKOai/4AQhQ6UAaodtUXY3J0y/edHTODpv6DuqX3wGUwZtzuDoU99YTJsK4IfWVbhc
	7JomkcFi6PmVoNS4TdJ5F4SgjMoZLiivnZprXHA==
X-Google-Smtp-Source: AGHT+IEAA2eR1CF21wxXJhBK6Hja6nGKN6FOH0gS8wg8S5DjXKbEDhtopM9INx+Et4Pz58X0bcnls83hbYMzJRZC6gI=
X-Received: by 2002:a05:6902:2849:b0:e11:6bbb:d700 with SMTP id
 3f1490d57ef6-e17a83e2a1emr8932113276.30.1724672358211; Mon, 26 Aug 2024
 04:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <232106a8a6a374dee25feea9b94498361568c10b.1724246389.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <232106a8a6a374dee25feea9b94498361568c10b.1724246389.git.christophe.jaillet@wanadoo.fr>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 Aug 2024 13:38:42 +0200
Message-ID: <CAPDyKFr9q=EcDpQApyu-RwXth=ghV07B1Mo70hUZEZRp4vdm=w@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Remove struct mmc_context_info
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Aug 2024 at 15:24, Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The 'mmc_context_info' structure is unused.
>
> It has been introduced in:
>
>   - commit 2220eedfd7ae ("mmc: fix async request mechanism for sequential
>     read scenarios")
>
> in 2013-02 and its usages have been removed in:
>
>   - commit 126b62700386 ("mmc: core: Remove code no longer needed after the
>     switch to blk-mq")
>   - commit 0fbfd1251830 ("mmc: block: Remove code no longer needed after
>     the switch to blk-mq")
>
> in 2017-12.
>
> Now remove this unused structure.
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied for next, thanks!

Kind regards
Uffe


> ---
> Compile tested in drivers/mmc/ only
> ---
>  include/linux/mmc/host.h | 14 --------------
>  1 file changed, 14 deletions(-)
>
> diff --git a/include/linux/mmc/host.h b/include/linux/mmc/host.h
> index 49470188fca7..545bddfd7e1f 100644
> --- a/include/linux/mmc/host.h
> +++ b/include/linux/mmc/host.h
> @@ -292,20 +292,6 @@ struct mmc_slot {
>         void *handler_priv;
>  };
>
> -/**
> - * mmc_context_info - synchronization details for mmc context
> - * @is_done_rcv                wake up reason was done request
> - * @is_new_req         wake up reason was new request
> - * @is_waiting_last_req        mmc context waiting for single running request
> - * @wait               wait queue
> - */
> -struct mmc_context_info {
> -       bool                    is_done_rcv;
> -       bool                    is_new_req;
> -       bool                    is_waiting_last_req;
> -       wait_queue_head_t       wait;
> -};
> -
>  struct regulator;
>  struct mmc_pwrseq;
>
> --
> 2.46.0
>
