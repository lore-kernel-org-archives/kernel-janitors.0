Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF15840D56E
	for <kernel-janitors@vger.kernel.org>; Tue, 30 Jun 2026 00:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782779063; cv=pass; b=V7RCsVsVdZc1s2468b3TMcE1XU61DJ91S35OJzKNXA/RL9ElE8OzgsKY+EtIepsfzIM3zFXc9zeRHvoSBsRjLYh6mIu+MYGYbKT0bVKna8YszDP6A5ylJIs4dM/k0rir7GhicfQJcbRw07FPiTASK49S5AqqcRTWBOzCqog7onM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782779063; c=relaxed/simple;
	bh=3L3VdGhIsBbyDc+0LPdNEJb5c9sTAFhUQpyHfWrAkHI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pqlxLlGaq6JHY0+pyTPbsVDWQUh4O4nbKb90lc8qvkRiMaZIIPSA1ENzM93RNjk5KOlo7G1lvbb1bU3sjKdzmxk/IGk+CzT63m58NHMjx3RtLO63nqLUqucilNVpuSNzS9tZH+ooxhrJenwCRnRvGXEjReomGEeH9VJmci1EALM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KpgIgm0/; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QAwEQrMP; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KpgIgm0/";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QAwEQrMP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782779060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
	b=KpgIgm0/9VTpaAiNgWsH+QeiShb3HqUG2MiOUPw6UKizMnCrG1BZWANkyJObd0j+0ucxRt
	Kjpq85NURXU+0QHZq9DfZhuwYqSMUBm+ZKrezlMe3G3bLvHrEU/R6ZZb7l40BLNRPQWVdY
	NCEDOdZziyyPzC0FPevWfmNlDrCKbJk=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-655-ubiuTvTIMNScVHnaB-Snbg-1; Mon, 29 Jun 2026 20:24:19 -0400
X-MC-Unique: ubiuTvTIMNScVHnaB-Snbg-1
X-Mimecast-MFC-AGG-ID: ubiuTvTIMNScVHnaB-Snbg_1782779059
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8dae6572676so53015776d6.1
        for <kernel-janitors@vger.kernel.org>; Mon, 29 Jun 2026 17:24:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782779059; cv=none;
        d=google.com; s=arc-20260327;
        b=RKzJVIgcHQl0Q0GWn7/Bs1fdw+tP/vgsXjy8aArDGDgtPvNVCE1XBlTGOAPduaXLFz
         Sr8Su+jEh/z3uMukzohuD2/r7hmS4QvCi0MwTNanq/6YV12TseniPLqziWkBkaig1cf4
         FESJjJr5pFVYmRD+qRSWSGFsY4E+cnBu8SVbyi+aDM9f3aqNx2kdBgILXdm9k5q/wpuK
         SQ5FkH9mjh/w0xlX+quUtdUrij2CdB8UIcn6OfW8n5BN6ldg+UYQjz2WXHFOmomelkXE
         yGIUsURi9eKexYQcWVIrCS7dJnZDMlmDlLV6z6XNFpbQ7HdDwkm95oO61pPEqOaxCFXB
         X2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
        fh=IeBY+07wVp8nTSaFaRH/wK53KGeNw8kW0/hAH4FpYd0=;
        b=W/Ng25FAMorosBjCS/nig0AL0uxV0VrFwxrhjYvM8M8iuHBGzHgErSRi+AyvR3pAAA
         kkYFBrvv34UJj8gTMLMWUP4h5AW7bbyXqsqB9b0uXchbPd3/JfswfwSIdOtsYfT9V3Kw
         oFBoqYm/g9x6bYk+LBWhz6YX/Vx6EnAHVghz6kQgu8fpNIxsLlvuYZUzKpPskFHWzj2F
         jFysZ46C7jzsz0NC8ZQdwynydyk5h09BwpUfT5KxThvyZmzFak4n2RVJtLUw/n6a1oEA
         ruG0LF4edBjHtriUO/LweLGKppjB68h7WeJen1lXK+sfFVWQjC1HzxQyAwkJZM19peQ7
         40vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1782779059; x=1783383859; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
        b=QAwEQrMPsQsVtfH1p7fsOOrMLpeajFs8AuS4He0gNjjOWQKR3mdETn7Wg4lrquDwZK
         HxGDyEA7216PGj6rM3HsZV50IdkmQZZpcq/3+2IRKe3Ysi/2wg2iERB4VWE1np6sJLAF
         +CicpljPthP/laX/zXOklK26A1Mzrs42DhtYSGpUGz43wlrDCpz1V7t2g2J2vIVYK9nr
         bwlPcwxpiOtOw2/NHNUmvMLpgGtWQ/9K4lMO8c3M7K+L5OUSMt7abR0TdAzA+ER+JiFa
         1xLeKY6xpYjUtEEY6z/dNRdZA6hca7qlpED+fOxZzOh1WFDssqq+8n534Qel415CQv9q
         Czyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779059; x=1783383859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wMkHt1yiC9aluHHTld/vXF2ndSc+3tCY4NweikcXiQ=;
        b=BANCuQVt5Ps9mf4BRkwhcfDkCG1rzl78SCEVw8YLHnXV6s6UeqChJ+/DexKBPsYlmP
         r4YyHK7LHhhoj2xbt/J8Gb4EJ6pbQBo2J6FzlIdAxbZA5e0vGqcD6fPeTY9X4nD9FgYR
         ZnzncQbVhhMXK/vIQduw8yi6L3ixahuN/sSc/8jH42HVAqon1wb1AKiI3BgEzpbdIb9G
         99ZTnPzQp5/6Q6ytnRt2aHny7iMiw8RNdk5Y7lSCEed2DyGLFJ9PhLibnOdoEh6ZZYwY
         KEJwJI0k6frN8nKt7S6GTDliLr/Xkjm0HtjyWUbsAWI4I5QMfXy06extNH2B0+kauluA
         IAWw==
