Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBC94418FC;
	Thu,  4 Jun 2026 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780579166; cv=none; b=b9h0I2IesBjdrNRnHqaGArUg2xpTIoe7AzVqVMj1D3irTYDM7TEM6VDYWHYtr9L4z7X+rIxb3qCh8nLeeXV55otNavcVR+nEmu6GjIZpS8WoPrKLg09NuDw9Xp1dte7edP43bx13xB2O0vq2gKZEH6M46/iZS4F4rBbVUAYO43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780579166; c=relaxed/simple;
	bh=//wH32WXHHonuUxHvd7ajx70KKJeXTCXT0dmnJt5pnw=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=W75eZKZDMYAypspUUtEI5NRJQ6OXtQQgzYnM3/uvQ5dQYX2mAtOQv192tjXy7Cng5qUijZniaKSvCgjoJOXSyZ1Ve2y71CzrCEEqERAPMrrZuW5PIkZmoIT8PuDgdWjDMBIbNbI/B6HY+khFTzm94Y80G/0J4hbaIOqixgtwYNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Zr3QA0o5; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Zr3QA0o5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1780579162; x=1781183962; i=markus.elfring@web.de;
	bh=0OSD/VKi/puZajyl57HBfU17CQYq2Ug+p7OAnLKX/+0=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zr3QA0o5eZxZBwhfb3NHaztu21LIuwI1LTA5IMuDYmMVoN/TDLAT1XiPy9HgsySC
	 hMKZ9dfWHMbwjhZO6VVw6ZxKHVO/lOtF+jLKGY1qGAlPI3tr3HyhEV9eyq1KDvrf5
	 QdYAq9bwJipKBeSCFhFuF/fNo6F2TuWdPOc9jeCh6j7un18Qi5RI9WxbpWsin9Zuz
	 35KXw+dRitnsPRlrZWYetAgxg3Ir85GJ6CNI7SbYERSa690yNP3W3yunVdRH33MiP
	 AbEWzpl6lsLqMijM1waYS4vzDr0fJjVyqO0GTII0iXWmIOGP/xKBoKeiluua06BmA
	 U0S2k7Ovhrev6q5j3Q==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mvsq5-1xNMxZ0tC3-010yTj; Thu, 04
 Jun 2026 15:19:22 +0200
