Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F0B27BF79
	for <kernel-janitors@vger.kernel.org>; Mon,  1 Jun 2026 04:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780289972; cv=pass; b=tGL7gq9hwMhDqSEm1+6NVdzCShXCE9yTd+UdkwZk0tce6neNffW4aDSBVCt3JRi7lSeZQhj0OHgR7dsB7p54YmW+sCzCatRRb9hAFSYY+L65oSeZLLzDtXZBNIlnWz3csGQSFzlKBrr36JAk9RxFD4em5vk6eLKzNwOfqRm3t0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780289972; c=relaxed/simple;
	bh=wBFVGCqCyESGZeWw0kFKKPpCRpxPQf8+k2stU6NaYlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaow2yc+TA2E8iPQmvOfYCWZx42j/SXvPOcbq6+k3rSIlMFqSAudp6GCr5DDm1Xt2T8m7WKmGHNGck12FWBQpLg1Fm9sp14HVKm6GXk5oy3caLe3Iyfj4YwY4H8uSirlvA68vnqQE1zuIiHjyu1ErX6/4GdYv8gacRhEddG2lzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=Xsn3tx9f; arc=pass smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="Xsn3tx9f"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bec449d57bfso21368966b.3
        for <kernel-janitors@vger.kernel.org>; Sun, 31 May 2026 21:59:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780289968; cv=none;
        d=google.com; s=arc-20240605;
        b=imHdJs7RV0a4Nzx8MmC0ZVV7ljC1meHsFV2e/Ac/y1FilXlHcmBLZf0OXxKEbWsdgS
         6O1QrxaNMhULSF9A4b/bxW3EMlwEl2uzPgc5aaXOHwrY08Sd88AVyiPagNBNip98v+as
         SD5OmUP0g8S0NwCA492/1O3IqHHLYHzE9ajsCYiacuHSH68bpqnER5vWahl85rHUo9+I
         +ZNmDuVNDYYife9UGb220FVgTl9YnSsLkMemVegBUJODKp6DA517lPeEOwc/6Ai3K4bF
         78RupwHrHIvsvAjntCa0uhf8uDv6ByVNiLPgDMXmKDJF/SumMNDw9g8WgfHnIyluShq7
         5XTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L+TBTZFxxv1JuC2qd1ez82wqnLD2VWaPg7OYnlws9+E=;
        fh=M27lQy+nFy0tiBp9ZTnhWWkjVBl/qlKuToI1DApFO2Q=;
        b=M7HPKn/dzO2Fn0gpeFJ1kWTT+tpc0chQESdlb/3VJX2b04fqmZJ10KV66s56KJaTnj
         ZTcNynAqYFB3j6s/YBij8z3X6dTFAZDiZsjBjkCw1IiIbaULeQymRwGckJlwtYdHn+ee
         ufs2JD1IJbRueeiVIrckxW4QfcULnyvpEy/OA4CfNpuv8GucPc3aOoJZ0CrLHq4hwA+J
         wyItJpGDUuT8Id3hFFSn+rkbvLbaAO5xltLnW36OHaqZHU2Sc4BkKCRMo5hWTIspPFVh
         vazlsQm8r+RnCcC+dVUh8tJ9vgBFhCJ3p7yWq3eKlzT2R2Z4dJDP6weAAVzSRzHgEdGv
         LrYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1780289968; x=1780894768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L+TBTZFxxv1JuC2qd1ez82wqnLD2VWaPg7OYnlws9+E=;
        b=Xsn3tx9folCbb8zOE21GmsIkxXBXnMrsIEHyMeIpIM3KRgZLKvxuMECHiVEeSmRFHc
         gCGVeWQcZsRNTxDmKNFvY3qlrkAXMpV6ez67rLTX7J4oOoHdvW282LVVMxF8ZNTL1IW0
         R/9BS3GCS5ExkRvJZjDW5+YIxD6Z7J4D1ojrWadH1kgvvKCNYJXh24L1VtyudRlC2p/w
         v0KWKRrkf6mOZTN1Qfa11RmbNJbCxQKEI/9RV0zOUhw0XwP+/DXlEMFVy+Zpu4XOaiAx
         vtuu6N5vUSSJ6iB0IaJRkwQouXrbnQgcKuRsCZ/J4ToMzl0ArieSzHjuAChU2ZLp310s
         P+uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780289968; x=1780894768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=L+TBTZFxxv1JuC2qd1ez82wqnLD2VWaPg7OYnlws9+E=;
        b=Tpda4TJPLJ/2DRRIuKgVg2ewcFBzjjR9AjeNwvTdY/MXPOBs8IlYP7wQ3xTxchwOlA
         nCWrppftzC/J6S9rQatm3dI+4d6GzjB6I5AMNJpmNboB+U796jo/hWPhuZNrRPfP/nic
         /Gn6YCHq/G7Rm/e8sz3aQ0gVHIEVjSRvoVlXTmlSemKiK45EVhLK2Im/js06u13ca2p3
         ujHScvxfuXXwDaSSciwHKk5hkfVaw56vvRGodlO7Rsb9dV1of8KC4RCStzXf/Y/mhnYB
         e/gRNOjPeweGkWBRvlJOlE/tuxMPse7/fKNB9uH9EzL4fHmyYzgTGk4RijhJj6QIDdIw
         lQNw==
