Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2057D40EB90;
	Thu, 24 Sep 2026 07:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790234174; cv=none; b=ksXBNMCTNO5/q71dDGiUx2sohw7BIMxwE97tnrDmZTyVKkckNYRT952QOWolut3ka1wdK0PRNyJiNX3v/vzLKstmOnw8V+/5OlU8SuxfkfljBqrVBSlyhsU5A6VBrkObk7/9bW1TQOAU68hveYpUxfUCuxZVBYuj5Dqa+H1aGoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790234174; c=relaxed/simple;
	bh=/yWNnmtWv+f2znjtvO98MdDV5K0k1c2jpUCIbSE7ZXs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=U2kqaNZVgRuKNtLDLsgBDeJr1xs4UKLIuYBusFWZ0ig+zt7LXC79cazIuJmV98+qElkC0Ee0cBvzX6BrQNPn7fvrVRAVMEAB2DFJpj23EjS24YDCQbVwCSkJRC9lp2HV6qh+eXXbVoGl5UOkSj22IqmsueXe8hPPAkDXb8QyBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=oaOmojKm; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="oaOmojKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790234149; x=1790838949; i=markus.elfring@web.de;
	bh=jxxwLEo0BXdYM4pKyZTS7qZZG6NzOJDKgCdnSnZlcjs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=oaOmojKmVnEW+DCoOQbsnmHMqFtQXl9oYGKwcMd99mAs4Xah6dplcChhoSCPAF9V
	 vGGKA/W8Q5EVGFwi6vk+7PA65ec6rQGQYOG5tiZIY1OIYUtTRKBo46+aG6kgCwFqk
	 GHmeDW3LPc3ZGBLW7Ws6V3jYVloDCJq19cmyO7FET8q3mY1ws+OiwDdnAPcTKMu9a
	 Iya+1Tkj2wFfWszLmDsc3dUywMMOwrPTU9JvqmlArdVWAVtP1YZ5LiXGw7ouQChze
	 9EPBUVLtlYBtbegffubPx7rJWK6DuXeLT8kr5u450C+3kxD3uO51lX2GTGvuXmSlX
	 XhyeSVAHVFxcM3wbig==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M1JEu-1xCNVX1hl4-007wKk; Thu, 24
 Sep 2026 09:15:49 +0200
Message-ID: <6c08552a-49e9-4ee0-b1ba-b27e17ade9c5@web.de>
Date: Thu, 24 Sep 2026 09:15:36 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <chleroy@kernel.org>, Dan Carpenter <error27@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Roy Pledge <Roy.Pledge@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v4 0/2] soc: fsl: dpio: Use scope-based resource management in
 two functions
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Fq6Aec0o7LQlVtxUXYTHaBJ017F9jCvZsB536K5W3pRurIze04G
 A7Vbqm6a4oM/TTS6B/MP1vR/aR/ZrkVaEAXQ7zPPTgZr2E47nn2iL46ugF8W+xwcLIyBaIX
 N7gO/ldyXV88oMwjdbZE9tNREkhubE1KzTWYeOjc2u3O1jzlLfVw8kbwaaHoH4nYU0hxnCx
 6AvrR4ArN5QWLFCu4U42Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:E5ligmXBx+8=;vqSEaQJN+0lngXU/PpgQaQN0tK6
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 24 Sep 2026 09:09:01 +0200

Some adjustment opportunities were picked up.

Markus Elfring (2):
  Use scope-based resource management in dpaa2_io_store_create()
  Use scope-based resource management in dpaa2_io_create()


v4:
Christophe Leroy pointed out that Sashiko provided hints for further
development considerations.
https://sashiko.dev/#/patchset/709fefd1-821a-4cd1-8598-b1179a95ce52@web.de
https://lore.kernel.org/kernel-janitors/59f78064-0e0d-4e3e-9ca3-f057e70b44=
eb@kernel.org/


v3:
* Dan Carpenter requested to add an #include directive.
  https://lore.kernel.org/kernel-janitors/amdBqQfIsAjxMsqX@stanley.mountai=
n/

* Ioana Ciornei requested to keep variable declarations at the start of
  function implementations.
  https://lore.kernel.org/kernel-janitors/6woig227u5snmdsrjfuw7gfcf3vk5iwa=
ap4yf7ow6b6s3pba7z@yg4vmdoaak3h/


v2:
Christophe Leroy requested to apply the attribute =E2=80=9C__free(kfree)=
=E2=80=9D.
https://lore.kernel.org/kernel-janitors/d95d2f4c-f3cf-44eb-b61b-79ba789167=
4d@kernel.org/


 drivers/soc/fsl/dpio/dpio-service.c | 97 +++++++++++++++--------------
 1 file changed, 51 insertions(+), 46 deletions(-)

=2D-=20
2.55.0

