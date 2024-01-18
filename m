Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52D5686
	for <kernel-janitors@vger.kernel.org>; Thu, 18 Jan 2024 05:29:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705555767; cv=none; b=F9j+eiNAQlpYq72QYcrA9g/2zuzXPmYOmLAo9i0OkIWlpoCO49y0Wg1UrCmFPqqhAPRB5wfTroO4VeN9UOxSyF1gSWWAiKpm1kBz54SX6FeMgA2HVP4WZwz8f9A3UCTFrJYtQ52rXvwYDNa2OjBKQ/Ds4x1HyYvIehZFwQ5wVfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705555767; c=relaxed/simple;
	bh=SBVMA/CPQNcVCfcURUzuwVBCE1qUg3c5WG0zdMGFPQg=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To; b=eOfxLrYK7xptDjeoZ3+vLgdrzr9RSvWQ9d9oEco5bwpjewfH/0qTNo54xM25mumEu7tHAYu2Pr9ZPlC0GAsj+xuv0n6H9/YZ0k9uK8p9/6uZt+wSCt+yDUO7/cGwi7sZplhvzdaqfsSjXjXHFCOsXJr4xirwHg2QkXBCdQUTxpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bies4SxQ; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bies4SxQ"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e800461baso31788055e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Jan 2024 21:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705555764; x=1706160564; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wWVOjE9eG7LQZ1p5rDtepmpo2WIDbMJDdYV1+1m1FBU=;
        b=Bies4SxQOMm2y9Btq51UiXzVZwhtvjN5NVmtvQJ0eMUe5gfREJdCIWlM2FxjYkiBL3
         viV/JtBvnRgvSaTfwEus92WDyzUb3MfLjJ5O9zlh/ZVwvyVQBv9ZeiJiF1E7DFlkoLLO
         63j7Xl9jQkNSOsfYa7Ts9+OTe+0uab+XRsZ5WD7dEzWzmQQ+NdTwQcWCyP+4CkAEiz+r
         ORCWpnC38A/1yZmryV8RrfSfvJ57rWs9JR8xGuX/rZYA8bP39uLvGBOE2VJtukBhe+Tc
         C7nh4w/yN1i/HRgsTCxOEl+pkZ6R/0O2RS9YvtIv8EHNK1rY8hSfBv0GqE2qbHOeuljq
         YHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705555764; x=1706160564;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWVOjE9eG7LQZ1p5rDtepmpo2WIDbMJDdYV1+1m1FBU=;
        b=GUhGoXgUdyuZQLjA9BP90NaWV5ORHBltse2WeAksn0AfLDN4vl6zfslHO6cIJONJEO
         xY0MJ9r47H8JfgICUXvqEgmM8prcJbslBjr3+AbzYecDrnVwE1D2h0X/I76eUFMAxiH6
         VE3M48UtfU+d2q4axCaJjJ8smoLleeYyElt1XYiXtRzwNSSkWWVrh+q4D9E+pH8vijx6
         QrA60rHQtULoSLj1oWmxcyxM3tgujj0DdU8sVbizf7QsbLvTQ/WWXSMsJK73oUyKtlGa
         JUsQL2BUOVzNl/+SqMQw/Z5SpWYD+HQZJUEjNQmt6EQwS5nILiry9NZb3LOFitXGmLzf
         dsgQ==
X-Gm-Message-State: AOJu0YzHyGckWN2rKRVp72G5T7ogoD9CtJE99bjm7suS9VNhbkfM4OSk
	xbfboBB+bcdz2oAgwAS2J0phaOFI31c1FosM5dPeQ4JPFKxwxsAEu88DrITOz7c=
X-Google-Smtp-Source: AGHT+IHaCjW/5P67xwqKO0g8DnWLu4YQwaK2HHCRSW+8Wlvh81P/g9nOxJOSa7NQjI8+GNuKu6R48Q==
X-Received: by 2002:a05:600c:880e:b0:40e:4799:8a81 with SMTP id gy14-20020a05600c880e00b0040e47998a81mr66295wmb.281.1705555764049;
        Wed, 17 Jan 2024 21:29:24 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id o21-20020a05600c4fd500b0040e34ca648bsm24586127wmq.0.2024.01.17.21.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 21:29:23 -0800 (PST)
Date: Thu, 18 Jan 2024 08:29:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-hardening@vger.kernel.org, kernel-janitors@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	Kees Cook <keescook@chromium.org>, Tony Luck <tony.luck@intel.com>,
	LKML <linux-kernel@vger.kernel.org>,
	=?iso-8859-1?Q?G=FCnter_R=F6ck?= <groeck@chromium.org>,
	Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
	Kunwu Chan <chentao@kylinos.cn>
Subject: Re: [PATCH] pstore/ram: Return directly after a failed kasprintf()
 call in ramoops_init_prz()
Message-ID: <26759e3b-ff74-4b04-b06f-4d68fbc5f606@moroto.mountain>
References: <644f44ad-7e2b-4a1a-bbd7-ccc79d479242@web.de>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <644f44ad-7e2b-4a1a-bbd7-ccc79d479242@web.de>

On Wed, Jan 17, 2024 at 09:24:12PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 17 Jan 2024 21:09:22 +0100
> 
> The result from a call of the function “kasprintf” was passed to
> a subsequent function call without checking for a null pointer before
> (according to a memory allocation failure).
> This issue was detected by using the Coccinelle software.
> 
> Thus return directly after a failed kasprintf() call.
> 
> Fixes: 1227daa43bce1 ("pstore/ram: Clarify resource reservation labels")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/pstore/ram.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
> index 88b34fdbf759..1a673a4af17c 100644
> --- a/fs/pstore/ram.c
> +++ b/fs/pstore/ram.c
> @@ -595,6 +595,9 @@ static int ramoops_init_prz(const char *name,
>  	}
> 
>  	label = kasprintf(GFP_KERNEL, "ramoops:%s", name);
> +	if (!label)
> +		return -ENOMEM;
> +
>  	*prz = persistent_ram_new(*paddr, sz, sig, &cxt->ecc_info,
>  				  cxt->memtype, PRZ_FLAG_ZAP_OLD, label);
>  	kfree(label);

This patch is fine as a clean up, but I think it's useful to say that
if you pass a NULL label to persistent_ram_new() then it will return
an error.  It won't crash.  So this patch is a nice cleanup but it's not
a bug fix.

regards,
dan carpenter

