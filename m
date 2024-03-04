Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E13FBE4
	for <kernel-janitors@vger.kernel.org>; Mon,  4 Mar 2024 20:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709585759; cv=none; b=Fhv0Z3HXqBTFjg+cwtxxRTFjJOa61DKLETjT8wYqoCTf/h5umhCCK8yn2PQbUIWEzzlGQLxDnNVI9xzwN3wdfzZgeddULdMZpDPdiEjco/QkKENSsXIquFpO/QYVvjJAyLlVp6IN6xjfmaDdWXo1K5YIpRhl+GUh/4cbIJ7EVW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709585759; c=relaxed/simple;
	bh=Xlz2ZWcOWc8IDGysuXBIvluPifNHYRG/R4yvi08pKOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr6Ak63+DRN9P3VGnLnuHsPPkkhRi9yA4EWAoFNRNt7AlrLPCNGY4vI4AKzYqWWWNlHBnKGOgcbV2uH06MVjT/BOFA/FEdLmvgXeriJyW7JPhJ70tX+jBNAJoKWWH1xGhpFdTnNsFqmcEsJ0Y54ykj6vjE58gU3GciO+8rn/HQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WiB1WV2i; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WiB1WV2i"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e59bbdd8c7so4081227b3a.3
        for <kernel-janitors@vger.kernel.org>; Mon, 04 Mar 2024 12:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709585757; x=1710190557; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8VZP6eFRFm49p8drfTAJOKTfORAhladZw0uGB3+WSL8=;
        b=WiB1WV2i9C6GamF/xI8b46IAsf/wrYNJGrUHuHSazgVuj2hH6uJyLhb2yycmuutAdb
         8Cd4bopXxJbDprDmBqX01DRiNHhzQZ1OrKXoE5X1LVH4cJqZ2Wkk8dV+IgqA0WK7Fxl8
         Fsz4xt9nUxd85mhWv5Y11FH4BMuQfYbcQ2dtU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709585757; x=1710190557;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8VZP6eFRFm49p8drfTAJOKTfORAhladZw0uGB3+WSL8=;
        b=fPsEWs75zqlDKfZ23zj73i197L5LJecXcVH7aDk2GqAy2apGRJHXQAt+Bn3OAiM1QT
         kYoQFO05pAV5JPxJhe0ystdDvMv/6cgtms1gr9YgsDM9FN8UYnVxJBIteP2vcpfW5Aw7
         Om0PaWrSFKPmIjlsM+NyN0dBjT+9BgG58V538b3exMO8N9ApErI4pfkDy5jbY91mL0/V
         vRa1g8h3ZNRToxtrz7p+qNHNz7EdsIx/rP9g2nJV+qh6M6KtjJ8BED8mNEjb/jTC7YG6
         OnwdpcJUQJ73kUbBpF8AakfnSfVRpZlWCJgOiKfBmhmZrX58cBob+yJKgn7hjabCPQAN
         MOpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCIXFxJClkEzXfMWXIXqBLBH1/mxmGktuCeQ0ys3q9eq7U9oO1kAzBf1GnzXO1Gffi6haeMirfZDqC74j5snXlxFgxM/bOPRe3Ga+UHZvI
X-Gm-Message-State: AOJu0YwGxgdZ08Rzn4ys1TODy/ODUw6lQxUDwcOB5cw3YbaMys9zCtlL
	0vbmPXvkCBMin0TqGlB4NHh0pUBHpRm3vjpLTBuIzKCjzA7iQYyj8E2+1HmhDA==
X-Google-Smtp-Source: AGHT+IEk6XxeY4cdUe3b+NTvi17Gu57p9lo+D0aVZSXVbjaWNgo5OYjM6y6Rs9SMukETfLs4Bkx8yA==
X-Received: by 2002:a05:6a20:8424:b0:1a0:b05d:2d04 with SMTP id c36-20020a056a20842400b001a0b05d2d04mr12851206pzd.26.1709585757622;
        Mon, 04 Mar 2024 12:55:57 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id e29-20020aa7981d000000b006e592a2d073sm7535861pfl.161.2024.03.04.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 12:55:57 -0800 (PST)
Date: Mon, 4 Mar 2024 12:55:56 -0800
From: Kees Cook <keescook@chromium.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Shuah Khan <shuah@kernel.org>, Eric Biederman <ebiederm@xmission.com>,
	kernel@collabora.com, kernel-janitors@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] selftests/exec: Add the overall result line
 accourding to TAP
Message-ID: <202403041255.4964C19467@keescook>
References: <20240304155928.1818928-1-usama.anjum@collabora.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240304155928.1818928-1-usama.anjum@collabora.com>

On Mon, Mar 04, 2024 at 08:59:23PM +0500, Muhammad Usama Anjum wrote:
> The following line is missing from the test's execution. Add it to make
> it fully TAP conformant:
>   # Totals: pass:27 fail:0 xfail:0 xpass:0 skip:0 error:0
> 
> Signed-off-by: Muhammad Usama Anjum <usama.anjum@collabora.com>

Thanks, looks good.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
