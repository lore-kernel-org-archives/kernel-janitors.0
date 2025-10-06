Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8981C221FDC
	for <kernel-janitors@vger.kernel.org>; Mon,  6 Oct 2025 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759770453; cv=none; b=Dwhbk/B6Jni8XCoOMHJendjD1bUHKlv7aYbVbR4yosv5EMtE5GkzEksf3f+ai/pZYVxDRltbuVaW9C+xC/72JvImUk3Lynnv7aka9jkQNP55tqk2+8sXBGxsFS5emvMGT/o40UcbPTrgXih736HGc5fc2Vfvv9ORe/K5rU9zQCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759770453; c=relaxed/simple;
	bh=rlFixZbJvnpPw6lVlYW5Kt3QbvdLM3zAzGBrPPHtZ1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vC17Refchb1p+ZCXdi2aOGL/nIfA+6fri7JgnGzM9UjwOC9Wy77jwZwdy3WHTxI7dKojpmpGJXheUwmg7K1Rn4Fr+Mr0UAgbx7Gi+wm4mr9knfkmZOqXE07LXaaei0eT/gFU8n+6c/IlEI/B8rESkiFunxaFgJczeXX/tvrBy5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LM2ba2ZQ; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LM2ba2ZQ"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-85d02580a07so519047085a.0
        for <kernel-janitors@vger.kernel.org>; Mon, 06 Oct 2025 10:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759770450; x=1760375250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKKNkmcBQxnFeZkKNYdKplHNGJ08onMcowwhJIAvhnQ=;
        b=LM2ba2ZQs/uZ2xGopms6MOc8QJQ6lP48Wc7WS393kjHNQR5SPLGB27f/xBrdAzi4GU
         Mp7TMTcLynLGdanXOorYaBQS/lvuP44tuTkd8JFZizHJ1hfMIuswz8eqCO1blWh/fNe+
         1VI/Aq35OhvEK/9knf5qPUQ9DXwdG4aYxbh9chGJ42NH5WGyZ6Pa4+NFmm5VHGhZzR72
         tueeYbJN4vHOhMXN9s+ddvw0kTL8HOkNq7Ojk6tuL4GXPgTVXvopBgH5nOq8WzU4getL
         skrgIm6Zykhianx3zDQi55vfEomsVX7Qrxgcmn++7UWLwSo2/tIYw/LuGSH1LTc921qx
         tR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759770450; x=1760375250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zKKNkmcBQxnFeZkKNYdKplHNGJ08onMcowwhJIAvhnQ=;
        b=HCt0aKCeh0rb6aQa9TiUyUVMbDVrjvFNrGCGoRcsYlrD0SD/op7qri2Qp1JoqJatAs
         jZfbGz3WcOIydyTcFsPTBUKaD7Uv9Wndsh7WLRmCaxxxqRwNXMTHDVkG9JqGcHHl6Dj2
         KCfrfOviRO0CtilwxeSNcqcVOzIzBYL5hFsQO80ciojgZdy9/zZf1YGAa8dSGc/s5UZa
         f9l9SP/wbSCRca5Ybal5nfQM2XNQ0KfPyU9oD6/t4mRcqvo7rI/YBrB1aOYybnaV9fvK
         sdQlzla9I65f4FnAL8wjLXlJ0Co2UMwZqEEOmriMQpTZ1eTSS+9xd5SelUIU2vUCshxg
         0NLg==
X-Forwarded-Encrypted: i=1; AJvYcCWWn8YX69LMO4K/frIwfvNAiNtj0yRQDXcaXnhgAgTgAU50ZjksBOUDX9Bv4E/kTKTJwG8Afs+5+QpLDziiqWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPECLUVSW8lRtet7S2PKeTTue9XcNwoQ27wo1VW7mJkBPo4vXL
	FOy3y7MauHkuxoJkAb3NrAFlnUnzkVL+koYywDUn1OUEsOQWN4gT0/ATlc43dtA2cgU1zkMdz91
	mkBq/Vbp7jywsR75c6IldBEUF9qQLlS8=
X-Gm-Gg: ASbGncvQ/wNCAxen73LaWXTG5n3U6dyll1SXZRBYYjniBYzM1cEdH+1c9h8695w3oAr
	B1Plqblh8W3pnXGORRhbf1Rdg3I+t2peopCF03IFSI4WitTCILv5QXopfRnu5A86UesUysvF1ga
	28BRaPD59bONxxLbGovqH6Vr7ya5t7HE/nY6HvdUZd3rraJj0XMDSxEBpVzNJpiqHt5JKtyK6jW
	s/tGuk8pKA2gBhKD/rnenFvbl6S86lG9yeGJEltSH+b/dwsEw32Fkjc0RMO8TxaHM6awYKrJsrt
	SXh1BohKL8cZRuxqEVzmB/bpNEasmO2BMRcZsoHbp4dtrd8DmNGDDSe7+3lW7bqGcfvFqXVHIrb
	i9Y+wW823SZQYzCjAjCqsE7YxL21im21vHbx7CE/+AUQWaQ==
