Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB344379C5D;
	Thu, 20 Aug 2026 16:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787241621; cv=none; b=utiGloQCi23icxocWzkCfHysPXH4gFLl7kZcmPUkTq3yzodJaacONtwL0N1OzUwkYeWlYY4ScLuza2oxN48LWOiK5MrvgIbev0DNf/6yNp1YFOqiJnZgA9aEALGaVgxc4i7f9WQmwlggpCIwSMf7xbKl67X7oTAr23YiUEDoWtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787241621; c=relaxed/simple;
	bh=wDVBjf9Z4PU9X6ITXSmdywbYAfqbhR233atZ+eJoC40=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=GvMRFvY340s+5Eg5lKal4vIGAmV0/8JDUi+7L0kwJwJTiLXU/u+wO7xScv+kTnPc3ypBT/mO5eIOy+xdaxxvAumDSRtDm5EOdaCGV12Mqm1RLfmVU25lrJlAgArxiMK2P3suJ0K+bHax0IIfC9YoIf+r+jOOQ9+IR5ZsWTTFCZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GTFwUKEN; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GTFwUKEN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787241616; x=1787846416; i=markus.elfring@web.de;
	bh=wDVBjf9Z4PU9X6ITXSmdywbYAfqbhR233atZ+eJoC40=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=GTFwUKENybnI8rQW736emTszJtv5m6ojYIj0EW7R9MiludoaCOZPOv9SGbu+arJ7
	 v9NgcX1JMAJWWUmdryIBsj9nZAzD1lvQ5xKAOvsclx1DBMHvYU5/2UEkNVdhfVZMU
	 BNihlORJLhbNivgaKJd9DL7ftdUnZiaDu1O0G1Sey+YPk5nIIEOpGvTXdy0v+SgUP
	 qJ25ej1Y7dQisZOSHNh0c+4UKeisC0jZAwHFtIoghvlMAptCjg2Lg2gABW/U5/5IJ
	 Kpkk6OTXTRArqiAJe04YipzAWTVgCCWHJOh48f504LAFvF7uMIIY1cztXDUrS+PvW
	 D8riBzpQU1rSOqerfA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M3Euv-1wxufd1dtd-00A1tF; Thu, 20
 Aug 2026 18:00:16 +0200
Message-ID: <1cebfec8-b63a-4fd8-8381-3ab88c24a091@web.de>
Date: Thu, 20 Aug 2026 18:00:14 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Felix Gu <ustc.gu@gmail.com>, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Vincent Shih <vincent.sunplus@gmail.com>, Vinod Koul <vkoul@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <20260807-sunplus-v2-1-d5379c664dfc@gmail.com>
Subject: Re: [PATCH v2 1/2] phy: sunplus: fix memory leak in update_disc_vol()
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260807-sunplus-v2-1-d5379c664dfc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GlP3Xw77BCkJq47kB1MeiOla1gma2Itzf5+fIpbe87GK4bGpU4F
 HXHz+fpj0HuFALn+jf8ouVWe8t0k3zDbu1fSbGjcpE/OqtVbC4/Hx19OQ2V+HOp2Ccqg5KO
 tC9AHeFwG3/L4cg+xLpO2ly1d3QPPL3r4WfvNPWBqlMF8j3dc4yK0zaoFF/dKmR6n4/2ngY
 0/CPHKU+W+Mix/kd+Lo0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:QumMF9x9fK0=;AhIYA+erFWJvgWnFVXIFL6fhsfu
 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
 D5OAzRvdvtl8ZZLcFLHA=

> nvmem_cell_read() returns a kmalloc'd buffer that update_disc_vol()
> never freed. Free it after extracting the disconnect-voltage value.

How do you think about to apply the attribute =E2=80=9C__free(kfree)=E2=80=
=9D also in such
a function implementation?
https://elixir.bootlin.com/linux/v7.2/source/include/linux/slab.h#L596

Regards,
Markus
