Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9E13E0C6B;
	Mon, 29 Jun 2026 14:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782743988; cv=none; b=tplLF9EbtKpitimvW58q+ecx2H4n8e4zZ1lAjPb1W3fewhmsdzQ3kR4dz9TN0ltAj3qVOnn4RUaU7gN9LCEPjP7Ui8M/4YjStxxRP1xZRGkKEu049hl1DXuEMA5/b95ZuJIROXp9XeC9XpKdcG/FOquxAUHUCp4o29S/+8mRcoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782743988; c=relaxed/simple;
	bh=cDd40m1goyaC5AyZOt4aLxnV1SdvQoghfu6KgdqFBOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t/5+qs9dqcoU8ocWYyVV3E07F12Bl3cf1QeNcjKXTwNj6iEyzPlOPFWEm+tTqxXheDTtIrW+WrVLDpbiwYebznziEFx/f+YeQ/CbwJUT2ywAzjR2X9+P4BZ1W4/3xFXaQajIioYcAN3OMnwbyKmXMFmLE3lMkCj0lTaWRwn8DPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=BJObYbhP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="BJObYbhP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 39982C5145C;
	Mon, 29 Jun 2026 14:39:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1BD655FF96;
	Mon, 29 Jun 2026 14:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0AD09106F1890;
	Mon, 29 Jun 2026 16:39:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782743980; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a42TAHzGWb/UyvAGGTx1OTIKOuKhNKN2lS2loDfeQ1o=;
	b=BJObYbhP2ptcR7KO8ZM6XBOW0dFJfiqXLlIUFz/SD6cljhqZ6uRQ4yC4PAKJaymsjATYJy
	D9uDH0KXWUn+GzfNHbZjJN+ql7GwPNfWv0pfIL9CFCm8MRD24ZM9UbiDJSxCh7a7SKDDd6
	1gvszjy1IqMInSL7HmmB1LVGvmTBR6SjdTDDMrcN3+mcBFpnvkaXyXUjKoFsgs6M4XdYyB
	7OEcMKzSHcNU2zmiQBFcyAkFa4ruPOPxw2lDEcaDppblSgBsyGTn+GQ2W/fEjvWj/He5EJ
	YLSnkPuygAyHyWImhUpXaobUcz1VqYghdzJ7EvTqUbbQQ+2ZO1ap5JKA1f2fnw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com
In-Reply-To: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Message-Id: <178274397897.256048.17604438269324216719.b4-ty@bootlin.com>
Date: Mon, 29 Jun 2026 16:39:38 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

On Sun, 14 Jun 2026 01:10:52 -0700, Harshit Mogalapalli wrote:
> mtd_concat_destroy() frees item->concat so calling
> mtd_virt_concat_put_mtd_devices(item->concat) leads to a use after free.
> 
> Fix this by moving mtd_virt_concat_put_mtd_devices() before
> mtd_concat_destroy()
> 
> 
> [...]

Applied to mtd/fixes, thanks!

[1/1] mtd: virt_concat: fix use-after-free in mtd_virt_concat_destroy_joins()
      commit: 75c0c09541b49daa08fddbc2c18c2232f4eab7d8

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

