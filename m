Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D090F3264EF;
	Wed, 10 Jun 2026 17:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114235; cv=none; b=oFZTQYErmu1scb/35RkaJMl7R78F9JzKi4XTUoDQFADP5cMjUFmIORmfoSLvYep2HVfoOBZgUhX74MwlJe1dXgiS8aCDACMrCAHjzEucwL3OpC2yk0xSm2pHe89n+24UIZofCYe56RZiPPiA2gBQ9kQvvbocbIFpcBoqekRCO0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114235; c=relaxed/simple;
	bh=YkTiBYMBvmc8vg0nLoWvQF/TQQyy/PULesnD9KjP2OU=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=RiA9UlCVAOm9cfb771w/g6HxECH3WgotbMGOwqChnvwvvbu1ymN3xYc20ovc8hFRcEUQkSZeUiB9x5KEmObPq0G/UjGwEoK2v6F12ZBK6WbM6R+hB93f0uemvhpjk/H6yP8BJ2QXWuduO9FZxBAshYeXC7q2sZMpL2lRXJkS4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=ppNReDLA; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="ppNReDLA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1781114202; x=1781719002; i=markus.elfring@web.de;
	bh=kBzMtgZnQ0JjubcHgSYpkiu1HFqidm8qbhuirNDbgQA=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ppNReDLAf/D6FhHmSExWtCZUDqukoruMVoI454YoY2TtfqgK6RoSgityUXROK5WM
	 tj0+8QvvB4TtMsHQO7gtGsWh2exfK5aY6OpuL6MHUa+JWk6VRK4UeMBsZSHawsU2O
	 P5PwglErLG+cCkXBBYqNZPlWBo0vTftFMsYT9dQd0igyNqeyYy6nhr3FTKk33YwJX
	 7QtjHE+mF+kvyE8dWzA8jc9gOa97RlfSdlJIIuCvfNSHuinjKMQFbd+Zox5yyu4lG
	 ej4QPpPxOLKV5WXYYKff6EXYv0m5I3MPQmE7hbtS8VDqZz0N2jN10zbJHgpzWNiDs
	 V0BVRmRQX+Wdi3YPdQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MG9DE-1wRrOQ2yce-00AdK4; Wed, 10
 Jun 2026 19:56:42 +0200
