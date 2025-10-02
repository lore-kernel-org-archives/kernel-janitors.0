Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C831898F2
	for <kernel-janitors@vger.kernel.org>; Thu,  2 Oct 2025 15:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759418092; cv=none; b=Nz2JSzVQkP+SHTDLYfvg0WAP5ugHvUWaar3apeGQ91hndH0aoYUksTxWzwhIpoXQL4PXUfdJfjYjx/Zzw1gU+m8P7YDmxRgKj0Nordc+UW2slsVXQaKMUXO3ZNy8HymANPuJRPzBjAiTsW1oYhS38Rett6SL9ZrbaILFXYnep8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759418092; c=relaxed/simple;
	bh=PduUZoikr8LnqAZaTzWf0aljgdXphuwsyDaOnjpUC5o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5Dh0BOMDhWcup30mAIF9v9H3UrTCMPfYQqq+0H+1YCXKmda1xUSamVcZ31sIYQ0Q4AMB2NaZ4ChnQhTsYa1laUW/K331fjhFVygqWkCP9BplgYrU7FL3d4wLgJLD9lFr6cCfpVwa0jArZ9ppS8oACLVj/9c11nHBU2rY7iniXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6O3BzEL; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6O3BzEL"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-78e9f48da30so10886126d6.1
        for <kernel-janitors@vger.kernel.org>; Thu, 02 Oct 2025 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759418090; x=1760022890; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PduUZoikr8LnqAZaTzWf0aljgdXphuwsyDaOnjpUC5o=;
        b=X6O3BzEL7gA/laF1um/c7axpZUmmp+wVsQtWPa5nsLsmmCwh1m4ALhXJmbA8+cblby
         4888/pG1pDgUXY6e1NDvYWhRNUTqpfnL6To5Z26rQA6eFoTCWig83HXDoEEDDkTui+/z
         LAiQOwG03S2ABLV2rCOtpa88UKRCEWjt1Q4ul2crynEhj04Jde3PSiOp2CNt8gsgEzin
         gLI3Wumy0R/qEo04RYJkl8D3jNWhZZQXQubCv0L9U9oZyZaf4EDH+2JH+ah/Bk9GKM2A
         Xw7HZVJbyoIktiuZVKII2Hjrn0EiTDj8d50jKWdfMIQ85LY8aj52PNPHYpVpExMPrl0V
         TXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759418090; x=1760022890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PduUZoikr8LnqAZaTzWf0aljgdXphuwsyDaOnjpUC5o=;
        b=TAhbEIJWxd/SOBFMM7a241PRJX608q0Bq55vXJzk90GWlPFlnD2YXWiTsSURR91Yr0
         cz7JYWlrrfWW9+Qdbn1X82a0ckNPuqmIQSz6LVAnUYCb4VskXqnh4W0OqN0kDXpoRO35
         jPzmkcimOXSB+cev/uMnJJoaKQgMVjfpEWTXz6+rTA3law6XcZ4J3TeZIpJg8C39OJD4
         gy9erfQEaQNv5bap3PzY4VXqL0QwiunL3mMamVkpJS7wYAoImoC6JPaVHTSt+GP/6uoG
         8A/tmBMewIM8dJK5BjgS5boJqmGd9/Ru0z4ccPpxi5FLaz/Wfybd1PIjY4y07GBGsN4I
         AkUg==
X-Forwarded-Encrypted: i=1; AJvYcCVH8vKPqN4L3dyKeM9SOm8o0l38eoCnJ5m0N3ZRnEAvExpPlV8+wTAIADRlrTBcgv5XzLDupgcm3tCoP8EqmH0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4GP7xItxoPMo1eGB/vHfdYLY730y7GqLTnQTIyv1j/TUrw465
	y2mZsQPK7WIcobqOY9stx26OS/c+n34o7+D/XZwa/6V4JPIS9jIRtKM7W1vYHBnMAbGWWmpZnt9
	dy1U43XNJ/lSpcAc2jiaWfoBP5cGbBUA=
X-Gm-Gg: ASbGncvGNXsR+S1iCsnHibN0HTubvxNkIgDYmeFn96PGDXAfylRVFG8xHXP7bAbF/z0
	JIAcYxgOCRc/Bt2MOM2rh09R6Ryd4pakZTMz/Zd/dmvxWqFDrIqJIIC9GMrVL0vhwI2W5yHEoaW
	Qy5hRWCA/QB+vaDEf2d8Wded2Sdj4OQrxNUDfjqFPk3PCsZbi9op5VbKqprtJIMn7/L+PoGXZY4
	epAAuZ5DcugAqDCB0j60bFEgN8YXDN1xf5vT2R+hdGRugJXo+BgpILqSG9vqlUck1XKFljpAJ5B
	42Adm3k3Rnu2dXK0aFxLMs6fCDjqHbMvnu+fXwyJfEAlVprQekRc8/gzRKgV06cc180SS2a3ney
	CvBh/IYYn2Q==
X-Google-Smtp-Source: AGHT+IGyfzn10GjCw6AbrHIRNFIF7sVwOU2PmWXcEbIdO80lNgoAtt7bNshbrMBB5VQ0QLFvb0YDQlUlMexok3l/HTg=
X-Received: by 2002:a0c:f088:0:20b0:786:d65c:1c3e with SMTP id
 6a1803df08f44-873a06edb4dmr97474656d6.30.1759418089626; Thu, 02 Oct 2025
 08:14:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <7f956b3b-853b-4150-b2e0-ccd430adf9ac@web.de> <a9518620-29cf-4994-a9f4-a6f862d8c214@samba.org>
In-Reply-To: <a9518620-29cf-4994-a9f4-a6f862d8c214@samba.org>
From: Steve French <smfrench@gmail.com>
Date: Thu, 2 Oct 2025 10:14:37 -0500
X-Gm-Features: AS18NWDp3jCCqFOTgwnnq5szZSBZZh9XBeoSBG6yvmFg9Zc70t7XgYEAJdiinjo
Message-ID: <CAH2r5muh7GCAdNmiF4YjJrP5p9wVeU+OLC_41um2_Yr9G8mhnQ@mail.gmail.com>
Subject: Re: [PATCH] smb: server: Use common error handling code in smb_direct_rdma_xmit()
To: Stefan Metzmacher <metze@samba.org>
Cc: Markus Elfring <Markus.Elfring@web.de>, linux-cifs@vger.kernel.org, 
	Hyunchul Lee <hyc.lee@gmail.com>, Namjae Jeon <linkinjeon@kernel.org>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Added to ksmbd-for-next

On Thu, Oct 2, 2025 at 7:31=E2=80=AFAM Stefan Metzmacher <metze@samba.org> =
wrote:
>
> Hi Markus,
>
> > Add two jump targets so that a bit of exception handling can be better
> > reused at the end of this function implementation.
> >
> > Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
>
> Reviewed-by: Stefan Metzmacher <metze@samba.org>
>
> I'll add this to my for-6.19/fs-smb branch and rebase on top
> of it as this function will move to another file there.
>
> Namjae, Steve: this can also be pushed to 6.18 if you want.
>
> Thanks!
> metze
>


--=20
Thanks,

Steve
