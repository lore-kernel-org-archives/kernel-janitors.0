Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4441DF26E
	for <kernel-janitors@vger.kernel.org>; Thu,  9 Oct 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760024604; cv=none; b=o5b4jrkuqJpnQ3gVewGlAxZlcmRgnQcxMuzn61R4aynCr8dwEwVNbzrZQzujrp/rK+vbcIYkHOmayHosXYD6XnSUjIEP7HYKaxiHYt9cCcAbc5Tp6N2qtpqSP8MgiQFif+boZSsAlQKzF2EcVOJ2u5r0D4cgxkkxb1kC5C5h8+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760024604; c=relaxed/simple;
	bh=te3lK6IWUoqi/wAYbc+4g/fP/ekfKZqS9oWgxvjZ0rc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLsttMJmFhi9GMEKwq4OImQunzNdfqNeIoWsO2QwiLuHt6qzyvYLPQ8EQO6Czy7UMkkDZFRJd95rm+14w+SUuMBEgXlx3Sx8S6oTxUql9++gQ6wMv9Zd+aT9b9feYF4xPmpsgInrq0GFyvBHlTMBiwq93GbzBR0bWyQWtph2Bt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5IK4OCP; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5IK4OCP"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-7e3148a8928so10682386d6.2
        for <kernel-janitors@vger.kernel.org>; Thu, 09 Oct 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760024601; x=1760629401; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNVjPOkZQ4/5TQpLx5EDj6qV7WJ4xTniFhtjleJ40Ko=;
        b=O5IK4OCPguzzR1HnnG11tlVqTHh3OF3Fv/qXLzbXFvE8ceBPYss8GF9Ce9OkRuIvta
         GkJy6qalK/ePV+Uh3tW/YNL/Aej2dNIbnrNMXea0znWeo7oo6JgrDrxRBrXUAhpQKIhT
         RBfHf1emrQzLYpVBwDWw2/hDtcNG4H42zgaMWP17cZejWoFx/qLtfPHYfBjsjdBEnm1B
         nAgDzPMJq0feamsRcZ2R/avlbGjtEgSHAHJO1izz1MydN2OwMQEs9tygudUwb/qjDgsU
         r6wF0KraM9AOfbl/9hytl0xx5wwAv/RlWRSP1ZqeD2Iobn5dRxokou9cIVLxZqKOHL1g
         bMJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760024601; x=1760629401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNVjPOkZQ4/5TQpLx5EDj6qV7WJ4xTniFhtjleJ40Ko=;
        b=U4so2VdaDWzyIV32U8BBvWKXqrSeN3t7Bqum1greXjF1qSnji/NQ3F5E7Wa1zhO0ri
         nCPQ4TUGhpzcE9HhnYH0N/wyQDG4gL+lE+ubP+Zk08EYEki/JPJIxloZqXoPmv2LZqDv
         R+rKr9caYiv/9+1YR8/c2VA0xwccZpSqiHM+9hQRf2NgyxI+g2qDpchj40BVQysaZfPG
         2ghPbdWoUmyvbC6/hgB64gYOZVBl7HhtTjlU/0BCU/uS1CKHKdHbr64VmaJDtsa+DQPe
         wEVH7l6SSRaYTnOF+Oa8S0lkmgPKfXPnWEvclYKQw0/4PhYxStBdbOtvZm7/AyuuL+IL
         oAtw==
X-Forwarded-Encrypted: i=1; AJvYcCWq5YfxUTCIfE9WrhSi2GDVVsyFokx2WWCMWZ+6gLsZ1XZsgCeHdOmqcoTJXai2kQMLF9lIcVusaxQGksiVAwc=@vger.kernel.org
X-Gm-Message-State: AOJu0YywQ3jRKM6o32anjKEpgTgWF5FyIhrtgOsrjciDxx/+NQb6uWeF
	rdblopbjaM9hfNirB39OdsDdCSH/zjgZ/z40HHYPjvTwA9naX8HGyhsS+Gx1ghIRdL4X1hrGq/5
	z5Mg4Fkz3L2CpcLcclM9hf3YsVE4EHlU=
