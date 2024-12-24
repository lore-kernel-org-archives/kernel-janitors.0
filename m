Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CFF18FC7E;
	Tue, 24 Dec 2024 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735030593; cv=none; b=Ev2GG64GMSMLtEVazndPtCY8HQgUbtoEf4o5LPqSv+mCX8qy/AZtthOmbtH59Lu5ECNcP+cs0ekcGPHNgwO6gep5qAO8L6f9OukSOHG7uxXTSohFRe3TnVRH0COeXOt9kwts33mu2nqDwGeiUq6F3Cl1LtBt6DTh9cIv10cgPIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735030593; c=relaxed/simple;
	bh=IuWRi9Mpk5IDPWlpOPLeCmEJmWFWL6y7FR596LZWphA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=soowG2QneXTLvKLtUFmM8e922rvoxgW2xJM0L4LB99R8IWEARacz83R+vK0JN0ng2m6iZmNX7T0OGWB1XDBYV21I3R8LTI0Aj1agCSubg/2DPEnxtJeGUuiIujPaeEe5HBRX5E6uKXmDCPE+wMO5MgZnRpu/bc8xFEbqivmzwQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=mENGUNlW; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="mENGUNlW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1735030548; x=1735635348; i=markus.elfring@web.de;
	bh=IuWRi9Mpk5IDPWlpOPLeCmEJmWFWL6y7FR596LZWphA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mENGUNlWCWuGpjAS2ShLyiOQJg7F61REhlSKTArnu27UgeCPEBYlWVIyoTyzxgXT
	 knA7Is6GQkjuFx2XNxJ9ZKW52sh+SCsY+mrFAPQ2KGLgAZjdktF79G7cuyqOXdlhP
	 i7uMn4B+PoFmxoX5sAzpEvjRDRLPslODcXkjtcm/0dMbrex5b9sUPD1LA6viSX2+u
	 cYtqSMwAMFDUB1oGqNwccBWxe6xfKPDzctg2mGtQJ1XF+JzfVHuDJ0GhMJFu3CwsD
	 Q6fmW7q2DiKtV8OMPjqw+U29Cz1FEusYULUT9tBU5eRy+5VDAoC7kcQz/NGjj1eAX
	 rLSNjzShAUyVV7rBoA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.78]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1My6pZ-1tkggN2PV9-00zXNX; Tue, 24
 Dec 2024 09:55:48 +0100
Message-ID: <015b9bbf-8268-4da6-b6dd-bdbcbef7ec34@web.de>
Date: Tue, 24 Dec 2024 09:55:39 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2] sched/core: Prioritize migrating eligible tasks in
 sched_balance_rq()
To: Hao Jia <jiahao1@lixiang.com>, kernel-janitors@vger.kernel.org,
 Ben Segall <bsegall@google.com>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Ingo Molnar <mingo@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>, Mel Gorman <mgorman@suse.de>,
 Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 Valentin Schneider <vschneid@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>
References: <20241223091446.90208-1-jiahao.kernel@gmail.com>
 <d983b931-b623-4af4-ac87-3807a86d1f87@web.de>
 <2cfea522-8015-d86b-f78d-a6a2c56ba8b8@gmail.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <2cfea522-8015-d86b-f78d-a6a2c56ba8b8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hrtnlSOkiaWCPT7ZgnPqB186B+mLLYzFxnJ4SQ21Q6HVh2UbblE
 aO7zi6qVF+LBWUD/yHsjPJie9tURSH3wkBc/4ZdWF/Z3HZmiSZ/R9nyofNHQwVHN3CcarFs
 A4fn3abNgV0u49Gtru2I9dWE0/qWtD4aNt5RsUQVd2REsOgtAA1Fwa7M1IceUDQIEQhwJ5x
 wOSpNs36w82a/Wn0j1aRw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1yrY0Sp87QE=;QClvgNZ226h6a15V/r9ycZbjDtO
 6+dB/wICwGFaZQcJLHZmiAphjYKc6I5n6mepqXfAH+xkk4XtnbAFsVj10pwPu4YPmc2kAzc7s
 lqH+8DBPHhm0nzf7vle5QZsAKFHpeKg/x09gg6wT+lzUwlXR3UZDe4K2fdFrdFzys9UPEA4JV
 +RrQI7e4KHQ/Vn+r3ua01X9bXbY4uE1R9/z0dalTLy3YwIN0TSssDnhgrm/Iw+cHK98goklrZ
 DmpTbqiG4o7W/0RKGoD7kecckCKmuMXsgZtTzoQmuu+npb47S/AZG3NYlez2yAaFBVnkWsmpK
 J1rB6daLyBlSF6Mty5ul/G6Ljrb3TtBzb7tuzy46ZY7lY+NdEDARUbRt9OvAhGXyZfJoVD1oa
 hMdOgjLns4SXlDrri4WJIx/CkqdJ2/4ccWYXwqUyGtTDmZ1WbWmyQzjHGE3x9j8TwMxNZ0/QN
 dbOEjClE8ACsDjdnK4Tf2XyTe/1a3bgBJHDL1xXIr2Hef5L/vkH9aY/KqgsnIDjyw1ckIjpGK
 OL5foLaZrxOkuZmbDIPu5EJ5zkZjwWDPtn0PI47p2e5r02PfQd3bQCjevv778E6cdSSggZQhZ
 DSkPNdP1mXA5E6MGAmPS4oOx7ldNh1NHkX1I9OBk/ujOgtsEpTCimjoHUQhVqMJ+G5OcZjc41
 wo05aeRpERBBWPvXKDFqfrFuof96g4Ib3qG46nUoonXIhYhr0qT5InEzc9mJEkYm7URZasiHj
 m7DKJBUpm65POz0a9usyJF91W12+fz2SaLx0GP3og0iQjhPHNjloKaLkdDV8fDMbGgokVb7PY
 zXEIEJGvSO794TVobwKZTdPDEO30d/bWXaORowo9Z5hLq2gjtqA1Zmn1vQ2lnL/zIXgmIT8CD
 zK6FBYdoRfRH2AGvN1PcZmLC29/N6IBKSbdPwxCkIjET/b2DR/NXoT6jiEcEjzy+JXN8x7ADP
 U6PXFrPEoBTzUa7aRO44jJxcOAn9f97wrHfG4GCki32jE6SX2Oa6vqNKo2KPE1+GoIeoqe+oZ
 EP/ZT6K0aFN/NMu0kESieQggxv7naLDGTVaIOQpJKPzPN/e4RdHZdok7md4mvXRGYzmnFEYgx
 adTTgWifE=

>> You may occasionally put more than 63 characters into text lines
>> of such a change description.
>
> I checked the patch using ./scripts/checkpatch.pl before sending it, and=
 found no warnings or errors. The commit log should preferably have less t=
han 75 characters per line.

Can any texts look nicer if word wrapping would be accordingly adjusted a =
bit more?

Regards,
Markus
