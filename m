Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466E528FF;
	Mon, 23 Dec 2024 20:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734987055; cv=none; b=p+LGBOY2WdbQlpXHkUpEqf/Jf+MElPoGhK2o00F7NGVm8+CQwzHB1ShZDyMo6xt2ymLVx0C36K9efdI4J/iTbvXroKF19s599W9loYTO7JFjQrx4i4/JXg15hKSekvHmZcB4E6ULnTY1C52kICdLjUZ/DuAa5n6GP+ptffco7vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734987055; c=relaxed/simple;
	bh=3T9qzlFyEqHF6vosQqzArBl8JuV3uCTmVULi4qJddKY=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=nEW31SKNAc8H9ciekeV2jB7eaSHWF+iquFuLGTlN93LydtJLBkSeUqZewAw2R1+GNJ4FrESGNUI1/a18BeNmMLmFKRK+VUArO64zK8HczA/T+7aFrpK3YCMJO3/6vRtYZp3TSph5SAiUhrlGFfSkP8W8DOHNRyzMnpJt5cnme3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=RG2clnMA; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="RG2clnMA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1734987031; x=1735591831; i=markus.elfring@web.de;
	bh=z7Nbn3U4UHyXoXWBz5/azVwobvtrqjxYgFCk+vEPTZo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RG2clnMAswu60PezC9qXi/GI5K89kXC12H09YVMPYvO9ksWTr1ZLKOEkVmo8FQUD
	 6IP6UeNvOnHA7ePS/8EWQlXOCvxIhsp/ofyLGhtb7EcMFnMu6KAm00ADVtIkH7WsH
	 ZUXk2NUQZGj0LACfXVaxWLImkytGosZ0ekSQvwJqMMcaI8C5qfjUoRf92cb7LiSoG
	 gyKhhNuOD8U/vqmWCoNxutrMPaB8Ff/Z8D5qFPp+2OMcdcru2skXVU25bOHY6NQwo
	 k0e2LoeZq6A6vLAEwOsu7BU7pzFrGlrANBG/sX1m4SCcjkOHQOxKo9mFLBstgoVT6
	 IKp5lP4yZr9lqBHe+w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.70.52]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MRW2R-1tDOfC1V7l-00Lf7V; Mon, 23
 Dec 2024 21:50:31 +0100
Message-ID: <d983b931-b623-4af4-ac87-3807a86d1f87@web.de>
Date: Mon, 23 Dec 2024 21:50:19 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
Subject: Re: [PATCH v2] sched/core: Prioritize migrating eligible tasks in
 sched_balance_rq()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20241223091446.90208-1-jiahao.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:p4HKWBUmz9Oc54VJ/ICfs+OsDNqIsWj/Fr97pVK9AL9jCvHkJ/e
 v5zW4McvNE+bX0aJkQJ+iB3EoOeK7QF2QAdlrJQnMxL2Yo2uqqOl/LifS01XYKkbfdsrGi/
 XWzKbmXwymkG50FfipCiHRv59U7c/IwIlDGGpOTUKK3FXX+6DwT/vw11OF5EsuFy6Llmn3J
 WlCaoXiA86eHyI0kjrW3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:msIF+b2dNIo=;M9P0wwvyUqa2BL6JDXMoLAhPUKy
 8TrMOp7uXJXUsXuvurJbqOWGcMu8T+++WPpbqrdLBjd3MuS+mhzEFIT+Wmu5SG+G5u5sFApFX
 9xRKBxQsC3yydmgVXNa1k21m2M0uEWAzSb3ops8pNxfjBmk0Tcex2xnlIjBLmhNx70/+nxpm8
 fELzAu8aIp2f67L6e+0RVvo+nm21ebXdSkOt37QvZBGApqemQ3C2oAHoqMwc/EyAWP66KcCUm
 TvcyD2Pjokbq9jVm8WczLfsjQbAycVVHBiyILt1up/1+XhOEcCw4VIZmPVRbW4wDcBrQdpVov
 0MLVhZpNzO94j1fuCTaQQ2JmSTbbHKdwJ9vyxqSzVlcfutPtK7dfCtTzL2ESMGcGgy7mDKJER
 raqs/jteOXAJYXE8fhjRA1FZ/FQ93al+4wzagRgJvGhL0J1wcMpjPv+0AHYi6jQM0/QwDOHnY
 8Mk3qeGykQGIJYa9wLi8GpOtqBTTTpaycGwluvOwXy3FCrwz9BVgGNQ7DKd+L7YqaAinuV1iw
 MXc7TS1ZGANPmC6PS4U4kf4pvOWBnfiLjCSUdWiOnrBYYwB32gG/ElV3c7MNOLEigzVS23C0p
 pVR6PcXPDW6qBWu/nIxKfMajdJpaK6DQaOeKI7rnYzU1Viz4sM5sY4vb0GzfLdfb++XvqGE1s
 D2NU5gH7Mmt/osGwEgkfIAXAGs998vDQ6vguS1vv0ByVDyHBaVkkzfH4qA9biX0cx8E5B60Hd
 5ERMSL/2a65d3wnFB7fb3W1fweQhlAPY6OuvPoWF/Ndf8HlyJEwI576ODjLwNrLQlZSMVa5MV
 /vmk9CVxiZ+x9gEOZn5BMizHolT70/cHEAWyZdcBBcZjqeNMnD9V9KoEqetrDENfaWS6wusWL
 5cVVsTvloy30sC6PS8IoF+uBHMs3oRsGdgBPz7q6jaKdjxLOFlWSTYiUN6fzDn+n9XZKGsWCQ
 CCsGqyBSfkDuVMFho9kO6pt9kZSD6viVg8h4b3Ua4Ym+2fD3vaOPodZKZFMRNC3ITz2PnXhnB
 2ue8MXzmqaI3tbZkk2QP5ztTYVFenQpERRt8PXwM7BN+0DSduXkaVlp+RCZFe6ktwr4aHBAU0
 KTannsFXg=

=E2=80=A6
> All of the benchmarks are done inside a normal cpu cgroup in a
> clean environment with cpu turbo disabled, and test machine is:
=E2=80=A6
                         CPU?

You may occasionally put more than 63 characters into text lines
of such a change description.

Regards,
Markus
