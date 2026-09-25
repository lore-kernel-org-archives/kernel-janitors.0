Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531D34AD4AE
	for <kernel-janitors@vger.kernel.org>; Fri, 25 Sep 2026 14:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790346569; cv=none; b=MfuMRaqLMpod5aceyWne0P/qN72Gy5c75UmjZqsqa61divktSLWWtAGGTjx3DjrW6sIVCOc3MlXeBWTy2nmQHkheho5N91/dyDMIDTMCyBrr7YkLX7ShJ+P8XUQSIgaOAztc8l4ePJqei7FGEyeIdxDttNOVgqnGorUSkXSUbpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790346569; c=relaxed/simple;
	bh=QVPgqdb1/rRh8OEZEKYmCblwkRb1tPDTx2dPxbP5cgk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=n0aGUvRbY4ncEgS4J6lazjAlU3TS16yjnHfKFcFc0k6IJU4997Vf3sLihZpYkfBIeHBjtYJ+H5yQfXg+cYoZqBjxGYOgFzhuAj9FOjOcNHz4XxYINEcZXnkTig9JdYfQtLioyMW9EiF8eAOU/oT5pktxUk8s3/v9SwHq47f3RhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VKUmlsyK; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VKUmlsyK"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CE82F4E41072;
	Fri, 25 Sep 2026 14:29:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0A586073B;
	Fri, 25 Sep 2026 14:29:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5793D102F19F8;
	Fri, 25 Sep 2026 16:29:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790346566; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5YQghMkQxKVMxZ3HXy4f6WO6qALFgb2czJJHSaPe1cw=;
	b=VKUmlsyKXhsNGflv+JcrbtODY5kyVbE0oBnq666f8Ek13qonjW71+8EW8rmx26seoqAzUe
	PXxWdjtZLCNmCrIaJjuDClfEYb1R7LQ5bMVypmYnEUobW+B0D+qjn8BTcrEZ0X+fvugR46
	M0qFVxPylFXekugeywTaSSIN7TA9UFwPlXgAFDyeUq/7eJkFiojLmUzUtJHgwUmuKjphHU
	dRoubdI8mNt6/o+yKHc1gCKYvu4TIRU4Bg3WXqbhBKZwIgRqJrteI9lfz12aRoPp5t7Qai
	AAbpnBhAxeKicDQt314EuVzMCQ0rEDi1OfcEZCUBLoPBQBX/apDf9F2uHaj6ag==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
References: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
Subject: Re: [PATCH] mtd: concat: use container_of_const() in CONCAT()
Message-Id: <179034656384.1166139.12762954308681250790.b4-ty@bootlin.com>
Date: Fri, 25 Sep 2026 16:29:23 +0200
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

On Thu, 24 Sep 2026 14:14:11 -0700, Harshit Mogalapalli wrote:
> CONCAT() currently recovers the enclosing struct mtd_concat by casting
> its embedded struct mtd_info pointer. This assumes mtd remains the first
> member of the structure.
> 
> Use container_of_const() with the named member to make the relationship
> explicit and preserve any const qualifier.
> 
> [...]

Applied to mtd/next, thanks!

[1/1] mtd: concat: use container_of_const() in CONCAT()
      commit: 2e566a6830b82d95837c4d669c63a0c1abf766a9

Patche(s) should be available on mtd/linux.git and will be
part of the next PR (provided that no robot complains by then).

Kind regards,
Miquèl

