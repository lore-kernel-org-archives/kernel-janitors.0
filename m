Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C484D23394E;
	Sat,  1 Aug 2026 12:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785585632; cv=none; b=pMEvL7ex49INC/Z7cYQawFmWHJGiLtI6xuiHtzdGFHptJ5QxWGcJmKUTE2XIDbMDr9xAOmlYguyRLsPmHQUFW5o6juuBYOnw+4RJ03XfvKCZAnp7hg+gORYZJl4X11WwaKPooBVhqFdDjgtExNMnXBln9ioxw+20kJknwPlqc8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785585632; c=relaxed/simple;
	bh=YRSlPaIUTP+LGbdn1QfUQfAj7xtzWiGSMMEddtHlX/E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:Cc:From:
	 In-Reply-To:Content-Type; b=SEcv9+ckHwIyvtwCSDWPloPQ6SqVVSTGbYFK3j7t7aCkcbcY5mk05zOraxax6Ip+FRIjr4lSZeqlkry4xIePpA20afolFsys+M8PcyTCRGdCiEoNUEUbsg+2yeUzkhVLjqm4yvqi/6ee+xrVBZHoqwWlFiuX765wqn7XqyzkfHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QZJv5QMo; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QZJv5QMo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1785585627; x=1786190427; i=markus.elfring@web.de;
	bh=fxtoBybmL/FDKb/bmWset0sDueRjXVzLcjRyFiDE3LY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:Cc:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=QZJv5QMohOYJ9ezk9Ml94t1nLoZvB7BBCGZO1RpzPbyzRPljLXidiSYW6+aXki59
	 +fMrr5b2MK/2M6gbrZJctoj20gCz3HhPKRfVTAR3MyqNohZMIFrmT0QbwhBdkqyCO
	 tAmXPyg0D8fI4i0ACmcwH3xp+JMR5pW2As4x/BUJhrhCzaZUenkH+4x1mR9t4ELyX
	 FvmVNWekX9Ik6KxoM3dgPYxVDaS0HyszZGWKNkxyOl2ziurQGTmg0ukd9fiPICeDT
	 gcKdPzI8TCnQVUdrUwHim341j6HebD5syRXjOgH5iNOpbQJxO8DOVULdL36yclq5G
	 GHRmir+7Rgg0PBfFVQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mrfou-1xJhux2ewO-00ja52; Sat, 01
 Aug 2026 14:00:27 +0200
Message-ID: <47b1a35d-8a88-4944-af8c-077925936106@web.de>
Date: Sat, 1 Aug 2026 14:00:26 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] Improving output for single characters (with SmPL)?
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
 <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
 <9f8ce18d-67bc-4c01-b3fa-8605c9856b82@web.de>
 <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9e187875-e472-911-c280-59dff6b7c80@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fNa2kKmHoX9hqLebO92Qoeqw8Rq6ke4ExzMInJFf4G+r3B4DqyU
 j1ybXuabtTR/lM+dwYe4kEhIbu1VNe62Fd4/3xYeHWXdVzx3OmlspXt9w112K1kdbgeNKIH
 ZN5b7kCqNoImZD6WYzTjC1ATJ/0KoTvMDqsJsJzYxvMH8d8/CW8urxKnO/p9HivjSZiWAgC
 tVktzLqoyc25xYzH+68bw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nj6bfZO+O08=;xoSLRM2q0AzcBc8CH8w40OoBv+P
 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
 EB46JJ+uWsuv+V61JrSmshewmz1McgErSg==

>>> Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Linux/next-ana=
lyses> grep 'diff -u -p a/netlink_dumper.h b/netlink_dumper.h' /home/altes=
_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721=
/use_fputc-bpftool-2.diff | wc -l
>>> 2
>>
>> How can the generation of duplicate difference output be avoided here
>> for other SmPL script variations?
>=20
> I don't know the details o what you are doing,

How does such a feedback fit to provided information?


>                                                but if you have duplicate=
d
> output about herder files, it would be because the header file is includ=
ed
> in other files.

Duplicate difference hunks are not produced in all test cases.

Can you reproduce unexpected software behaviour also in your test environm=
ent?

Regards,
Markus