X-Google-Smtp-Source: AGHT+IEPISwSCtFAAyFwofIFOPnmbMbF4JyOJ066gMSsxLm13Rxv+HKDa92QBeQD2yMdtcQya1taGWfxC/jbAWm/jgE=
X-Received: by 2002:a05:6214:d02:b0:875:2636:4bd5 with SMTP id
 6a1803df08f44-87a052412damr4657666d6.20.1759770450151; Mon, 06 Oct 2025
 10:07:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <468cf96a-5dd9-4aa5-a8ce-930cf16952b3@web.de> <8e79516d-ad82-46bd-af00-3a8594a0baee@suse.com>
In-Reply-To: <8e79516d-ad82-46bd-af00-3a8594a0baee@suse.com>
From: Steve French <smfrench@gmail.com>
Date: Mon, 6 Oct 2025 12:07:18 -0500
X-Gm-Features: AS18NWCiMwnwOYL0R_azJWeM_ATvaFnKnhpK_Wr3r0REf2iO_ANzlxxIqrNli6g
Message-ID: <CAH2r5mvNM+z6re5toyNOJXewE0=9u2f+xxPXO5xTsMCj5nUWTw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Reduce the scopes for a few variables in two functions
To: Henrique Carvalho <henrique.carvalho@suse.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org, 
	Bharath SM <bharathsm@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, 
	Shyam Prasad N <sprasad@microsoft.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Mon, Oct 6, 2025 at 9:11=E2=80=AFAM Henrique Carvalho
<henrique.carvalho@suse.com> wrote:
>
> Acked-by: Henrique Carvalho <henrique.carvalho@suse.com>
>
> On 10/5/25 2:10 PM, Markus Elfring wrote:
> > From: Markus Elfring <elfring@users.sourceforge.net>
> > Date: Sun, 5 Oct 2025 19:01:48 +0200
> >
> > * cifs_lookup():
> >   Move the definition for the local variable =E2=80=9Ccfid=E2=80=9D int=
o an else branch
> >   so that the corresponding setting will only be performed if a NULL in=
ode
> >   was detected during lookup by this function.
> >
> > * cifs_d_revalidate():
> >   Move the definition for the local variables =E2=80=9Cinode=E2=80=9D a=
nd =E2=80=9Crc=E2=80=9D into
> >   an if branch so that the corresponding setting will only be performed
> >   after a d_really_is_positive() call.
> >
> >   Move the definition for the local variable =E2=80=9Ccfid=E2=80=9D int=
o an else branch
> >   so that the corresponding setting will only be performed if further d=
ata
> >   processing will be needed for an open_cached_dir_by_dentry() call.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> > ---
> >  fs/smb/client/dir.c | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/fs/smb/client/dir.c b/fs/smb/client/dir.c
> > index fc67a6441c96..7472fddadd4f 100644
> > --- a/fs/smb/client/dir.c
> > +++ b/fs/smb/client/dir.c
> > @@ -678,7 +678,6 @@ cifs_lookup(struct inode *parent_dir_inode, struct =
dentry *direntry,
> >       const char *full_path;
> >       void *page;
> >       int retry_count =3D 0;
> > -     struct cached_fid *cfid =3D NULL;
> >
> >       xid =3D get_xid();
> >
> > @@ -717,6 +716,8 @@ cifs_lookup(struct inode *parent_dir_inode, struct =
dentry *direntry,
> >       if (d_really_is_positive(direntry)) {
> >               cifs_dbg(FYI, "non-NULL inode in lookup\n");
> >       } else {
> > +             struct cached_fid *cfid =3D NULL;
> > +
> >               cifs_dbg(FYI, "NULL inode in lookup\n");
> >
> >               /*
> > @@ -785,15 +786,13 @@ static int
> >  cifs_d_revalidate(struct inode *dir, const struct qstr *name,
> >                 struct dentry *direntry, unsigned int flags)
> >  {
> > -     struct inode *inode =3D NULL;
> > -     struct cached_fid *cfid;
> > -     int rc;
> > -
> >       if (flags & LOOKUP_RCU)
> >               return -ECHILD;
> >
> >       if (d_really_is_positive(direntry)) {
> > -             inode =3D d_inode(direntry);
> > +             int rc;
> > +             struct inode *inode =3D d_inode(direntry);
> > +
> >               if ((flags & LOOKUP_REVAL) && !CIFS_CACHE_READ(CIFS_I(ino=
de)))
> >                       CIFS_I(inode)->time =3D 0; /* force reval */
> >
> > @@ -836,6 +835,7 @@ cifs_d_revalidate(struct inode *dir, const struct q=
str *name,
> >       } else {
> >               struct cifs_sb_info *cifs_sb =3D CIFS_SB(dir->i_sb);
> >               struct cifs_tcon *tcon =3D cifs_sb_master_tcon(cifs_sb);
> > +             struct cached_fid *cfid;
> >
> >               if (!open_cached_dir_by_dentry(tcon, direntry->d_parent, =
&cfid)) {
> >                       /*
>
> --
> Henrique
> SUSE Labs
>


--=20
Thanks,

Steve
