Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52C937FF7F
	for <kernel-janitors@vger.kernel.org>; Tue, 16 Jun 2026 20:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641898; cv=none; b=rc9i7tEWcMgh+i5rwLEpf9H1ZqeMj3ZZCvs2t5pEO4WUeHaRvJhU4IoPIXcMliqTkvMt9YQ6DP1bPuCA2NyJlO8y57IeJ9mXZ/HOc0d/cqL1rLiurc6gU9kb4LGQvsLgszqTK0PedvLIVpxbrc8LGIH5u/30lNolbQddke89vVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641898; c=relaxed/simple;
	bh=HCW5tdJBbLkSCtPB8A95auyUpL4bRSKZcHYR9puXJTg=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=VV+uVVPLOSNUE1FG2pxjiV0UVUSVyiMop8G0XetqnBuco5hbsfoaHvydt2GESj1FUKZ/lNl8W080k5MWhgsEci/Sitf1Vr4s9BjU6ZdmiZDIUqd82weV3SgXM50pm0QsgAah6tcCEBcHl2I2R1EZD+2eHRybKEm9Y4CfvmtS5Xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Hk+jd8sZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Hk+jd8sZ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B101F4E42F1E;
	Tue, 16 Jun 2026 20:31:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F884601A9;
	Tue, 16 Jun 2026 20:31:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59C4C106CA091;
	Tue, 16 Jun 2026 22:31:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1781641892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0K2dG7B+coSG/toMEOevtp202hxYMc2qlIGt7v5YEvY=;
	b=Hk+jd8sZXuFUzzfOtbcmCmh1Vb7+zsBcGgYIZi2o5HHkYzWOwK8VAzzAxuMKjfDGCAe+sD
	xiFNBSo27yg+KRPL+IQNGjDPasg35xF1wGT5PPMfsvCtDykjCIWINN929ZOAQz75lGYpmQ
	zcQ8leZ3zzgCylwtyR8Gl2DOYc4QwcvOq6WlGcEyINDrp/BGnh+S8FnwDxvcChf2FmehjS
	Birfta1umDLyDnmqnB9w+T/K+CN+iuRRBKgpuJ90a0jo2YNxYeu+9hPkXRC6eGbcF0i4IK
	W1HQjFWUr4zW19ebP1Vzn4mrF7F63bSj4dnk2Hd/mqUHa8GkVmg4d+N0RzZuiw==
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 16 Jun 2026 22:31:28 +0200
Message-Id: <DJARC89F2VJR.1EDEQ27GSDAK6@bootlin.com>
Subject: Re: [PATCH] mtd: virt_concat: fix use-after-free in
 mtd_virt_concat_destroy_joins()
Cc: "Harshit Mogalapalli" <harshit.m.mogalapalli@oracle.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Amit Kumar Mahapatra"
 <amit.kumar-mahapatra@amd.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
To: "Dan Carpenter" <error27@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260614081052.1332702-1-harshit.m.mogalapalli@oracle.com>
 <DJADQJ8GEDNF.334T2EXRX7DXJ@bootlin.com>
 <ajEhuS8xwcX1AA_I@stanley.mountain>
In-Reply-To: <ajEhuS8xwcX1AA_I@stanley.mountain>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Jun 16, 2026 at 12:13 PM CEST, Dan Carpenter wrote:
> On Tue, Jun 16, 2026 at 11:51:53AM +0200, Luca Ceresoli wrote:
>> Issue 2: in mtd_virt_concat_destroy_joins():
>>
>> 	list_for_each_entry_safe(item, tmp, &concat_node_list, head) {
>> 		mtd =3D &item->concat->mtd; [0]
>> 		if (item->concat) { [1]
>>
>> At line [0] we dereference item->concat, but at line [1] we apparently
>> handle the case where item->concat can be NULL. Either [1] is always tru=
e
>> and we can remove the if(), or [1] can be false, so [0] is a bug and sho=
uld
>> probably be moved to inside the if().
>
> That's not a dereference on line 0, it's pointer math.  So the code
> works.  But a lot of people find the distinction confusing.

Ah, indeed, you are right on both aspects: it's just pointer math (not a
bug) + it is confusing code.

So moving [0] inside the if() would be a readability improvement IMO, but
definitely not a bugfix.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