X-Gm-Gg: ASbGncuwPYhKLVbmHHk0mahFRl6IYv2Ximcm428fwd1ak7dkcOKrjjPsD3EVJsi73YL
	EOrmsBaCthxLNUYFL1rwznH/0UzK+VIbyEkvZzUcnVe6aoXnE+W+JX8ZVQMDtdW0fT+rP2n2CAo
	QMGjlUrmWf/mDt7WkBE9oVpd9yadVEULiskLFqPKJWGPGodKBnqamxMy/LestjT1V0S+WXADnNt
	UbuMevVLuSjXNQMy5hBFozUjAQXDJGhNjaFsD5VwyfGl74R9IW+kOzmFjNuu08EaFplwXA9PbTS
	ah32/nLgSl7nE0qVNHA5udrpUMrDxzv4PXZQIP1P1sTqFtRf4c1t0NfDPMuN7wg7dzTB3mt7rm5
	9vXvwg2SDuy5813JCXcVoGQfhjEKu/mycNrP8RCBP1Rm6DidhmIi8Ck/4
X-Google-Smtp-Source: AGHT+IEYrpzc6SMoRQfsWO3qThn+WGHDuSzBgj5HClu2LTLami2LK2vOG7hA85WdSkdDUqm3JQ980vltGEZBu587cu8=
X-Received: by 2002:ad4:5c83:0:b0:79e:88e2:1e60 with SMTP id
 6a1803df08f44-87b2108abedmr105123276d6.29.1760024601139; Thu, 09 Oct 2025
 08:43:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7a5c4b6d-f15e-4071-8a82-dca6b71b6b4b@web.de>
In-Reply-To: <7a5c4b6d-f15e-4071-8a82-dca6b71b6b4b@web.de>
From: Steve French <smfrench@gmail.com>
Date: Thu, 9 Oct 2025 10:43:09 -0500
X-Gm-Features: AS18NWBOW4IMP5XCqIx3vf6oRH0bz8isK0u_b-ctyASqmWxzGVwLMu3pjongCW0
Message-ID: <CAH2r5ms+S+G-wjB1MPTp1G6MyVLf+yzq6r+_Yg9PLb6HmDCtYw@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Omit an if branch in smb2_find_smb_tcon()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Bharath SM <bharathsm@microsoft.com>, Enzo Matsumiya <ematsumiya@suse.de>, 
	Paulo Alcantara <pc@manguebit.org>, Pavel Shilovsky <pshilov@microsoft.com>, 
	Ronnie Sahlberg <ronniesahlberg@gmail.com>, Sachin Prabhu <sprabhu@redhat.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Thu, Oct 9, 2025 at 10:12=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 9 Oct 2025 17:00:13 +0200
>
> Statements from an if branch and the end of this function implementation
> were equivalent.
> Thus delete duplicate source code.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/smb2transport.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/fs/smb/client/smb2transport.c b/fs/smb/client/smb2transport.=
c
> index bc0e92eb2b64..33f33013b392 100644
> --- a/fs/smb/client/smb2transport.c
> +++ b/fs/smb/client/smb2transport.c
> @@ -240,11 +240,6 @@ smb2_find_smb_tcon(struct TCP_Server_Info *server, _=
_u64 ses_id, __u32  tid)
>                 return NULL;
>         }
>         tcon =3D smb2_find_smb_sess_tcon_unlocked(ses, tid);
> -       if (!tcon) {
> -               spin_unlock(&cifs_tcp_ses_lock);
> -               cifs_put_smb_ses(ses);
> -               return NULL;
> -       }
>         spin_unlock(&cifs_tcp_ses_lock);
>         /* tcon already has a ref to ses, so we don't need ses anymore */
>         cifs_put_smb_ses(ses);
> --
> 2.51.0
>
>


--=20
Thanks,

Steve
