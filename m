Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988E6224B04
	for <kernel-janitors@vger.kernel.org>; Sat, 11 Oct 2025 20:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760212973; cv=none; b=HkIyPxKIqkR2Inp96ziTfyY9NO2EX2wSyBhNWwVbsgOLEcugq3gkybXVgappFyDo5HgIzJV2zY116xABPYwYWBpYKeEyGLc9MqTOiRelJZ8BM8yWrvA9oa1Ht7cqPuJKbJE87zaXMXv/6OJ3315jCVTdcl09/fnXy4KxMBpMdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760212973; c=relaxed/simple;
	bh=uKELvK+Pabr7Cacwb8UIBERYWif8VOC/Fn/heHRHgdo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m6+ud+4yLAYFoA5gZfm3rHHvhPKCXgLLz9PcnHUNUxMmDrWkTH93TgI1DSK3WS0OoRfx0F+fjUw93viQTBZDKtakpv7N5AFwPC2/yQ8SNU2Y2waHSOJeaebs/05iQF3UASGnm2uGTIofcFN4I/UJyCZDmXWGkzvpYkcUypTqLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yw7pWgLa; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yw7pWgLa"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-79390b83c7dso31743646d6.1
        for <kernel-janitors@vger.kernel.org>; Sat, 11 Oct 2025 13:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760212970; x=1760817770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xkr5Es7W1sfU77GvysO3I+d49t0a9ilRQJudJAibtUM=;
        b=Yw7pWgLaQoD10kVLOmX/9Hr2IE20ZUZMQINXnfAqf5653lRq2V/QNH2DGzWXiwbq2z
         1D9CmNHRS4gLUc+L8MMIsQy5uVN+eTob1v9MzQlj9IGc4DQCkrOy3Oz3WiWGCKGDZxjV
         qqPloWwMeWiH1Bhy5BI/n9kh9HUJ7aOvVPf5WMcgcCmR60MDp1jZ1MkfswXv0vWxSMyl
         RLxTN4zTqlnlIe/WBSgLHJR9xOh+H4iswlDnS0gV44stp7Auvs9hvad4Sp/55dbbrME4
         vX6FqlNv4wClzVt99z9CJE2JAIC/MY+ao2B7P8qIWa7oGCFPTZXuWuJagfXOPPoFXTkR
         2nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760212970; x=1760817770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xkr5Es7W1sfU77GvysO3I+d49t0a9ilRQJudJAibtUM=;
        b=Gfuna7DJ6+rnIyI4SWiO/4x81fCxC+WEiibSpNFsnyMQmldVYDYCFk8rq492tfyclf
         P7THiRlyaCTuguMBgNonSiUs5o2lb+1Fn9LQh/pvtE4c78EWYd6eMaA3zsSYWfDhNRU2
         aW8NjiFCiU4ajKiCGmh/OYB4gCAu1LD776Fzf+B/xLILmghTdHsj934rDCPXkvavh9pw
         I3SaN1iz/GVasWM3Dckc8DfUfoXVETyRHs6/vwSG7/qDFgwO3dkHJMmzfGLpwLTdbvRT
         i202wN38V38elrH7edzqLTLnzbyF8X9XlUDXggtNSU2k5EWZcA7pA6xV1mFRt5JSW8sI
         dIvg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjzMrpZQ6z3fUDpgzgPucyeqP51kuVTYmweeTEcQr432yVYWfoAXfUkl4tQmN+fWavqIai5eWDTvoNDbF5jI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfST0OUbicf5Oz53sgykxq4t5tbSyYWD6+1wdgFmjdC35pvM8C
	bUpAylqY+/+RlSH+PKL5RBlW35wgNeYgL5JsiDN+QP558jgws5Yw/jtndwaAdD0GONTcm/s/asA
	nEVtDCscJg842GA06EsNx0BVxo2cl2UY=
X-Gm-Gg: ASbGnctGNMKOUWdvLUecne2DCkK437YHh/yJ3uFlkd9sD6lWB17IeRSaTHFSjTIRCLy
	fS4wHXQJ9NPsa2pnpyLQuQOIF9oRsclBgExX1pa6YAOViEPdMLFUsFl2XL8o/StUu1OeBcUI+Ab
	HuXtGIIBg2JVXHajlSeWnFu3gHeCaxCuYCeOCX8kpx5pYVqZ8ean/mXgifE5vHuXtKCtWmPEV3n
	NBn3ZN+3NOMSzgiN2ImlMmA3oMOgJx+0qJJHivUqASyCo2FiQm/PzxMtp8RrLVzZoM2oWYCSe6G
	BgZ1mrPuZCvSNrLMGe88lQHHTavALh9VbBEB7fZMQmQpTGHJpJn1FeDuqdQ/rET0New7yn90bG1
	Z7i6bh8MHSzv7a75xAdyEsIxCCbF/czQi0rwpVUYVw0xNluele9g=
X-Google-Smtp-Source: AGHT+IG9ZCiwfq5KyR/1TeCl3i0cP2OQ4leD6REdC5/3Qk1b9iGVKiA0Gxr/3psvpoZZ40crdSe1lNPJ/iiBnZaSH1U=
X-Received: by 2002:ac8:7e96:0:b0:4e0:a9d6:d554 with SMTP id
 d75a77b69052e-4e6ead5427emr236273121cf.38.1760212970368; Sat, 11 Oct 2025
 13:02:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <10e2a3a5-e109-44b5-ba3c-3e8c40d76361@web.de>
In-Reply-To: <10e2a3a5-e109-44b5-ba3c-3e8c40d76361@web.de>
From: Steve French <smfrench@gmail.com>
Date: Sat, 11 Oct 2025 15:02:38 -0500
X-Gm-Features: AS18NWDvFK4gyGSPs9eyGmSKOV3bV8TQqhZdaEEWV_hSRnuKNvbTBU9D0yth8t4
Message-ID: <CAH2r5muxz0q6E+8NQiAxDRgWRfbwjsRN9fnoQXjyV_u9WXFh-w@mail.gmail.com>
Subject: Re: [PATCH] smb: client: Omit one redundant variable assignment in cifs_xattr_set()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-cifs@vger.kernel.org, samba-technical@lists.samba.org, 
	Bharath SM <bharathsm@microsoft.com>, Boris Protopopov <bprotopopov@hotmail.com>, 
	Paulo Alcantara <pc@manguebit.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
	Shyam Prasad N <sprasad@microsoft.com>, Steve French <sfrench@samba.org>, Tom Talpey <tom@talpey.com>, 
	LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

merged into cifs-2.6.git for-next

On Fri, Oct 10, 2025 at 7:56=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 10 Oct 2025 14:48:13 +0200
>
> The local variable =E2=80=9Crc=E2=80=9D is assigned a value in an if bran=
ch without
> using it before it is reassigned there.
> Thus delete this assignment statement.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  fs/smb/client/xattr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/fs/smb/client/xattr.c b/fs/smb/client/xattr.c
> index b88fa04f5792..029910d56c22 100644
> --- a/fs/smb/client/xattr.c
> +++ b/fs/smb/client/xattr.c
> @@ -178,7 +178,6 @@ static int cifs_xattr_set(const struct xattr_handler =
*handler,
>                         memcpy(pacl, value, size);
>                         if (pTcon->ses->server->ops->set_acl) {
>                                 int aclflags =3D 0;
> -                               rc =3D 0;
>
>                                 switch (handler->flags) {
>                                 case XATTR_CIFS_NTSD_FULL:
> --
> 2.51.0
>
>


--=20
Thanks,

Steve
