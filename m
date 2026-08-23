Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FCE259498;
	Sun, 23 Aug 2026 08:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787474964; cv=none; b=B3wndHFJPjrEZgW2siNH3lHH88PPdNiynHzF55XXgJ6klQLv79IkvlB2Qm6CQzoQd2kjdihqkUcCseqUqnMF4WJmZH9ddJ4Il1FVjzOvA5J58Rk/7GbcnEtsTmxtJrVgRKmm1vimWKa6cZvQVXh7va+GmBIiCE35je1wniRA654=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787474964; c=relaxed/simple;
	bh=6An2NS7cFMX6d10c4wkHYDQyTJsYmnjLY9sxEeFYQk4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=d/HHtrAQ5t/jUCbx3M2Ksl+zMIuYoGsMuVBU62QiHFiICOEKC6qlERbovneqGTJaOdDf+4L9bZTcYYcHRfON4irrn3NbJnJIaG78uFFpFr0WB8fPHCOHuK2pbwL5hWTyqRbZEOOl1gJzPoqY9G/Vd6CPYFDZ6UAfJoVHaT0WH3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mCTwrW0/; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mCTwrW0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787474941; x=1788079741; i=markus.elfring@web.de;
	bh=VtFax+tEw/Hm2GSWhB5n+Z0Du1G6jVjSxBsXqKF9z5E=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mCTwrW0/fcRCPUKv7KYog/Nrz8qJMWt39dRBcEtnCBp/PupDv9t6+N6adXRAlTb7
	 +iHoC6j2e06EBNKzck8V9d21l9Ke1qACbFjTj47uvnwD4R8vf0wFN4xLA+TesZn8c
	 mmhW6sUPQmUsmVoyUus+/7AKVAazskmzRX9TeLpvlJlUcfog9g5CAZRA6ynB06PAp
	 I52iN8na4ls5e+Qqt16/inKUsI/TiHrgHa9RCUmiDyki9mJ6YqmG4nleW1TnYzcqz
	 oZAM7lv70dzRZ3Q87/6AJ99AvejwNm3NslZS2KVmnWcvDBz9DB8xVnuT6G6BXV4t6
	 cuyjYl8rWNitMpQC0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MJWoe-1xDXOv26cC-00Yc9U; Sun, 23
 Aug 2026 10:49:01 +0200
Message-ID: <e804d27c-5b0d-44a0-a6d8-8b10238f49d4@web.de>
Date: Sun, 23 Aug 2026 10:48:58 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Rosen Penev <rosenp@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260822224150.198749-1-rosenp@gmail.com>
Subject: Re: [PATCH] mtd: rawnand: ndfc: use devm_platform_ioremap_resource
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260822224150.198749-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:PSXzZfB2IDm2ZJThij8/vJIulGqa8kQ4WgKvJneWJ61WAXeMKDH
 6YJdjIbVhkmRUXqZD9ctz5mlmh6+sejbPjV13/iA6/58wMdKhtl5KS4fFWongkv7kb3Lemy
 8ha+/0s3m87HxPVfbwoBfuU5jJ/1m14QawU3aNVTH5sfZP+k3cU6ySipFg4o1DAfus63lrx
 SpmCq22c3dXr/B37eUBQw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:a9BsRzNVNBA=;sc60CuZmHR4ye2gWtyp9dYIcKbR
 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

> Replace the open-coded of_iomap()/iounmap() with the managed
> devm_platform_ioremap_resource() helper. This fixes a mapping leak on
> probe failure and on driver remove (the old code never called
> iounmap()) and simplifies the error path by dropping the manual
> cleanup in ndfc_probe().
=E2=80=A6
> ---
>  drivers/mtd/nand/raw/ndfc.c | 19 +++++++------------
=E2=80=A6

How do you think about to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?

See also:
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/submitting-patches.rst?h=3Dv7.2#n145
* https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/=
Documentation/process/stable-kernel-rules.rst?h=3Dv7.2#n34


Would it be helpful to append parentheses also to a function name
in the summary phrase?

Regards,
Markus
