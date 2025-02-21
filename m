Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAF92AE86
	for <kernel-janitors@vger.kernel.org>; Fri, 21 Feb 2025 01:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740100659; cv=none; b=ppIWN5EOwYWLQ9AgSX2XNetxtQpBtaWE8zzKjD/geIyWbvrruMDIW4mLJQBue6U7udvzGxxLNbHHCdtJ+76vWaX9FUmUmq6y06iXAX75jc3I4Wir6ObVQESTGZ3LaB9YHSuIcPLh9EelFXrO+nR3KhHv8mCigea/UrcTBK3MKgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740100659; c=relaxed/simple;
	bh=1gCFFhPre328Jo6BJaxyEfCZJIQOlY9Sp8B3gGnSSpc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7+QpbjauoaZmRiAqgz93otJttWjW1Rss1GQleqjhri9AK1S+WflIhkKLB6IKqBWwFsM+9qvfIq6b8FZeLNMLzXsK2RCwCC0+InIjqDOHkK+I8q8d5aRuuYqGHx1K6AcMM0i4q0ZUUa5GuHs80erbBHfhWfaIBzmc67pgjGgRm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gv51tuVU; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gv51tuVU"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-471fbfe8b89so176281cf.0
        for <kernel-janitors@vger.kernel.org>; Thu, 20 Feb 2025 17:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740100657; x=1740705457; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gCFFhPre328Jo6BJaxyEfCZJIQOlY9Sp8B3gGnSSpc=;
        b=gv51tuVUcwD97ggiy/TBbAFhZK32mQqRJhk56+IN8T1SgMbReEC29JqEko+w3fPs0r
         kUtDCpLqwS7T1ppYUcBJ5udeqZv/3vRi7Ezt56NH0XzAPzNelB5AG8z/gny1eurV4T5U
         5w5u4KLgHwv8eEiIfDwG7tfNwCzKeE7L1qSGX4M6GqSotX76T4l4JzGg4etMO54qXY+v
         KkHbiC6XbpAiid/01eHjB8CirGjWN8JFQQDtiO/a2A1m1Tb8YBkWbx5jlJc04A4Qsk2/
         aQy03+fqyvwRHKHL3AW8x+KbrsO9WBX925xg9QEDyPwub1D7ggBfl9txLJpLpVtZQopq
         NJ+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740100657; x=1740705457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gCFFhPre328Jo6BJaxyEfCZJIQOlY9Sp8B3gGnSSpc=;
        b=jnv7H0LljCiXogOBr/3ClpyGtGbvKYiXLhmnQ+YMWsOYe3gQUcw2030DCCdrg4L/Pj
         q9G2hD/BUqJA7/0cUuH25NE6Ch+/r3EQ582TVLkQAlDzS+lwzBwVjIkhgWXudPpc2u0M
         Vma8IWVdXsl+b+i4KCDGORluxGhhTS6DyOE11wnj6z08ZeYmoBdlB9IRyEflqNn6341k
         Tq4aJXWbyVXnlIMNanAw9jiepckf6FZR4SogerXgeNNetfO/6GQOrCEszWkX8MePEU0l
         wVcYfUqlRLkYFDaR60iB/GEYG5MoW9YJleeLYVq4+6PibumDwcGBZ3GZSwXJLsO4+GqA
         2l1A==
X-Gm-Message-State: AOJu0YzmdcaJNzk+P5b4WV0CRu7wuTcc3Lcj1GsT0KsWq42tp6qIwRCj
	qfzLSd7YTMLbJimNknnhjV+TQb6PHlqqCQ4toIy1bGS3C6mNNQZvyi6cz7mDK1b+6ubXtQUwR+V
	amhnf5N9/M0arFL0XLh+eYg4Oon4P8OQoHKFL
X-Gm-Gg: ASbGncsqwwdNF0MZf6PfnpDJ9khA6ptlr67hdFXaqREv6ldW+k3pM6UJWKCtDdoxUNd
	k2D6h37pFO++gzDiWawc2ybBFqUwRDlmXN4dq8yStparRNBACgGsQklC+Lw5Hv4i6LWSya/zgQw
	==
X-Google-Smtp-Source: AGHT+IF7AlNAgH0UjxRv2es5ALe+A6mfPGmSxVbX6luAUr0KjSPvKmibXyCkkasN3H9u5m8y/v5ldowj7oAsz0/k9wY=
X-Received: by 2002:ac8:5a48:0:b0:467:8416:d99e with SMTP id
 d75a77b69052e-47225106af3mr714471cf.21.1740100656296; Thu, 20 Feb 2025
 17:17:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250210195117.1074569-1-joshdon@google.com> <8923aaae-becd-489a-bfe1-8c1c569d8d48@web.de>
In-Reply-To: <8923aaae-becd-489a-bfe1-8c1c569d8d48@web.de>
From: Josh Don <joshdon@google.com>
Date: Thu, 20 Feb 2025 17:17:25 -0800
X-Gm-Features: AWEUYZmnLnZOx-woOtot8P2f9Hp1GdUS6u38mNdHZANKITXS0Y2iOa1hU6CM9p8
Message-ID: <CABk29NvJu82jsMBvoE0Fte4oo=tcVk0H=z1WpcaBasdaXC0Kmw@mail.gmail.com>
Subject: Re: [PATCH] sched: fix potential use-after-free with cfs bandwidth
To: Markus Elfring <Markus.Elfring@web.de>
Cc: kernel-janitors@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, LKML <linux-kernel@vger.kernel.org>, 
	Ben Segall <bsegall@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	K Prateek Nayak <kprateek.nayak@amd.com>, Mel Gorman <mgorman@suse.de>, 
	Steven Rostedt <rostedt@goodmis.org>, Valentin Schneider <vschneid@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 12:11=E2=80=AFPM Markus Elfring <Markus.Elfring@web=
.de> wrote:
>
> =E2=80=A6
> > For full correctness, we should avoid removal from the list until after
> > we're done unthrottling in __cfsb_csd_unthrottle().
> =E2=80=A6
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.14-rc3#n145

Thanks, yea I'll resend with the fixes tag and with all the additional
review tags collected.

Best,
Josh
