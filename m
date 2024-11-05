Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333CB21219E
	for <kernel-janitors@vger.kernel.org>; Tue,  5 Nov 2024 22:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730844325; cv=none; b=SyAxAUwPCQnkwEln/lEs6gKjLDqkJH1jueegHPcJw2UhnDdVWpmjEgt+IfRLe5rCZa24sCBBPEE+pnI422R9h+7kK70g2YOJtwLPu6R3T2n1Rq9ShB8t/ZTYyC9NlnX8RouZ4471Rfntsavk6qVzsGMLbTsfmI3w2vphoOD+9r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730844325; c=relaxed/simple;
	bh=djBJ3X9b8PV3X9FBvYB2DvR8/bEo6mFq5HQ90DmmY4A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jf36dHJNhfyWSAiAuevfj3dp8GyLL5s4DfA7CaY7A0vWb4tkOkvC77MAbwfzPo4QTILFR7sqJzBIFVR6MxVKYAXfBt7eDvvIT0phXD6qdknAb72mShB0T5a0JdpLDsFWq+Ni0GN7HsKkMpLRWIMPrqJJy1Cfslb8lt0s0Te0xn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=MOCTC9us; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="MOCTC9us"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e34339d41bso51676087b3.0
        for <kernel-janitors@vger.kernel.org>; Tue, 05 Nov 2024 14:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1730844322; x=1731449122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhZ+0Y9dSaLb2rve1kOjUAczY7wbLs+msnWKXaMK6Qs=;
        b=MOCTC9usKgp1nGk5iaqLnYdttea3fDU3AX2cnt0Bet4WEu2WUWTwboM3TzvZ1sWM7E
         MG4dk2wGRgdYj6Csuxn/qOPGhXr3iQSvAeEl4Ix61PtiJ+4ktyhbKB3BFqcSdGhvs0fL
         AMCogWlcLAcIJvqo+W3H6AcGi9bMg3ZWZWpM8gPVltPVsnd1CUEgCIVFvYlfoMpwEgdZ
         DkZ77YiEGzXFyj/8UoGM80TKVUYMhYid6toEzy2QKo1hD/WWgBGL8hhW/shGNQBI4i+N
         ElfyCHB5/Q9/iS5yJi+1/gjTrYLonnbr+TAMbIz86OzvVWZ9pEUB0Z6rHowzD5qj5m+g
         iI7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730844322; x=1731449122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhZ+0Y9dSaLb2rve1kOjUAczY7wbLs+msnWKXaMK6Qs=;
        b=oR+eG0lAfSbU6jY23Vk4C3wdXtTYJzbOFjS8uvTzoVAUQtHz/wNjivuW2/JhwR258n
         9WFyJRoNUJHZDAnHeoDkmW8cEcOUClpy/xglWQ8ifKPIqZ3WyLOVig+uCIkXc9oPn6l8
         E7bjlB3m1d6tIZ27D+q2DUMd5rvRKNA62SDPk931De8ZkDYSknRLHpbWIAUMaAqzMNIv
         uycaFWafgMC/Dw4WhA7XaP4FSgLI4liVnwsTEJFgOYR/Ku7vJGrZv0tXP4HKrM4mAJKH
         QSPnsrLQ24zeY4JQbYSK5UrOGDJBJM8LFDE3NEHrnNZ/rlZgjPHV4FvA1+R+CRcuAQ4F
         JCWA==
X-Forwarded-Encrypted: i=1; AJvYcCWb6fuidbGE+KJa6QmvWnRpol+C/IoHBoqhLJaGzerttT61E626UkYUSFY8rnPbFsEun08D8zwTICoz5KzygLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwehFtipOt3wgjcEx5hZs7VCYPInzneGz6pX4poqvP8tly8P+9I
	cepqQxT729WX7BQg5p6fnRQa4kNUkuLUJz9jB1dNylbMcpCtJ4/vzap5zENlNXnMrXpSZrZcN/8
	FRhXMQ6GurG+JsVUDxK2WrrlpAVaTnx2Z+4+/
X-Google-Smtp-Source: AGHT+IHOquUqvyWgtXT2/sE8iENbvnsQpc3TOSa8HX4MAum2KDhJxz63gYWb26deeOkneLh0dVm/l7sooH5/2AEa+1s=
X-Received: by 2002:a05:690c:b82:b0:6e3:1008:6d7c with SMTP id
 00721157ae682-6e9d8939dc8mr367029867b3.11.1730844322234; Tue, 05 Nov 2024
 14:05:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2d02f331-42ee-40db-a64f-5ee378eb44db@stanley.mountain>
In-Reply-To: <2d02f331-42ee-40db-a64f-5ee378eb44db@stanley.mountain>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 5 Nov 2024 17:05:11 -0500
Message-ID: <CAHC9VhQw-DGzCq-q=ZUXjzM8GN-cUJXb6nU2PhOMre3nhiQJ4Q@mail.gmail.com>
Subject: Re: [PATCH next] lsm: Fix signedness bug in selinux_secid_to_secctx()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Casey Schaufler <casey@schaufler-ca.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 2, 2024 at 5:31=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The "ret" variable needs to be signed for the error checking to work.
>
> Fixes: 95a3c11eb670 ("lsm: replace context+len with lsm_context")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  security/selinux/hooks.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Merged into lsm/dev-staging, thanks Dan.

--=20
paul-moore.com
