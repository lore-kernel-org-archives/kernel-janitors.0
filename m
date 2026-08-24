Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4F638643B
	for <kernel-janitors@vger.kernel.org>; Mon, 24 Aug 2026 20:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787603008; cv=pass; b=FkcZNli0yoTzwqPqUPuhUJcIwX9YSTuqvdJ2QYlxBbKJ1sOuQJGGr7GJQ3pwbT9nPrXZFpmzO99bvdDQBB7MOecp8aQ5jC8uptBgSPz98lU1qc8GQ2D1sXAHoKqMAiM8m6oA1dlfW0emJNyDfvuvTrRQeHQ52qp4a8xx4mtRCDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787603008; c=relaxed/simple;
	bh=5qs3LmMlxBH938LicuDB2dABIFNbxNYpIEl6WUqmYhE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioOu1JrSSr/gL8khuG2O9DAip7g2iGXRHrUo8b3QL1YtRayLAqPVSEoaSWxxVAreZuD/ombKAr9Uv4ZROAM5RsRUmNr6BV8ozTEhaiO2VJ12NYUhNQsea3eBLUTLM6lnsdf/WBaoUE5BMtDY5ze3d6GmNVNcQo9ME2vZmzGmQ0o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kypXOMdg; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kypXOMdg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-69fab5a852cso6696883a12.0
        for <kernel-janitors@vger.kernel.org>; Mon, 24 Aug 2026 13:23:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787603006; cv=none;
        d=google.com; s=arc-20260327;
        b=sh0uHnq886uVepQBly0PhCx0gcPbPmx9HceIzw21iE9xNmkipDnrff9AsvpXadYpgx
         N3TiTmmAmWQPQIT/0+w9z5OOC/ZVf6++Yc/b9/84MdrF6YorgjYCfftmYZYUo4DG9M8I
         P0uXCQJlpURjIj3CmUZBpWZGQJDVj+TN0GEAv0Hcai/dJ5x11FEvtpQ1PIEdOCz1fnyh
         h5XW6pDd2kx7C2J2T/XfRUj9mw+MqCGXnAq0R/bmfaN6nweZ8J8MggumN3o/d+8x4z/r
         2MwA+42pOcJf6hUHyX8jizSFy9xQlmRjfOFPiWbfXof/MmWpuJIK8rGu+XUF60rL74FY
         bd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        fh=qH69xUoRoLfzLxsgGdXc+ZzP2PP82hy6sNFuboQDE68=;
        b=dJiCCjEHPWoJDc0yRUDSgMbPSyLqla1pnSkTgnTWl5o9xgaLra0411nTpNDaKeBUSu
         SHY/uix6t8YYpE4kgB/jdKb4qj+mHlxAB/UiWac50PfOMtUBU45fwVMrpnxLjyBhS+qi
         /VJC/7IUS09Vr+owz5eDTDxNak4EWR4IZbCp/r/r2jdpTYtTT6VRMBhbgGc7lW5Mcwu7
         aoqaA+tBb8UkCBwGvSxWxhaqlLtJp1fx/xcSA/i74zE5NiYuy17jl88uUR4WCS2WJbta
         4h4pfXCE6DOZhgTv1iY2TPCgejX/fVfAeq6l95gS5sWjshCsxPYur4fqs75XLosnv+10
         eJxg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787603006; x=1788207806; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        b=kypXOMdgOxl9dUQxPYu+/od972hZGuF4KAPE/Mj3RWSoX416qMLiUliPfUgBaCUb5P
         wAAz05ePDrNYXIyNhQIRm/Vv35ShgAXbLji0gVnqXmSPomLoFIL9wOB2D+3ruso3DIUw
         MBUJfd0pPsrVqW53oQPD2l/Nr+iuKKEQc/XO4ijUfOMnQmZvXyzhI3nvrZ5DwQUULft2
         U3NqGur+W6H2ggdM9RDeyKYCmLfzec/PLy5Wqx9uWzIMAThBqhlYnPvQEVhg0p7/45RP
         pRAc43PBC6wr/mlh4uR0dDWCPZJHr00FOasIIDKaPxMyA+nB6pPSCAsKKJd6rZSaKKPn
         KHKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787603006; x=1788207806;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KpQrKPvXFKOaF0Tr+8jrYooYDbrbtiMXAGBA3TVJxiA=;
        b=C+7dCdFYlB7+ixiYTXFI9gtgGe+AOYxN65NsdwVHg5Yu5yLeEVq+3uhzc8eQg/CMtg
         XjWuFx6RD0/Huyyxhy3CMq/8oAZp9mKskow3383qzFFURFK3srTDcfnlfIVmEdmEuLXZ
         gU8PQ0xNkUJRTJuwOeJUitrglQ7B7+IO2Y5PeTcOYICTHOAQjWiKqT75JL0RhwWEA0No
         TLzLNn1GuRSbO9eod4eHidSwmj5Iu/oYqT6I34JD3xr1WFR7Gr9d8oWrarFxdvG5GTjA
         LuPvqqH4k+Gfv5LvWNol+cLY7doG4KVE6jI88zz95qp2V8fAo3FNjM4iFSSPCo7hEYq0
         MZaQ==
