Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3174B666
	for <kernel-janitors@vger.kernel.org>; Sat, 16 Nov 2024 17:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731779162; cv=none; b=Q5Jh9uW1nk1f1k0hKgy25QT1bXrXT5wHsdh0zqc1ZYUDdXoMss+G8H+OmtcLe9Y34dFJRDLDrvVa0i1L9tYTFeCkuLbpft/tDPFLB8bRT6ysL9RXUgiLEh3wGJyFraUYJUuX9vsQ78HdYlD1XB/Akq8WkzM6xbS/517yuIKfL4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731779162; c=relaxed/simple;
	bh=uOytK0/YkKrEa4/zyILRrO5TUonKSH/DAPj0RWsgDh8=;
	h=From:Message-ID:Date:MIME-Version:To:Subject:Content-Type; b=Q4kEVpIuyRdr3kVfGHe3r8XthMdjzESQHiWWHHYTKMmZcwpVC/IdJF4sVT9mKdjCpEItC2w3zdhaBzTZ5A6aFyUeyd188iJWW9lrF3gKnZA1Tp1V5QAqybChQDB/6zkH3lJaClUxJhwqqYLoEqs7hQhpNln82w0toDLoYKQJE0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=We7SDXBF; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="We7SDXBF"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a9a0c7abaa6so93936666b.2
        for <kernel-janitors@vger.kernel.org>; Sat, 16 Nov 2024 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731779159; x=1732383959; darn=vger.kernel.org;
        h=content-transfer-encoding:organization:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qIu1FZ5Xi9G6Ez34zHgFN7HrLFjiKEjAo8IWEIEUZcE=;
        b=We7SDXBFPz2H8rJmio5cRhfrpT7vaO/pDXq2s3Z+2cx5jJrCSAaDJj1WMgjk5iTcf9
         z3LwCdbe7WJRuUcHLusEqKQUgvjKjaSrb3yVYKMmcGUgExMEm5uWEoxKz4VQ/FyATZ8w
         j0c2H59u83whTV2wsrJ6hYP7e1mE+unWCQg0+CP6UfDxLdt6dFSYfb81EvJ0Qcd/GfOj
         MWgHRJ7oVA5IE3Udb3ciSMqjBfBd8SbTGjbRxiuOtU8WjSefwwNKjOWz+JcxGO+MMEHs
         XdeMli3rBP/7WFUXo7TNhjjtV79DbTu11WY5nCzPZuY7246BX7hR5kfwwD0uNGOOYdT9
         dbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731779159; x=1732383959;
        h=content-transfer-encoding:organization:subject:to:content-language
         :user-agent:mime-version:date:message-id:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qIu1FZ5Xi9G6Ez34zHgFN7HrLFjiKEjAo8IWEIEUZcE=;
        b=Qt91P7PWfRuaBehrAe3P/tKTfqI4jJtTjbNepZDR/V+85uc827OHgEIKPixZM3nTmo
         OM/0sQvOhVRqswxmrY5xZ25A/+2t0vIEMr08CoJQDc/PnHnZxEoNFDEdOTeUmExz+Gfw
         5mxMpW75ry3H6lKhc9TY4ct3WD4pSzDdk6WgvjF0AFxN7OZcTM3cf9RWDFFo1MY69RVb
         WDhYWLookcCBBMtSNlL2omjStwvlkzvevPXgj6PGQe49ptBo+WKe6KlGNac6UbutY8BG
         1rtcBatn7sRRaZyKQIE0tKGNQo1o9vfRLj4YlmFT7oWhGlczla56kZ5trm+gmWW+K8Ph
         GkLA==
X-Gm-Message-State: AOJu0YyRA+uY8rTVUJBUPYAKSj5aBhYCRtdUxuIFoxzRTTVtvrQzc0St
	BsizG0q6+ruKmZmnW9fH+iJrNJPsXMQcTj3g2XFauDVnqqUHiJGdsryObg==
X-Google-Smtp-Source: AGHT+IH3lOBQmHukVu83FLBk8yHYDkNkhet9PbadJwDc6/IcZrKHQG2PJzXN6gp6JVR2JrfMBqPang==
X-Received: by 2002:a17:906:f588:b0:aa1:e60e:6fe7 with SMTP id a640c23a62f3a-aa4833f6579mr670014466b.11.1731779158668;
        Sat, 16 Nov 2024 09:45:58 -0800 (PST)
Received: from [127.0.0.1] ([193.252.113.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df26c5esm326669966b.32.2024.11.16.09.45.57
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 Nov 2024 09:45:58 -0800 (PST)
From: Alexandre Ferrieux <alexandre.ferrieux@gmail.com>
X-Google-Original-From: Alexandre Ferrieux <alexandre.ferrieux@orange.com>
Message-ID: <97f3b17f-2e92-4cb7-8ee5-3a76969fb2cf@orange.com>
Date: Sat, 16 Nov 2024 18:45:37 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Mozilla-News-Host: news://127.0.0.1:1119
Content-Language: fr, en-US
To: kernel-janitors@vger.kernel.org
Subject: RFC: chasing all idr_remove() misses
Organization: Orange
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

In the recent fix of u32's IDR leaks:

  73af53d82076 net: sched: cls_u32: Fix u32's systematic failure to free IDR
               entries for hnodes.

... one side remark is that the problem went unnoticed for 7 years due to the
NULL result from idr_remove() being ignored at this call site.

Now, a cursory grep over the whole Linux tree shows 306 out of 386 call sites
(excluding those hidden in macros, if any) don't bother to extract the value
returned by idr_remove().

Indeed, a failed IDR removal is "mostly harmless" since IDs are not pointers so
the mismatch is detectable (and is detected, returning NULL). However, in racy
situations you may end up killing an innocent fresh entry, which may really
break things a bit later. And in all cases, a true bug is the root cause.

So, unless we have reasons to think cls_u32 was the only place where two ID
encodings might lend themselves to confusion, I'm wondering if it wouldn't make
sense to chase the issue more systematically:

 - either with WARN_ON[_ONCE](idr_remove()==NULL) on each call site individually
(a year-long endeavor implying tens of maintainers)

 - or with WARN_ON[_ONCE] just before returning NULL within idr_remove() itself,
or even radix_tree_delete_item() (quicker but possibly disruptive)

 - a variant of the latter being to do it only for harsh bug-hunting builds (the
ones typically used by patrolling bots)

Opinions ?
