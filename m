Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62292E3383
	for <kernel-janitors@vger.kernel.org>; Wed,  5 Mar 2025 15:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741190302; cv=none; b=USSzJsGGHKMIMkcHFyptHdDu7bv1ZygPW/yotnrkXjT95rQCraaJ24btU41o0qeQxtiADhG0ZNDZSZ6Sy9W+3FjG/z22DXAaobQipa6/0iDhydaunfvM3NNKQjnZRaioTkgo2urr+kC51mx3UieygeJ74IN1AKI2eGd3NhN4m5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741190302; c=relaxed/simple;
	bh=bYuWvTnxcH9cu35HRFKPtJkB8o67RKS5wYWWIeSxv70=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FfmWuYeWFHJHl5K1Q9JPqSkLiNxs+jvaHnXkk32jrAxcgTSk2uN0Kusv2fiCj4+pILs7+Qgai/awytMV3uJ77YCKe3ee8md7+kqDms2dclZ5MNxoDimDYvZoARVWdiLw7sNBUCaJBHWBYFNjgZq8DkATcD/Ut2r39yNab9dgkvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=Y2gqTApg; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="Y2gqTApg"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f2f5e91393so1977176a91.0
        for <kernel-janitors@vger.kernel.org>; Wed, 05 Mar 2025 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1741190299; x=1741795099; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYMU1ONvumZN07XPBCtkjUrstfEAtCPPddr7Hfo9Atk=;
        b=Y2gqTApgoVu023lcE28ic24Z/iILnnSBvedaOlwJ+l4XsHdOMokBtTFXwUg7lFmMvO
         BwQM2Ors3A7bASOcF6yaOmn6M+1J0OYG1lMVm7untLeN0EwJFC2qhFjypaoxzXvlxgEi
         KqegLmZaTWnHmYMfwEOFmjAfFecqwcXbA5LBKvIfIz6A1FxDDV9TSt9l9eFXKSS1iLjE
         plJmFsB2LKf5QBQMDjkf1t0T1SCGd3ukHFu0ySIyJyK58F6DmpRv68TOD0sVw5KH/JFo
         hV/GYN9rZiLvnZThK3WRZEQ/QTm2K3JESfSjc41U24NGLI8a13bfJtoS0/HQ9gIyxhXQ
         Z7oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741190299; x=1741795099;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYMU1ONvumZN07XPBCtkjUrstfEAtCPPddr7Hfo9Atk=;
        b=OGj80AsXjCp+64xjozhWI+24+uPWBg2t1PF3vwbGV5GrXp9eMh/B8FZD1vOmAWR2oe
         vMSzYTcvkQ42q4j/bNvKWw6PxH2KM8OWgCWxv3tONsMaKlVsiaQxCB0ilNQmLEB8avF6
         HjFER+NRpXV+PrN/D/6Tqa3fxUH3+ZvrFuk5pY5Qy84BGIFRH6dlHrYdKG1MWWZ18+bQ
         E6+FfaO67OAMH58GuaF7cQawi+s12tghiBlXztSsMlUFoj7XbxHDlyVleMnXdiAY9Uoq
         G6aIcAzPw2eAuzyK5kl8GuNGeZJiEaeDRbLOXD0jeWSAD3dkqm2h/wC+8LJi7OsAGTzK
         YhBQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1wLvitfvO9SveBqzvaE3t/GkSMlq2OvK77fw4qgtBpewVafmWE0hST8R2wV6WYPOwQEAYV88Stz7SM1Y/Dk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK3NeEg4YLG0eOQOFRU2/HLPqGVNcg2a5S3WRrtwn+z7k8TBbN
	SIxxBNP/B+Sg5mgT4eXIHmTHSuQzsVl9ppeyipG969D4f+obZV5q+FtqNrziOFaycDlBDPKLh4S
	BhENFrSruhdvrimzO/cL88rs0AHrN5EK2a1AvkQ==