X-Forwarded-Encrypted: i=1; AHgh+RoX/tAdoN0Jd69Xuj8xnLQz5dd/Q+/BEF9gEJ9Y9l9ikw+bu+CN3W53bO6DS0H+HDp9hnWbQEHqVV4qJlor7Z0=@vger.kernel.org
X-Gm-Message-State: AFuF++ksYT8vNT4+DvXVLOFsnseM2ckI3tixstfTg/fSlt+omP9SrcVu
	3hXrvf2DwJ7LHV1XDBEHo5PyN27a9MLOyFpTh4Ab2FCRyZc3xpt5o2bDDrknpfa+9lDpB2cWyaM
	VdGmLNWPeVQogIC16hdqqm/D39BzCKBMfJg==
X-Gm-Gg: AR+sD13cX7b8v013I9cH91MHNX5EmQh7Ods2ur5M+JVY7Anev0dKiLEiiRPBXIuGrgZ
	xviQDSQr9BzNEiKD8HdQn7HZFyAjXla5Qwss8XpkdGTswF2lqQlS6BVlbhT8/++LMk7pb+deja2
	lrB8aHFEqKuYgCM12v7w2JD7oPzH2KkNtGPv2w8jy6eTWRCuoUlFe1t07aGIwoLP24N3rYB/eCa
	CYmjH74dmF/Vnoye3jPeZAK9ASB+Ee9KzEMzlRjQC0H1rVhfr8D2VCX8kJZq4/u05kQKl+TuN0v
	fTJNYtjzpGHmXcPdv6R4KQc9jPshT3CsHMpEd4D3EPFdRkQ7EFRCmJjyTUZ82a1pgObQ+45fCze
	Vm5YWPLtVMuxNRPxnumB9HTyD1MgNlsCf/R1vwt9vERt6mxvOxqjQzBjIeuq+Ds06XO0OuSXIxm
	SZwNoBySAy4+nNKP29ZjLn4986t79sSkcjjYcCwUc0u4QBo7EGolw7r7I=
X-Received: by 2002:a05:6402:52c5:b0:6a1:29ca:681e with SMTP id
 4fb4d7f45d1cf-6a5c41023e9mr1167670a12.7.1787603005383; Mon, 24 Aug 2026
 13:23:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260823044900.11466-1-rosenp@gmail.com> <8735371d-b466-4262-818b-f854c83e23af@web.de>
In-Reply-To: <8735371d-b466-4262-818b-f854c83e23af@web.de>
From: Rosen Penev <rosenp@gmail.com>
Date: Mon, 24 Aug 2026 13:23:13 -0700
X-Gm-Features: AcwNN1UsgemHpYLmLNmLi-9SyskohQPDLhvFFG24vc582B61NUGfhIv6kTo3RAE
Message-ID: <CAKxU2N_f+spFKbvvPDkh1VLLqrmSzBCZ9kvbsFDc2SRibRTGnA@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: ioremap early
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dmaengine@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org, Frank Li <Frank.Li@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 23, 2026 at 1:00=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > This also fixes a resource size mismatch between allocating and freeing=
.
> > From sashiko:
> >
> > >     release_mem_region(res_bcom.start, sizeof(struct mpc52xx_sdma));
> >
> > This is a pre-existing issue, but does this mismatch in size during rel=
ease
> > cause a permanent resource leak?
> =E2=80=A6
> > ---
> >  drivers/dma/bestcomm/bestcomm.c | 45 ++++++++-------------------------
> =E2=80=A6
>
> I would prefer a clearer separation between manual descriptions
> and tool-generated data.
> Can quoting styles be improved accordingly?
what do you have in mind?
>
> Regards,
> Markus
