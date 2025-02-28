Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C517526FD90
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 16:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740759614; cv=none; b=LecqrNO+c/a6cnk4dMkM2pid463RCrRRgqBYKFyz0RDyqRnG4LxhJNbqr/mvNdzzo5y3eXI4qvMKAJHaecKP1iBlWMhwuvFYYFF+xNg08ZYJwdPYHROpUocabsxMapAXfSbnJJVsBaRMHfZCHI/A5NlV2Ymf4PmikQCZdoRGUoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740759614; c=relaxed/simple;
	bh=h2gE6rUUyvcemVgUP1W4tCsojyay/YimUNqH0KvLJIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HzR3t/5jw9cOhoma0Ws8KC6soG1heMOJICR85A+rsk1yyVT/BZ1C8A1gkzwIJHY9Aj/olVdfgvCB0O/wbKnL6L+zwZOugvCwfHsxVBEIXpsXFxIwfshZTLVvAr0AEyxTNj+DE+orIHsaG41sm5uH3icX6tpXbbOh20AsoVfwSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=cDqxIvV9; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="cDqxIvV9"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fe82430bb4so603155a91.2
        for <kernel-janitors@vger.kernel.org>; Fri, 28 Feb 2025 08:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1740759611; x=1741364411; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FgeRbDBZj/Kmr7MOY4QlYhLgpNtskrfBfuQ+fdrrXK4=;
        b=cDqxIvV9oFafs1O12JzqSvSnSyugQjC9Q4p62fkrwOI/2w+8Z1iN133/Lp+byJRWAD
         n8koxidpdvhj8dxZV6nrvKzfD8QAlcMLKeQORCbHpa87JHZuU7K4VwrQZn9uny0zJJKo
         3cQxK8SeaM4p+MSQpoOb+IIGzESbYU4JprIjl9b3JhcjnjPwl5Abm1BP3l/Q1+0dmYWU
         WlYeLjflXG1Gvzk1832VfpYMwdINxbqUTEJWFnf+83WFUI37ldGd7peC7Dru6O+D7LGs
         7Iafm2gBQb7dQxg4tbM74TX7ZleY7x3FUIstQLDHp5fgiagsE0phCwgy5FTKETniNEig
         MlQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740759611; x=1741364411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FgeRbDBZj/Kmr7MOY4QlYhLgpNtskrfBfuQ+fdrrXK4=;
        b=ms/KKmIs2jOSSxra1d/QPVwOSFUKr3ssrysVjSSTczWZ867dO0L8tGb28xjMOrc6Yb
         ltlsqTL2my3PXleCH//VOAqIk+eJsDFKo/jVmvHO4JE1YhC0zhgvrBK4zut62mk9yXdV
         9tT5cc8qMZeT7la712Lhz9upWMXEPE7Klqs9LHQwY3+sKVUf5ymXvQNb6Mv37KIE9D7H
         WlY6Gq/yu4GH8z3dTDxL9l8EudI6qouGr9fJJgAUJScejJL3nB/G1S4F1eNcgdPdiMPS
         0TvfJ13XYOC4ZGSiiBQP0payqroNQzA2MSzJwfaEsADMoMK2gTcu8nJjjBCAvPkO7yTy
         TlLA==
X-Forwarded-Encrypted: i=1; AJvYcCUN3gbcCHEEmXSc7vxroRzPYkJEXYTYCZp/oDlimNSx1nbFoRq0iad1h6w4njsEvDfTHr4W03dwGc12SRmZaDs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZF0sRzj/ChO8wzcZ+MPIkZ2Lvljad7196wnWpwIeM11uARumU
	PXH3DLixP469KmzZE0PQ/fSByT0yOQZIELlmsc/V2CmInhZsO3JomLtw7JOPS4oDtk5qbvtAYKA
	6go0haV2O0ZUG28kfx2grVycYu39OEAsLQkh3eg==
X-Gm-Gg: ASbGncsALBpU2zqKX2xDDxtO7t2vpjaP1dbgSk3Q76LLrY7p+1+iz9rIOqIA52iBXLQ
	inrhvMHiSaLzkRAyO/n00tR6wY/v9/yqzrOPeIElaBd6y5i7B/9PhYNk/VBVRON/KzXLpcd5q4B
	BKXuhsMA==
X-Google-Smtp-Source: AGHT+IGrPFexLq2p08fvEV+7vi1y3CJa/f7XRnyFy9qcLiZdIYOI/25rvbAAY8P6RNV0DwhkcTgV3GIHP6AtdYEir/o=
X-Received: by 2002:a17:90b:1d02:b0:2fc:25b3:6a7b with SMTP id
 98e67ed59e1d1-2febabf856bmr2465912a91.6.1740759610894; Fri, 28 Feb 2025
 08:20:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <0f3be9ff-81a1-4c33-8960-75de2c239ae0@stanley.mountain>
In-Reply-To: <0f3be9ff-81a1-4c33-8960-75de2c239ae0@stanley.mountain>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Fri, 28 Feb 2025 08:19:58 -0800
X-Gm-Features: AQ5f1Jp0gEH4Qx2IhSi_EgMbX05yYyRpMAompI303gVwrEuEcTt5M__EGuq2aTo
Message-ID: <CADUfDZroCBhuJbc2jMsQAKhMZF9y3Ye5zowhusbUFqOdaA7PZQ@mail.gmail.com>
Subject: Re: [PATCH] nvme-tcp: fix signedness bug in nvme_tcp_init_connection()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 1:39=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> The kernel_recvmsg() function returns an int which could be either
> negative error codes or the number of bytes received.  The problem is
> that the condition:
>
>         if (ret < sizeof(*icresp)) {
>
> is type promoted to type unsigned long and negative values are treated
> as high positive values which is success, when they should be treated as
> failure.  Add a cast so to avoid the type promotion.

"so as to"?

>
> Fixes: 578539e09690 ("nvme-tcp: fix connect failure on receiving partial =
ICResp PDU")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Good catch, thanks for fixing this.

Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

> ---
>  drivers/nvme/host/tcp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 8a9131c95a3d..361b04ec5b5d 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1495,7 +1495,7 @@ static int nvme_tcp_init_connection(struct nvme_tcp=
_queue *queue)
>         msg.msg_flags =3D MSG_WAITALL;
>         ret =3D kernel_recvmsg(queue->sock, &msg, &iov, 1,
>                         iov.iov_len, msg.msg_flags);
> -       if (ret < sizeof(*icresp)) {
> +       if (ret < (int)sizeof(*icresp)) {
>                 pr_warn("queue %d: failed to receive icresp, error %d\n",
>                         nvme_tcp_queue_id(queue), ret);
>                 if (ret >=3D 0)
> --
> 2.47.2
>
