Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B335FF79
	for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 13:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765977679; cv=none; b=N04Ab6mGSiXgJHF/24+xEOuEV/HvaEAZRc9pTiUEgIJ8BgYGqmQv9gg2PYX4NCX4VERp4rF+aUSszGzWKt5r8/TMjQTy/QCI+zNdt3LIilTOT533paRKM4og9GNsuqIxQ6+zdE2KB0M/TxYP5gXV2hV6ncavq0ZrlFcR3SKbZvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765977679; c=relaxed/simple;
	bh=aEgJWDMgL2iTOeYqpzwBjAe+/X8n/GevgE174r7pJo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=icT72vweLtxoUh3anSd+l8WpGOuSAH8L+KrpKGe2d/+uAGqaZwJUKm5OIWjfLmmJA0JfMOmXREMw/mPSNxU3+MnO8/gIoyXedikPPrbHt76YWwHUYYIuL+fiMoogpNvzlvM8gu5XPHxp6ghO8ZuWzCoMyYBfioo/HfgsSWamqIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZKRxvKPF; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZKRxvKPF"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8b5c81bd953so645028285a.1
        for <kernel-janitors@vger.kernel.org>; Wed, 17 Dec 2025 05:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765977677; x=1766582477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aEgJWDMgL2iTOeYqpzwBjAe+/X8n/GevgE174r7pJo8=;
        b=ZKRxvKPFleFcqa1t90PtF/7qRacHH/jRnQkzG+vNvMtTsOI12tqdVR86XIBsDUrskf
         913jXRwCvdpBO/qkTwI+aXEnSbNBzyKT92QSzMZfwJv+dGqjFlyeuUbSLb3AaYdr20nT
         Pgl8XLMdibLw3EnZLGezdT1Pv756SjpZR69KWlm/Xi9QhKdiluJmnAH2ZapDzB/j7FgN
         xvPYq/vLFp3z8cvY8EEeDKWLuvQUAXJM8Sp6LvHElhMRNw2wBkrnq/SP84sKkdJg73QN
         AZIyUK+9h3hj31IBXDqwqxLbIAihQ+G7I4pRfX6biNPYQFE+2Zz34OZ0C+2K7uz1ssKT
         01Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765977677; x=1766582477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aEgJWDMgL2iTOeYqpzwBjAe+/X8n/GevgE174r7pJo8=;
        b=Kp6UtylS5Ca2pZK+yuvkOxWNelSCAqfz4kjJN+jRmxF9NG67lAj47omtLR5py/NvcG
         tiq+x6Ay/q9FAz18kzhm/guS4/ADCeV2xteK2DGB6cxNkTTb8MyARSXA+/utN8iG61ja
         i+14c2j50aJ/Gd9I0WVUyW1m0LlX9JCNY0aY+1ObOnRqTurRRbUQjZJMHlRG4TxDG9bk
         ocZqaLouNl6/33gDkOUXCcpMhnmAlfiAqMyJwL1a+tGfOCslrkMSsQ/oQBKX8ghJEf/U
         UTulvgTELWLhD/lRjd86HY6+ghlnITDFPtshseJx2IQ1L5QKFQyMDH5jGH16XPUwon8f
         +N0w==
X-Forwarded-Encrypted: i=1; AJvYcCVqqq1rBYE1svirMEXHx44YtRY0PguoDv9l+neG/AtWrQo95hTjL4H0Gg98RIT5+qDAwz0LQWbk4LHMrD/aSSs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGzH2DBaN/1RA/joSnhmmuP3y2uLRXZQkEjyw0pG9qfKZt390h
	RO8oJNkEcgQ5haVXFVPgpBCjiHAFMGST1Ab+ZkCrBZHM9GvWH16PoWsBO/H16HWU2uNeEO9U1OQ
	lI+WBRqP9PngWXMNhkrAEZmzXZNNTCJc=
X-Gm-Gg: AY/fxX55wWCM7mLFQQQGWCUciSezOF4suwzYYyVlnK2rOoYk/+cHfeXH/R+82FBBCj5
	3l3NLI8vAFowAM8SRvWIx/q0DSTOVHodjFqYS18gcK5T2ZU8HXiIDs4DYp4O1GwJZ9I+694F7zJ
	wkX4QIlDIlCnl69uiaBzZWIuXKJFniQGflpoBfHtcsvSFv8MVCuGT1F4AxSWLrUQ1JiLjYNMmlj
	VORCNScLzDWjUnqssennzO1d0bOU0y7pcWr8K7c/js3kWtXVO0ITlXozQxy8uNDZbpinPE=
X-Google-Smtp-Source: AGHT+IFeDXE8xQVyKVRR4g+wcvNbzkEl7oBzxYUPxg4w771wRyzwrhfjHzGREWsDy3FajOj/9sH0q9ZGUaUs3Bjakew=
X-Received: by 2002:a05:620a:700a:b0:8b2:e990:5114 with SMTP id
 af79cd13be357-8bb3a210da0mr2511089985a.42.1765977676860; Wed, 17 Dec 2025
 05:21:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251217053907.2778515-1-lukas.bulwahn@redhat.com> <CABVgOS=gvZ3d1cdLBtCCxJ3P+5c-ZvtkvrZygjOHhshMvUpvMw@mail.gmail.com>
In-Reply-To: <CABVgOS=gvZ3d1cdLBtCCxJ3P+5c-ZvtkvrZygjOHhshMvUpvMw@mail.gmail.com>
From: Ryota Sakamoto <sakamo.ryota@gmail.com>
Date: Wed, 17 Dec 2025 22:21:03 +0900
X-Gm-Features: AQt7F2rQ_B8MJasr2sS4YuNcBTMb9lwTzWXWMnWpEdChh-ldjrT2TCI1vfj9_vs
Message-ID: <CAHMDPKW3KtJS7SpnETfnRnmwk_b7LkjM1BEK=6MWZp=iRRsOzQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in UUID HELPERS
To: David Gow <davidgow@google.com>
Cc: Lukas Bulwahn <lbulwahn@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukas,
Thank you for pointing that out.

On Wed, Dec 17, 2025 at 6:44=E2=80=AFPM David Gow <davidgow@google.com> wro=
te:
>
> On Wed, 17 Dec 2025 at 13:39, Lukas Bulwahn <lbulwahn@redhat.com> wrote:
> >
> > From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> >
> > Commit e61d3add3e7f ("lib/tests: convert test_uuid module to KUnit") mo=
ves
> > lib/test_uuid.c to lib/tests/uuid_kunit.c, but misses to adjust the fil=
e
> > entry in the MAINTAINERS section UUID HELPERS.
> >
> > Adjust the file entry in that section after this file movement.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> > ---
>
> Acked-by: David Gow <davidgow@google.com>

Acked-by: Ryota Sakamoto <sakamo.ryota@gmail.com>
