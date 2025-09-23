Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6648530DEAC
	for <kernel-janitors@vger.kernel.org>; Tue, 23 Sep 2025 12:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758632226; cv=none; b=W8PZXeGO3f7Qng4Baw2rqyBstr+Ymt/q+DRHjt8jqNcwm4kxEauy8SEwJ1qH/grNizk5hbVR6hkbm9CZskFnhb1SHLXxPplAt+Y6c2yYn9KuQbVXm+VsodzcL/x8WAee1KWwGlmcIZ9aeLKlqIw+OVn0c0+OYab3AmZkJv9kjxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758632226; c=relaxed/simple;
	bh=8hXvBACNKMC6Vka232dL2J2GqL6YlVwCBPS/uafQIRI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iE571Cn5RPMGXjzBGYJ4MkBJAS1EC7TnXT6DNYZyAs/pGh6rnAjzLqar0Mve/yUJKMqauz8Ticl8I2lJ7/5XT64PtwyEVxXPcBLyfuKC+TAPYWz2biLz+ggHC0P4/tfVSxS0sthfHYAN4wmm/uDMwtQ5WtcqcXlEbxKV2qPOJbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=AEQXYDzq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="AEQXYDzq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 60BDDC01FB4;
	Tue, 23 Sep 2025 12:56:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7751A60690;
	Tue, 23 Sep 2025 12:57:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A36E1102F17F8;
	Tue, 23 Sep 2025 14:56:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758632220; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=997DuB0/qTBFekbRo7Y7ij+xLdO1BjvKAhULVSaVRrg=;
	b=AEQXYDzqrD+7tFfWgFqzTx4qHfizk6cXjKyd0QYnrvqUx3Lb6X9kNeWow/9TEHoIQJxY+w
	Fi4/xCEKIf9R8hMcv2HHNA+hYlU4FMWpL658CZJZElNcO8Ril7VcMdEh9u3KgqirrWJfmJ
	P+fXBRWpoovqfM4pBpCnvxAFe3QOsy9ACV+35l0T1MdOJWVxhj0FdezSoKeKEbx5Xk8efy
	84CdxbAQKVsYwEqdx4Zsbtk2dHQYz/JYsFouaH/05Sz4u78lVjZCaPVvABjbmGBuPsjow/
	r/JUXi6hroA9uN4zmwC5NyQMGdbSc4GAtv2kXGq91YIZgdxNZkqqBVexTy7Mgw==
Date: Tue, 23 Sep 2025 14:56:55 +0200
From: Kory Maincent <kory.maincent@bootlin.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: kernel-janitors@vger.kernel.org
Subject: Re: [bug report] net: pse-pd: Avoid setting max_uA in regulator
 constraints
Message-ID: <20250923145655.7ab4ea73@kmaincent-XPS-13-7390>
In-Reply-To: <aNKCn90htSbZHVsn@stanley.mountain>
References: <aNKCn90htSbZHVsn@stanley.mountain>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 23 Sep 2025 14:21:03 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> Hello Kory Maincent,
>=20
> Commit 675d0e3cacc3 ("net: pse-pd: Avoid setting max_uA in regulator
> constraints") from Jan 10, 2025 (linux-next), leads to the following
> Smatch static checker warning:
>=20
> 	drivers/net/pse-pd/pse_core.c:810 pse_pi_set_current_limit()
> 	warn: AAA no lower bound on 'max_uA' rl=3D's32min-(-1),1-1920000'
>
> drivers/net/pse-pd/pse_core.c
>     783 static int pse_pi_set_current_limit(struct regulator_dev *rdev, i=
nt
> min_uA, 784                                     int max_uA)
>     785 {
>     786         struct pse_controller_dev *pcdev =3D rdev_get_drvdata(rde=
v);
>     787         const struct pse_controller_ops *ops;
>     788         int id, mW, ret;
>     789         s64 tmp_64;
>     790=20
>     791         ops =3D pcdev->ops;
>     792         if (!ops->pi_set_pw_limit || !ops->pi_get_voltage)
>     793                 return -EOPNOTSUPP;
>     794=20
>     795         if (max_uA > MAX_PI_CURRENT)
>=20
> Do we need this?  Shouldn't it be checked in regulator_check_current_limi=
t()
> instead?  max_uA is an int.  Do we need to check for negatives?

No we can't use max_uA in the regulator constraints as I wrote it in the co=
mmit
message:
"Setting the max_uA constraint in the regulator API imposes a current
limit during the regulator registration process. This behavior conflicts
with preserving the maximum PI power budget configuration across reboots."

Maybe we need to add a negative check to remove this smatch warning.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com
