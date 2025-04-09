Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E445D2505A7
	for <kernel-janitors@vger.kernel.org>; Wed,  9 Apr 2025 11:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744197030; cv=none; b=aOR8ZqKBgnifYvjzl0es0S1NwTJBLZjcZsTvL0QMUh3rPwB7avrMzwgX9Khz3TXhINbAPPqgiDjzr1YHEA/pFpd0bfhi8np+peYgP0FT7Cdm1kfjwp7L6IBNxtgaWa3nRZ2tefbcVIqjmlPTyDwOHf8Y1U1gmJepyzsT/oetPHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744197030; c=relaxed/simple;
	bh=1cRD+Q2EoGSHOsD44Cq0W9nkSKnhVJaA4hp6x6u/kEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P7xYRjOHqtdRtMHMaZWflRh1KFsXflQsOupqOIwkMXSuevbC2YWFR5nTDLcLQ3qsCQq6YY3h9NTDGfc8yl7r4g66rrMxWKRvneD964Lp3Z7DLF9/0aSBA/aUXwACmYfMEiuzpxq/X58VoQORgaC1/I0Gem+gCgGV0KVrz1xaOHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TusZ+bex; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TusZ+bex"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2295d78b45cso88113185ad.0
        for <kernel-janitors@vger.kernel.org>; Wed, 09 Apr 2025 04:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744197028; x=1744801828; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1cRD+Q2EoGSHOsD44Cq0W9nkSKnhVJaA4hp6x6u/kEw=;
        b=TusZ+bexpNNEZYaKkjwOZ3nCoYWkYW6ILEViYBMKxbjwBW+muwIGt+WHK64kmbJssL
         c3QMn4E/Z7MV4uQTgHR5mfxyZ2/zOVjulXqHBTLGfboQHlAbPmsgaibqdLq3d1abE4nr
         QDgiUDwColfI23yHs39rg3pqWp3RZvb6MhAYw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744197028; x=1744801828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1cRD+Q2EoGSHOsD44Cq0W9nkSKnhVJaA4hp6x6u/kEw=;
        b=TWw+94mBWAPymzqGHIFRnnoR9AQK5xicTdYqahjxp2kFaAnTc9uh51fr0riJN6Ak9H
         nttA/UYAtWquuYEzcVfFJyOb0Bz6EABAAXi6hMFNrR44wmUuP3iL2pOevG2FcNJ157Y9
         KGXy2x+G+/gHwH3jzoqQL9W+Q+YerPITERwlvXPKdG8FcZqhG4Wxf/REoj6sEq/HUuIn
         j8SHG8kBkzFI+5SECmCM5cQd7kwSJRnJecF1jifJ0Ku1eWhzzhnaleUkROoA6vivofhD
         qjkO3GPOt4FgGbMQ7msqr0AjR6WPL1HZ3ShJ35u2ho/14SPWSjLWUCAV7iTWX621dvyH
         n3/A==
X-Forwarded-Encrypted: i=1; AJvYcCWz3S1JF551eJb1FnnCXD3pVGeN20m8XH1a5USKjEJ7k9qK7v37tHYuNGcPAnAHk0USr1ho2H3rONtrUks/OAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/lYm3jKyhaQQ2KDLStk2oYmHR/1ObBKbgxKPr3gb1IsUStEHK
	0Poz4hY/OnDKld801pzMdQhYb+ClNW4omyGvGclynoTt6vDQ67PotPoWLv0TNQ==
X-Gm-Gg: ASbGnctEhIiGLXLVxBwvjjWuBIzBxd3f4tIgV5bDIBP3ZxOpAn9mUsRJX+lY5g9zQqg
	a7OY5psNQclIMCPRbOJbiIUNs/lmVCk5nGHRDDXV4f9Ef3jFfKgjHW/Xk8NW9k6n2esa1EKbZpk
	f0MIU2UedJOoa/rHXHYHH4c+tE9miPKrUPgi7IeosPIXB2IdR7JFCXyJunNACVQKzRsIhFCYv3U
	rud5CjN/kWMlD/4jZ3v7de8zXNU3YEL0DNkTZ0uRAT03Z8h/IfCS6Mu35FCS/DCZ16+2+eaXvt6
	cty5aH+J1Yz6nZRiEaOWKu8ZpTSY/s2lgCQ5zTPtmVkD
X-Google-Smtp-Source: AGHT+IH6fxmgITIb/nhtffS9HlLl7QIjWlAJGMs05n4iRReuayhWjvcGq2N3FOP8fHxbYwcNMgiypw==
X-Received: by 2002:a17:903:1b28:b0:21f:7e12:5642 with SMTP id d9443c01a7336-22ac3f6df3dmr30398605ad.18.1744197028206;
        Wed, 09 Apr 2025 04:10:28 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:eb5e:c849:7471:d0ed])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c9c747sm8987785ad.130.2025.04.09.04.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:10:27 -0700 (PDT)
Date: Wed, 9 Apr 2025 20:10:22 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Dan Carpenter <dan.carpenter@linaro.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Minchan Kim <minchan@kernel.org>, Jens Axboe <axboe@kernel.dk>, Brian Geffon <bgeffon@google.com>, 
	linux-kernel@vger.kernel.org, linux-block@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] zram: Fix uninitialized variable in
 zram_writeback_slots()
Message-ID: <osj54aiqi3b3dtgyfituj6tqpar5s7trkkx7hytfozl4cifc63@mu7bb5pyse2n>
References: <02b8e156-e04f-4ab3-9322-b740c1f95284@stanley.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <02b8e156-e04f-4ab3-9322-b740c1f95284@stanley.mountain>

On (25/04/09 13:58), Dan Carpenter wrote:
> The "ret" variable is only initialized on errors and not on success.
> Initialize it to zero.

Thank you Dan.

> Fixes: 4529d2d13fd1 ("zram: modernize writeback interface")

This is still in mm-unstable, mind if we fold the fix in?
Or I can send a v4 with the fix applied.
