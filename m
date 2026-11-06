Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793959612;
	b=aMpFI+Yksb+yXaFESVwmx+A72HqPtmcdeboFfFIXIbVyg15t7/wohXmB1yGkU8iS7fVK
	 Sh060U8wHg6Y68mDc8VGLYyMSTXqL0Houh7eWA39l23pFDtKj7ukOYGQSuDHByjmW4IbP
	 uShVpR1lREotAUJ2CBnT/mrRnt3SQRHPLppeU0/dqBd96fduZD1XZptiviyPKr4hjDo3f
	 28er+/YHwerZj4C4enP39TmdHFb+H8np/UvVtnzaDSKUVJAEqHrHwnqzZFozF952/X4mY
	 VBECgkUfVdNu3vWYm7tre/IfFUyjUUMitg5VC80vchpyJzKLfsnAO3Lt7ZbuRLSIYcQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793959612;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=9qaQPULHmGhMMXN/t8R1NNj3C4xlt2X3k7MVn4b1bE4=;
	b=MRbpBlf+ADKhPTH90nf+IyX0C27c/jKyxs8N1dpmDeTDpEy3IKXNqgI40kAa/D6KIoHu
	 9yCq6hyTfirhqvnwxwHoLocGeW89riL+HzIuKelPfVtan/kzc67Qlaohub0VVK6Gv3TsH
	 B07YYiPP8Rb+DhvP+LT9xwirRFPTo5GrTRL8dTEibB9Tad/DjPymoBVLfPhryimASbeH7
	 k5ZrLtDv5JJ17GeIogMu4SuqZPJWrl5Ro+rlQ+ZiwSga5NUzt5UOI2PKc7z1TrqVRCiyN
	 aPs3RvNdFi2rOgRWTVlyhEVtjw+wZhNyRAFQezxLug8jaOks7aXDmoEB87RFpDYRK+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bWdYIxg3;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF29606A338;
	Fri,  6 Nov 2026 10:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBF29606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=bWdYIxg3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793959592; x=1794564392; i=markus.elfring@web.de;
	bh=9qaQPULHmGhMMXN/t8R1NNj3C4xlt2X3k7MVn4b1bE4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=bWdYIxg3+HE/GuGEuTGEGNnvT1/2DRHjrr9raMKt32jYeuLREvqAGE5uRBykIOom
	 M4tfOMwvYuA/x3G3Ya/14kAaOc7Q8FOT/fa4pWT9RsxM3mCZbaYY3FzfBxPwK1p7m
	 Ix5MqHdX0LvKIKpW22LqyFe4JcNdrvN1DvYzyDx8+Ln8KtJ4NbSWi+DfDZWQQNjxD
	 zWRXOo39WllLmm1yYUBhTdEnJJSch/Hx4/rkkalsriP+P1cMomIVnNd4XDtmlCrq4
	 2r9aJbAOLqBZBUXOonghIrXGBPOmSX4KuF0RTXhVMMqAbBd1IhBlwUQU8EUNeS0oJ
	 RHhp8WHb8U1aoFOQCQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MKuON-1x4AgX3E8z-00VhqX; Fri, 06
 Nov 2026 11:06:32 +0100
Message-ID: <b0b99c1a-59ff-4948-9e7c-cff3da8acc6e@web.de>
Date: Fri, 6 Nov 2026 11:06:07 +0100
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Determining reachability for selected source code?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr, tools@kernel.org
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <52418f50-b3ff-461d-8e66-c10f70e35b2a@web.de>
 <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <161f567a-f33-7865-8787-844a299ef9c1@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gOjFVs95ad/7s+/u11uuD2Baa9cl4J+7AnQhYKxtXgjzhhOUW/k
 jd7eq9EooVgeNm3XTqY6tuH7DUx4sZbRNqEz8llzq6hGTi/R74adXGZgtGtCGx4CcK51B9/
 SL8082OkZhfMkbBuI+322h4CPSVj7wH2fKxIKKMpishHeKZT5u+xsKaLmMQfOBrMsa3X7XV
 38YE8KzEALJDk8bGzGM8Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:q701Lyem+j4=;nYux1a6O2DfrWWVwJsN3XB2998C
 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

> I have not tested this.  It might not work, or =E2=80=A6

Will topics (like the following) become more relevant also for programming=
 interfaces
by the semantic patch language (Coccinelle software)?

* reachability analysis

* dead code elimination

* source code fragment exclusion

* data flow tracking

* call graph


Regards,
Markus
