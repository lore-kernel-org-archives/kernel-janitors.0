Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F474314F;
	Sun, 22 Mar 2026 07:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774164444; cv=none; b=IwaoM0wPZuepUoZjVLoB7qkBkEevov7O0g44bEh7p3i50dTTO9AQS94nuN9CVDiAph2oSvi+4jFS+OVNm6TJwzEzr0nMSW7N4SFwp6gfZaJh9JODFf7pU5Jd3TIUtKN+r/8ZIa4h2u63emAqTHhRE0hO+I/o/kIZ/OPUm1mpZWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774164444; c=relaxed/simple;
	bh=UhqAYqL+3wGMuuH8b/vd6ck6VmmuN82PqiFa3JHh2/0=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=YRsjLB0uG94rkWgnewTGJminJisPKt6wd5sPnmewPNs+r0n/qDYjj4klC83BKv4ThcObbFG+/mNdrfqQayw23HPZnyFkS3VJQOEU2+EhupWrT/rDtPPjrFynPgNgcNkPIy7JZXFpyZfA54C8K541lEYb1XNMP70e4eYv3IsQAh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=HUbQNshJ; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="HUbQNshJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1774164433; x=1774769233; i=markus.elfring@web.de;
	bh=UhqAYqL+3wGMuuH8b/vd6ck6VmmuN82PqiFa3JHh2/0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HUbQNshJULmetEuZIwAl2hkEFYdW4ouz3tcYlA4tjNhd4Dmv86Za1r8D02qQrCV4
	 6G2vFduKZVDoWyxkD2AUZEC7Rrs1FgkUkTiRbHYbaKPwHp8j5N+WuDsq5mZKPLvRn
	 V2BbN1ve3/Fmxh5cCHomItnWX/5yOMWP6QZYWgn8Tp6Rd1eXdZS4fhIlPgxDV4Lh9
	 vEBXpPs7rvYF6N0xT3+g9TjttO3Q/VCPfU88Lq3+whiXjMUmV63W38z45laDXVSpQ
	 5xhIuMKIN+aGrqkF8p+eDI1ZWrUZ5VkbagUkZ9mo7HO44mQS9j0+uOHPXqsHBqONt
	 uBriF7Sae9e6LlDqnw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MN6BN-1wKVXx49gL-00R2nD; Sun, 22
 Mar 2026 08:27:13 +0100
Message-ID: <af317acf-cfe4-4e85-a0cc-e99d67c233c5@web.de>
Date: Sun, 22 Mar 2026 08:26:49 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: vulab@iscas.ac.cn, linux-riscv@lists.infradead.org,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>, Kees Cook <kees@kernel.org>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Samuel Holland <samuel.holland@sifive.com>,
 Will Pierce <wgpierce17@gmail.com>
References: <20260321113419.34437-1-vulab@iscas.ac.cn>
Subject: Re: [PATCH] riscv: Check the return value of reloc handlers
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260321113419.34437-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:FquAmJgb89TPPTMd9cnbJx7Oi5R99E6iq9PJUksys5tWNRpXxps
 hNNiPUscIc9HvagNeoNRgKEzkeo4oe2E5aUfZsUsEQv4fTMQ/a5aS616qBLTEdwR9dBiP8N
 RbYogq4MjNXK8594EMuvrN5+Xg2pneJ99m1JIuDWW6+3J+fmflo305IvdMcpmcroUQwjkXa
 kZYMaK3HfX8D4yLQrlGNg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:cFAtL2hS2jQ=;u7L46gzgguNtdDpCZ0vcKPtDcXu
 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

> Currently, process_accumulated_relocations() ignores the return values
> from both reloc_handler() and accumulate_handler().

Were any source code analysis tools involved here?


=E2=80=A6
> So we need to check the return values of the handlers to propagate the
> error, and fall back to the cleanup mode.

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc4#n94


> Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")

See also once more:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/stable-kernel-rules.rst?h=3Dv7.0-rc4#n34


> Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>

Do multiple personal names fit really to the same email address according =
to
the Developer's Certificate of Origin?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.0-rc4#n396

Were code review results presented from an =E2=80=9Cuniversity laboratory=
=E2=80=9D so far?
https://github.com/ISCAS-Vulab/
https://english.is.cas.cn/

Regards,
Markus
