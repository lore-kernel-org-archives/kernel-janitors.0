Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC3C3E2771;
	Fri, 24 Jul 2026 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883779; cv=none; b=PVta0Vb710AzDUFoq9qb5ezyDMP/inYvSg3Wk2wxRSlwhlQ3i+oi7kyIpsk4N2cGq/sa3P5zEboe4flHyXjnQeDDISlJufS2ssCWP1a10/PBZswhOarM2S3oeMgV5ruIWmq3Dpnx3atIaTQePSMMJ5X/zDo8dZrm2svXqfjyDwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883779; c=relaxed/simple;
	bh=qNTNHae8S0XRC8fq3J4XIDu6HKND7kuJeeGS95bf5LI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=BBhSM2vRKHe62cPYXOj6zV9l13eMBZp4xe91cSBv9hEIeE1SYIUABaAiVVS1XSyDZcgcOCcJvKsQgQOJo1VngL6gQU1EDL5mlsY4Zjxnw2S4gbcrerOzmqDAWZ6qckY+gy4Fgkes/PbMlFfT8VtwXIFnZXLEKSqQFai/SMtAsvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=gGB2jG9Y; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="gGB2jG9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784883769; x=1785488569; i=markus.elfring@web.de;
	bh=vxWe2+L3ped2oOyZISiErWFnkAj4KfTClgbf0Fxuql8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:From:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gGB2jG9YTa/zV3b85lgR74uM0KptmMcv8LRCrESzY3qnTg9tQvyV375rMDw/ziFg
	 f14GLMRemMumgqCmGvBhWoBy/8/q7dkOB8hsCf+sjXdsbJf9uVxjunkHnf+DzNf06
	 /oSjPi9j/NYIFxBYHhkiu1EI+6Gta9MfrAQnm0wIZa4eXTQRztnANAF5q21rjOjLn
	 Zr2PC0m97zuI2fiKjiqqW5lOC9UQgghOlPTTgiGZ84yDL2qyf1ZtVwl6pWts9Ijcp
	 sh0wBzKRF7jYzIq52B1eCLhzM+y3p1pWEfbEVpKjguQJ/E+mwEi2tPW3jbhagAGGl
	 cgvniK22PVueKNQgeg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MP384-1wdN7E3q2e-00M78P; Fri, 24
 Jul 2026 11:02:48 +0200
Message-ID: <be2727e1-907e-487f-8522-e5aa694b1c38@web.de>
Date: Fri, 24 Jul 2026 11:02:07 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving output for single characters (with SmPL)?
From: Markus Elfring <Markus.Elfring@web.de>
To: cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
References: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
Content-Language: en-GB, de-DE
In-Reply-To: <202dfb21-f5a2-4550-8a1f-aa07d84db345@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:5WRBPsU3hml5qu5Ni8uOmLsitulW5/phBgKLvbwe8vCMafbbjzd
 mE9ht+FhzpP3kPs2rmBBOn/OQFaDIWeUNVu8mW6F4Nf+4p1w057fw1FIq2dZOzGr6ddvb5X
 +o8Npu29Y0QVZcmMdz4LKRkS3H7pR0RhnlFoL0nfaNUj7L4iUgzXnWLKEAJP7s9dkJAOmZw
 NZT++W3vy/z/71lu0s3AQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:P6ji0uTusrQ=;OxTwLZjVxAy6gpsL6A0LpF9alTi
 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
 jfnQch0Vv1HTZ9GUfbAU4

> Which implementation details should be reconsidered here for an affected=
 macro?
> https://elixir.bootlin.com/linux/v7.2-rc4/source/tools/bpf/bpftool/netli=
nk_dumper.h#L25

The shown source code transformation approach can be repeated on demand
for selected areas.

Another test result (according to the software combination =E2=80=9CCoccin=
elle 1.3.1=E2=80=9D):
Markus_Elfring@Sonne:=E2=80=A6/Projekte/Linux/next-analyses> time /usr/bin=
/spatch --timeout 23 -j4 --chunksize 1 --no-loops --include-headers -dir t=
ools/bpf/bpftool /home/altes_Heim2/elfring/Projekte/Coccinelle/janitor/use=
_fputc-20260723.cocci > /home/altes_Heim2/elfring/Projekte/Bau/Linux/scrip=
ts/Coccinelle/tuning1/next/20260721/use_fputc-bpftool-2.diff
=E2=80=A6
17 files match
=E2=80=A6
real    0m1,998s
user    0m4,143s
sys     0m0,372s



Now I wonder about the following information.

Markus_Elfring@Sonne:/home/altes_Heim2/elfring/Projekte/Linux/next-analyse=
s> grep 'diff -u -p a/netlink_dumper.h b/netlink_dumper.h' /home/altes_Hei=
m2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/tuning1/next/20260721/use=
_fputc-bpftool-2.diff | wc -l
2


Should it be sufficient to adjust an affected header file only once
(according to the means of the mentioned development tool)?
https://gitlab.inria.fr/coccinelle/coccinelle/-/blob/bd41911b6d35eda4d9a03=
247043bd3879733fb3f/docs/manual/spatch_options.tex#L43-46

Regards,
Markus
