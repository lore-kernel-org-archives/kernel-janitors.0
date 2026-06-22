Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EC1357CE0
	for <kernel-janitors@vger.kernel.org>; Mon, 22 Jun 2026 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782113579; cv=none; b=k5IxDiZ/ugb5gIfNjeYi1DzeZS0JuE8RzZEtGhv88H63X2jTkPYI8hC6/x6P3VaPGWD5F97e4jgnd6zLpuG/XBrvkZ7QWDAdTIhd9lR6ijtxJpSwOGmWEFLx+7x+wEE0SGNqmejAPafRyL8KdPx69V8bzs/0b5XBMs663mDC6VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782113579; c=relaxed/simple;
	bh=wOS1gYH4Tf4CRu54h7iK37DgFW8FV0uaaTC6GAp3QSM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=USzZN7ftPPrX9BPcfsOuiGo4EpMPeRrrCLTsORHIcFHBC3RMLVws7zqddHRWPH/Njo1wsop+iE6ZPdiyJpWA8OPcXuw6xRsiSQIkpHhEDNbsoE0q5HnR5r8UBxI8snyWYYFSJ5hizTuR11jGQnnBKHWOxJTGLG7f1JcW1yGUTvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lK25WbJf; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lK25WbJf"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C99271A07A8;
	Mon, 22 Jun 2026 07:32:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9CCB9601BB;
	Mon, 22 Jun 2026 07:32:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1112F106C898A;
	Mon, 22 Jun 2026 09:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782113568; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F1WzrJAQoi06uIZ3fIKeNj1JU/5aZLhBz05F4gML+eo=;
	b=lK25WbJfW41zUnB34avBqSf+9NXYnwgLTQC0ZTcbS9SaYEFGk3hwIgsmPy6qD4mbR1aNJ9
	W6dkiQeymFtT31dC06rtuxCRaTzB5DGb7gBhr7c4YaXCLsxvQpO9O/i9Eod1XTv6/XMqZn
	ZDatIXDlJa7CdO0Rggrp8G7bO1U+WS4q0HbyAozFlcu0u0HJbSmHuaj6QuTY7ExMYzOel0
	IKo4bIGoZMiKWaoH946F5VDHMWiQF1gXBjyPyfbQHqE0RaJpup4GJ/WpUUWVATXbbeBLC8
	7PvP4E81Osl8ggtteXB6QUOmju2CWUoNOnqPGpDg+DJqUOeDWzfOAmza8zQJ8A==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Dan Carpenter" <error27@gmail.com>,  "Harshit Mogalapalli"
 <harshit.m.mogalapalli@oracle.com>,  "Richard Weinberger"
 <richard@nod.at>,  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Amit Kumar
 Mahapatra" <amit.kumar-mahapatra@amd.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
In-Reply-To: <DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com> (Luca Ceresoli's message
	of "Tue, 16 Jun 2026 22:31:28 +0200")
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
	<DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
	<ajEhuS8xwcX1AA_I@stanley.mountain>
	<DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 22 Jun 2026 09:32:43 +0200
Message-ID: <874iiv3u90.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 16/06/2026 at 22:31:28 +02, "Luca Ceresoli" <luca.ceresoli@bootlin.com> =
wrote:

> On Tue Jun 16, 2026 at 12:13 PM CEST, Dan Carpenter wrote:
>> On Tue, Jun 16, 2026 at 11:51:53AM +0200, Luca Ceresoli wrote:

Yes, container_of() for issue 1 seems to be a better approach.

>>> Issue 2: in mtd_virt_concat_destroy_joins():
>>>
>>> 	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
>>> 		mtd =3D &item->concat->mtd; [0]
>>> 		if (item->concat) { [1]
>>>
>>> At line [0] we dereference item->concat, but at line [1] we apparently
>>> handle the case where item->concat can be NULL. Either [1] is always tr=
ue
>>> and we can remove the if(), or [1] can be false, so [0] is a bug and sh=
ould
>>> probably be moved to inside the if().
>>
>> That's not a dereference on line 0, it's pointer math.  So the code
>> works.  But a lot of people find the distinction confusing.
>
> Ah, indeed, you are right on both aspects: it's just pointer math (not a
> bug) + it is confusing code.
>
> So moving [0] inside the if() would be a readability improvement IMO, but
> definitely not a bugfix.

Yes!

Thanks,
Miqu=C3=A8l
