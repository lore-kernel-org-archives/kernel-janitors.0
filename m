Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221FCEEA6
	for <kernel-janitors@vger.kernel.org>; Thu,  9 Oct 2025 00:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759968758; cv=none; b=Hp4ee5tbH5z4OI6ED+zmiEYtCCi8fbF3tti0L5UA10SnfSlyAYy7QU1b+h7YgRsUK4a7NaGDGIqgc3bFSEudtA3G6aXLGkIZE3qBxNfPSTTWNkIY3J5G0ScNZ1/GOlXXauYIAf+40LKABi4//zy418BS+6BEgQoLgy0O2IrI7ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759968758; c=relaxed/simple;
	bh=Z0JF/h8mBUCqcPAR13Gn4OPXCm3qaHZYWJB6uhLvJtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8oggi9b0qjxeQ5yAelcvLKBCsxDXn2qBnV0gPmvdwkF0o+JLuBhjCfttw1cj2wFpx7W2g1sBKyGybqMgX6eMvfBn7bw1KUEuP8TUoN8tYIkRogmPjUfUEVxxBHa2hbmp1+nfO+twIIlAXjJ/ifDcmFgpbSbBzgAe4D2ps8HvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DLDVNUOk; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DLDVNUOk"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4db385e046dso3250421cf.0
        for <kernel-janitors@vger.kernel.org>; Wed, 08 Oct 2025 17:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759968756; x=1760573556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLOs0m+C5vy8eU1JuQcMkicCaJKpraCdPB1zIalrqqQ=;
        b=DLDVNUOkky4k1sok6w7IfZN1sYj1GMmOaLvooxszPDdZn8YxmOwoNqgnOjAiH4AQ+2
         0Gg0nnLNt90ImTl0WeO7iuuVQnxwXl3pAnbusMS9TxlfPhILRqRqLBFGhCjxLiJ11mou
         9gWxK/JMEcxZK2qysIR8oB5yB/CRC0QfPkzvRD+X4pyUEJR4b0SIEctQRUME+mVZ2Ocz
         /hReImJNenpbKGAlmv5KOvkWsARcHHS+AFkIw+tiZoppOcFoieVtFTzHwB83Tq2Z2vib
         PCuG8RpKWOjfwl5mJho2MlY/9XMfRFAPMI8TX56OQQgfg8S5hdKQwWIiMZRTdUiQjLBa
         48Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759968756; x=1760573556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLOs0m+C5vy8eU1JuQcMkicCaJKpraCdPB1zIalrqqQ=;
        b=KFb1ZQeE8UG3EJXD6kDcU6vT2/Fy9gZt7TZMi+AJ/OOv44d+QFyuzhUySgdvqzq/rU
         gn/Gd86rubATaWV+s46XnW13mH8AFJvx6ggEL2ong5MKkOvjpilFnePjpIXeFiDh4Pig
         jBGh+j46+wjJ6vhja3tQYKGDMjALDqPZ4nNdV5Z+VJ38vFUCuO3u13mzJlx6Xv2NQ3N5
         tjF8IJCPslfFlWZYGjlEt9wocbGEmY1Be3jmQZubHBiZybahxWwOPB6sZTE70j0pJqUC
         Zuzcws3X2J7X0kOy2ihuIHpliDH52JYOd47Imwqqw6i1zJaDGtyoXaSE1ZjasK++8KRH
         VD4g==
X-Forwarded-Encrypted: i=1; AJvYcCVZ8xeozDdfITEyr3ZKlPpIoTw54MhsepUWDy6s2YNBDAWE+Uq1lMw2V/SihQvtP0pD8KrsCiyMi08ZQLr+2eM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjvFJgJmOCLTLDxuzoN0LwSl5GUqvzCwV6IYjYtlG6J1kbWyFo
	w4GW1CIDsY9KDKsLdTTciTetw1FD+lVXtwnwgG0DYB2iI0Njeud5Ur9geK3YPyg2PmduEOp5Lfw
	RZWuvAZvqzIoUdw72VWfyZgsRwxvmQoo=
X-Gm-Gg: ASbGnctYHeMsmqQ4HOPi9eOc9jtb80NWcWb6RcW4+AXTMG+GGgqr3UPac726aO25OHX
	jgI6Te3HPkShsxaOYZKIvQP+68CVmgHFKUrYXIQReYL9b5ChX3d7hOa66N+c/EavdvMCBjJNtIG
	EuaQN60a+eLebk8s1qJ0PURZhi8EfzDFmwYdhXatLYLRRCpgX2Gne7skTaTOXsMtu1wf0iKDZtx
	lwCxFsukEoOXltbjZ1CXB5u8JJ0cajcL/hl2aG+03DoYNyrgfE9FH1TKgzV11FC67DdhSjU9aOC
	3YY8F+jxWonnkqzRAbtPDeXgyvJJ6xKQMQPvYfN5cLb37II2eckPgxiPyJ3qftMYDEobSDmTLZW
	O9tbEjylMawlW7O5cyQR0htW9cwEXMYk6JIGTC3occdxgKA==
X-Google-Smtp-Source: AGHT+IGTMJxEUzyjJOaL0+NNwHEI9UfsX87q17OQxRmhejzUvwBxmkwB9k17auDXhJE1cMaLG7jkj1CnKy1ELrzjvrA=
X-Received: by 2002:a05:622a:6a42:b0:4e6:ee71:ee96 with SMTP id
 d75a77b69052e-4e6ee71f26cmr35134331cf.25.1759968756008; Wed, 08 Oct 2025
 17:12:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
In-Reply-To: <5b95806a-e72e-4d05-9db8-104be645e6e5@web.de>
From: Steve French <smfrench@gmail.com>
Date: Wed, 8 Oct 2025 19:12:24 -0500
X-Gm-Features: AS18NWBDO6yK69iSBzCC-3F6icpJXqhtpmdffwn6wWQE7dyQKytMaHCk49ryAxs
Message-ID: <CAH2r5mtrT7m71i2928akVarmQ0FTKzaEOu2q4781U8a-_w__ZA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Simplify a return statement in get_smb2_acl_by_path()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Bharath SM <bharathsm@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Shyam Prasad N <sprasad@microsoft.com>, 
	Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Wed, Oct 8, 2025 at 3:02=E2=80=AFPM Markus Elfring <Markus.Elfring@web.d=
e> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Oct 2025 21:56:34 +0200
>
> Return an error pointer without referencing another local variable
> in an if branch of this function implementation.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2ops.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
> index 7c3e96260fd4..bb5eda032aa4 100644
> --- a/fs/smb/client/smb2ops.c
> +++ b/fs/smb/client/smb2ops.c
> @@ -3216,9 +3216,8 @@ get_smb2_acl_by_path(struct cifs_sb_info *cifs_sb,
>
>         utf16_path =3D cifs_convert_path_to_utf16(path, cifs_sb);
>         if (!utf16_path) {
> -               rc =3D -ENOMEM;
>                 free_xid(xid);
> -               return ERR_PTR(rc);
> +               return ERR_PTR(-ENOMEM);
>         }
>
>         oparms =3D (struct cifs_open_parms) {
> --
> 2.51.0
>
>


--=20
Thanks,

Steve
