Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FEC337687
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Oct 2025 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545803; cv=none; b=FkKCf5q9xvj+BZFjpKBas8B2SRq/LJlRHO05eebBHaZGM8+wtE6fowOQu/cV5Ds2UxplFUtvcyvpkSz27qQjecHT1b677XEig9IT4stuQRA0iiahzZCBqX0ITsVbvWvSNO9eQMDLNcNE/TVbGHCAOihz8nVKrJ4ktOPN8HDajxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545803; c=relaxed/simple;
	bh=Q6rKlCtixSuiwjIXlFbpaB8zSeZrFlDJ0Zg9RlK//Y8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tqvlh4m2MT/FxP75ewt7w6ZUuzvGPHq/0CNjmNWmd+OouBdCF1/diTs5lmxHWFmx9eUlHVQYs7rKztq/i6rg8sN6OkR5NdILDnJrjUAAAVXZEXrM6oTC96yuph0Bf2VEnR/JEvz50zaZ0r/Q52IthtQfUh21sC3+6J4GYCKTNqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AGi+HTAA; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AGi+HTAA"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-87499a3cd37so63702846d6.3
        for <kernel-janitors@vger.kernel.org>; Wed, 15 Oct 2025 09:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760545800; x=1761150600; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8GDrJ1rQnlamUx9lojh4fPxJBAOk9fRwuDS8zKFOtw=;
        b=AGi+HTAAYaeKmvdeCKFuFD3QorPfDOYS7yk5MGVHuKv3umIZVNqXDwA5/ijzxO/efT
         7F4nDO+rsjuSoS4TyT8ye8fIohqfptvhHwmCrcfd3ckBhXYNEejJu6a32R0V5Owi6CqC
         A1S8wOr3J4YLOYZ70niUVNgI6cGddCT4kNxDQXfEZ5Lc4+v1EAtnNDmd7bB+6MGrMvvX
         UT7e5DwC+C5RpxbEV49HYuRgR/CI/hMcCg6I8I7aJ+BkF1dNPRQbEVwFD0tkJspQD+6+
         f61slewSLbmHqN5dT8qrKpWW4Z8g3OatwaqvTY7ThbN+hUPzo1dUTox7Oed+zpbcnYGd
         2Hlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760545800; x=1761150600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8GDrJ1rQnlamUx9lojh4fPxJBAOk9fRwuDS8zKFOtw=;
        b=sF0GP5R0IUkNnhBFh8XvV/078bj0wSwpRZ97IFJWqgb16jIDnMNx3WZUiD5IfTEcDH
         DH570q+y8JXHVLnOK916JWm2vraB/vlnycgAZqzv1g2b1A8xIZ538vTCcBsgaGeiNhwb
         iAYi0Xu0ZXh68Pi4E9PxWLpQ61GHlmqeU17Z43qdRN3d96KUz1m+Vj6OS0gnEcy4cGnq
         KGF/118pjp1MsBuf9gASe88or7maOVu8vQ8ttKKskQ7Z4sSVB6QgpvRh/FQUBT50hwXh
         hPvsW+GyLtV+K5dgO1lgKLfWbnQX8xGfFapG36FlvIjHZEnh+FNw+HogY1QkChthood7
         qCuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqdrwR0laKJO1WJzzXW75F+IFVT1tgA/so9yCsR78wUCzNoIy7iZw6Hie4QszxLDmJ+Cum5c0t4GKas/1k4EU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BxcC5OOrtuWaRtvz0MUjeEzOerNdd6nX9v4HOLuOyhat58So
	VtVak1/lkycfctKUfT7EED/au6tsT/EMuoGSMLpXvLemvNfPM3Q7MnMZryq1sYuzVSyv/RXTDvr
	yNz9XgGr1qJFF8ebMbdbik+tF20nTgAA=
X-Gm-Gg: ASbGncsEaU2fSARgHOWq9lS7A1F4hLCfy9pxFj3QLUtzmQbhyx20Z4T+DnuOCzXyLRk
	MfdO72RcoyTjQj6vo4p5XeSYmAkhauwnxnqfLkSSOzlEaX+QMyLki589REfipYNJGV2yeSrZn2Z
	szeW2QktWLCfpudSyLtVIvIjq4aumP9WAxnlLD1v8ZuGJpeaWjG2Iyh19oGUdNoY9m1h38kz5nG
	OgS0GvwkdpjAA8WI3V4v/cZO5tqT3sUx+r0O46zhpwZL5VZjBoFfsdlXpiPULvoNzwhHKgOicmY
	hh+34U029YXvpBadi7UTlS6ubKaYXkPfQVj2372fBVB5iR8DFxhIgeppCfxHsjDd7odduApnJdX
	rbDzMI9Myi2/LW17wjCLdTfQ/uiJNDu2O06jV6w==
