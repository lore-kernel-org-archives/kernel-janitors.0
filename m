Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.72.192.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793536664;
	b=RfKtE7IezzQhZsjQZKNI1F9M9RCMuwczeBwsZWHE5DB94bR6mqNIzT9XrSLmmZ1polDP
	 8H32qOfFm/+IVE1STNpjm6PBPKzR6uGS05T6gW9yyRDX+stUYIfDHXOZW11dea8DsUE6w
	 UeNk64lxnWnbt1MkakTVb2/w3bTnQDL8LKXNNxEIb9cGOd1/FLxrvScBHzcb7EIXTIx1A
	 DOeBa2H7ZnkIquc2UTpkrn/qI8zvqMW0J4n1fkaEpp9hgTIiwb6+KCXNox62iXqgUAe7K
	 tIGuXwiZS+FeABQQflCB9IHY6CQ9PwE6RX0l8RbO3QRNN9mfPWmV5AzEt9yHD4vZlHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793536664;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:To:Content-Language:Cc:From:Subject:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=9VTWMtfi/UqBqDsCr5D4xfOEpOxSpxbyyjdA+6dozfA=;
	b=MoVHHK0TT42Q0gXJk33VANP25rpIO9dpqL9lx1GaSTeofbsiSByhhKbLzWKqVl0eybBy
	 VhlnEEtNhX+lyR+Y8wzGZqL9wsWcuZkV578firN9FSb4n83deKjy3d2eW5gNN4Rq81RQq
	 eucViLY9xMi5aD8ARUww7D2RQkptQ/iO/MgvS8rOu/bVHH3oSKYeXeRPzOBvvGPPjRR9D
	 +BIDSLgXlVJzz5RBHC+dNM0wNM5JjDNnZTMHm9pPcYWs9e6u0HUPyMfcYmONVDHxpyfUj
	 jYhd7jpM4/0iMnaq+cZPyIIdgpEl9cslCcqTmrbxuXH60OFffPFsY5fw3zOHWq34+iQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=b7dIqWdm;
	arc=none smtp.remote-ip=217.72.192.78
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90FE606A324;
	Sun,  1 Nov 2026 12:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A90FE606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=b7dIqWdm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1793536656; x=1794141456; i=markus.elfring@web.de;
	bh=9VTWMtfi/UqBqDsCr5D4xfOEpOxSpxbyyjdA+6dozfA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=b7dIqWdm7ekJJFRBL9f+uE4siLcVYtIcU+PreGZHU9mWXaeEhG5a1gaP9oZ+d4lv
	 0EGI6HYYedGJdKeBaj8siEoLbMLb1FNlhctIUKb3mnLxkudQVtV5ytDcMKLzz7JRf
	 xRi7MneCtXM8HHO1u1ju3rbwTU/ebjkr92M0+2cEAlBnlLXYNwQvmZHdCP27G37G9
	 mGgaNJi//LoxEe1WsndWbBPSsce9WNlmS0q6u0JXZcLD+0VaX4k2sNorlZ8a46ILK
	 bvrxJyR3/I73+LAn5kMAUI37mnZg3q0Um9M/PWSEVIbKJINXrFPb+KRojxR3UlRoS
	 hcPJX4Mwtvp1neik0w==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBSB3-1xEwud0KFz-004ilP; Sun, 01
 Nov 2026 13:37:36 +0100
Message-ID: <aefccf2d-3ca6-4d15-9026-649fb0a0f63c@web.de>
Date: Sun, 1 Nov 2026 13:37:24 +0100
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
To: cocci@inria.fr, tools@kernel.org
Content-Language: en-GB, de-DE
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [RFC] Distributed data processing for SmPL scripts
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:m+7tLzsQ+G+cZPc4vpMIyKdMtcZ7b5n7qbZQvw/JWFtnAwPKsNU
 8cQTtntTCX32iPUEWIrvLiL2YFnVLRROUeJeDrQeSSScy7AVbe25MEExhLzM1gFE9ZaExJa
 ucD79Jq9Fz46ryBU4kWSzx83Xq45xF+ob4F36Sx0byR1nDhRcLqh84e/jEVrDvhjdgU6eur
 mM0ADAZbWM/icBDsuem+g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SKDKEpuY8ps=;4F5RdN+8ZPGHA1WCmHwQXbI4zWN
 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

Hello,

Some developers got used to tools which support distributed data processing
for compilation tasks.

Examples:
https://www.distcc.org/
https://github.com/icecc/icecream


Would you be looking for similar needs also according to source code analyses
and transformations?

Regards,
Markus
