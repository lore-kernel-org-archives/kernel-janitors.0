Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4C43603C7
	for <kernel-janitors@vger.kernel.org>; Fri, 28 Aug 2026 15:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931016; cv=none; b=bYJLWK+UsmLwdptb1wLaKCVEuS6W5sL2BmZmO3LgVemdOZQfY8kENVP/nxQhzl8uN8wgnLwUpB4IZEMw8VhqvdwO6fb5g/MPHfdXyjkCaF7gUt5j9EKfwE6cs0GM6lPhpU3MKI9xDmDyggAcS8p1t+3XHBP7T08Dn7utNsl96O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931016; c=relaxed/simple;
	bh=0kXGyPvioWAATuJ5TnhXMSSx5ldk1r84QL04GhLDW10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L6Lx6Gmff21f84K99RkPiWJj1dfB4KT+3VgF9iiCN0vrZOcJbHaL+1rvDRt7manceZhdcyr6oj/PeWq8GhCdQ37c/PSChAmGZcjpQmPjLKK4g2RpzK0kWtqJmZy6vhCpeL2p4jtiLRTpTTFi/+2YNwtq+FDeM7bw04nfI+QVSeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=hetDIPaz; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="hetDIPaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1787931006; x=1788535806; i=markus.elfring@web.de;
	bh=PSedaWJNwx3skwjF2zV2qnSC36AOgZEI+MBBaOpeofY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=hetDIPazloeZahGCEVHdkPQmC3rKsgTUUSpqkw1TxSWigSipsbOONq+XYz2e3YUW
	 OXpV6bnnzpS3RKvr7gJUSUY8DpdG+I9JC9vYXDJc1jENMKfxAv6xWOObsjqhWl4Xi
	 JObYkMWeV+siCc+IgMXC0hTYiOtD1qsxO+ES3aaM3oaGQ8NWN4OMZjgatEtjEuyAT
	 OLBSLUaiJsj/Qg/SxEWSQsX8TwBAXqkTpxb55toYnBE1nmI5+QHetLwf3O8CimOCM
	 GpxsOGCjmq05pVK97B6XI5YCom0SLGL2dRPDRn5zIFDoi2zt4nsKbFJr0QYlFVFQU
	 ZNJHaHHBhSEG5lYbfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MuF8x-1wlKM735aP-0178mW; Fri, 28
 Aug 2026 17:30:06 +0200
Message-ID: <3e20eaeb-797e-47e9-8dee-a6c97f360a46@web.de>
Date: Fri, 28 Aug 2026 17:30:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Improving support for replacing expression parts by SmPL
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: kernel-janitors@vger.kernel.org
References: <9e729258-a720-4b8f-b0f0-e84f3a984aef@web.de>
 <a0b9259-987b-1c92-2e86-3409ecf87e@inria.fr>
 <b2fd77fe-fc97-412e-a5d1-69b88e27f61b@web.de>
 <47b6b35-2cfc-b5e-f96-8ec6548cd9@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <47b6b35-2cfc-b5e-f96-8ec6548cd9@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HiuDu/5th5pOaumplBG7K0VmcY7JnlMYwLsnhlKV++EH5w+4t6m
 yxu0KJtl/tKaDiuMzMWRl/tQuMW1YKzpn2dGb028KRByJEHLaOX6iISNARDinz2WRdFrwO3
 wv/FO+3q6cCCjVk0TB9bw6AMKAepOeRaGk8RzyxtNfHoWNSPigQsqVQvXZ2LkhkDB3x0bMD
 WFmsnw5wr0+AHTTqbbmug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:PQbXgRjVAHU=;OElIG/1p5Hg/VwprkUGRPTpNFex
 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
 VNMlIq/RWbRZk69SlIDs=

>> I got the impression that some expression parts would be replaceable.
> If you expected it to be replaced, you have to specify with what.

I would like to achieve something also for another more detailed SmPL scri=
pt.

See also:
https://elixir.bootlin.com/linux/v7.2/source/include/net/pkt_sched.h#L128-=
L134


SmPL code sketch:
@replacements@
expression =E2=80=A6, dev, =E2=80=A6;
@@
(
-container_of ( link , struct tcx_link , link )
+tcx_link(link)
|
- READ_ONCE ( dev -> mtu ) + dev -> hard_header_len
+psched_mtu(dev)
|
=E2=80=A6
|
-refcount_inc_not_zero ( & r -> refcount )
+p9_req_try_get(r)
)


Markus_Elfring@Sonne:~> spatch --parse-cocci /home/altes_Heim2/elfring/Pro=
jekte/Bau/Linux/scripts/Coccinelle/list_inline_non-void_functions5-net-202=
51114-adjusted.cocci
=E2=80=A6
minus: parse error:=20
  File "/home/altes_Heim2/elfring/Projekte/Bau/Linux/scripts/Coccinelle/li=
st_inline_non-void_functions5-net-20251114-adjusted.cocci", line 8, column=
 21, charpos =3D 2685
  around =3D 'mtu',
  whole content =3D - READ_ONCE ( dev -> mtu ) + dev -> hard_header_len


Regards,
Markus