X-Google-Smtp-Source: AGHT+IGVISVKSMZGXKvoUfC3pFbB5+MNCgPpT6oFP0VzuN6FflZ2A58qUHZ/QKyXQmRk6Yh4FFnGDxift44mJ0jL8XA=
X-Received: by 2002:a05:6214:6215:b0:87b:cc00:5de7 with SMTP id
 6a1803df08f44-87bcc005e4fmr188945256d6.18.1760545800119; Wed, 15 Oct 2025
 09:30:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aOzRF9JB9VkBKapw@osx.local> <6599bf31-1099-426d-a8e5-902c3d98e032@web.de>
 <aO/DLq/OtAjvkgcY@chcpu18>
In-Reply-To: <aO/DLq/OtAjvkgcY@chcpu18>
From: Steve French <smfrench@gmail.com>
Date: Wed, 15 Oct 2025 11:29:46 -0500
X-Gm-Features: AS18NWCziKfp_DI39cJxX3YKcNnedwhMB2N5vzWIwfO4Ia5b8m3SwzD1D2OHnU0
Message-ID: <CAH2r5msK3SDhAM0_monUcNTrf5JCwydD+AJgARaiVziUUo0WmQ@mail.gmail.com>
Subject: Re: [PATCH] smb: Fix refcount leak for cifs_sb_tlink
To: Shuhao Fu <sfual@cse.ust.hk>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org, 
	samba-technical@lists.samba.org, Bharath SM <bharathsm@microsoft.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't think the title needs to be changed, it seems clear enough.
The other changes are minor (changing goto label) and also probably
not needed but ok if you have to update it for other reasons.

On Wed, Oct 15, 2025 at 10:52=E2=80=AFAM Shuhao Fu <sfual@cse.ust.hk> wrote=
:
>
> On Wed, Oct 15, 2025 at 04:52:23PM +0200, Markus Elfring wrote:
> > > This patch fixes =E2=80=A6
> >
> > * Will another imperative wording approach become more helpful for an i=
mproved
> >   change description?
> >   https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fg=
it.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Ft=
ree%2FDocumentation%2Fprocess%2Fsubmitting-patches.rst%3Fh%3Dv6.17%23n94&da=
ta=3D05%7C02%7Csfual%40connect.ust.hk%7Caffcb410915f4b4bc8f308de0bfa853c%7C=
6c1d415239d044ca88d9b8d6ddca0708%7C1%7C0%7C638961367775911255%7CUnknown%7CT=
WFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFO=
IjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DbThHSbvjokcDU6hNpnYxt4%2B=
lVyzlyxHl1JopGmCLY%2FQ%3D&reserved=3D0
> >
> > * Would it be more helpful to use the label =E2=80=9Cput_tlink=E2=80=9D=
 instead of =E2=80=9Cout=E2=80=9D?
> >
> > * Can a subject like =E2=80=9Csmb: client: Complete reference counting =
in three functions=E2=80=9D
> >   be nicer?
> >
> >
> > Regards,
> > Markus
>
> Hi,
>
> Thanks for the suggestions. My apologies for the inapproriate wording.
> Here's my updates. Please do let me know if it still needs improvement.
> I will definitely address these issues in patch v2.
>
> 1. An improved patch description
>
> Fix three refcount inconsistency issues related to `cifs_sb_tlink`.
>
> Comments for `cifs_sb_tlink` state that `cifs_put_tlink()` needs to be
> called after successful calls to `cifs_sb_tlink`. Three callsites fail
> to update refcount accordingly, leading to possible resource leaks.
>
> Fixes: 8ceb98437946 ("CIFS: Move rename to ops struct")
> Fixes: 2f1afe25997f ("cifs: Use smb 2 - 3 and cifsacl mount options getac=
l functions")
> Fixes: 366ed846df60 ("cifs: Use smb 2 - 3 and cifsacl mount options setac=
l function")
> Signed-off-by: Shuhao Fu <sfual@cse.ust.hk>
>
> 2. New subject: [PATCH v2] smb: client: Complete reference counting in th=
ree functions
>
> 3. Labels are changed accordingly
>
> @@ -3212,8 +3212,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return ERR_PTR(rc);
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3245,6 +3244,7 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>
> @@ -3285,8 +3285,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
>                 rc =3D -ENOMEM;
> -               free_xid(xid);
> -               return rc;
> +               goto put_tlink;
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> @@ -3307,6 +3306,7 @@ set_smb2_acl(struct smb_ntsd *pnntsd, __u32 acllen,
>                 SMB2_close(xid, tcon, fid.persistent_fid, fid.volatile_fi=
d);
>         }
>
> +put_tlink:
>         cifs_put_tlink(tlink);
>         free_xid(xid);
>         return rc;
>
> Thanks,
> Shuhao



--=20
Thanks,

Steve
