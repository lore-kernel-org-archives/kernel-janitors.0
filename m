Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4852839ADD
	for <kernel-janitors@vger.kernel.org>; Sat, 29 Jun 2024 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719671445; cv=none; b=drKEevVwO7WT97HmPPPpbbnsPSqSTx+UA/wMfyjfrhyOWCmESa/gcTYpVTDbGL7hkk2iF7YHVlmvPgoCgv44cID1/PwDnsPwYjEX5Efvx8uLDjymL9ntblTGmDeMsUMsk5ttMXdfwpzKTynfzm8K5uPPAUuGPWKJuxfpQxh/gTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719671445; c=relaxed/simple;
	bh=6GbLi1JD0DeqwbARIUWnsx6f1P44NPHpbsq6lRJDRm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=up8ZIN0nt1QYRVI4ThhrsgPeNI6au+ynW/qbE0LP2WJD8UcFC91E19FGWY6G6WVW6xxP5784lCZ9vbcCnEz0KgJHGJeVOVuBkaP2E9/gpJwDA8jiBa4RfYpRhaKuVmncYe39P6dFcy3UVElIGJasdE81Sv3XDEIKG19Que7tWXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uhMMqDAc; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uhMMqDAc"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-57d119fddd9so4842a12.1
        for <kernel-janitors@vger.kernel.org>; Sat, 29 Jun 2024 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719671443; x=1720276243; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zrud1JhfOlUfYB81S7Syr/8uTZeCdrf+FlsoxmK/I4o=;
        b=uhMMqDAcFyJ8riw892JZyCOfM+uvTFsVHdWfkXkUnmsbwU2nBP3HkUETwEmiR1JGYR
         Tql2vR59f29RiaynZeU7I3GtqDjhbDvuVpdMX4mT5t5aTLS/BpodWzaJB2VMVHItUpAu
         nVN/WRVqiDRk6DbS0tLQqh9IbhdM7T6pn5ItTUkfEvzzVtYiibkFhKdgUegI4x65yVuF
         DsNYMTCSTa1taqTjcA1DAg4taaPbJ8lyZm+17mMa1M2f0lAh3KnEPR0DZFSOlpPI4Gqq
         jsJ1dvdiz8d+p79tsSiQI4qtiy1gIFEHaSL32cXcZeOkFnz2vVE31hSo9yYwkKU2GVoT
         iULg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719671443; x=1720276243;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zrud1JhfOlUfYB81S7Syr/8uTZeCdrf+FlsoxmK/I4o=;
        b=BtcIQJnlf14+KaUobV6BGqSelS8iWsQydeoGSS3YaQyZE8JX/bUWOgkNRlBO1//Bwd
         RaRU5Xb8dYGGEdNCGxPkr4QYIw+zg+dsTLNYmzjbb+FLLdSpI8SHYrk1162VZczF9+z9
         3x+GIy/grxeqmpVtsd3EjS8DhDwD4FMnA2AzfLJxE3/1c7l3T2LJpJPRM28K++4Qq1F9
         JrWO51Csx6OlafECwDQINb4vl/BFYrYYebYuE5hZy/p9m/Sb/yyhMhLdL+jzK7aHrYcZ
         /GEfQ+1ZHCwA4PSE0Jdj4ybOZaTFWw1j5v58a5QszlQurSHgA/Xgh5VpbqwtjAZqp3Pr
         7R7A==
X-Forwarded-Encrypted: i=1; AJvYcCU5HNUkbsgFWCpzkd0+1SmJ9e6kbloP4yl+m84hh0XN3RKMK4CrRPJZS9ctvtKo1VFMtMBF4G2aIxRqyHXPjQWxOVhPs89wN8yEsa4HCNpL
X-Gm-Message-State: AOJu0YxZK8j7+YCNkURSbd41SFZThWn82B9X+NBL0SLzvJ1/JNcY1vBL
	IZ/AtgNrMjgKvLaGlcMsSHItqD7rhz8COjfYKghCfVNYczZcLcCzqPk/4jXaamvrDpoBJ2w3Wy1
	NW7KOGgdXDmeKxroyT/ib6QAe7sjPbjRUBETa
X-Google-Smtp-Source: AGHT+IF6Ig144tkRe+lYrfurwiAb/HGvUlbkbhXr2qYEad3JtuJTL7bhoRuypkZ9VxzjKILvi3jchWLefZw/5jHXLgc=
X-Received: by 2002:a50:8ad0:0:b0:57d:44ab:ecff with SMTP id
 4fb4d7f45d1cf-5872f6702a3mr120663a12.2.1719671442396; Sat, 29 Jun 2024
 07:30:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a9623e7e-ce3a-434c-a904-39c6934c2ff5@web.de>
In-Reply-To: <a9623e7e-ce3a-434c-a904-39c6934c2ff5@web.de>
From: Guenter Roeck <groeck@google.com>
Date: Sat, 29 Jun 2024 07:30:28 -0700
Message-ID: <CABXOdTc6G9E2SdyP+27Gp3HsxfKqKOPmqkYG2x6Avg5bzCNNdA@mail.gmail.com>
Subject: Re: [PATCH] platform/chrome: cros_ec_typec: Use common error handling
 code in cros_typec_init_ports()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: chrome-platform@lists.linux.dev, kernel-janitors@vger.kernel.org, 
	Benson Leung <bleung@chromium.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <groeck@chromium.org>, 
	Prashant Malani <pmalani@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 29, 2024 at 6:33=E2=80=AFAM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 29 Jun 2024 15:17:44 +0200
>
> Add a jump target so that a bit of exception handling can be better reuse=
d
> at the end of this function implementation.
>

I see no value in this patch.

Guenter

> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/platform/chrome/cros_ec_typec.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/c=
hrome/cros_ec_typec.c
> index 4d305876ec08..aff744a0b38f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -348,15 +348,13 @@ static int cros_typec_init_ports(struct cros_typec_=
data *typec)
>         port_prop =3D dev->of_node ? "reg" : "port-number";
>         device_for_each_child_node(dev, fwnode) {
>                 if (fwnode_property_read_u32(fwnode, port_prop, &port_num=
)) {
> -                       ret =3D -EINVAL;
>                         dev_err(dev, "No port-number for port, aborting.\=
n");
> -                       goto unregister_ports;
> +                       goto e_inval;
>                 }
>
>                 if (port_num >=3D typec->num_ports) {
>                         dev_err(dev, "Invalid port number.\n");
> -                       ret =3D -EINVAL;
> -                       goto unregister_ports;
> +                       goto e_inval;
>                 }
>
>                 dev_dbg(dev, "Registering port %d\n", port_num);
> @@ -408,6 +406,8 @@ static int cros_typec_init_ports(struct cros_typec_da=
ta *typec)
>
>         return 0;
>
> +e_inval:
> +       ret =3D -EINVAL;
>  unregister_ports:
>         cros_unregister_ports(typec);
>         return ret;
> --
> 2.45.2
>
