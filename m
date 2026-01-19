Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4779219E8D;
	Mon, 19 Jan 2026 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768824564; cv=none; b=nuZtehPDOyrWZj3a89F68lPf2E4Ow+MnYAlDsiysy1pfJ2COdPH8vkg06XXE25+1sD8tVK/F7+6AeH8bTIkBq0veZbigrAm0ZZ4YzDsCJqRNLGKXUOBGckIguv58eo0/5O5ay6SzJhpDm86ufm/AsAKTS5KqYmUBGvt9paiNbWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768824564; c=relaxed/simple;
	bh=hwalExSEB9E09OucGCTFTewRCnFQA947VO7YY0AuWPY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Iqw++PWumg/6v/OKyXOWnBuUX4GfURAmcY/cTJB0kffSyESTzqsRt3uo6PSBTjWvfR/13uNUuv/0dVLQVoIQskn+LAbQga6ulU6KNhnML11UOzxU8SSEUmtKu7bG5qBTZ0I7ci+e+d4qTtd3h9UzR+jwN2TuMadVVm+LKLIyGQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=XrZo6mSO; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="XrZo6mSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768824539; x=1769429339; i=markus.elfring@web.de;
	bh=iZak6hoX1ShRV8+3Yd35Dx5VdGA7yJozPtnYwVDZJlM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XrZo6mSOFUa6HMWocvC62OHbNTTNkFasavRsYrzZArn5Vg45ZUwkB9tQkHuxjdek
	 hTK9IDv5QTHYzZT1LYV65Vk5ACQnY+GbijjxiHWg53Attqpfe7QgKDmnYviejUP2c
	 soLkDazGRIiH8HOyIoRGVqzwscielNvWmE9EWwBTV5KNx8w+Hdrh4VwDzbi9RntTT
	 CbBXUQJQXBGjoBOmisJCjmqaCYN2GV5UYrztuN9lMKLrkyTpwSceNvKEMfbc3OXXZ
	 YmjfRa43E1vFRdIo1qu3xE059XsTkYCPiTQVD+8t8hNQYzQ3BbJ5gXC4/dWpasAqr
	 eUw9XWuUNm0qOfM5FQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.178]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MaHWx-1vL47a2sNR-00WHTu; Mon, 19
 Jan 2026 13:08:59 +0100
Message-ID: <6820805a-9849-42cf-bbc8-5bcd2c9c968d@web.de>
Date: Mon, 19 Jan 2026 13:08:58 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Weigang He <geoffreyhe2@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Josh Poimboeuf <jpoimboe@kernel.org>, Peter Zijlstra <peterz@infradead.org>
References: <20260118065643.924837-1-geoffreyhe2@gmail.com>
Subject: Re: [PATCH] objtool: Fix memory leak in elf_alloc_reloc() on realloc
 failure
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260118065643.924837-1-geoffreyhe2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:6h9yISDbok5illYxemO3S/vlO1deuDrNuAXfagsywlG7wmypSPf
 OThBhOVSnb2KO/ZX69xh305jeGoYEvC+6tZmqhQSmlOEQ0yxR/aFqs6LelK+JdMWoGhL5MM
 aDTZrV8dGnoz9j8UC2iva2XKmD7iN2PKY5SOO1Vo3WOppC8F9zhZkDoufAk/rga3cidUWP0
 G0u9mr63HUqM3HwNXW0IA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WRocfp9zT1g=;Wny6TVRbTQSfhh71yC7tog2zetJ
 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
 aF9NZcGDpy0ORR1xC8HxVxdnizkxQ0JA1BBZhh

=E2=80=A6
> This bug is found by my static analysis tool =E2=80=A6

* Did it get a special name?

* Was any additional background information published for such a source co=
de
  analysis tool?


Regards,
Markus
