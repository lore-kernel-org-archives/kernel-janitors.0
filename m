Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A6279C5
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 20:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585899; cv=none; b=ZbyO28h/qvQtjUUcPJJPS65KEsdloVZRrJSPcFRstHVkFKGzNN0oMml8JX/cPq9lyy04wlpOTno6S1BNAelzlubqfAKoJ74j0WY71SNM8KmpNCGNef086pIroPFcd8+m4Vp5dmKVVlOOxdWa8b6tp0SCqEbsNbduP/qWk+XY+VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585899; c=relaxed/simple;
	bh=vdK6RiW/KweEb9A7JW6V9Ozhw2b+gLO9iT+16Hcypr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqsjxq54yeFT0r9w+5mhYfQdIm/0ZyYJujIW6/SjvgykmH0DctE1YfX0K+fbl5o+I2GrKkSv06cvU+aMsLJq51YWMAFzj6tTdSH8SbiCAJLmPg4V5p3AYQbycsKZqpRrEjXOVcgP8Mkpkh/J96sPRcIB4emJh8ZUgzTSIasgQgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JTg4ctT2; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JTg4ctT2"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so11902355ad.2
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 12:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709585897; x=1710190697; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MBysldzXTflPzomKWRmSMXhF54SNqFAu7g8kqMxzJW8=;
        b=JTg4ctT2hzSBE5HZLwwuwqL52LNpw/pz84iJ+Lm9UnxvXgd8xleoD04qL6ScUAL+gG
         xFETjvJwH1BYAHdMKxxFr7r3hpwUrdz0r85KnBrBJZXSzfqiBY5nKIMH+scCd9ZirZAb
         /+qvENFgdlvIJ1apQ6VXW7x+15GNuzAhR/tAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585897; x=1710190697;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MBysldzXTflPzomKWRmSMXhF54SNqFAu7g8kqMxzJW8=;
        b=XgDho1N3qnkMF7a4YuB5pTt5haBqwwM6Slf3f5lfzP+WIQqYPXsrzu6d3tqp+90X0v
         ROXby5TqpY4adK5NlqbrzSLdb8a0z9cooHmZA6p3VHzbjnCtRhUnleOkEhnKHEj3Jwg+
         kcx4A3h8CdboVhv0RIIHROVZikGiVrijayDWsHRH0lL2S+C2dXs/od5Bp8QOLftk8Pcm
         siOTDp9uEhPpRfqsOQXGMPVrGb4PLHOAJy1kw4FdQaFNHQGWdsy5RJqZ2BEJPTQKTlgG
         QrhH4AKYf1wSVqu6gcQKPFGpi89M0cT+F+stsEqisxyhW4BYEFWMX9L6OSKKqNvCWZgw
         0jIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuE/eyz9kEszuepK149vq+vGDnwtLASZSljqN/TkyOMjFD22nFE8yLQYe4HC4gNY5j9rwliP2eoNcK1PLEdxG2BNyXbrAJrvyWI43Ey/2Q
X-Gm-Message-State: AOJu0YxqSyMlZADRhU0GKTApAnFMXP3NdXx9YK/u/DXqBf9qqfm7RHvb
	QIBDSQK/oYJDtWI6PVLEf08cICmw8FKkxXnyKRBnohf3TTQ2rYAQil9Nz9rkXg==
X-Google-Smtp-Source: AGHT+IHa3YpcV8KFwBIJ1K/azj4a+KW8cW4kPPah4+2gIkxeNC+6+YuYOXOCykzg7xOmrXCDdKZsvA==
X-Received: by 2002:a17:902:a3cc:b0:1dc:794e:27b2 with SMTP id q12-20020a170902a3cc00b001dc794e27b2mr10676858plb.56.1709585897109;
        Mon, 04 Mar 2024 12:58:17 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jv11-20020a170903058b00b001dc96c5fa13sm8950726plb.295.2024.03.04.12.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 12:58:16 -0800 (PST)
Date: Mon, 4 Mar 2024 12:58:15 -0800
From: Kees Cook <keescook@chromium.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Shuah Khan <shuah@kernel.org>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] selftest/exec: conform test to TAP format output
Message-ID: <202403041256.80EDE9BA2@keescook>
References: <20240304155928.1818928-1-usama.anjum@collabora.com>
 <20240304155928.1818928-2-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304155928.1818928-2-usama.anjum@collabora.com>

On Mon, Mar 04, 2024 at 08:59:24PM +0500, Muhammad Usama Anjum wrote:
> Conform the layout, informational and status messages to TAP. No
> functional change is intended other than the layout of output messages.
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> ---
>  tools/testing/selftests/exec/load_address.c | 34 +++++++++------------
>  1 file changed, 15 insertions(+), 19 deletions(-)
> 
> diff --git a/tools/testing/selftests/exec/load_address.c b/tools/testing/selftests/exec/load_address.c
> index d487c2f6a6150..17e3207d34ae7 100644
> --- a/tools/testing/selftests/exec/load_address.c
> +++ b/tools/testing/selftests/exec/load_address.c
> @@ -5,6 +5,7 @@
>  #include <link.h>
>  #include <stdio.h>
>  #include <stdlib.h>
> +#include "../kselftest.h"
>  
>  struct Statistics {
>  	unsigned long long load_address;
> @@ -41,28 +42,23 @@ int main(int argc, char **argv)
>  	unsigned long long misalign;
>  	int ret;
>  
> +	ksft_print_header();
> +	ksft_set_plan(1);
> +
>  	ret = dl_iterate_phdr(ExtractStatistics, &extracted);
> -	if (ret != 1) {
> -		fprintf(stderr, "FAILED\n");
> -		return 1;
> -	}
> +	if (ret != 1)
> +		ksft_exit_fail_msg("FAILED: dl_iterate_phdr\n");

I'm for this series, but I do note a weird glitch in the ksft API.
ksft_exit_fail_msg does:

        va_start(args, msg);
        printf("Bail out! ");
        errno = saved_errno;
        vprintf(msg, args);
        va_end(args);

"Bail out!" is not very descriptive. I think I'd rather this should be:

	"FAILED: "

and then that added prefix doesn't need to be added everywhere in this
patch, nor the "error: " prefix in the next patch.

-- 
Kees Cook
