Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BB4E1BE
	for <kernel-janitors@vger.kernel.org>; Mon,  5 Feb 2024 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707155771; cv=none; b=DH48gYj6bfAKyjmyX6M9pvw29zv4qVtVxVraAwG3AohdafcTTPXOxCtn1LaAwzvcLF22emaVV4EEeG4saGa1qnRjmPAK35mOaMFSOfnorJo00lLQUL2XhmQNkVt3FvnmOi/J0Ty3uteLG+z/9DC02URKNs+MgayoEzs0Z5mwKDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707155771; c=relaxed/simple;
	bh=Y1+OGpgO63h+CoyrYHJeBkVHIfjV8yHeOKcX7588wxQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZFMXaHbenYaFB8vEkoEx1x2VyN1QsUbSv0gHay2ZtHVuQfSJownGjgGT5AJYWP4QKzT8IeFLb5xWUx5AteFgnPvfoqbPL3TIYXB6m774kKjAm3n4wy00/QVU+oVCIEgvpIP0FUrK5GAIE+jqHJ4dvS5w93E9kceNkzYAb9tCn+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/kKlqU6; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/kKlqU6"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40f0218476aso6885e9.1
        for <kernel-janitors@vger.kernel.org>; Mon, 05 Feb 2024 09:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1707155767; x=1707760567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y1+OGpgO63h+CoyrYHJeBkVHIfjV8yHeOKcX7588wxQ=;
        b=j/kKlqU6T0qIJhCMy9EQ6i/Q6rVT7CdP2dbM1BlcQ8UrvDwthHQo4m6xsIJVw6i+fy
         ulBleSkxPDLG3JRTwuH28kV+Xd+lmrdbpFMXMHnvPKgo1Urf/zvcDBjNuOwiU/eRGyyw
         WM9xYPRlIDhnXuxkH/KFH7Ce5NHpF7GfXVVTXLi5Zt0EnQ6uGFaxb7AKUqSqtsDQcil0
         M6R9DDgP4e8yB5tdSrfsrQM1wuA6cSB+EEMDVCiUrvEDCUSNYSvnYYski9LFv4NN9sYE
         oTanzUAfMa1fk/naCr9BvAdXL4suah7SV0ovpjPlv2oT8kvMXenolFAydHAb8CloJ1be
         JDNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155767; x=1707760567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y1+OGpgO63h+CoyrYHJeBkVHIfjV8yHeOKcX7588wxQ=;
        b=XR4kgdqlXyvw6Lpj/ccTxRVL8jb6L915JNAlE4imlhaZHtUZT2ceS1W+TF1/bQsU1x
         8IP3/p7SNhneef52T9ctpgDIe65clTD+yQ4neYDoc895/qKXC8F11kQdI04w7uixF1TR
         CFTBmJAHD0YGyFdD5peTsWwxUq/3vUuUqrL/4H+DALpVG3CnOhOi6CM2pE05zFBEfsp5
         jrJZRPGW0w6jNe6l7l9vpzAz8mNd1gQKqoGGn2CrYLlY/t3pbU/DFAv/+W6qoPZMymli
         qGBPRIbdrgUP9E1Y4pwW9z9ZDQ8vSvpFYi2Oa9xfXqnZK5mme3A2Gqk6FsuZTAPbaicx
         gJaw==
X-Gm-Message-State: AOJu0YyuE3Qk2KbFJITVtM4OUpKb0/7Csk2UTg+JYjs6q++jZHdgGwB8
	gu3dOVrS1cBRTGUh8nAXJp2aUuSXuWDWT0scHliK7Gv06rChC7ma4Rt3d/oGtNGHEoYIiU5FBVt
	N4M3S7AwV/8QTfx59blsSpovjPTzzJOmS5Lo=
X-Google-Smtp-Source: AGHT+IEnaDiX/OcCRASvTFKqqbb/i//uiR4yKUJvHKwFX4zPwyfbM9Aww/8xHpm2xtrafzPUXoU0/HaRQHki1N+jtes=
X-Received: by 2002:a05:600c:1e07:b0:40f:df29:9abf with SMTP id
 ay7-20020a05600c1e0700b0040fdf299abfmr18729wmb.2.1707155767456; Mon, 05 Feb
 2024 09:56:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
In-Reply-To: <b236236a-9953-4246-a697-19ed1b22d86a@web.de>
From: John Stultz <jstultz@google.com>
Date: Mon, 5 Feb 2024 09:55:53 -0800
Message-ID: <CANDhNCpZZ9k-7h4VWNq_=56v1fRehKJcHobZ=mfu3MP9Rzno+w@mail.gmail.com>
Subject: Re: [PATCH] drm/hisilicon: Use devm_platform_get_and_ioremap_resource()
 in dsi_parse_dt()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, 
	Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
	Douglas Anderson <dianders@chromium.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tian Tao <tiantao6@hisilicon.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Xinliang Liu <xinliang.liu@linaro.org>, Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
	Yongqin Liu <yongqin.liu@linaro.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 12:13=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 5 Feb 2024 08:58:21 +0100
>
> A wrapper function is available since the commit 890cc39a879906b63912482d=
fc41944579df2dc6
> ("drivers: provide devm_platform_get_and_ioremap_resource()").
> Thus reuse existing functionality instead of keeping duplicate source cod=
e.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

I no longer have hardware to test with this, but this looks reasonable to m=
e.

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