X-Gm-Gg: ASbGncuqSa6azxN3bZ//3e2saBmZdv154OGzTRfd8e7Mfm6WesImoJylads4rrrAcSu
	Brzps9pxa+H9qC+u0RPSpmBXHDEMG8ifmMAvq/hGPl0ZtYTLdVqWLwuxrTe5FUjIKpxvSgXzow5
	v5UI2VQfKXF/Cl65DkXEQvzYLyoTU=
X-Google-Smtp-Source: AGHT+IE039RKehIzWkPoz9Pwq8myqyy+FZsujwKtDDyBFn8FwGJVt10BuBtMIRgg7fWx3zw0WYibWGpIpl/Q2cToPds=
X-Received: by 2002:a17:90b:3848:b0:2ff:4e90:3c47 with SMTP id
 98e67ed59e1d1-2ff4e9041aamr1711334a91.4.1741190299046; Wed, 05 Mar 2025
 07:58:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <d3661d33-096a-45e3-8304-1123fd031527@stanley.mountain>
In-Reply-To: <d3661d33-096a-45e3-8304-1123fd031527@stanley.mountain>
From: Caleb Sander Mateos <csander@purestorage.com>
Date: Wed, 5 Mar 2025 07:58:07 -0800
X-Gm-Features: AQ5f1JpSLtbPYSGimhA0YnzX_t62kjsBmHrLeI4W_9M3JJL8fO_onDsebrkT6Ww
Message-ID: <CADUfDZphhneo1g7TSpCh4iNW_PjgyuM52Nm3mVQrG5PSzDUnnw@mail.gmail.com>
Subject: Re: [PATCH v2] nvme-tcp: fix signedness bug in nvme_tcp_init_connection()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>, 
	Sagi Grimberg <sagi@grimberg.me>, Hannes Reinecke <hare@suse.de>, linux-nvme@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 5, 2025 at 7:53=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro.=
org> wrote:
>
> The kernel_recvmsg() function returns an int which could be either
> negative error codes or the number of bytes received.  The problem is
> that the condition:
>
>         if (ret < sizeof(*icresp)) {
>
> is type promoted to type unsigned long and negative values are treated
> as high positive values which is success, when they should be treated as
> failure.  Handle invalid positive returns separately from negative
> error codes to avoid this problem.
>
> Fixes: 578539e09690 ("nvme-tcp: fix connect failure on receiving partial =
ICResp PDU")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
> Reviewed-by: Sagi Grimberg <sagi@grimberg.me>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> ---
> v2: Change the style.  Add the Reviewed-by tags.  (I will feel really bad
>     if I introduced a bug in between v1 and v2 and cause everyone
>     embarrassment with the R-b tags.)

Still looks good to me.
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>

>
>  drivers/nvme/host/tcp.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/nvme/host/tcp.c b/drivers/nvme/host/tcp.c
> index 8a9131c95a3d..b23ce31df97d 100644
> --- a/drivers/nvme/host/tcp.c
> +++ b/drivers/nvme/host/tcp.c
> @@ -1495,11 +1495,11 @@ static int nvme_tcp_init_connection(struct nvme_t=
cp_queue *queue)
>         msg.msg_flags =3D MSG_WAITALL;
>         ret =3D kernel_recvmsg(queue->sock, &msg, &iov, 1,
>                         iov.iov_len, msg.msg_flags);
> -       if (ret < sizeof(*icresp)) {
> +       if (ret >=3D 0 && ret < sizeof(*icresp))
> +               ret =3D -ECONNRESET;
> +       if (ret < 0) {
>                 pr_warn("queue %d: failed to receive icresp, error %d\n",
>                         nvme_tcp_queue_id(queue), ret);

This log line is slightly less informative now if a partial PDU is
received, since it will log -ECONNRESET instead of the number of bytes
received before the connection was closed. But I think that's fine.

Best,
Caleb

> -               if (ret >=3D 0)
> -                       ret =3D -ECONNRESET;
>                 goto free_icresp;
>         }
>         ret =3D -ENOTCONN;
> --
> 2.47.2
>
