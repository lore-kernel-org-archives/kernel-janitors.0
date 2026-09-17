Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39C4EF15C
	for <kernel-janitors@vger.kernel.org>; Thu, 17 Sep 2026 20:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789677294; cv=none; b=MIrrGtfCms1q6XfgtUnPVGTZMfUqPIJYDvZ/mAyTYa0MpCUnlovW1Cpe+Gp5HQbx3JKDeR2K3d2+HQjsaZU6kqIrJuQSYsWGa0XQMenWlzTB34/QeEvGiEvGnqUVqbILCsw89ctC1eRpXF425ZLQQ8uYuTo/CfkFsajmbdFNyK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789677294; c=relaxed/simple;
	bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PhfJloz2g+n4ycq4LBl12zEpTuJOuch8hHT7KxXP+TJJiow2F0NOXcYs/BuZuzpobbatvbgzOGCdE0g9Dn9coofWO8cVq3xN/WbqUaSeQ7r3ONsb6acdq1vt5FItwWBbI8DBAEXPYQH2Cd3Kyc0h3A2bITq5ruyjFFDG9hGFURU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AY2IovFX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=mlY/EhQV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AY2IovFX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="mlY/EhQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789677291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
	b=AY2IovFXwAFV0Ri7RDmaYDUL5c++Q92oKKr/Kt2i4GETwYaL0C6przEb0iFTvyNRX+RFkk
	qSLQqbZkY3VS3jcRNEkdp8cLgpWS1BQsKq3C9+ZYzEROcWzhaZzZ/V5T6b7ybWmtTbcjBO
	NztS0fIQkQiVyl86SyH0itbhn+uORSY=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-pddlRIoKMBe_WNGJzjmDpQ-1; Thu, 17 Sep 2026 16:34:46 -0400
X-MC-Unique: pddlRIoKMBe_WNGJzjmDpQ-1
X-Mimecast-MFC-AGG-ID: pddlRIoKMBe_WNGJzjmDpQ_1789677286
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1bffc2eeso7214185a.2
        for <kernel-janitors@vger.kernel.org>; Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789677286; x=1790282086; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
        b=mlY/EhQVEuliHlsFMCsYwGJ1EaRZGUFzfXYXGSEd7pTyjyrZwaV/JBOeJRilPeLh1x
         TzB1KlNgcCi1jHrbKGaugKrglp6XfFyqqDF5Rznlp5JSj3U3AR78YxIMt1tlFuj+xR4M
         CQd6dC4g0D2NiOQ0AY4iq+919hFYX6HOMjFk/Yuq6fibKQP1n9MTuYGw/eky9AWB8z1v
         cceOgJNDF8kuiGyuGQp9OPkCRgWKchE7ifQ1SvQMkopDffnPmk40Y81jt2lpNB71UtPS
         btUXtlxNeslVKVCXopg8OZwNYEm+abXGMNUocqIuiFFCcfXXPh44UJzEDtoMCxN0uqBq
         VJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677286; x=1790282086;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
        b=HIe890j/UpdJcUwg4d0AnWKW8nCjJ8VViQ/6D0laI+ITYeH/uHimSW3VvgQjLYr+uM
         2s5FnVpKWPAls3XyfYF6TRw9WKgVQk8CrwqMxss5x2gz63Moc6NQVHqOek+O87B0fWES
         gZIWm33x9uTPpNIhr3EtyAMjbOC1aUdGOzJuJ9qZJdWWC6YRYxGZ8ShM+whe4r+WJKcM
         yIMjnPEDYXvjc5ZeoxxCeO71tYzAn2kY+ViisF8ba49Q0OXuUaQSHqdAlFuERIAQwG5Z
         wzNLCu26Eha/6KugdhvwJp5qrHGP6DMNgNEMHFRfnRyk/aOtUSnYsWo3xWap4D0TI8Kl
         v1tg==
X-Gm-Message-State: AFuF++ksXQQTEF2FyGimEvyu8lNbwFLGRTj3ZfZZY9BjekZqCr6TR3Qd
	nz+4oRH4xfDgjiYe1Snqfma8m4wznIDQT0WrnppiINNIuEJcs/AY6KzwVVCzRBucjsmZMP6iBj2
	mbaH6edb1Uhmif/KcEMaMt+bLK4G0ujvM1ObGoy7J9fuA+tdIiRe+KeMZW8B/z5ytiDxQYw==
X-Gm-Gg: AYBFou0Os6EOsrE3xXwXLwAt0u18+n5CivBHELeQ5lom/mNqUGUE+aw+8gZdcqX8kPn
	N7XreK4egagEVHqdv/k0UjXKH4Ji9GkwP5xfS8qRl5YpqMr6CkM2/7obJjO/THhtQyCcsV9qfD5
	Y2NgH/NrzzmQZPRYShaTcke6WnZ/htg13qOLi+3tYoMPXs74vtFVkvOPoToYlFw2SyPyC6i4AwO
	9TYvvfsisnt0vL2GTRUrPROGnYJRQIOWvi6MpusA0N00+kcyx3ZZ3U0jInPAxzZrO0jl3X4e6Er
	YUxwPQAXBYZuhERB4+oPuR9Mi9slx2Vbk//q+m8LOUdnkFKZ+WxbWNxXkJz5mr3m00E41y3x
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id af79cd13be357-93bdca433b5mr16959785a.70.1789677286172;
        Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id af79cd13be357-93bdca433b5mr16957185a.70.1789677285807;
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93b781deec2sm559137785a.7.2026.09.17.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Message-ID: <fcd366286750d61f0d4e2b99ddef2a9d36e72b0f.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios/init: drop unneeded semicolon
From: lyude@redhat.com
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 	nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 17 Sep 2026 16:34:44 -0400
In-Reply-To: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
References: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Sat, 2026-08-01 at 21:09 +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.=C2=A0 All uses have been verified to
> have their own semicolons.
>=20
> This was found using the following Coccinelle semantic patch:
>=20
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i =3D i };
> expression e;
> @@
>=20
> *#define i(...) e;
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |=C2=A0=C2=A0=C2=A0=
 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index b54f044c4..3f888fb97 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -403,7 +403,7 @@ init_table_(struct nvbios_init *init, u16 offset,
> const char *name)
> =C2=A0#define init_io_condition_table(b) init_table_((b), 0x08, "io
> condition table")
> =C2=A0#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io
> flag condition table")
> =C2=A0#define init_function_table(b) init_table_((b), 0x0c, "function
> table")
> -#define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
> +#define init_xlat_table(b) init_table_((b), 0x10, "xlat table")
> =C2=A0
> =C2=A0static u16
> =C2=A0init_script(struct nvkm_bios *bios, int index)

