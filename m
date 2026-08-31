Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF70B3D75B5
	for <kernel-janitors@vger.kernel.org>; Mon, 31 Aug 2026 12:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180132; cv=none; b=OHHDAAHkYW6P136FZHcRR86XtsKC2jhcv4I8S5SgC1oM9uenaxtpGdg7dk+UVOEc3TkNyVR+JVUTyCQh+8qP+htJZ85H6N0fDJWPDethhApnKpSI7D4ZQKa0CEynzmjqyt3mCwjYo16NNr86g7gzn5mq3RtosG7H5KEcrdjZeIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180132; c=relaxed/simple;
	bh=X0/nsep7f+OhiAf1SrmKYcbOpJuFoFNxbI/b/nr+nT0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:References:Cc:
	 In-Reply-To:Content-Type; b=hdoBt/O3qLHqJ3kGF6LEpv5lQ1js4Mb5p666q2P/rDMtfdn5VIqJ3iQ0rtkMm6GCp+E+WrRm9dhV6g2x1/nUMBbjIdgk2aCeL7qfC9ct3jAVj1Q7Am2PZSSuB2zYbcneVXnRLv6nkK6lk3cTPHkXWRnJMYTt52TDBbIy8nLOGeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=fMUCK86i; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="fMUCK86i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1788180121; x=1788784921; i=markus.elfring@web.de;
	bh=NCnETxCIjh72AjOIxljws6JMhQFhZYlYuOG14wvmras=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 References:Cc:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fMUCK86iZU2cR7tCem1R+xZKsPy+L7tywgpSfGuwSbhp1xaawqn7RZSUFl80dE3t
	 g7LejTPu5YnBXM9qNH24GZQdGtqBgEHj/L3o7QWvfeSfGmeIvTHI0Ma3xEzGzLzf5
	 9S5CyalTLPmmeQCth7eGuT1X7S8GIsw9RNiNcO0uwo7WlQNcmE924EhbtFlDRSI3A
	 t0D5nUfnkQbqc7drTe6BNnwm567zL6Ks2OUHLUKIB2pBIKVI1SpquICdBpcdnA3JI
	 NdE+6jGx3pjdYImR3BVEVNPTOvUoGDpWPKSh+PCa17ibdxgvCGU4Jb+BeQiYp8x3z
	 zfRPCLeSr30PtpM1lw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Myv72-1wfcZ10lCk-0110h9; Mon, 31
 Aug 2026 14:42:01 +0200
Message-ID: <6e0bbfa1-0f4c-4f27-9f1c-41ace85a0069@web.de>
Date: Mon, 31 Aug 2026 14:41:59 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: Checking run time characteristics for longer SmPL disjunctions?
To: cocci@inria.fr
References: <95c4aa23-d13d-4ec3-89a8-5df56844addf@web.de>
 <acc76ef2-2a0-f716-ff28-f8be945db26d@inria.fr>
 <0fbe54d4-d595-4fcc-bba7-14da44ca3f0d@web.de>
 <3f2a4432-375d-4a93-ba53-11006d0c2fd6@web.de>
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org
In-Reply-To: <3f2a4432-375d-4a93-ba53-11006d0c2fd6@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GHYTsZ2R/6nQmAYLl64YpOc8EiXKjRRIMxOsQ10rqVVyjoeeAbV
 EFmxyNMfLXz2lk5kTB0Izv4lXeIKYTBTF/IbhtCzlRFLlbb+zquzP/N+SxPZpblixgeG2Ov
 rXoOEyNiqT82naE76fGmxqG6JlBGILjKJQl2Py5mYv7nl1AOOhaa6C4gDFzFO3jOkcWgdFv
 HWkJJ8OsXjAQ4JrOm1dOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qVmqV2konlk=;RVvDDXz1bVd7vfsilLB0NgvZ/Ue
 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

> Which adjustments and improvements would need to applied so that 870 bra=
nches
> can actually be used for an even more detailed SmPL disjunction?
> https://elixir.bootlin.com/linux/v6.18-rc5/source/include/net

I got into the mood to adjust the relevant SmPL code.
868 change branches might make sense finally.

The following information can be determined then according to the applicat=
ion
of the software combination =E2=80=9CCoccinelle 1.3.2=E2=80=9D.


Markus_Elfring@Sonne:~> time spatch --parse-cocci /home/altes_Heim2/elfrin=
g/Projekte/Bau/Linux/scripts/Coccinelle/list_inline_non-void_functions5-ne=
t-20251114-adjusted.cocci
=E2=80=A6
No grep query

real    5m32,128s
user    5m27,845s
sys     0m1,132s
Markus_Elfring@Sonne:~> spatch --parse-cocci /home/altes_Heim2/elfring/Pro=
jekte/Bau/Linux/scripts/Coccinelle/list_inline_non-void_functions5-net-202=
51114-adjusted.cocci | grep -E '^\|' | wc -l
=E2=80=A6
29477


Will the impact of isomorphism rules trigger further development considera=
tions?

Would you like to tame combinatorial explosion a bit more then?

Regards,
Markus
