Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788079;
	b=x7hQGWVlIyaagjahN5CbXjcr0HYbnyeP1Z523DWlYrj9TLXQz04WjCF40/U+Evuh/feS
	 EXkLLpCllQCsP8RJYSEPB6i4ZLTjgUN3pty/tW9m3jNI0iiySLlW6gqp+imM8kHFDn3oZ
	 Uo6OBja1dAEZZrXtZ7G5LoNQi294ETXsapEjMUzrpuzobuP7GVvDlHprt+MMtQSVDzROf
	 3Tdcc0bU4YMB+yD1rgTlGsK1DX12Da4Acb4iFB1GlcttOsJXQex7MFdoVnpnQvmFndv0C
	 q3/DquVmHD38ruyg/OcfZgt1xeriDBtqybSlg+t8RUoskEG2AI2zAWLNSX0IxRtyICg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788079;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Content-Language:From:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=iQtWWS9pWBn4itGYoz8FhrzoTXQ4TLZSCDR1yn8hHXo=;
	b=sK/z3ah5J3tg0ezVF3atlykr0JVqFkuDjzNL++lYmL11ggBGCmsp83icKqrz57VyM9Ub
	 B4OD3Pn0zAkdzqyaHZEMtjILt72AvPxFP8mIa8mXXj581Fzvp7T0hw7ITu8KhjAX3b9a8
	 enogZTZ6+0m2wq4Ac+P6E2U8MuMdwaEjQrxG6xGa1fbRPdaz1OZ8pyPdTTFG/BsEa0Ajv
	 J+uXBmEuEoIlo5l/eyq51WFkzvblbEJO47Wz6LD7oOaIvrVtas/y20eyGTTrMY+OdZ/+Y
	 tvQrxbgXJMy8sky2cE8//415h+fmmYw70tY+eue9dxK4t66Do0jF8cJ5AmOyJuKeS5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b="lqcW/kyP";
	arc=none smtp.remote-ip=212.227.15.14
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16890606A31C
	for <kernel-janitors@vger.kernel.org>; Fri, 27 Nov 2026 14:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16890606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=lqcW/kyP
DKIM2-Signature:  i=1; m=1; t=1795788076;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:dYNcTO/T+8wbY2u0UMhruFTmvRMX
   tECinYN9ffWJvYvmSkZCR5BzDR6iyiCROLsv0ze0JKhLGCFwcmK9V8iHeTg0tD2ectpjDQi6d6r
   Ccadb0lPwWLZeHE/XPoa1OknxvcfHZuFnDivBWTPkyRLoGeQAD0K+Oh8A/GVHD42DFepFeemjIV
   NXJ1Jv8WHLfI9/h+Cc0oZG9u7Y6Cr6qFq/rivGeGm8/ZUe4KS5I1WOuk0u1f9aVNmycwjOKXKKl
   kd/F46lNe0nv0x564wWKE5oUQZ6J6lrBRDk+bGyNkS3KgH4XqCWtGYOEHMMwr1HJJOyG/8tBPN4
   j1M68r9hjNHEmg==;
Message-Instance:  m=1;
 h=sha256:
   dbFvJkqWyfhRVgl5dTakD5GyEd2TGtI8i+64YolxLrI=:
   PgLP82ofK3CmnzO2ilPI0ZZQHWsAlTIDkhZaZ3iOGTc=,
  sha512:
   bpLOrEmcyrAt/k3CWaqoH8i7cBG5/DyfqyF0UOJ5z2YGOI2B6Sdz6HW8uQ6y8Pn46HZy9KC9Lmbhq6OHyfbZJQ==:
   MeXkywnfiMEoTgGEUlonI6YGkSwSx/i1GMr0x2MLdZQaHDylT50y7g39bgzubtzW7l1QzmfEc8TYhKYIqDCO1Q==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795788076; x=1796392876; i=markus.elfring@web.de;
	bh=iQtWWS9pWBn4itGYoz8FhrzoTXQ4TLZSCDR1yn8hHXo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lqcW/kyPkZV7zvfMtQP9wV5BYnxNd+jqhEm6xCSFaFP3di11dFYIMOOZN7qWnMld
	 dBeh+65f4G1X0YkC869fdDl3INIukl9kIaYVKjJPCCMTgPsLPNx7ZWY0mxBh1dT2M
	 GB9SauWPLJiJfRI3ymAxUs7LM/HBSonktv+KwMk6Ww2g3SlbY6vbWmD+F86ymQu3B
	 EIDBjJjyFsJV7tN4Lm/55K4XYrrMVU1rgcta+st8v4wk8ngTVAedwwWelYdIUSrNP
	 eZOIuPSKB2GrSd2GneinxdEp6T7X2l6ei8pFG68rVIBdpwy4Yqdl+UMPReldhkn4/
	 ZQJkUojIQIE3WoyI/g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MsrdM-1yLSlP3H6e-00s9k0; Fri, 27
 Nov 2026 15:01:15 +0100
Message-ID: <7d7b20e7-6749-46c4-a6f8-462f83cd27e3@web.de>
Date: Fri, 27 Nov 2026 15:01:11 +0100
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
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH v2 2/2] bcm63xx_enet: Adjustments for clock management
To: netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:q+AxnBp/1DFzEht0lO489ax3OWEdGNwipEu9dM3T3W/QpRzVe95
 OyXBv0zFCgtBrvk5KqXZrM7CbnI53OfpUybRtYaDE+2MBx0dSf2P6fGgeNHRJn6K8XjGx6G
 c+0XFom90yoMuvD8PinznJLPQ6CrxZGcPdrzd4Xl9HyyzrOIuujBeJSxnXUZOYIg+ci37R7
 23kP4UEH7HcWMUozGg3XA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Tk1Bthdm+04=;7qXvh+izic9i83oINvAgwYnV4s9
 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
 f7GjXbAdD78bpgAA6Ga1klY=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Nov 2026 13:50:43 +0100

Two update suggestions were taken into account from source code analysis.

Markus Elfring (2):
  Prevent unbalanced clk_disable_unprepare() call in bcm_enet_remove()
  Use devm_clk_get_enabled() in two probe functions

V2:
An initial patch was converted into a small patch series.

 drivers/net/ethernet/broadcom/bcm63xx_enet.c | 31 +++++---------------
 1 file changed, 8 insertions(+), 23 deletions(-)

=2D-=20
2.56.1

