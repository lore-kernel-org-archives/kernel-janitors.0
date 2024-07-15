Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CD9256D
	for <kernel-janitors@vger.kernel.org>; Mon, 15 Jul 2024 01:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721008477; cv=none; b=uUscrb5VPv3MsPFABITi7wpxRuZvmYbAixWQBjIJR4GaX9L1SXYWOdNdS1vEp9u/qtnldFgfF6oJDhU8nxpflgP7IREwdSk6UJEcCg2Pag/4azlp0sGrMq8keDbg8Dql5CfuiRYGoqOfwNpbsUdbaZYKwgC0WjdsZS8Ov9Co+9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721008477; c=relaxed/simple;
	bh=PdJcb3igX9JMsq3rnGseO282QWH+Nqt+bo8dY3Ir/84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XDib4NVnrCLyyL0MVJwZO6GJSnEAbCw+o0ODWC2NEcOenNVe5x5sUFDwI7HNisG1ym34o7kk5KewHjCbIby5A/dimYakTjJ3vzgbe7z8iGnb2LB9VDZLeuu69yH0OK+EZGqzBXQn4XvWNobM90xxhB3c7nv9fpy2W1cMR35F3zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XtLOPlr5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XtLOPlr5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721008473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TyziscBlQ1c0/6ktS+LCg/Ky3aZzCiDK4+QaHxxkrmw=;
	b=XtLOPlr5tsFLBhgWfwBaHNMcdzzva11Lp+XTk6OB01Gs8kzyktcFQkb3HR1Cva6YarmPkj
	/h7cJ4PeURMlsp+VOEt9+xjzU0R7XdqquchD1JBq78W/kl+GFaRvA50jqa5rVXs04rGLq/
	9YYCeDMHlnXqqywKOfKbw9FCqGYxsZc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-85-yPYAVsSbM2mhtkU-_-1pyQ-1; Sun, 14 Jul 2024 21:54:31 -0400
X-MC-Unique: yPYAVsSbM2mhtkU-_-1pyQ-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2c961f68638so4036428a91.2
        for <kernel-janitors@vger.kernel.org>; Sun, 14 Jul 2024 18:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721008471; x=1721613271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TyziscBlQ1c0/6ktS+LCg/Ky3aZzCiDK4+QaHxxkrmw=;
        b=AkswRFprWC9BVj/hLD2o73OcbzT5lwrquJXlBYSi0RIV2rVudNWoigo5leqm6pP7ue
         D795a0jKkFPoVHoNFFI1coetRuOtlpUyvi8Bh9AitmWQwVZ3e2udOsBhVxZvHkWvTTFX
         5BpEc1icDgAayRh9kFN+bGAp7y4VaWiyOld6uNXf2RxyGOScXzO8GqNFTbwia1mzDM9N
         pj6B5Rf2E3ZNBwpU/Hu0kjYN3dRI9pqhMW4Su20wRIfySVII2CNy08ogsVqSTOmfPJoi
         Xg3a0Q36L4R45q1qpdn/X/CCuiKxSX1v94JUduMOfBpFlSqJ22+51kkW/Sy9j8lfSpLe
         Oq1g==
X-Forwarded-Encrypted: i=1; AJvYcCV1j6pex0r6AWQphp5pRDTQ6jLzREl0nvoxaRoQZVzZReCmB5w+vMTbWdu+t5Pg+V93ZvF8ITrr8SpRwkNa9+iJY1qP8tGFQXePc4DsAXfQ
X-Gm-Message-State: AOJu0YwuWUin6zOUiSYGHqJWbK9q6kr+ihTbi8qtsgwE6dL3o9PR26cj
	gmsV9BpnJwARILXGeMuBRRMxVB4qwQmuhMR/PRIfRWUd3Om7Ya2WuBwXr6AZLuISTaqaezFg5bT
	MpR9qwh3j/U+D4bGE5i8Rba1b11Xin2ML3HmLS+xTjpeim7GqUN/tvSqhPGd92znPK1JYzo4lis
	/CRkqy8UtQQ9r4SrETNhC74h8h9Mbb9rZHBoH09YNQ
X-Received: by 2002:a17:90a:5ac7:b0:2c9:81fd:4c27 with SMTP id 98e67ed59e1d1-2ca35c312cdmr15354431a91.14.1721008470744;
        Sun, 14 Jul 2024 18:54:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGsQqLS63Hvq5fYpeQcjjiPgAVcyB+pI69ldGNsmD5W0H1x9xueomtQ2GsZcTQmFkboH3lsYYRff1IdWbUz/UY=
X-Received: by 2002:a17:90a:5ac7:b0:2c9:81fd:4c27 with SMTP id
 98e67ed59e1d1-2ca35c312cdmr15354418a91.14.1721008470209; Sun, 14 Jul 2024
 18:54:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <623e885b-1a05-479e-ab97-01bcf10bf5b8@stanley.mountain>
In-Reply-To: <623e885b-1a05-479e-ab97-01bcf10bf5b8@stanley.mountain>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 15 Jul 2024 09:54:18 +0800
Message-ID: <CACGkMEusUJvJuk2QLcQNt4kb4TK-dsUwzx1q5zzK1dggx3iDpw@mail.gmail.com>
Subject: Re: [PATCH] vdpa/octeon_ep: Fix error code in octep_process_mbox()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Srujana Challa <schalla@marvell.com>, vattunuru@marvell.com, 
	"Michael S. Tsirkin" <mst@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Shijith Thotton <sthotton@marvell.com>, Nithin Dabilpuram <ndabilpuram@marvell.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 12, 2024 at 10:06=E2=80=AFPM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Return -EINVAL for invalid signatures.  Don't return success.
>
> Fixes: 8b6c724cdab8 ("virtio: vdpa: vDPA driver for Marvell OCTEON DPU de=
vices")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Nag mode: When we add a new driver, then could we use the patch prefix fo=
r the
> driver not for the subsystem only.
>
>  BAD: net: add driver for abc123
> GOOD: net/abc123: add driver for abc123
>
>  drivers/vdpa/octeon_ep/octep_vdpa_hw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/vdpa/octeon_ep/octep_vdpa_hw.c b/drivers/vdpa/octeon=
_ep/octep_vdpa_hw.c
> index 7fa0491bb201..11bd76ae18cf 100644
> --- a/drivers/vdpa/octeon_ep/octep_vdpa_hw.c
> +++ b/drivers/vdpa/octeon_ep/octep_vdpa_hw.c
> @@ -140,7 +140,7 @@ static int octep_process_mbox(struct octep_hw *oct_hw=
, u16 id, u16 qid, void *bu
>         val =3D octep_read_sig(mbox);
>         if ((val & 0xFFFF) !=3D MBOX_RSP_SIG) {
>                 dev_warn(&pdev->dev, "Invalid Signature from mbox : %d re=
sponse\n", id);
> -               return ret;
> +               return -EINVAL;
>         }
>
>         val =3D octep_read_sts(mbox);

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