Message-ID: <7b929238-1c8c-470b-a6ad-c929090f4c82@web.de>
Date: Thu, 4 Jun 2026 15:19:15 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@kernel.org>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 Yicong Yang <yangyicong@hisilicon.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] arm64/cpufeature: Simplify data output in c_show()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:iAmZO3jXuqxLYt1Az3G1ukyTQnWxJ/DwiVQfBQTdycFxopHZt7L
 P70Jzk27tFgM4eL/7Z+0xXtmyID1pyorRbnnufUx8x3RBjFbq3WtsQACFfD1sDaFURJFUqw
 qqCCYPYJf9umF9vck8rrX2xNHAlEAwPKDAJ8Y0WjTVasP8MrejkmlRC/p6lnpeVLMEAjhdi
 CER/J84zqwraGxNPpm0Kw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:txmsfiONF4E=;1fMPG/OhzXVl2lTWfinlftPZABl
 mEnMquwLTDkFDcV6vyElyN6kwhchz6UhDVOM/KWLYsWZYGBqAD8hehlal57fZ3fbvZtqh0I1A
 cuoDD8I6d1sdpNSM2cZHI/8EPFAtaUeAeaEe/qC7IQRNb2z1L426QjAjnsc9+ukVe/NtcoVoU
 CEyX0tRrhqUWk5Ab2ajW3Nzl8r1bNoPsgPHvlrv1PK4XGxxzfQg77T96pVbU1TFWfNfSHEqwD
 x9NNsB3yi33A2d+Xq5mW54ERh9eSbfam7TfC0LK4SLScVWNBv79Htihy9dFwZ0A/AmBqaq7Ha
 o1wMdG+fPrELiK089OuQuSR/dWMBXW5bJwNjj+Q2EqAmyVsQSYV9UyCqJKOrMFB3ieLwPozYm
 nAgftYF8BQzKDkPWRuG+gl91pUrpKkCwMd1kZrOKYjxkU832w3vb38Tes4/G8ZDxDRfNzPdKk
 KE6KWD6kz8z//zr+o+SxMdNGEhjOTLJq61A2r/nQo+llhfsqX3dGZewvHt9XQLVlodTPx6M3j
 ns39BCCgFT+lpPuy0/Q0HVi+yJaM0hgEK3csmbPr+6Z7HkLGqNKY4mSDruWptkcNmUx1QCi5C
 nktayuJt6G/s27boZl1r1s2hWbJG339JN2n5CXZ7vPZN66BGP5iWHJ4bnM0nLHHkJ3iQkrGg8
 dRfQjs9/UP1Bj9x4s6xlqKlkX8OLK3NDlrmtqSuMxGSvSbh7o23Lp56HlCUhxKV3DPOHyHkgu
 GW+oIzj0YMe+MZhfPbfq1iHOZcEZibmp3oUOARbSfyyBdAqHvtUeLY+rRWVpPhT3nILCRXjeI
 N5qi0UibdYntJLvioVn+WX8DCSQwf0mJDRsEVQOuIhsiAKaP0AW1by8MFdL0Mv3NxDbfN0EtY
 Oy8G0S8IEK26QNKsRyWpcILt2mSedFW6XEn8m3DkUneFvw4LAo1Sx4XITnRXs1XRi32BgtY4f
 pufzTy8wqMGGpIbjc2RacyTBr2bOl5AIJ86O7I4eSq85NeOa6vi/G02SNeRT1vmSLxM/VQShu
 J0XDQ1rYNUoFDw6hWb7kn23r1dGpnfcmYT0JgxpmhDA9NXhyf5Inu7oLTdQGx2tIx5YSy2qAE
 LGDv5L8q4HzIh4kUqYpEOT+Ul+AoU1FcgVLD9LaEbNoHegQmwQoZqbk8uNwyJlHfgas2P41dt
 c2PbvgLc32HQKNITyHBO5qoZ/X6JW04H2nnq0cdBtQGCt3ghCDwJEu80I9/BIb9A6v99BQqmM
 IR0eFicKRfdeZqRVTrmDs2HOPkR8bv+qgaDCt7WLcbb1NgC7ind2xnik1t7+sPv7ckP9dDtOv
 DMwURcDOZQuTsbRz2Ve8jCLNKgwRtuNCwHdfzjEkF5bXdqQwdpKcihSrL8vqIGNKAJgU0aPop
 zNFqG9mTuRvm2fvNoocmLeaycqKj8UVgZttj1Usi0C8kuapVy03MflwLiOh7CXeoSxU3ycRZr
 JnQaMFaQ3LEflT8anGHgRVBy5b8m8yDjlnWbSaCq7u7d+pWx4Za2kYtxRlsjPhRMZvoJrlYmC
 7PpeDnNoPmly8nWvFzUWzMqao4TdHLqoYWP9pX09a+Xa0oYyjncxbNihqiWOW3i19Q7RVkVUw
 P+2V/998aDvFIJ+aIo2MjrUBpcBumFhDCC0/u0TUx6a8jd5D6K2I2MGqKWk38rtD5TozU45tA
 xxbeFrObouE6dR7a5YTaFINaLyrs62viH1BsSvgKAqbeRdQWnkDUT2eKJvwnLy+Q9Zn8mdBas
 YleaGPiiHalV/bhijD/kqhz7tjbISZBHScZuki3eSlW38sQnbNzhVAe297LhgFKaFtsqpT/57
 g9baA5m57xNbO4SupQUrg8UZqRDAW+/VbTI06cka3sUUcuosey8rfYSDcazVXJE0ZD4Y7iQfc
 Ew/y8xCHl9MpCPxZOg0h4WuRxbhaFC6SWy9Q7ZJN2wg0Fj8e7uuU05owibHfwJm+rxIIFeFf9
 KWCGcP3K3cmwCoVZVahE+mRJBEuMOOQn+ywj6Z1MZQP0IQLda++6sXkRwzQosfYi30R2B2VMQ
 bpIFqib1VzFcmHaDyMxB0OPGA/np2tv8aL+OvSoB/nWZN7c0rFDGubYwfKYjORhVHpFJRodtS
 WnkhE9ezXhUdUhqR2h6RWM8QBhWBi+e5vANK+fPs6jvZA6X0W3iEmEURSRaklZ8h4eli7FJhV
 AAnYq6jv868nG6LaUAaldVNycwdYLdcDpeE8Dpt3I/kazuomT8CxWj3G3BG7/pTMzOk110oL3
 PeOysLjLRrOKM7+gguqFJnqMwB21nfqmQ0ch2ZT5OVWS04ZXPXOxn3/bkhVwAShDnYi/b0Ywl
 zLTx0iKij/IAghHB94S+AfR19aI7RUYQY2L1xVZcb7YlI2iw7FA+k9Y9C68BLpOTjybTZ6vDs
 lBx4ufLrL/2p/DNCvaDUla7hlpgUcWA1sQCU8g0b+FpfxI83tsKwXUe10TdiHPDnwcctH4eu5
 jjCKKtG0EHL4veovNp4fTMcz66FO4mAAFGEtCH5fuDVO+YlN5CSfmpUlWxvX5kRz3f6vob8l7
 UnP2gqU7at7yHtChX0WkQ8oq1zCbswEXj2bJEeTqIjJJMPIRq/Z8vRGSvHBpQ1yOgU6kQHez/
 MAjE9nn1aw/OPcSMw4s4WtEFQCGnMxATiw56opVt/fmRXD7oen4hO9v4LhGV/ouzqfjiiexEu
 59+Q0yeIkpVObGDv6BJX/63zXxa7UYygCnZ1B/w1CjvQVdBSuMaZ0bvBGB8kc0f/skbS7GFUy
 Gi2WLU6Fc9prIvKeyA++2g6tDN2+3dRqrHOSIomVSdVUaa13jGNjxMn3+sw4eAbqThIQ5pJ+7
 P5H7O3bMM/XA69Uy1PCFS4IpEFOb6RS4VvsKkUNqdZLuiiw2pgQahI2Ncbg2TjRDgJLUZBIp5
 tTytBK2fjHeUlVgtkno2az3YWz1Bt27E/IuNfCWZbdVn9FMQOkq+DYF0ehCSGR4QcG6ZegFup
 s/+trkeOVCnU4NmFsEgT2mjTrq5/2R5JVgxYX0r/EwMfL7jM16aKyPv0wjgmmdHiENK+K1/53
 BMMPMrCHT0n4H9EbqzJcaOtCrFLD1DAtZG7d/dwahHWw/s8rzHr+VUy7GmV6U38tzaVJy4YNJ
 ycr5uplQNcZ9V7VLfUuMfwpryKRjO+pz9G/lWyMVvfawTcJdYFzrrAqwX6SFHDsf7BZ9Ui7Vo
 NPqHbC/FXePvOVuyKXi1H+8GXKx49l6HPDCjrbrzW/BT8nhuwP7AIWkQ+3hxkVBq0rQUT2p9c
 EQKNKXDL1/WShy2mej3e325JLmZ9WY3pUvKjuC6kUjGWgIWoZ0etWYtUrtXlsznuJjZJXPjqV
 lGKAiRECQCUf+4LWFFy/4AMjcPsl0XH4kv+/z7UeoGEZyvz6p2mvtR5vfMgQP4wuk5Pfow2zZ
 jpvfm43RjtH6KsgREh3y1CLR55gch63iYDO47F8LE/A37MEwcf1csgjSGuCXw5VlVJDWHm1mi
 wHQ5hTSBo0aBrUa8SGRp/YBUiqoC+mARsSdGXppCcYSHC2VHSqjOmBacUikPqzESqZJxOEVqU
 LgEG7GZeqsfmiH1wz+WnrTYbq8bcuCc+KgYZRxVKReZJinPU5rsLEBQn2J4dr/3rAQjuSRhQL
 sEg5k19bh7Ty4aw/J1o2bdovmb17ZRbZ9vICWteU6TW+q36gRrpmZ/KlQyAh95c522IRpoyTf
 u69/eKnot3oZy9xW2HBhd/DextVRC8lbNthtAwGNT2YwE6KndoV4BgdO1TGwMZZ3HlnyTD9RH
 aAp+cvBkwGJXzeMMFWMLvVYE+nkJqzZWQ/VYaexdM/aVHACrnjPqdQvSJQ7sVgXeEEpbgmpFK
 NeTATKZUWnoTziAN7BF6uAL7WrI1MH3XFt4snc8zdOvlSrD4DFz+u2jEdxHckpUYxw1wOR1rd
 tiKCWNCH/zlKdiqFgdA3gWuulClLLvlCi6duMeFJ6G/TKs8ksjkITwNv2bpJuKAhpj+gwkg6c
 nDo2Foiy9z5gPBOMoDePmhBi5piFTgETttvcxBNfzEDzeUggCB1XGTqxkKa6u/Mbkkhbn3Bp5
 kvE87g7CFuInHx9+edQyxgqZ+ZtUu+ix9S/X5C2L39di4Wp9yl2+ip33NvAdsXcrMBjdcjrgv
 Q2k2qqMTkcpJLD2eyqdJMcbasMRrtUdZwfg0txIz/prjR/x9YtgrbaZ/x76jUovkoQKdhtAys
 agCdqDjBDiFglJ5D/tlotZZCefW+wjhaSmK1SsVPPhfihDaBhyidbj1GoyAaX39jdecJfUoV1
 jik0FJ2EHWj7CYoJekU97hMplJW6jrwfst6W/94XG9EzYI/tgdQ5zFhUOIboeXPpdyxE5cT5j
 i9xIElDw2YnJlQuqxf2wqPQb+nSifOCoQxBj70e5Xt7trzCz/PK/tYRnn9NIXJYUP/4l9SIE2
 bxojTRlA/8+gX4m4Ix3zAtQa8csLMUs5HPK4vhyetARfM9AfEGtWRwpVMeYsI32qDhH3Xr5Yt
 pYWamVq0Eh/vuDklwUddW5aMpH71dY7M8KeXZlFybH2BOiUg00q2dqgxyYyfO1nyO4ACpTdBW
 q9+XZ3HAhoMrjRUu6963Hl9NplaFJ7rw57cTwldj18wIrlEu32CfP3/VlCtU/ggMJ/dz7QTS5
 36FIVeTtPUBTmE5N7pi9djeWYaWNrGkI8KJmSWCiAevtY9Q9UCsrVnD9/9ZSOsst1dSRUwZ1H
 VCik3XfBpzD/RP90rCJmNYdm6+KMbINbbEC1VDXWAJ9IjKoztHHNFqdKowO0sVqIIGb3IU8Ll
 9YdLIC1bwmJDpLHE1fOOmEU8nlGLN+w6n8YCPV4RHtb/H46jOJrKQHbmFk+3ITSs2kW3Smoqz
 Jf4y92xCEtRWoYsCkF0IYiTsNWPPbF5bKNwXTLng1sqyf+Wgtra9CSEm1tvSzzCX3sXiATjyK
 W8bD2a1BNrRsSizLgJtf986HvIZUXvtKmm1q468FdR6gzOFGZqQL9wD8oVXNITorsyAkexVTC
 M0dRZuzWlLvjLm86Y5UyWol2Tu80Op13RKdi0teU04glrqRhCpZ5/sgI8yLd6f0b+1F4o3abP
 mr/A1TS3Q/OM86T1zi3ClQB/oXDgTwYa20kG7jpLwi5JQMf98P9rNh/SwFv7uU0tNBsvv6bWd
 ZJHRRkqHK4TatMUg8hHDks6CkXr6A/6u92m3SNYrFpIh/s3xYJfTGYWNUtGTiUGSbowdT5D5s
 CRZd1NZav379Xbzt9tf/Tvzm54DAwVgfkZlqkvK6IMgdbl01Fi+Yp2v8uQYSY0V7ovxs/YGDp
 KHaRZ0Xkf3K62TGW8Fy22SqO/ze/P0fZ5XEUkoqsAE8nZWjiYwqKzxDUZSvrmTqhPExXKsPNu
 akZ0ybko3QW95sA/Ug2Hmt9O1BvzbQhkOku3A/cP7pi3yV7lN8YF0Zfm3wM7H0RA1j86mu/Js
 giKh9Vvq3O1zTjXI1ZVfLazt3UHDWku1k/yQmywbw+vDlKeC/Mah4u9h9PRYnQ2doHnFL6QC/
 hUpsL8i2nh1gHKHlbY7nqvx9MUh1zlb/yH4oOo4So0nW1KY6pJEh3ynRtq6NTvyOfz2MIybn0
 WwgVbXBodwHGwb8CKJA2gk6qBrQ=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 Jun 2026 15:13:00 +0200

Move the specification for a line break from a seq_puts() call
to a seq_printf() call.

The source code was transformed by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 arch/arm64/kernel/cpuinfo.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/arm64/kernel/cpuinfo.c b/arch/arm64/kernel/cpuinfo.c
index d50e2a9b066b..a9704a11de57 100644
=2D-- a/arch/arm64/kernel/cpuinfo.c
+++ b/arch/arm64/kernel/cpuinfo.c
@@ -272,10 +272,8 @@ static int c_show(struct seq_file *m, void *v)
 			if (cpu_have_feature(j))
 				seq_printf(m, " %s", hwcap_str[j]);
 	}
-	seq_puts(m, "\n");
=20
-	seq_printf(m, "CPU implementer\t: 0x%02x\n",
-		   MIDR_IMPLEMENTOR(midr));
+	seq_printf(m, "\nCPU implementer\t: 0x%02x\n", MIDR_IMPLEMENTOR(midr));
 	seq_puts(m, "CPU architecture: 8\n");
 	seq_printf(m, "CPU variant\t: 0x%x\n", MIDR_VARIANT(midr));
 	seq_printf(m, "CPU part\t: 0x%03x\n", MIDR_PARTNUM(midr));
=2D-=20
2.54.0

