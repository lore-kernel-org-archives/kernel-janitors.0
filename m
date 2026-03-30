Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24574315F
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 12:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774872655; cv=none; b=dfjqiB3K/Mze/4egG5wIy3UTcGdm4GibTDfo6aNQNX+DjEMuGVxpK9GDxOofiy/ohK2TWBZ95JijpCwFvRr40qyu8AvcgBVjiUkKC//T2mhoCvLlRE87BZRdDtDFDS88cU2f12dxa8QQya2Pq7VPUZRAcaEag/GSuQs+m2oUFDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774872655; c=relaxed/simple;
	bh=JsCm1/xPfnNaQnETgfqz9hxlLfjLgnC+cbFTHpTa+Is=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qDgoa+2JByQs6zsCjvVrg9PcEZk6L943ZKjYSgtVZRkMkqZZthiTFKQpzeAXK//5QyHZi35Fzlbp9yhwkn/UhPEY2aWmbfFgOPxYlaTW38yReCNYlGg4HyScaDj2AZwpAd267FH1kqF7w8dxRQv/tTy0xT8UhnN/XSBM7cqPROQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CaajqP+x; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CaajqP+x"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a12c19affeso7531581e87.1
        for <kernel-janitors@vger.kernel.org>; Mon, 30 Mar 2026 05:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774872651; x=1775477451; darn=vger.kernel.org;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JsCm1/xPfnNaQnETgfqz9hxlLfjLgnC+cbFTHpTa+Is=;
        b=CaajqP+xnRBjpCBHkIvhgmz/NUAt9bD3SXQlzRamQm8P8Dpmpx4KjmnRS2Nyh6uJlJ
         uRWt8w27fJwpIEzwdhBHIYpxVZbo1LRp6mbLz0tiLPfk4WpiT5lEFjOFSTkM3kjervV2
         5cQcrPMnt9sWcjd6PUMjt4nMXJ52OBeVseTzGhka9xR5l2pBFVwzQJNe8VclKcTr2hdG
         j/gymTdK79q1qsRYkRUS/VtfZMeSZBx64LWeMa0HPAShTCeihH/bihRtRn0wb698xnVw
         uWKdt7yIqYPtEP+nYscAfkDSXEtXJzf7glY8BtqTlAD2zmp5OISCnTR8ic2pFJSMLn/s
         rovQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774872651; x=1775477451;
        h=content-disposition:mime-version:mail-followup-to:message-id
         :subject:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JsCm1/xPfnNaQnETgfqz9hxlLfjLgnC+cbFTHpTa+Is=;
        b=quNwua7Vl9nhMPIZkHEQ8ZwllCB+sCo/NR7T5ajHe0A0zvE5Ma3geptxT7BR1FPTop
         uTzGiCaVbujYWJtnXQHbb3uv4UeDVKN5lgBz0eICvzumVbNuVScYvcym/zGEckH/h6vh
         R2Jgf2ZCcs7HbKO2ng0v8jAFOFFaK+Ob85XAqrGZCHzy94GSbWZsbzeC6J4cMK1JWzsw
         V4+1nYDMXdk11kb704vr1tTZZY32YGeVloGmU16F5yeVWqqzq7sZaMp+4m6PutdcM1gp
         Pv1v3GyYCTgo7LNuf7d/B4VyIbIcJYSndQkgVqimn0rpNOscntgBVaxHuEDiBEFOMUX9
         nFmQ==
X-Gm-Message-State: AOJu0YziXn3KFc2rHK9oLkFzNmyL9dDC6hGjRW26a1BgZg5sSda3pOh8
	IJfsapSBx6b/5dQQxT2OcFfDoZnFc8GM7BrIRHaU1jBZoLZtc5jtoDww+Pozcg==
X-Gm-Gg: ATEYQzzBb8zpFhgagn3ZbI0VcWeXwJwQmQoymX3cQcidvvo/h7MjuPZjyjrZjsW3MLz
	Lw7fHf0pWErCezXaTFEeaIpKQfBoFmovjMKOu0X3gaLilnvKa+sEsX61QicEcPqjdFREWD7764n
	PoztvA3ky7AIQ/gtDpyiQcAD71GrDmnQKsyMncvWRUssP/M5fS2F6fYgDzYnGyNn8KMF663n+GE
	Ecq++FItqzHChfRoBBku7L08iPC8TD4k1aOb7Sk8924YZDi0olAcwP0Lt7CYNuCgSzS1NHyQKMR
	gMeaGjWhj4z+Lfyf18RZnoxA0eINu/wusNz5eD37iPHJfbkzPXmGkWsg0RLkQtYMxwZZslVN6Js
	pfFVkBIBDJe4RL8R6fiv7lsCxhCsD2Qqsr5gWqKHIcruJ5grs/CLH/f/IH5udEUKC+r0alVMpj8
	859KoBB9WR7pMvWrLpZjGq+ULb9stIWyOQbkTQv6PY89y5LPcIJBu2+/JJnC9gzAnl9fKfjQWI
X-Received: by 2002:a05:6512:3e04:b0:5a2:a3da:fad7 with SMTP id 2adb3069b0e04-5a2abc3ee64mr3599915e87.2.1774872651260;
        Mon, 30 Mar 2026 05:10:51 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b140ae35sm1623861e87.36.2026.03.30.05.10.50
        for <kernel-janitors@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:10:50 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:10:49 +0200
From: Linus Probert <linus.probert@gmail.com>
To: kernel-janitors@vger.kernel.org
Subject: Status of kernel-janitors?
Message-ID: <acpeJQEPtDKQ68uo@mosquito>
Mail-Followup-To: kernel-janitors@vger.kernel.org
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

I've been a long time builder and fiddler of kernel source. Running
self-compiled kernels and pulling in patches before official release
etc. Bog standard for most of you I assume.

I'd love to dedicate some spare to help the project. Like so many
others.

The kernel-janoitors "project" does pop up in various resources such as
kernelnewbies and I think it might have been mentioned in one of the
Linux Foundations free courses. But links to potential homepages seem to
be dead and resources are sometimes dated.

I read somewhere that this has mostly evolved into janitorial work in
drivers/staging. TODOs were mentioned.

So the actual question. In my mind janitorial code work is a good place
to dip ones toes when starting out. Is this the right mailing list to
ask about such things? Any suggestions to find an area where ones
assistance would be welcome?

I'm aware of checkpatch.pl but for many drivers diverging from these
rules seem intentional and just blindly fixing checkpatch warnings are
not helpful to the maintainer.
Open source is a lot of work so the goal would be to be helpful while
not stealing too much attention from concerned parties.

Br,
Linus Probert