X-Forwarded-Encrypted: i=1; AFNElJ8MxmFIbmxNTB5D/8vSNI9cAjRCb4njeJz8hCLzbrotAk+FZ3rpQwi9me1ItYCx63Z847apjyb7uzR6i4ur24I=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoNNIK1/BfJLD2mceKvdDv05x+WB6bCHNJ9Lq+KRmbKm2jvviO
	XxmknxECZNbJcN0bUWuHGIVElLRqw/NpdhrcvJ6Buu0Pfsu5PsSJR+/c8RZU5at0ZYbktk88D1n
	E7M2bHLuT1KAGrA2lBDiiUZUNHhfWEgHnrKDYa+IltQ==
X-Gm-Gg: Acq92OGrjM05cym1mUzsMyPZRGsxU91BqOCvTrfUGhjqonshQiOuzsQJsRcCocO4coK
	FeK8ryJtSqZXj+lVuSjRivaPXoYTNCyv8zCDVCJS6ERXlUGE21dNWZAYwhrFSWPlzbPT28utU1+
	j6aV2SeuoFyigV4uRnKVVoTChFTZ7+Bv/U7LZ/hFoJKviaYbpkkwdciaCQ9LDLujC3NxaClfAF2
	7yf4dSCy2wZ8TuCGYxe8K6zusejO6HTk06m0dRuwwxE5Wp76M0BfAnNeJXqUYxaKlXbrGK4VYsj
	iZ+thlJPySHmLBcw6HgZSxYzr86TvVP8soo+H0uZwW5GNlPFAbQ=
X-Received: by 2002:a17:907:1dd0:b0:beb:7979:47d5 with SMTP id
 a640c23a62f3a-beb7979599emr92349166b.6.1780289967892; Sun, 31 May 2026
 21:59:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ahs-bEsBJH0KhnsX@stanley.mountain>
In-Reply-To: <ahs-bEsBJH0KhnsX@stanley.mountain>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Mon, 1 Jun 2026 06:59:16 +0200
X-Gm-Features: AVHnY4LAehZcnZHdh13j_GDDl34f5hNMroM6OlI6VVhmBxdbnfHfcsO2NPSUDWE
Message-ID: <CAMGffEkmt_aXWrJq0Oj8kkEbQvsi7r9zrdOxV7KvcB2aOjVXPA@mail.gmail.com>
Subject: Re: [PATCH] scsi: pm8001: Fix error code in non_fatal_log_show()
To: Dan Carpenter <error27@gmail.com>
Cc: Deepak Ukey <deepak.ukey@microchip.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Radha Ramachandran <radha@google.com>, 
	Viswas G <Viswas.G@microchip.com>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 9:45=E2=80=AFPM Dan Carpenter <error27@gmail.com> w=
rote:
>
> The non_fatal_log_show() function is supposed to return negative
> error codes on failure.  But because the error codes are saved in
> a u32 and then cast to signed long, they end up being high positive
> values instead of negative.  Remove the intermediary u32 variable
> to fix this bug.
>
> Fixes: dba2cc03b9db ("scsi: pm80xx: sysfs attribute for non fatal dump")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
Acked-by: Jack Wang <jinpu.wang@ionos.com>
> ---
>  drivers/scsi/pm8001/pm8001_ctl.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/scsi/pm8001/pm8001_ctl.c b/drivers/scsi/pm8001/pm800=
1_ctl.c
> index bb38b2d63acb..a27f3287748e 100644
> --- a/drivers/scsi/pm8001/pm8001_ctl.c
> +++ b/drivers/scsi/pm8001/pm8001_ctl.c
> @@ -588,10 +588,7 @@ static DEVICE_ATTR(fatal_log, S_IRUGO, pm8001_ctl_fa=
tal_log_show, NULL);
>  static ssize_t non_fatal_log_show(struct device *cdev,
>         struct device_attribute *attr, char *buf)
>  {
> -       u32 count;
> -
> -       count =3D pm80xx_get_non_fatal_dump(cdev, attr, buf);
> -       return count;
> +       return pm80xx_get_non_fatal_dump(cdev, attr, buf);
>  }
>  static DEVICE_ATTR_RO(non_fatal_log);
>
> --
> 2.53.0
>