Message-ID: <d8fb5bab-e65b-40c5-b4ac-7b0736702990@web.de>
Date: Wed, 10 Jun 2026 19:56:39 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linuxppc-dev@lists.ozlabs.org, Bart Van Assche <bvanassche@acm.org>,
 Christophe Leroy <chleroy@kernel.org>, Kees Cook <kees@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] powerpc/powermac: Use common error handling code in
 kw_i2c_host_init()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BY2W0mT4VkkXtvo9AE3X5vQgGO15AQ/QpBss8cy8IB9P9dWSZ6M
 Ccpq5xVhPaKo35/yVyuCPVmsSJ4o0k8YcqNBs3dDFU9Z8ZxscqxNGrsQaoVsLpl7DeZJBQp
 Z1Mpj35sFjdGbsV7QUuFnJ+u7gz1Zv09r7CzguBcjr9ABFXHW5yq/FnhR8UkthHyDKhp9pE
 9KdCVVRxEVaC8xvwxnp3A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:u7z5qRZ3Mrg=;gj7QfzTb1dXdyxYqMkwmNcZbZ78
 qJrHlGnunME3hgL0RrpDvuIMg77klMZDNGC0Pdp7gyr9yScJ+r4szg1E0TmQmf7LaDFNJvYM7
 yPO4yhzNCLcDwcY48iolJlDyCiyZVVQSQmi8AhQNqnuUoX0QQylecjifR/elptl0gwgmSvZ2u
 95p0VbJh6iH/h7GjSUxTgLERb3DZQG8TYvXgNZZtayT5E67HmOWrY19Fp2F7DflV6ZFmekBHv
 AXb1FQm+NRM6y8gBeSluJvYa7VFoo8n2WG4OU+av+Du5dmFyuowUg4YyW649iAoFqI1c2HR1z
 DVmKRKlr5dk4/AnjfyBjGIP+Hml5F1ouCbGam42ZFNcEclPQavqum6QBIJeXosupRWq3NsYC3
 km0qo/oNPGa0pTaKBQ3JuVLUkr/c3eF13akWtGD+8u+dyBv544ML35K+WnN+yOFqo4CIdopwC
 jMCBXOHBC6CWL8mSt+gCdz6iAHvyJEH4zmgzeVMvRFujAZmFtwz3Gax5vsV4vuzkm5ZRVp1GI
 oZeoCpm3UCLSsG6nse+sAvn7rwGr2Q/QYH8hCogyVJri/kFoUuSQJfhjFJY7ltxxkpE+nZ1fj
 Mzic6OMzJbD9jQZeTuaNwuOmdb4FiBn6lJx5QiGK8HVtNqfeGHzpF8QMmHH3VblqzBXBWCnuS
 4+HvWjD+Sk7cPY2nMW7hX7sXQV8dHEoXKdQj7dFKxrN1bbIZ2ccmm99zHWrdmiPmlTKdRG0Ns
 wZUctxKFE24xSj5MY16vSSbDNu+E2Z4txxFOGPceEopf9+xla9YzcG7cNbgRBJCOKwj/tyOXb
 gPwltRofax1VJNEfhldbqTtgBnULpePtN6hJ3q+2IWuMczKscbi7sl2XGMcHZyb7PzsnzQ47o
 xn/nj/ubPtJpT5pT0l4doRBNz2yZoGb+FubHnT76vgLJiO2hxt2xrnimGQ2Q7yivthwlzGVdo
 aSDItfvMP6dBbFFsahaMGVoeNBqPDq4xSDhq51bE2xr5SJJgNSEiYGErFDnnjYF6dcZYGDSza
 /rXs64oF0GCGZEonspYrXEg9wTmAOYRjtTTsG33fUClgRIeVQO0XhwtJnMvslnKMMPgh34FIB
 zp9q1ZE64NJ+1VjtSoWrS4LGr4O/ZGaf3Z7S25+rnefwRonS23I/RVFtmACRg/TaIruJeXl8K
 qXwX2MQ1MJifPbqc5VMjsNJjT6vBJKCdxQkL0LSWxcaA7EjD0pncbt/5J5WdKmYLVUaxcVSOv
 K2vNR3HJMzA/GUw/bTjqWmMu2ca/oPXkdA6u2gRAAAXAPwN2slZTROYo9wc0kgBH7Z+8ifhgo
 VX60taiH9aHOgCgiUgmuZPCXorHo03A0Saj20wO6TU6kX261IcIWonKa6Ugz5Ro0aHlhMWHx8
 zd3QzD76h3t3vOYEEocvWhLKPYCANjQZSDD2ADdUagOpYfOB7FQPJ3P/sPTDs+GHIUWJxQNze
 NsYETWyM5ErVJ3/xxJgx0jVYJHsJg7KsLsntrxr0MWo4ZgZYhLTWL0tXLNLoquEid7SXm6cEj
 KRZWoVyxBQtz2U7EZR8wTQOSMolOMqd0cICAZ3BGbJs84472AaArSJ4cJyaxscz+/npAq5ma4
 EqPC+pxsLOZ6+QnkDZY1GIgluD5h/Ki+SGMzwWqnVqSN0WwMfbTmAeyVL0QIa4RPPdNWekR8f
 qcOVJPY/Rv9+JLxFveePHxw+QPYQBTvxern/THIYnUc4vtlEtF+0aE+qSzRJo4xAJqSAfpxL9
 3cevyX+RfzVko+Ha/LhOf2Jb8GeL6OcSFqlHc9eapUIXi3gVHMK2XtaTEzMi9q1h1B7O9TM0y
 sC3x3hnEpaNAp6/zygioDXMzhOY1MPJ7dk1xtKJSic+srxVesO3+68QTsvDX36rx/7r2UA9JI
 MkSFZ8w7k3ub76af3cgRC6vv6If6CmvLWa1i92Ez3wJ1vqPAqwVL82AY/RzH7EeG+mOsfj/qY
 FdwADQr0yBWBa6rPrH4DVZDe0Eou2ldE6QBNzlOXIafaPXGCDHJ3Ebqlbkjy4Hva+XyuYiE0p
 MTGWog6NW4V4qBRzrSvuOZFPfPUgbqh/LsYVtje4C3kQejFPds+Wyji3uChS1fEv/oWsbt5+K
 Fv+0YodpMZkPoDaLxUstsGiXsx4rMrZX+qH+hUA2pBj9I0OivkB00L5rC0T5PvywTwmzfZpj0
 WkAZNKoZlNU5sr8Ml2lsSiBBM0GyuJaFJkAAPNSZ1oS+BsJn1gm7DR7VkahyyLd0PKtxpRbIQ
 LSx7f64QrqoRfMf3RgyPuGkV3B3MySSRPzfqJaspsyB4TegwrB//mtEi4SdfZXXoKOCJnmpkR
 WDZGmtcu1XfD25Dk1cDzO6J9htrN6obheBB3w1ktiHO//SHWT8Dcx8etmPUMz4L1+LC0QWPkP
 pywILMbnKFqz1h0+ugcUvWl9Kowlxxrj2iWQI51VKAt+4/ij0vDiUFn/MA+0aanm19qToTO+7
 NeImRjuzBnU3l4cvDoF9UzzWbLT4vOEhWWxxg90HPakUGrsFy6S/D1dyJWFY4we9kIF0+jJlL
 cRlSj2d7M+PYLViSXqK4BEvyGQ8/IUPbVxG5n76XdbtOMBpa41GFzw8PcWLzU6pZw2CuwBgpz
 NPoPFLozmoxgeVkSpaiLKnadzWMmj1aHnIXLqzPSMbJxdCOjQPLXATwTdVJ0sOLwy+WpY3Ck7
 UZDydux9T0uuXdp8hlG4Y3Vyu9AD+l4AaRLkhNn6MHJxFiaTU5Mxmu7/qgAKO2TD+toM6x/9m
 EHBDWSldol8eFniAgd0dn0hxELeqjNouHD1CMEL5o/LP/YTrtqnQUPx7KfF8JXMGgZmP+B+/O
 15jwiVDMiIGtk8wWRx9bCCV7xJBtpr9MM1h8CLhlwsTEahyp/B5eNcyUu6ibdymo8qpC3adt0
 H5b0tN+FF53IsqkBQE2ZdhTrHD3TCkdDSL5S0+EHN4W1mygTPLVPt+SvbO8ORYqwk+xRlspRN
 5u36VtUi+2Jqf9iU/Abxh7Q69bDtI1HEdx0UDlooHSXzcXUD5QH5Yy5Fvfcgi3gm5DsjCqwMA
 dfW46/V0xm48uhhw4KTk8fikW4UQke8EMkFrPtrZWUddX0dNNgLelxDl25MyCbWKID0erlhbZ
 usSL0EdIn2J0+ZJiBwp4FlVSMg9ZPBtszSVckpFXw33s1pXb4x5GZuKukY3Psq+x1yZPB4jcg
 SbudqwA1zpI2InxotcypzZ/LDC0PUySSNY4WNACYRA7xLPHPdKc1gM+ZUYoR1hjfP0FhFTdO9
 uzdt0r6aKxiAKQYjd3x1TbBL+h8b9wM02G/pKna0CqjKB8XMbqxgoC87ZG89A+kBMNh3nupvr
 hZbMHGXtRxQnH95iX18ZmyF4bF9JPe7hpaPFJShmyABNudAj21EyO2WHcaEzDAvHIoCn90q1/
 CDEvxvD6qzMrE9/eu4EWCq4Ctaad0U2bInmkZPI+u6EbQuociL9U5gOBr0p3gPkz6lMTvljm1
 /KhcoXoUXDItWrpZKPGTnp53vHgpgxet0tbKBMXm7lyx7tZhGNhCha1riRYBT8AB7/E+pJVfm
 tPkg3CvwOFORnZ80NtcAmlgnDHXAElBn4CkO9vVlIhFC3VMSrURxPtmFKQnTblN54KNohF57R
 ooq7bYeDv/Yb6ASmtpcW9eSk6464xF38D7tVMcffbRlTAadbaqK+waoqQw7KNu1oZvpj6D5Ar
 cxYN1ORSVdUtN+U2XCxYsAO85RIlTsp07HYehaEF8c4W+TPhVB0aXRQCC6CpaqoZc4ITksPkq
 oXdsgJu8yuzXIa0J5UdgzuUQdekan20AeLMd+AIvtnSaYfNYLr1xv+AWsQnrgzgTCHyDtPE1k
 CQ+dk6iaBAqVakPK3Gjzful2MPpzXkECSPjIlaNxTzQJ7fIs16T5UjjOZ4N/kyndeTAuJ9oEK
 MwzjKxkFpF1Cg9ObRu4BXUbc/cRr4F5IJo6Q2tmiJC1fvI+H1HgTG8UQ8Ts71TRYG/VyqnJpI
 USuZjwf5oWcsaSKiFARig8cBfS1fxqNjS1++ms2QR2K1RhFjzrBiTfLSwQ6hc9d0jGJJ4XXyK
 O/Y/poJlOwdY0aCCbzB8i/Rqkb2grCNh7l6AO7UMh0SxGhOTlzp3UGwCnG3ShkxS7eT5tvQ3E
 jByVSHnzjAG5YABVLQXHN9iEvxg3372uQyN2C+jvO7nvbHbxRSNdkOge6dM5cOqvBLJlxl9QH
 R7KUQ9awZzrGbkqaLDbX+zYmZDDWsg6QpOJQIZ8GIjYhly/VPPo5n33rQcH0UxJG0jLDhwh2o
 20kICte63d6zS0oZUS1HYzGoeeNuOl85RvD/RVRYt/RTYziP7PFOkuvIR1xKwAQr+AhzhAXTt
 TLFZiSfpIy8IpFdGOfZzBg9NhokdJRrxOhtfPbLkzQxZakkgC5Ht5TVUgOIMdMjCHdDaCd7cP
 wQMJMGNaz7ygq9e34Vb4bX2kxhss5i72sCNC4Gyu2WpqccZOwW7ylwNph9N4Jb2SIDa8aRf3I
 EqjWzgZ5jMpwDHcWAxKliWDPPc33oFwwzzwmc26t1yJ8rwUUlEC7Azbgq77Hfbcf1BzZSsfIc
 TvHLyARe+ZRpdBWMCBZyw6X2YT8kgWIQa6MPvF+yeg1VR0v1xJqv0lNPD/Ku6EfX3sMcHAn+O
 CaVfTZch37yErSK4pDtsjarYJHZhnv6o7UdlHtmxIOtxNspM0lxxYbP3KGyJY9NrNr6mkx5BM
 UIK9kM48+qfjjcNhyrtHzhquPRgNXLNzfia7FX/XMrDIH/iny7ZTAuM8JC9+yWhWLt139WozE
 RnUU3G9gabnyf+cMmK6ne0deqk/p8+cpTvlVwThhXEEynUkme9NcejA0J5GihFBRgDeDZpp/i
 Wza8p4N6AA1kvpAj6I0mpgDSWz4zwsKKiSaJfxtAc5vPtKBo1EqqGGr4wIGiBoKFzQJbUPoJy
 picNUg20M5BzGPQbSPM9+4T/rhYrV5asUuV4iDe8zmUCTO6+aSw/JrNtK+AbgpIJhbtShehsa
 2EEwMnuSms6d78UthSqEdbErd4d/zviOb398yfd/Loaf0zOgDXyO/0XfbBTu4SZd0ISbpqTbY
 rO72m6eAcSaT+KyqHM24ojSxGSCMY42mh9Qp2A5K3Kzoxsjel3ZQF3YSCmt1NlNDeS6bir2vp
 wZWbG95ZBaGXFuOi9Fok23+eHFeJWyuJ95mGFg/cCrUDz00G2c+c3/48amCkvIcT+2nP6rWSu
 Mk08GA6V9IpkAQW13g5WJSvCHJ0oYnJ5CZXsSu4VrubRup0MonLI1xbg23EuhtlYgWdbncMTw
 fJkwCXZqxLIrp9fApKfE7pKFIH0GukLT++2eEK+p2Ex1BeIdxLYHehglpAFFvwpcdExHm9pLD
 m5IqsL0/3nojM+55TDSHrub9nkA/burL6NjupsZDFVZJlT53jIOk/NyKP5XFgKhsrEJkBZWoX
 ekAMZ+1OXR2Yxst7xB9h4T/h3k0ZuV2RXk1XcyKTH0mFEy6zGEYCQdEKlhzdpVsTb1rBYopOo
 S9NQEyhCk2yjBQnSnEx51StmQKyD8TWI7sOvKsL81MWPA3hzrtjhlLqf/tJRDv/aP5i/r7NOz
 gtrb+dLk+d3gMW3C8V3Jp/tR3bzcPrEr0CDh7SuhsQALPtowsb5/sGK3Xy/8jLnkb55W3g==

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jun 2026 19:50:08 +0200

Use an additional label so that a bit of exception handling can be better
reused at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/powerpc/platforms/powermac/low_i2c.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/plat=
forms/powermac/low_i2c.c
index da72a30ab865..8daf389d72e9 100644
=2D-- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -504,8 +504,7 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_ini=
t(struct device_node *np)
 	if (addrp =3D=3D NULL) {
 		printk(KERN_ERR "low_i2c: Can't find address for %pOF\n",
 		       np);
-		kfree(host);
-		return NULL;
+		goto free_host;
 	}
 	mutex_init(&host->mutex);
 	init_completion(&host->complete);
@@ -540,8 +539,7 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_ini=
t(struct device_node *np)
 	if (host->base =3D=3D NULL) {
 		printk(KERN_ERR "low_i2c: Can't map registers for %pOF\n",
 		       np);
-		kfree(host);
-		return NULL;
+		goto free_host;
 	}
=20
 	/* Make sure IRQ is disabled */
@@ -559,6 +557,10 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_in=
it(struct device_node *np)
 	       *addrp, host->irq, np);
=20
 	return host;
+
+free_host:
+	kfree(host);
+	return NULL;
 }
=20
=20
=2D-=20
2.54.0