X-Forwarded-Encrypted: i=1; AFNElJ+3HpkPuObIZqKrbmh3NOwBMy5gfWSwdHS4U52bnWCovK0RPdV4d1fWKUQ3P19xjSjVqYEHZiwLJC5yL5hTnEk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7w2kLEsubKjCaqMthFSmPWLN4rSqw2cw/4uSY4EWYAqOPpybU
	AChyYogDkL4sXjKDy2kLQOtCQzMtvZcu/6kIqwUR77YJkVtSXF2sJhGkTH0I6KpcMY9nOhBkLjO
	/dV5x2a0u7yibB89PJppg6xdtHhq05BheqlWDvEPoKkRnsAq3OL+06ed5HAby5e/6NwPaBgouDd
	SfgYCdspRFwgd52LVA6RodjApWphnDL7zA0p6N5fg+QjwQmZCHxncC
X-Gm-Gg: AfdE7cnTB5wvBCXoOLYNIvwPG0ahttO+uoo5iOHpZQcZsgsK3yGoVoLfTNptSTp+dYR
	iE/IHzoCygJl6dqi+rdA8czhpoifM3A0WzoaH3atki/npTCzQPPemjA/DJ8x03z0Pr0o4OlM8jK
	FmP8IJa8TARJg8nn6u0RLM0NcFcfYKeq9N7xOG1MYuFWOE/TELzC+rpnKEcK9XsRZUaTc=
X-Received: by 2002:a05:622a:4808:b0:51b:f563:f613 with SMTP id d75a77b69052e-51c1089ce79mr23434561cf.35.1782779058808;
        Mon, 29 Jun 2026 17:24:18 -0700 (PDT)
X-Received: by 2002:a05:622a:4808:b0:51b:f563:f613 with SMTP id
 d75a77b69052e-51c1089ce79mr23434121cf.35.1782779057989; Mon, 29 Jun 2026
 17:24:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529032739.13264-2-ltao@redhat.com> <f1adcf3e-1489-4131-ab62-277cab6a29b9@web.de>
In-Reply-To: <f1adcf3e-1489-4131-ab62-277cab6a29b9@web.de>
From: Tao Liu <ltao@redhat.com>
Date: Tue, 30 Jun 2026 12:23:41 +1200
X-Gm-Features: AVVi8Cc2KsmKA8vZOsBz9V_FtCI8517u9AsNGYliB96gBIfd-jn1GvHtlVtrPvo
Message-ID: <CAO7dBbW9s6uu3gHHF5QR=_HdqN9shEfYBH6roR814ZEAw392Jw@mail.gmail.com>
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in machine_kexec_prepare
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Baoquan He <bhe@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <pjw@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Markus,

On Tue, Jun 30, 2026 at 1:00=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > A NULL pointer reference issue is noticed in riscv's machine_kexec_prep=
are,
> =E2=80=A6
>                  dereference?
>
>
> =E2=80=A6
> > Fix this by simply adding a check before copy.
>
> How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

Right, thanks for the suggestion. I will improve the commit message
wording in v3.

Thanks,
Tao Liu

>
> See also:
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/submitting-patches.rst?h=3Dv7.2-rc1#n145
> * https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/Documentation/process/stable-kernel-rules.rst?h=3Dv7.2-rc1#n34
>
>
> Regards,
> Markus
>

