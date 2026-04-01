Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9AE3A16B0
	for <kernel-janitors@vger.kernel.org>; Wed,  1 Apr 2026 12:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775045771; cv=none; b=ZfrzpkqPO1CRqvSfmEucY9Poc2ZdwgjZOenJTn9o65bmtDgx3P8plqpsdAxBQbtiLTp3gK4Mre1pg9XK2gzfzH4s0yjixIZDjZL93FFcTnGZn+tBHodCV2nq1V2zSF1Nsxck546SSboDeW5HhRLdLrlO84vaxJH0fHmF+IRuDXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775045771; c=relaxed/simple;
	bh=3wxD6idGHQG4j4jBBXn3Maw8ufvro1T7/HQAf7AQIJQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=GfpSy8JPfthJ0WxRStMsoA0ih02GmrHXW/zdV4IrlBvk3Ofd6AL4YXBT7wnX1QTGgGRGmuI+clraXBHZ77TUPQn8hLi5kO5XPqiMMSD4BaFxuZ5ERAtge6lOf+qbpCqXl1syp6+UGeKTivxJBNcw8dxU8/lYminBVjvWdNykL/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifBSQOUK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifBSQOUK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486fb14227cso90384195e9.3
        for <kernel-janitors@vger.kernel.org>; Wed, 01 Apr 2026 05:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775045768; x=1775650568; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c/6LdoeEC7FOnQ7VHBSbWi+v6Qmo2pyXOZ2k8FFbrpA=;
        b=ifBSQOUKPwpzJ39i73x4yEEmVx5ROJRkxqoQTD989UKRIlEcijUCxO8e9L5h53q1V2
         Wxrf38bVnoqtP/2i0iDW8Ywwr82WtnZKHSSL6JC9ZXhBpxiU5Njd85KPNCWeUiPhX6SS
         qgbr3OnqOfGz+j8ICUceRZlrXGWhGPvxRYIp1Yr/GuKKUqK2URlJRCzOCTjmOk3hBgmJ
         qGxkpqWQydY1in88Eh2AN7pWEM1JWs15rpKMG6MlUWBm3YKMQ5qik27ZjBW/upX8B5/m
         +ih08Hs1irVHFoUnoyL3ItOi4XAMmilTp44W5WXA3zdD23YFUfLIVXy6E7Hd0H4x6/Q/
         1BXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775045768; x=1775650568;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/6LdoeEC7FOnQ7VHBSbWi+v6Qmo2pyXOZ2k8FFbrpA=;
        b=Xz77E1lbpWjwAIxq4HZW2AV5+JQhmbkObbLOv9Ze+Nxa2drxVVFBWF7A42JfFFrlqd
         ASib5o9Y0Q5r0dRaJs6oR6trO+Tz1TZIrzt2bh5w+wu89pvANvvqqGBb9GcmlLhAm3yD
         F9eL7yQB++UFDZ9PWOT4N8NFG6xsXeZGNbEk0PfE5T+rJIdserCLfZzBWHtE6Z3/8ir3
         OgrqQzdWAiA12FmUC+Jx5rCgNUe13PgUbHXrXdIrP9/DURTtZ+LCA6tWmgwTJYI20abH
         elGcAozBeVD/Almq8QYM7MUPLm35guawB2ZZQ9tAZvuF/WtBc9h1xCUF8VbmSHJTx+NV
         5JJg==
X-Forwarded-Encrypted: i=1; AJvYcCUTK0wxroaFT7XPa3USYmh8UfXWKgxkZ0fOa3AIRzx2SpH+87GFP7kyySe6Vpj+im8Di22bUYvsx/2ddnNde88=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxIgcsO4SpZYdcm09lPYnYA1HRQDEU2FSCk2Y7S3Ca3dfa+xJx
	babC85vxzdn6mb0kyNe4MeENOIzFyADBuNwI3ceVzyzmV1Wf4/mCROeVMrS2S+PXn/g=
X-Gm-Gg: ATEYQzwglwWJWgwY9jXztn1IXu711THSh4wGgxs2A6Wk5fV4AUXOmR4ZdV9hqEtYg2S
	ds2ByJpmVgTMAmLqfbpWEhKHdzUpOifweUJ8X3UvjGP/7uZ1g39mLgoDZTxoCw1w6TPtTlTeJPi
	x7kKT//Fusdj1CeEfaDv4BAX6ZN+/2buA8IooUUa8+lmUcv74IXnpTkI+MQU65WDg00tTWMg4PG
	YJIFNiFDtbePio5IKYTid62+M/5Bsl9NN9l9FLUendcGAoxX+WKaF18hB6AXJhsgpk0hCtU2QDc
	cIUDBrALzWDv4ZqHkdj32LtjL5co+RAh5WqyWfOniAZYI8fOw6EB4fyDGhTDd3bK8tufJ14wr9l
	00Q9hHl//diA58TukDAvwf4KPuNLTcOkylt39pxBTj/DTh+TXMP+QVfar7TKiJ7qqF+k+bSEunL
	qUE3VaAb2zBK1IasWsRsiPq7QhHrch+dPqGM3yajVcU/51k9Mi
X-Received: by 2002:a05:600c:a406:b0:485:40fd:8390 with SMTP id 5b1f17b1804b1-488835ccc61mr43890645e9.26.1775045768376;
        Wed, 01 Apr 2026 05:16:08 -0700 (PDT)
Received: from localhost ([2a01:b740:1f:2d21:489f:54b4:5d16:4f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e82e669sm104677905e9.11.2026.04.01.05.16.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 05:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 14:16:07 +0200
Message-Id: <DHHT7K60IORC.2DG3PT7PB2OSO@gmail.com>
Subject: Re: more potential janitor work: simplifying test for power of 2
From: "Linus Probert" <linus.probert@gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, "Kernel Janitors List"
 <kernel-janitors@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>
In-Reply-To: <888a08d7-1d0b-f114-dd3d-e840f16c8803@crashcourse.ca>

On Tue Mar 31, 2026 at 1:49 PM CEST, Robert P. J. Day wrote:
>

[...]

>   Lots of simplification there if one wants some janitor work; I don't
> see a coccinelle test for this.

I'll definitely take a look.

I've only ever used coccinelle, never written any scritps for it. But
for these kinds of things, is it valuable to introduce such tests?

Or are they involved in any form of automated testing? I assume we don't
want to wile up an angry mob of maintainers.

Br,
Linus
