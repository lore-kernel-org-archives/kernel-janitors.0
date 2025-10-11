Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6A223DDF
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Oct 2025 20:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760212868; cv=none; b=SaG1ArnbHsra9nHjU5hBDG7VtIQdoAz0vqkgDNfNju1Y+M61t0UWP8ED4nR+D60gtyAC7b+hjeUcjFhVfa1wvWDdZjX9uDkbi4MkDkKoLCf0r0FHrYT7dDLV5hp9F4xYAzw4bO+BPNT0vAhm0uCI+bYttBcyJCONvmvBB1uCDcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760212868; c=relaxed/simple;
	bh=1Ps4bs+k5Q12zq1sC/XXxaSLC6nK6BiT6V7wRXyLi8M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1v7PvySY8poDxvcETlDEt6Qt8KQtyxgCX17Ke0luTMa64oshM4aKrCJSgIeFxNfv3q9rcI7/bdpA11DCNxQ7R9hA0jPocYdrhiqU9GSeN5OSgHgjBO2U+nzTwlBRZh0o1mB1oNIQz2Rx8W7zUZo5kLQ7Pk+KAWdomLjHsmYPEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WmbcgNwt; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WmbcgNwt"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-80ff41475cdso58513576d6.2
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Oct 2025 13:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760212864; x=1760817664; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hfL+PrpKvMN9jJeKubgjHEY0rwUSNs6+/9bmODOXmYo=;
        b=WmbcgNwt6p9W2WjOcsJkJwTnWA2KdH2NLaAbIUz8xqe3km/hseaEOgf3w5tQcnvVIe
         HpnUYWRUqj5kCvn9L8alRy/CzqKxUSxUDFELTISHi9Mm1OGtMQFL4qbRjUEIPfhLAI9o
         VdbVz1owvZ38v3+E6Cg3OF7c19JjfSZjgmPFdKJmRNVGnWMYqaRo/ZkSRnK5JjP3JPL9
         svta4AMS1IBa18cayA3v5FZdA050J5VZZWvGiyfbuI86gq52zJK3FTYfbG3ZPzk4LiAl
         qO6Y8Z85oEePTmf9Y3GGbybo4cwYrdoQGch+qgiUzEvuaunvo2Im6vYRG54ud32YUNn6
         GtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760212864; x=1760817664;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hfL+PrpKvMN9jJeKubgjHEY0rwUSNs6+/9bmODOXmYo=;
        b=OvBsgCWG/pOUJ1sXnpN64rK3UQpC4/eeI3JEKc8zbdlZMXja3EiHY92XdhUqRBD0eE
         MuPO9hM9Fwo8KChCWeCzHIQQd4PhssWVppGZqxG6OBVfwqOLZa1tgV52f8U0HcWocpI8
         zI5uegulm+vHT+iE+StMJQhHhGq0Ov9BZRRWBrBm4khdqsbJoLMVY6JkjKC5/c5kHaxL
         ijjCJ5zTyte4NULcX0rLL3IqCbdWjP4bqnf57zHph7Q9wddV+xcTPyQZfrnK142KgC6F
         jUvYfDnHLFXwT9e4HyY+Ft/KVCFV3mqFv2OvrD1BtBSQfDcQ6AvPfoD9VN4kRdulBowY
         Of9A==
X-Forwarded-Encrypted: i=1; AJvYcCXXeaEU2ODz4/LncW3dN6N1MlrrDIxrCXdGJ1UO8khweO163sSSnn4d25tbAVBa2+LCgNbRJW58sMhUoY54B4I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr2HmMNAslHJrgDZlfwRV4DVrn8KseOK9XDX9hiVykWQJ1j8fS
	1vesYY2b5BjuG11Xy7n22Z2xfDsv76MdCaayrb3BWRZ07HjKmYcCQ92QYsUzLBCHald/fSS++rL
	8k6u6Y1CTjFDplpjp2FSFDGvkm2gcH1c=
X-Gm-Gg: ASbGncsx2P/OVywQpdKVQbr+C5A3gJl53ZfRh8/U4f8030yW1Bb+vTSf7pYYHl1r7Bf
	xpXGiUoEb4gbZm9jcqB3ALy2PgUQdnTFo4SinsOHE7UsWn9H6AnQ5/xXgj6FMNR90fCd9Ghxdyr
	0l4d1zqfwgZkHQ3WcvkEO7oiXPY/l0qMyEgY60XghWoTjso6wCLUUfpMdeZlbMkJ4JDbE2LNPkW
	TE8rqoQp4L1bUdVMVXBvjV0dnnfilj4w/6sQwVIAmPft40NH2NxuBipvz54ZUr5Cc98MF04g6G2
	38mkku5VDaG+2QdEc6HOUBzaaIhQA+1KBwLtJE/MhT4tNXzFbFzsXJfX0LTXNoHudS+Smncenr9
	Jrj2kpgaXQGl35AbE175IUyWAyyvoXmT+MeCdFmIv
X-Google-Smtp-Source: AGHT+IGPQgsa9k2a1Up8+w6cXCZMeV+WWQ7neAnv2u8rNwSSNXa4/xhGZLri+COAL8htLz8tCf0DrbfdaqC7StUYs9Q=
X-Received: by 2002:a05:6214:f23:b0:809:c3a1:27c8 with SMTP id
 6a1803df08f44-87b2efc2d9amr249718956d6.38.1760212864032; Sat, 11 Oct 2025
 13:01:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <f61abf77-4f12-4dc8-8b42-4bfe19aef174@web.de>
In-Reply-To: <f61abf77-4f12-4dc8-8b42-4bfe19aef174@web.de>
From: Steve French <smfrench@gmail.com>
Date: Sat, 11 Oct 2025 15:00:52 -0500
X-Gm-Features: AS18NWCM0YwVW2bZ6DwJJ1L4nOwS-cEpGPRUjdlffaDFbiwcZQD4uBoAC9uA7ws
Message-ID: <CAH2r5mt7LOFRahepvnPyLb_f6-SsWXRkWZ=B+TB3bB-dLmZUcA@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Return a status code only as a constant in sid_to_id()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Bharath SM <bharathsm@microsoft.com>, Paulo Alcantara <pc@manguebit.org>, 
	Qiujun Huang <hqjagain@gmail.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 2:24=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 21:04:16 +0200
>
> Return a status code without storing it in an intermediate variable.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/cifsacl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/fs/smb/client/cifsacl.c b/fs/smb/client/cifsacl.c
> index 63b3b1290bed..ce2ebc213a1d 100644
> --- a/fs/smb/client/cifsacl.c
> +++ b/fs/smb/client/cifsacl.c
> @@ -339,7 +339,6 @@ int
>  sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_sid *psid,
>                 struct cifs_fattr *fattr, uint sidtype)
>  {
> -       int rc =3D 0;
>         struct key *sidkey;
>         char *sidstr;
>         const struct cred *saved_cred;
> @@ -446,12 +445,12 @@ sid_to_id(struct cifs_sb_info *cifs_sb, struct smb_=
sid *psid,
>          * fails then we just fall back to using the ctx->linux_uid/linux=
_gid.
>          */
>  got_valid_id:
> -       rc =3D 0;
>         if (sidtype =3D=3D SIDOWNER)
>                 fattr->cf_uid =3D fuid;
>         else
>                 fattr->cf_gid =3D fgid;
> -       return rc;
> +
> +       return 0;
>  }
>
>  int
> --
> 2.51.0
>
>


--=20
Thanks,

Steve
