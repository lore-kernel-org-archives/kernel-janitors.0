Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3EAF397E81;
	Tue, 19 May 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779183574; cv=none; b=jbQivIpeWLJudee0zrWIemBuj9dLeTWQVTFqwZphpnbt6hIDge6oQOsP9iYNP4xyl5abXseI4DQwJVrZ2O3tqOakrKDhwz6hABjCxxgAgc0Zkl0zSZcu9pAQCMl9El2XtC18VpD6rp0iM2uwJje9j1NoIKtj/5b2kJ1pdc7ybKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779183574; c=relaxed/simple;
	bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eURvNmK8MR/mzkv2qPcRbxneKVy7sSPLcCYo4sJ47H5jgXKHoORK4t1KyN9fn3Bac5LEh8f8XBx1zCgJQ6d0cIB0eyU98m9KpQzliRS8iN6KmEVud85RJfB5Pf9B9ZQTPIaaAKrRDqaLMBxeTqOzySRwU/JA8MKDifi6+1RMkms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=Bq4jhxvY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=XzbKYsWM; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="Bq4jhxvY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="XzbKYsWM"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id EFFDC7A0115;
	Tue, 19 May 2026 05:39:31 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Tue, 19 May 2026 05:39:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1779183571;
	 x=1779269971; bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=; b=
	Bq4jhxvY+mGa6dUdOF/JPP3YMOtzjWamKGMAJ2JGGyWkxJizfbJFP78FCEFXsZ7S
	fBKbTQOe8g0+5FOLjVmhzCmMirsp04xqLFTCcyw/WKxus24S3bep7u5DReu5gSVr
	ZX7SeVULV4znLu3tgej7qUw6PpU6wQMbb2F0baIbdq7eoF4ZFPJEP+SkzR3XfqmD
	zXENispwzGZmNWhQ1KAXmgRfPO3vsYiRYlDKyfCNWRaLbnOQ6uwQxGMX7XoaryZo
	kpqQbpwMaO9bdLOyJtgAP3aGX7W2bkM/KJ2eER1SIF10KNEoF97ZkGN0r4hC+38e
	VYxh2+nPHInafvIpP5ZC3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1779183571; x=
	1779269971; bh=4ZaV7vAKmKkBxuUNmfjFmb5dle+6CQk6X/i0TW2Mc8g=; b=X
	zbKYsWMEYfVaBZJ88RUQhLmGj0A3gFtavphYY5//GuQyh1zME3eTKM+iNI2wJ3Fv
	+oSYC/wpca9zLa9KG2Hq+jXjTfKAqVw/fgcnx4G8K7riII9Fb7lmOEPC4Agvgpfv
	j7n0nP00tDrtlr7b0if6h1PFafbbl3fwZJmDLpB+LtQ81CgnIu5Mvr1aqrVlVSmp
	7Vs0YjT1ABY9LR/XEfj0T0Ui3jSMtZm0ZzukEovFyJO0RBFqdL9/9SauvFfn4ZTZ
	VvEFEHv0+Kwb0TwArBCtv41t95s0x+gCi+CZjcp0Bl+2YUOFTKsfaLzKWmvtW5Lg
	4wHpucM8AlCn5D/5YZsJQ==
X-ME-Sender: <xms:0y8Matt5SWE2PU2U61UXFruDi1eykIcki_JyujFVnuh0eLhv6TlO9w>
    <xme:0y8MahR4NosB200FRqEMT2EZP9prh0JmLIBnOmzID_0T2c08y4KAiQlOmK58v_Wnx
    U-_TT7bxvLSmmGBQrFC_4gCX2GKO7Rn3pLL2F7_psjaPR53MWYB9vE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugedugeduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehrohgsvghrthdrjhgrrhiimhhikhesfhhrvggvrdhfrhdprhgtph
    htthhopehhrghojhhirghnrdiihhhurghnghesghhmrghilhdrtghomhdprhgtphhtthho
    pehlghhirhgufihoohgusehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghrohhonhhivg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghl
    sehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepphgvrhgvgiesph
    gvrhgvgidrtgiipdhrtghpthhtoheplhgsuhhlfigrhhhnsehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopehluhhkrghsrdgsuhhlfigrhhhnsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehtihifrghisehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:0y8MamraOtaVkKG1s7palY71qJXmkBDiFIov6LYmeiAOAvqufxwUoQ>
    <xmx:0y8Map2Cgo2phVRuq2tClFmU_CWuz0suwuTl8cKTGnh7DmT6U_969Q>
    <xmx:0y8MaukyETDLy_KbjwbkUMDDh8xxmHhDeOIQMg9PpTwt_wekhQp3lw>
    <xmx:0y8MalZC-oVN81Az-hCMSdDpDANt52XgGkOxM8MgOdfIHUM0ur6wFw>
    <xmx:0y8MauWSGZeKilyNML3fKNmN9tpShLKeq92_zMRJbAVMa7-m6-BRjfYQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 21FA6182007A; Tue, 19 May 2026 05:39:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: A9I7lXiA-o73
Date: Tue, 19 May 2026 11:39:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lukas Bulwahn" <lbulwahn@redhat.com>, "Mark Brown" <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
Cc: "Daniel Mack" <daniel@zonque.org>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Lukas Bulwahn" <lukas.bulwahn@redhat.com>
Message-Id: <ae162faa-d42a-4075-829b-8d554b1c3064@app.fastmail.com>
In-Reply-To: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
References: <20260519090720.301782-1-lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] MAINTAINERS: drop obsolete file entry in PXA2xx/PXA3xx SUPPORT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, May 19, 2026, at 11:07, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
>
> Commit 42f67e1d1cba ("ASoC: pxa: integrate sound/arm/pxa2xx into
> sound/soc/pxa2xx") moves all files matching sound/arm/pxa* into
> sound/soc/pxa/. Hence, the file entry in referring to sound/arm/pxa* does
> not match any file in the repository anymore. As the PXA2xx/PXA3xx SUPPORT
> section already contains a file entry referring to sound/soc/pxa/, the
> moved files are already matched by the existing file entries.
>
> Simply drop the obsolete file entry in PXA2xx/PXA3xx SUPPORT.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Thanks!

Acked-by: Arnd Bergmann <arnd@arndb.de>
