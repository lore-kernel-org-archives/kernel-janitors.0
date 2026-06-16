Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64E6211A14;
	Tue, 16 Jun 2026 09:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603532; cv=none; b=qGQaL39kzIgGQcxPOOWsUda1/sOmSi8r6MiOknJXu4CN4jAiDcYlW43oTfVVjNRbc8SkaQF54EvyNTjHfNh2TJGqdeamJEtVhG2dfSuMW4jAPcAnGRBnX9WpCV7f4huf0LkOnUTWdjreOzxXB4zSWv1wBy3+BoCqWaUoo/5g9qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603532; c=relaxed/simple;
	bh=cWYbZTZffLxkc7Flv/nxHqWU2DOIkofcMRN/DxYsk58=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=l8VrPUdKkrcD4rJFXh+BnSw5Ct+ntUMsa7PpFZgOnzoMTss3ypav/SNA9UGjdO3S0K1t9ZtcV2/ohDJ1VAHMcjPrlS9B5ruCppyomkI9JyJqi6KamsXi+rdPzAUiQbrHg/kL/P7vWm8b7PEgJbkv0j48IDQrELXbc5VzYyz//eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=T/o2QZVh; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="T/o2QZVh"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1FCB31A394D;
	Tue, 16 Jun 2026 09:52:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E705A601A9;
	Tue, 16 Jun 2026 09:51:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC7CE106C9C50;
	Tue, 16 Jun 2026 11:51:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781603519; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=mt0GL6MEmje9F72ypwtGT1PU+BwRpdD8k+Q4H0emcR0=;
	b=T/o2QZVhJ2rg78gzBDrqFL96SRVdHfxhZgRh43/6KOhI0m2P/jfThebQx6CVADpyWgctLa
	EXIdYEO1gB3dxOdzt+sVVtb8FCKimZVdBQWoABIwNfU3Un5TQYq/BbgXPky3JrfG1U6HcL
	gxk3qbSwPaBKAVwUbTIBlOElqav5nkM8VHPxa6XD/ZIUg4C1SczvCpLNfvGDOvm15sTHLs
	2kpN4iPYMn1aTRq5ARp1h82JL71dggnJT2+HDBX4JorHF5yFavC63KxjddfS7RFCMGYVRn
	14HXFtmP1RkNjJ+2KsUtN9iHi3uzeahI24nZhzPwEi4mc6dyL10IkvHuQ5u9AQ==
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 11:51:53 +0200
Message-Id: <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
Cc: <kernel-janitors@vger.kernel.org>, <error27@gmail.com>
To: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
X-Mailer: aerc 0.21.0
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
X-Last-TLS-Session-Version: TLSv1.3

Hello Harshit, Miquel/Richard/Vignesh,

On Sun Jun 14, 2026 at 10:10 AM CEST, Harshit Mogalapalli wrote:
> mtd_concat_destroy() frees item->concat so calling
> mtd_virt_concat_put_mtd_devices(item->concat) leads to a use after free.
>
> Fix this by moving mtd_virt_concat_put_mtd_devices() before
> mtd_concat_destroy()
>
> Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is static analysis finding by Smatch, only compile tested.
> ---
>  drivers/mtd/mtd_virt_concat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.=
c
> index 37075ead0f33..a3fb96788e9d 100644
> --- a/drivers/mtd/mtd_virt_concat.c
> +++ b/drivers/mtd/mtd_virt_concat.c
> @@ -75,8 +75,8 @@ void mtd_virt_concat_destroy_joins(void)
>  		if (item->concat) {
>  			mtd_device_unregister(mtd);
>  			kfree(mtd->name);
> -			mtd_concat_destroy(mtd);
>  			mtd_virt_concat_put_mtd_devices(item->concat);
> +			mtd_concat_destroy(mtd);
>  		}
>  	}
>  }

This patch looks OK:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

@Miquel/Richard/Vignesh:
However while looking at the code to understand it I noticed two possible
issues in the existing code.


Issue 1: the CONCAT() macro implementation looks hacky:

  /*
   * Given a pointer to the MTD object in the mtd_concat structure,
   * we can retrieve the pointer to that structure with this macro.
   */
  #define CONCAT(x)  ((struct mtd_concat *)(x))

Shouldn't it be implemented as a container_of() instead? The current
implementation works just "by chance", i.e. because the struct mtd_info is
the first field in struct mtd_concat.


Issue 2: in mtd_virt_concat_destroy_joins():

	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
		mtd =3D &item->concat->mtd; [0]
		if (item->concat) { [1]

At line [0] we dereference item->concat, but at line [1] we apparently
handle the case where item->concat can be NULL. Either [1] is always true
and we can remove the if(), or [1] can be false, so [0] is a bug and should
probably be moved to inside the if().


Do these look like correct findings?


Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
