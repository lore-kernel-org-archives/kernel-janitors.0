Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F3C18CC10;
	Tue, 28 Jan 2025 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738053926; cv=none; b=oLzH4ekHC/Lmvz+R2ej6c/rEnDAKAJuorD0OBockSgG53ZwWRSA52MZlQrI6DN58OjR46BuKkEhZN6zUq7Hrc8NHQat+0/RmuKJ0j8tRz037vyELAn0EarZMUOgp9zsSuNIrjZN7bTPddODKtu9ETSNnz+4VTysz4XNTTfHR8fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738053926; c=relaxed/simple;
	bh=zxA5LUrDDzqaIPg89ah6h7ql1bD5waECNicaW58q/8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h3/w9wKNWjovaBubtNrJ8q9C516A011XIIjLLfIFuMgQvK+IHLD1OXHhb5IxmOmOl3MnQCNH8IfjTX0ub3o5J6DydsOJm1YpJyFbUKGJJR2H8o69pYwlGpoebVS9DSpDjvHqeltezsjyFUSOkTR5Dv2ObF2OOFZnasqWjLAwuPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=nxp56bfy; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="nxp56bfy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1738053921; x=1738658721; i=markus.elfring@web.de;
	bh=zxA5LUrDDzqaIPg89ah6h7ql1bD5waECNicaW58q/8U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nxp56bfyelV11uEnF2IILrIrWz8VgoMcvbRQtmSJQn4DnA1lAoGXGA5ZPFI8KAEv
	 EhtHmexdhABUSwdpg7wgS6cxITJs8aotUJHOk9eJpBCjHXKBUM86iFrblXWcpE58B
	 tYZ30CeMe0W1j7o6rMGktS2uXysyvo8d8VGiYgsFzztEpdeBXvIfsrpmhJsZODuS9
	 X2q5j9UWrXqn2h4dc/6cvwiSOzprgHYvwztjHj42XXmcEsXg0VnvMF3KaR2ge0ZdV
	 GEube+pixEDgD8lXXuokmICXJKnMvog+l26VQIk5HTZUpeOdHYfwa0UefydyeGv75
	 ZuQG0RCCFZJ0ja6ZXw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.40]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MzTPW-1tGc2D1vGK-00ttO1; Tue, 28
 Jan 2025 09:45:21 +0100
Message-ID: <2ee90f45-0ef2-4c9b-8b0b-79d8c6cde1de@web.de>
Date: Tue, 28 Jan 2025 09:45:20 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: init: Unnecessary braces around single line statement
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jeremy Dean Clifton <deaner92@yahoo.com>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Huang Shijie <shijie@os.amperecomputing.com>, Ingo Molnar
 <mingo@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Petr Mladek <pmladek@suse.com>, Raul Rangel <rrangel@chromium.org>,
 Tejun Heo <tj@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Yuntao Wang <ytcoode@gmail.com>
References: <20250125154139.7565-1-deaner92@yahoo.com>
 <a0f58c66-2ea2-45ee-a426-5934846990a8@web.de>
 <Z5iHRSUPEQoI2Rfl@vmi2410184.contaboserver.net>
 <5033d386-0765-486d-bf5a-68fe790ee455@csgroup.eu>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <5033d386-0765-486d-bf5a-68fe790ee455@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RjJdUcN157q3TgJztESoQwACDolzW/vqAqOJfK3FzkYmEc/BQbN
 V7MveICSu9iUv4Im56TaVLThTB3m+o1UAj5e7QrjZ6n1nOdf7IGtquSeiW4RH6bb+YDUkox
 y/L1aOMMlA5h7kduqSrAeuuQZXcDkK7cEYY7sDPbct3/gaYACb/c8+prNQ4nxYRdzK1dvIK
 4b9n7H21171Vl0SESq0oA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:scGj4n6p9pA=;IMYOmcYVoNzO+dcICCOtveiBBG0
 lvOP3EXaaDLvY2hNVxxPILHSEYuX33j0pu9dUOMxSjqw0oNixzQIubDM90M12t9H6G1ek3LuR
 aI6kfQZb9tgdSCYue7y5unDOEpy+e2FY5KGc5AcEbvTiFIsiH0PDeZHD/N57ENErMkeMP3kiw
 3UGCyaRlcxDvsKQpoF6z/0G5opqVfChSQZaIyiD7oICfrkTVfqj/HoVutmsgqb7Cyc5gliFQ5
 fr35S4itq4yv4xjgHvQ4P0gG+LwW08oQbm02rq4scZjGSPd+4TBG6DkcxEkzgdpYx8u7pSu9S
 xuBOo3x3rfhuk3MUTZuiO1+IAF5fmNLApmd/Kyu6usp6zOZHcTENmCIw6HeLrrb8z5nZYzXPe
 XIjEDhTddI3ONJ+dUTskEGwQeM7gGMt4k0JFmJFti+UxmIMwwb9QO/fF8RFyNW2Al0H4W27SL
 gabAJyvcQD75KREf9PkbBRheu9ZZwBuVfSSPHI7orbrlYLLqyKkhNOZR7NZATIhSdG4/ZNOFZ
 F+VV83+8DmnaT5QNm/xJnDBlvN24KcB6RXRpo2gO8/ui616R5KRcyo8EniLbcHhubkoHvww9/
 6BLXCYKh4RcaczPellzP6AJ+ZRcfDkEzYM32rN+KlcBKq9G5UcHW6H4C0bBl435vuUKyOnuqC
 TAaRoMTmrPzs+KlItrm17zkLCIB2uLUM69H7iw2CR/gHN2SgDNWkrCOUuvfV/wsLq67W7LlBi
 2fPHWFkBwQBYhsbHb4+aesYOYOQqFxOyev4T4P9I2a+bw/H4FRkEy37ZeCirnE6yZzhpGCHiW
 ZUxlZrNoEfrzfxH6ywrcoz5uLyQNEHYZE2YvHZ+lg5D5WuitwhM2XJBqGS1ieFpDfZrDxhx1V
 9/wTqJUSdXE/vUh5Puvm42zsh9lFP+G/O5SUSX7h3+YIADRBgLQFykivCWlvsK+CIH9c0lGL2
 QbLOrlK0Gta6z9qKIPIE1CXLDfO2fCt1EnPWkhJs22jpF1QMN/vCnX/J8p3z9yK2k4+X1ttmP
 9bXS0G/Gosdbr5/PloshnJHkFDV/vTpAYhzwekrItHhX0jtDvGJhh5BoHWwYmmZR0LEgeQX5V
 Y9c+SMdUbV5vy82rAsHHoVdO9QJHq/NScWGiBJU80dXT1XIE+TVZhbdTzxEIICMlGvQgLwGk3
 zxzh4aQVLSLJi3d62+cv3xAUuKLhtyYpLd1OACo2yuA==

> So ask yourself whether such a change is really worth it.
Some change combinations can occasionally become more worthwhile,
can't they?

Regards,
Markus
