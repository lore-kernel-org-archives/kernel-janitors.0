Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA95400E08;
	Tue,  9 Jun 2026 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781005342; cv=none; b=nyTp2p/UYTPRniFBaczu+yNLN8TtHi9HLR7+ghHL/B5vnsHNkZRqemQ+n3mQINtpJOjIs1S26+znRlEOoAn6PzClZpb4pFZyy88xdMBm5a+j71cV43pNqDVzeCAfAls4yB6nW/oByZkgmfwNTmrTFCaeZFBqR1Dmi8k5wbgBR9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781005342; c=relaxed/simple;
	bh=BjJjnSMr5dSXhydTDHeDGqZp/laP/WEpE9gSV1dkqi0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Cc:Content-Type; b=C0+HE0fp8QloHRko9tpHatjDeCIrHWotp3/aT0rcWgRaasWAU9kTgaku5bb4LSZypKKF8q2jTwFYfHp9KNn3dNbryTPiNjwSTk5FJURbvOdBcOfXvq1F1D2yUbqxDRZtXDb0MkpexJJSUD6hIhDpzJVOhORCHJ8Gbi26CMcJDL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lI48Q7c1; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lI48Q7c1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781005329; x=1781610129; i=markus.elfring@web.de;
	bh=u/q7bzpTsH1ElyEq00tgwpLbfotXDJDOjobC+Pzz4TE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lI48Q7c1x9qUQL0cFJP4kK94/Jw5ErVXRY3LmynqrPcIvqfvy2y+TN4PdKBNpvx9
	 0ImUJCzWNyBplERBPcQkb/yT2Cys6r4Bues41VJh21obW5WvmyFuQuYIqgnpTkYzi
	 vRQ76q2x5ErjEWLyTT4/Uc73NJkf10CfyRq9Te5N0ReUXqt4HCOosy/2XEDZnAYwO
	 FlAKi46VBI4vzJ44Bb2iWxnAgjOgjYVig3bLg32GcrZfZBcRfnqyth2iF7XP8R24T
	 hn54OUuixDJh67ioQpUAT3sSt7Nofl7CvoKLLZI7027J7EMJ0fp+OT5+JlVAH7E+M
	 yq7dp1E4p+j5C/YwAg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MbTLB-1x7tUX3fnV-00mErG; Tue, 09
 Jun 2026 13:42:08 +0200
Message-ID: <5c9b0231-5100-4668-a33e-ccb330d30c65@web.de>
Date: Tue, 9 Jun 2026 13:42:05 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: x86@kernel.org, Borislav Petkov <bp@alien8.de>,
 Daniel J Blueman <daniel@quora.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jiri Wiesner <jwiesner@suse.de>,
 Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] x86/hpet: Use common error handling code in
 hpet_create_irq_domain()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:F3PK1wWjjlkrA3B3xb9pQNaa93J211KgVs8QqIHNuUj58X0O3yX
 PWJ5wFQ8wUo4N+WDR+puafdw4fbB+kvVKHsCfjpa30jzQWvBT6Vfsj0XFdcArb5aqHH+X+W
 Kko/81Ux4CErdtzqnGi6AQMTbEwP2etra5RrhU4EoqC1Cw4NiiC4s6865Fim4tuKRS6vvVv
 +WjJW1yBVSo00TSDwv6dw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+rn2WtUN2Hc=;dLE4OLhqdLxt6E+/ZBGd07nH6iq
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 9 Jun 2026 13:28:18 +0200

Use additional labels so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/x86/kernel/hpet.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index 8dc7b710e125..ac7e06b40a16 100644
=2D-- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -553,30 +553,31 @@ static struct irq_domain *hpet_create_irq_domain(int=
 hpet_id)
=20
 	fn =3D irq_domain_alloc_named_id_fwnode(hpet_msi_controller.name,
 					      hpet_id);
-	if (!fn) {
-		kfree(domain_info);
-		return NULL;
-	}
+	if (!fn)
+		goto free_info;
=20
 	fwspec.fwnode =3D fn;
 	fwspec.param_count =3D 1;
 	fwspec.param[0] =3D hpet_id;
=20
 	parent =3D irq_find_matching_fwspec(&fwspec, DOMAIN_BUS_GENERIC_MSI);
-	if (!parent) {
-		irq_domain_free_fwnode(fn);
-		kfree(domain_info);
-		return NULL;
-	}
+	if (!parent)
+		goto free_fwnode;
+
 	if (parent !=3D x86_vector_domain)
 		hpet_msi_controller.name =3D "IR-HPET-MSI";
=20
 	d =3D msi_create_irq_domain(fn, domain_info, parent);
-	if (!d) {
-		irq_domain_free_fwnode(fn);
-		kfree(domain_info);
-	}
+	if (!d)
+		goto free_fwnode;
+
 	return d;
+
+free_fwnode:
+	irq_domain_free_fwnode(fn);
+free_info:
+	kfree(domain_info);
+	return NULL;
 }
=20
 static inline int hpet_dev_id(struct irq_domain *domain)
=2D-=20
2.54.0

