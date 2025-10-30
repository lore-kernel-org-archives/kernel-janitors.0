Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027431DD89
	for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761837635; cv=none; b=jzbHNCyApfQL55yZ/Lvc6O01qd7Po7WTZYlDx1CDJ8DpLj6hyicQy1cSLCuiJovdHxBUDDt5wwEDCcliNV4Lk71tvAXa64P5h63MLhHHiBiNcwTIrn3mP7hFAvi1dDD+3zN7+OwfMqnCz/P2ns/sEK6I5zl8C7rW3V6N9klV0Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761837635; c=relaxed/simple;
	bh=w4uB2bW2s6Cntxz/yJTQthIddw38Kx707i4y6i/lOSc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UN6v0atMKQ0G1dYBRo6Kqf0lt9RogrGhm24i/WJtKjaajqn4aL9/0Jw9m1kNKLB93MN0lm5VEZ2IwxsTyeewN7h2fSEbZLNs12ZANm70nfU6tKYruQC7Uk7OiMTGM0tDSVc1QvckF2c3HlujL8VHdVys7cmwvej1OqNeHyJkBMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUQRY7t1; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUQRY7t1"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-290aaff26c1so3344395ad.3
        for <kernel-janitors@vger.kernel.org>; Thu, 30 Oct 2025 08:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761837633; x=1762442433; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4n2ZAbC/7CporyooiQ9y7Oblbi4ys3ElhAZOq431qrQ=;
        b=DUQRY7t1Ca8qhDMTmy/SPTGcQC8xbX40HFyvzi71RzUr29CieLvhSLiaWZFy294bq/
         dIulEW4VAiG2Q8rEPe0n1FGKBJlPW/PqCOdhLD7ywLIlkU/PrZzx9lc5Y0UL5kZvw+WN
         AJFcS556YD7VipT/cMMn+3sfLp31osnOUTSRfn1riHs/KmP8pdsaV1VshBoqtNg7FtEz
         CnGDRKGBU/pH0ACMjgbVjz0pBEoMFPHF6LmxtNVbuB9NvLyP3lqdOxghWsrc8+dVj0jS
         WinjsaY5W2+bcsK1y4tplIOVVcvLCvDT0f6kfB53NOIdC2Fjv0WwY2kMxmQa0ZSP+rks
         AfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761837633; x=1762442433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4n2ZAbC/7CporyooiQ9y7Oblbi4ys3ElhAZOq431qrQ=;
        b=h1y8ivwB4vT6TpkQSLX0S64FBQ9iFrJ4A8OL8Q+2kjyU0bgm90IGDcyk4Fz430rEaW
         sqlqJg5/b4zqPbGFliz5UL058PWDKM1dv7slqh6ysPKTPqtxhThp3b+/6iqUsuhBMoAy
         V8pb7IP2cH7JRKpZeKBRekW/y1AnHGc0dhooAVivGsn77QW1/ia/aWbI51oGegkh1WRw
         9y5VzaRQT2JCBhA+KgC6gEUcbjD/VWFM7oHvtrBxPZsOafBDaAomtj9+MvjDpwuPUgYs
         n6Sg3hieULOL6C4Zk2bCEu+ROx58t3Io4X76IFEZrjDrxiXcdMwG5miGh8wwmdAn9hf8
         QPGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGnIla52MCsyp/vxaZyaL5LFxMGrbeYqkMgO1xJSRAOnDzkSEI+dp/M5y7YprHUC+qGkrpmUX0KlzaSbtZRYM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBHfNUlDmp6Bjgh8XlIzgOZYSU8kTiuU+I0DpM2R3tEawte9D7
	6ynRxJpD5ehEeNlSHiUIru6aZ5YMj9JUXjPP7kpUHdqjL6fJ7+CSukYXxvoIp1NzZXjiHVCgHkZ
	5XYKN9APzYOxLGsppDUnD0tS2kl2Zrw4=
X-Gm-Gg: ASbGncsPlkplwGVi45NuqgwYxRm2VkiiQuOjR0EtQwMXSYFmRjJZbF4jfp2L6UvPqbc
	7xQDVDIiZDUKNzkuLm++kwGTzsvn/lEPGQxvOlR4zcCBMsppUN56JQ3G5wbJ6EJSP35pRoIn5dT
	n19R0oTUbz7bMPyFYYvLUHKtIjY7F42bXvREH+SqgIlrMZh3WCFTP+rzJPfQz+26iKzVaGP4afH
	f2Bjr47qxTEHF/43m8F1gFLrgiDkUGMRFiM9zZZqi7h4rSIxfU/0QXjcf2U
X-Google-Smtp-Source: AGHT+IFb9s2heQmxBOs16F9sJ4fOGsoBxkOFOsxPxU7gqSkUUjW9axA4peKPZGOc6kGJhiEtISZ7fWFZ7zDcJ9fzKU8=
X-Received: by 2002:a17:902:f395:b0:26c:3c15:f780 with SMTP id
 d9443c01a7336-2951a49dd38mr397265ad.8.1761837633262; Thu, 30 Oct 2025
 08:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
In-Reply-To: <20251030143737.136120-1-lukas.bulwahn@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 30 Oct 2025 11:20:21 -0400
X-Gm-Features: AWmQ_bmVii5Alx1O5jsx56pQkAEpJlLlfevil6R4SK7ejJJXXuksGVL19-p25ec
Message-ID: <CADnq5_OR72MJvXHTGzzW-oP+z8X=7vQiCpytmuBJNsN7=Tw=pA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust file entry in AMD DISPLAY CORE - DML
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Austin Zheng <austin.zheng@amd.com>, Dillon Varone <dillon.varone@amd.com>, 
	waynelin <Wayne.Lin@amd.com>, Dan Wheeler <daniel.wheeler@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Jun Lei <jun.lei@amd.com>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, kernel-janitors@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied.  Thanks!

On Thu, Oct 30, 2025 at 10:46=E2=80=AFAM Lukas Bulwahn <lbulwahn@redhat.com=
> wrote:
>
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit e6a8a000cfe6 ("drm/amd/display: Rename dml2 to dml2_0 folder")
> renames the directory dml2 to dml2_0 in ./drivers/gpu/drm/amd/display/dc,
> but misses to adjust the file entry in AMD DISPLAY CORE - DML.
>
> Adjust the file entry after this directory renaming.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4d739e18aab6..7031ee1e7cff 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1080,7 +1080,7 @@ M:        Austin Zheng <austin.zheng@amd.com>
>  M:     Jun Lei <jun.lei@amd.com>
>  S:     Supported
>  F:     drivers/gpu/drm/amd/display/dc/dml/
> -F:     drivers/gpu/drm/amd/display/dc/dml2/
> +F:     drivers/gpu/drm/amd/display/dc/dml2_0/
>
>  AMD FAM15H PROCESSOR POWER MONITORING DRIVER
>  M:     Huang Rui <ray.huang@amd.com>
> --
> 2.51.0
>
