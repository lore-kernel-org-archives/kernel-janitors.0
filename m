Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795733461;
	b=HTD99XPlz5oLWCSfDTRS//8uYnf+E2W3R6I/HeT117mBbr1dELw/WmVo2GQAmxRiE+mS
	 h7SkbrlpQLijkcXPmqrhcG1sgqi6osJqEfWIdWM8fIWPTzwi80aBo6LsUpIDGJSBbhV5m
	 5bGuUKNNqDaiTHc7+4Kqyfl30UXpyT7AW5+L80GebPR+QxKC8TOWgkgMHafZqaXzVy3Xy
	 2z+cvz5z9anS/lqP8vxwG34k3KBpQParXmFe61Qu0lh8OnRgMzhMnxbtg6ygnUo/+zTx8
	 M8WFogg3/LWai+W4Vxytcj+sFLoc0HeVVTtTPGDo3sftrl+siLLhjSLXw9pZ4nVwNyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795733461;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Content-Type:Content-Transfer-Encoding:From:
	 Mime-Version:Subject:Date:Message-Id:References:Cc:In-Reply-To:To:
	 X-Mailer;
	bh=jLN7Zglm/StYL4ukd1nRW9wwqF9gdI+uQG89IZijPg4=;
	b=iENdZ1yP3GRWf0FnwG6CtnB2YYfCYogxuiBL7aib+2Tuhswd/iqvwRRM4ZsW/WyZN0Xn
	 ezNdNKdvy21JAvymJpWeMi735j06LjknZ71NX8EAfJn4M/Fal2NeUlewRL+tMEYFsjAc7
	 ZT2OkAEkMT2wAn6YDUXsQgKn8HNfvnb7JnGDGs1zamodQ1pR9qMyao/sWHZw9fi3N++Lu
	 kmK+s3oNPeI56Wq4juXKuOCOrx42rxrdoZZKvn+A0u7c328ba3M/033Zo0EQnDqU6jzRv
	 FoiXWOg/v9w/Q6bu5226E24x8XQ63ZATsbWVi+Ok4Q3xsy+YsICBQvqe/fBRzzpusrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=bULvjN1L;
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEA606A31C;
	Thu, 26 Nov 2026 22:50:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26AEA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=bULvjN1L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=content-transfer-encoding:from:mime-version:subject:date:
   message-id:references:cc:in-reply-to:to;
  bh=jLN7Zglm/StYL4ukd1nRW9wwqF9gdI+uQG89IZijPg4=;
  b=bULvjN1L5bXPAtrfhn+XkjmvOLi6N8dFaiLlGEptewW3E/4QsHXlpURh
   518lE/IVhHi/KheVSY1xIuEwREE87rVPZkNP6iFSWm9h5eRV2lYZL2IrI
   gxLkXEYqjS9zjnfIymKBpEkdhnWkAu+GvAz8ZrAV1umY0nDrZAHJfujYo
   w=;
X-CSE-ConnectionGUID: dJY5GmmcTAOL5gSc2MDfdQ==
X-CSE-MsgGUID: uCYVGHpcSr2ybi39Uc6wqg==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,235,1787004000"; 
   d="scan'208";a="307600174"
Received: from 224.16.56.119.unknown.m1.com.sg (HELO smtpclient.apple) ([119.56.16.224])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 23:50:51 +0100
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Julia Lawall <Julia.Lawall@inria.fr>
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (1.0)
Subject: Re: bcm63xx_enet: Use devm_clk_get_enabled() in two probe functions
Date: Fri, 27 Nov 2026 06:50:38 +0800
Message-Id: <80E9692C-11F4-42A4-BDCB-E235AA2359AC@inria.fr>
References: <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
Cc: Markus Elfring <Markus.Elfring@web.de>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>,
 Selam Hemanth <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Abeni Paolo <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
In-Reply-To: <f3de129e-bbee-470d-a1df-e867269522cc@wanadoo.fr>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
X-Mailer: iPhone Mail (23E261)



> On 27 Nov 2026, at 01:30, Christophe JAILLET <christophe.jaillet@wanadoo.f=
r> wrote:
>=20
> =EF=BB=BFLe 26/11/2026 =C3=A0 07:30, Markus Elfring a =C3=A9crit :
>>>>> Why changing only one devm_clk_get()?
>>>> The change relevance is varying for the involved clocks of the affected=
 Linux drivers,
>>>> isn't it?
>>>=20
>>> Your patch is related to bcm_enet_probe().
>>>=20
>>> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprepar=
e() calls in the error handling path and in the remove function.
>>>=20
>>> Why only update one place, and keep one clk_disable_unprepare()?
>> The ungating of the item =E2=80=9Cpriv->phy_clk=E2=80=9D depends on speci=
al condition checks.
>=20
> This does not answer the question.

Furthermore ungating is not a real word.

>=20
>> https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/bro=
adcom/bcm63xx_enet.c#L1789-L1800
>> Regards,
>> Markus
>=20
>=20

