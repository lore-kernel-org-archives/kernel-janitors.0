Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D48B386C37;
	Mon, 10 Aug 2026 06:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786344037; cv=none; b=LvM11WhqW2SUNICMg7wcp3mrVFdLzyWshDhR5ahN3r1DibDwOu9kXOcdVkVLTpB9X2KnS4Xv9IfL5cX7So4HGzR3+pef5jRKJZ3ZtrOM3P2XM95ynlHP+Bfcr5oMda25L/FBgRNfHR8sgfTW8qSDqrXv0rO/ZlcRvLEBr4GnV5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786344037; c=relaxed/simple;
	bh=DWD5FtLbMEX1DmJ+xpFZKuQzXa6Tbnw84te9VtDZGPA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=E6bUaPQ/Fb7FuJ0VowJ68KjGoqS1UTNPHk9Zk53g6XF7U7r6mn/taYZY20cHK4/a8ekf9cbcyYmw4sFOYQfg5yXeuGnNXcRN0tVr3gxnlibu8yVMfQka1+Idzad83AM6vK75HG1TXsudEqD5I0Sr2h7kouPNiXvVM/D5sRdlqvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=rfN7ZB5J; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="rfN7ZB5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1786344025; x=1786948825; i=markus.elfring@web.de;
	bh=09Gs0u+RJo/Bc+ZY0EEq6aN995lM/sdVS0WCfcdAjms=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=rfN7ZB5JpQNS5vPsZnLktKKlLe0JqXp/5nfIVd1FmodFjgXwWXmfssG31+aavQqv
	 GyBh/XmtTb8z785EWxvTCjc68omGpNP/kFa+P8J3c8x2jUsFfPAOvQTJU8h51WiVF
	 RZotmQSwFsLe07Yr6I7tbt4PUB3OBKfhw85c7DuvVy7JL7Rx65auhv3TR+vxDQGYj
	 j6zZcU7SOMMzf98LTlM6HLVLjRnYfR5xhcuPPZcVUpKcs7tXjLKP9p//1E3MMgiNj
	 JUi8j2jKOmoxuUE450p80DR7gK3QJ+LrbZNWBnr4ZVRs+xNrhEssJgOaxeise9EbD
	 Y7dBTgQGFpGUTUfJ1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MVad4-1wTv372aWa-00YXpO; Mon, 10
 Aug 2026 08:40:25 +0200
Message-ID: <ef5b5f36-a1a2-4723-bc34-4ec7a5350ef2@web.de>
Date: Mon, 10 Aug 2026 08:40:16 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Nicolas Palix <nicolas.palix@imag.fr>, Ricardo Ribalda <ribalda@chromium.org>
References: <20260809165340.1719736-1-Julia.Lawall@inria.fr>
Subject: Re: [cocci] [PATCH] coccinelle: scripts: coccinelle: devm_free:
 reduce false positives
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260809165340.1719736-1-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:GhpDj4Tp3fwon39t1+NBurF0n7t8fia9M/O4GRQqTD+fRN5VzcZ
 RgyESlZ/QoCiv/+aV3ozrKTW9MCqJYq7+d+eZZNp5pRQgp2kYse2/sc6SmSZghLyfLq4Azt
 GdO4ywYDIxNhD12p6G2Sc6Z33Lx7xzNLh7DEATPBz0mEBHgw8sZA0W3EwMMINV0NaHyqBJi
 rFZP2PMiFwwMTqnLe93yA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:v5oUw1iipVU=;CZeWkOHTa7iNEckTKGvVDoIJxZK
 BuAssJlZXVhh99NEqQ4jgcFCrC0tXCHzbaLTVReSWdaFTWim3Nltt33NECqCqysadDCzVRINo
 uxt/+oiaOzDAsPWGBNBRt8dIlsEqF0yqPovJrshKLA0rvfFmbStavFMHx1my621hp/JlY8Aeu
 pWnxaze3fUmAzNyDXVK0y+K0XXGHzAJPBq1SyfxKKtqBI8LMG78Eg/+QlWMjJr69ETm3WMip0
 bjGjMjmXTZs3XKcqbdgQBDqfZi7F1k/mHXoNXmHWBCVAMBPJexAJBN0mf6WvxwVF1o9SDg8wy
 wB48vm2BiWPrwwyTx7zq/u2oJfgZDZy5Pk3h8cAwoU/aREicCCn6Fb2ll4kfYU/iBvjoaYZIZ
 YGzfZ0l/FyKZQqbsAvZd9cYtWrKFkXW3meL05JgjFasl7EriYCE9aHVKLM3SaSKdF9D/HOwwo
 9F/85jqTOSc5aPLXLS7oI1uj38OOirc2Jv1MY053ONGH4VAfc7cSet0vOKvCe3ziB6LOsA10a
 zAf0lBqbbWQJVBEcANuXf/3Ay0AFYV8hF4Ko8NFgB6cYPi3CIyf1/8SWQoMBdBs9KI4b3KyNu
 oKFExAygTYONdHt1R5GkU6jUD+O3JnVt11be0MKoqWhz5hXLUhOcRR9Vzbj76hNtgQJe31AqV
 4RvMHDvqxGQtt47KGzjO81JdonuzYzXCxh2tsDeIY+oAa2YiQLshpbD/FjpZ7pEDS2jaH6tkf
 Yws6C6aZmLpAqnGkYZOG9xQGQelZ7exQEerAc9uTgOVG8dfebn8FQ0/QJmaIKpr9tLGK8ogsw
 +HO0/0R4hGIu+2SP7vG1AvDzyAkSmlzGtTbx7rrQb4YE/A+oU8YHjcnyAL77TmYC3yloB33HM
 FgpBsNh2pqIIGIBuR4o6BAn5ei+yFF7ApFmGoUDuxs5Ouo8a6NP3YpH+1kM6CZJ0oT+twdm54
 VlN+W2+gEZ5zf7TdSVQX7HfONXbHqJOnL+48Vc+49dHjtk2gLI6sV++0ykVRTrrVfJ6sZOsmT
 tirT0xOnPW+ts6Hi0miwFW0LAknNCAoxAPi2+MqDxGfcnj6dOF0cyyGPjH9BeC4OoWf3r4Pof
 SKHHsWjP+Rk2URl8kMPD8mttx9WktRgVo9rSfQVHIldsTTMYkp5YZH0wNL8Ql2A0g3zvxP5Ir
 Y/7AtIzNIyZQYMLgoM+fL9cueM9xA2y69IMkKvKF/ZIsdmXt8ACRajK17ecC936HG6cJ2ykvQ
 k9EyRgidll2/ztPGiVweSE0dpI1OWdHvLqt4DZ9K8ZpPfCBrv+4XhBzVpqa6KxmXGolzuuIhR
 pOQ4oVXq7w3fgts2lTJjDntifW9TxEqBLSejEZq/9YsRZaaqRIc5T/RyZ9pYqeKBc+YMjeTmB
 FYmQLvPx1pPXnhR4aG6PvhKU5MeEUIdfiH9ZeyqDd0sF22PAzUmmoZ4iv2Z2lkqhkWrw/4eP+
 imonbSt3n0SaddpzTqjTa5CKbMZH8hXFvdmi4fAvPeUvgLjvkFLOz976JZdwrIcxye38Qm/CB
 mXujxUwwh86vTTzs0GsKUhjuGlCK37dr+MJ9jSA3Dyp+GXyGoNjpDVJyxSaWTnydES896LdkG
 eLT6eTfZ1dDTgtq+aO4n1Dvl28tt8UcEtDfg7y/e4V3gFeo7OJHWi1PbCyqFhRF9ZnTVp8x/z
 5o2f5IjyJeVt8bkca9q3CtkoP9DxvhrPDldF40+2sQxexd5/FJ9gd3VZk6SgFKG9fwMKhvB0L
 ZqoaaM2b/POynetFrgOtY69Ttjh5ln+Rg+zQ60JTnhlzTNPfHaPqk//CWR2/NEFc57ELRaNib
 oaVViTE6t26hTQnJE4dFk5cvIpgXTBe/3HTJYKUHB6HcV9S+bhcr0UW2l28GevPfFxJHmFfU0
 vXDgLQAzI5j9ubCdTLE9eHVnaHO7KEtwcWiZmnlPiZJ88hsoPrxhjPN7YTGcb8/KiMakIPFHz
 EReRM8oIQF+Fp7lJWNqLzb3HxEYs7Jq4iksqdxvKS/N0QXh+D0cRq9TLjwHh0Qx1Cxa3aQnxP
 dS8TK4/oe8uGjsZvi7j2TGAiB5YObhCol3kQjN2GqTOZ9VbgeYPH0PEDIpoLC4sSfuj5nl96b
 PrVnjlc3tDeX1ceHhcGFRbWu2PVrgUbXvoA3UafkUmMEP0TAfvOK5LxPNGN8Yy0/0s06D2Imc
 QBxRmUUBkMMPzgVcdkDuU8EZ1Tc/rsOXYSGH8J13q18LGW/lB5ceOpSy3D4MAZ8DmwQO5sNxd
 0rAh+YXgN5LGBI6FU0YCWtHAuh/4JMf+FYBhaNDp6Rgj5P7MvdMqU+xi9VkxZ5hmHFnVBkqVu
 ZZa3Y8OR25QgMuodwu62YxxyjINtQbK9OQYpVE1EnYXD7Awqf/v+REfswj37ylAl3ACpblMWX
 XYoUwno/wLdN6us+rC/Q30t1jmlyiNh/iSogXnr/Z+Vj60IP3TzTr6K8NY/fIBq32p5zZdcv4
 ZQ+ERKLBcAjAe8MKpzJJW+NvZ0xz3acnZgSO+OanL9tcuCt5LqT1EEI28Rd220gTK05BRo5d0
 iE0sChO3JKJQ2pTVwcFlph9P65GkpEhDpk5fNHUR2MVv1imoepdP0aCu58oJmXRxHyy5MCB9s
 tDTusiD9eVGB2b6LDo67cIUslBf5i1SVWRci9HD5iKqRJxuJKIDMn4cCrkUt5rGlHjvbSQbXm
 pphwQXfR1yobBSTlXapG3tS1ekRHrxkI2UDhSTNVHtebOKckoSiMCbic9AkUNIOaoVZRdpGB1
 uvcgvMFP+aju9dS7AicNoKAfAU1qd6A7NpDbQJvJ8y24bLEdgQXemr3NIpppU/90vx+G9sXNK
 +M/I70/nJy0G8JdwPrUkkyTgqtNuL16rfuPSj7Tr/7DQfsfCyPXXPQt9EjGSgRmqYGjCUCrGK
 br9WhDttaiVLQ0/GvyXuXU7dR370d54hkdblKpvoWG9zHTmKfS4vY8xfw3snWfyLscfC0a/06
 Qy2h92tgi6gEoGA/ic/ctNXQQM9aWBW2/FU9uvdSPY6Hhm7M0s3qQLR4LLua9FmDPDgQQwV/6
 fZkpCYXN/ffhO4SjHpW+zGHQLLDhj/6MezDp3pb7xunh5sHMDZ4Mg9K4D+9ys4LpuKzhYHW1M
 +pI2GS7Dkj+7A+WHNpJ7aFugPVYEYfwfFJZEbWBAZ0xI1TLSKBSNbn+sBgdyPTxIKcEEMddW6
 Q5QgVKW3t/wIUb5GnTmcmQBjosdKfyCO6Tsv5E6POsx+G+nSF6P2GvpFMQWBWj/DJqRhu3FQj
 UbJ9wxHMyfJ+YqsRSXLgqV+zJPH1d3xU3FHv4g2APCp8KEzQUlG4HumwHBq94wjsISKh7uTGY
 O88O2LwttBLUBvjzwddyUqw8S0a0xTvtfua8c5ccCRnmMwBqb7CZuawHDzLnjpUFA7hshkV77
 0+AogXp6BQLiB8gbHgxgsGE7BrZpUrKtPgq+7IJgCDRAsm2Xdnqlvw9vq9kx16wq8wOsON8wT
 P8CYZqcoHrtpEya4DSsktrkGw/6TKPJMN3h5aqS3l5m28go/uQKSvprGz1K6RM8SVzbxPCdvq
 PoxUpNTd7uonQYLKethjO7rm3/NA222Bd1YwrMja1T8q52ZMhvEBAA522uDv3jNhnIZYWg3W2
 ksj90RGIZqi3gycbZLuxLvKyR8SWiwVRKLaiEIvqaU2nrUMIiDpXXtuIDoX8nN4/3ThdkSPfH
 oKfiyZ7cR7ySew+zG9K+gRTePRZVRbPtg36HunCjsFTgFGdUSkkJoOQbvRF0G/UxG52LDhwlQ
 kmw1DsXgiDX1QW19MzGMk6wg0iDDxZCZ/9EGnt6NYRTtM7Hs28xg64PAdHIL0LUUlmtPMouve
 p92jOdFEK5BOS/g9rzQxAkMxiAhgMQ+3Up1z1pcy515Xgt60+CEQChoBdH8BvkUAtb890OCLj
 mhqu00cyeF6mRA5RsyyMgoLXAQFZrojhHiWqpdSWg2QPIOpjHvhOjGDGHXn3TFveW9JBaa38W
 JJKcpEMaoWzp4fdzXBt3tnjaT01p/dH6XUyyA5f3orQZpYA5L7ul1iGv6qcvGjQB7Pn/1fvtt
 TKKZrAwerHnsO0vAl9roap1zsJDzxwmGZjlqxrSUrBby+sOO1oBi1CUydTKdUoooqSNlsBe08
 xiISh2njpJYIJIJXGQbc+04ZyviVwlIlhXncOOWkHCTZJ4pS382UqrWVkmoKlpuB9YICLVQ+n
 wsTW10dI3L3T8IBbuIXx1GFklz6wMjmbsv3qRVagj3izHulFGdyfTkjXXK+NbL5VOm1rgK6Jt
 gBgd25fQh5msSyER4y9nlFeIaQdSaEqfynGMtz2/GaFELpdQCGILcZ9g/OWXt3E0MiGesjXmE
 4pMi5ODHH61YssZwqBXjEOJr1HD6RFpfelG59jIMISxE2xtaX8i5TPflG+XYFy+Pe6Hl4Iuah
 mIQd8rZyFm4HD0iKCpnVzJUkLsZawIQ8vP27fYr49ijnr4dojItvqe9sxq0UK8jC6FrDduVFV
 yD9amApZicVyr74NgJd4LyLdGSJYdXIA1G0m7q9qoRS8BnDKhMS7R5LVB+Ueope1sAJBiVpp6
 6HYvLyAyBQDrrqoDKVBt732fe+hE5fQDt8Mo2CVtGf2NCNCToRO58/HwEt3EC0XCxuGkhbKmp
 6MWBO8QG2Zoiw/+TjUS3+D2k8QOKSN2fFc9TLj5DPRUViGYeNJHYilk9E/JOi3nUE0VqpUNRT
 nJaYwc85uyj9h1M5cOifNHhK4HpfT3xzgp6gJXFT8xBHztUWOuMjKb3rT7AYMlT6UHXKHkzAy
 OBCKH/0qTZmHHAi/NgPgP/CMjfOPDwuQZej9/FxLVwoYp4vdGIWoBCwcexnZTCw642sFpeunv
 dGU/i/QzRyyvtp5BPXMhe1khXTPNh25LNYvs1kRURvfNNCZu6kmWm0PY/t/YVRb6QMveshakR
 tZ4WBQLqlqq5/+TKVJ8U2fd2CSMfTEaCaYwg+ObLe5G5Ej4eRtL7RiufChQ4UMkAHGBxNQOTb
 kThprNvmicVgtLVuZAnCfrEfHvkJfvX6of4XU/t52mLdFYyuwBDBNoxLPjkG+1/OSJMun2OLn
 8fBisZ8wAj2TuZ7h4jDtTEAcw5yF6cKB1S1/OamztnMqUrM1uGI81acXhty63yGvQXo6k+51+
 gfkpA3bCeJm7/yIO33x9FDR8GPZ/9YqK+Rrp3aKmWjWx/JqPmK0E1F1AazyrDakuZVQP4Ov+P
 ZOjWWKVK3wRoLtlK4tsf/W4mJDZ/5oZZ+0MWE/FcXbJakxcqjh7b76WOGz/PqSRqZ5RjI0VbW
 3R3lbnvriAkLCWCMgTDhotBS/XMoRv7fxhMF0mCn4dl0oJsFlmN2q/HkEbtlavFzX46DPBSG0
 71sY7dh1NwLJFLu6pEI0QFQjIbcpqZNHsSuzekkncoCA+05NFhE9UPcjfiGCUXGcbjMRegXFM
 Ou02kPvMkQtcfiyPfNeuF5hCTg8n7nno6Ho3Rp5QbRLC0q2MUc50zlWW2rkHsFrjH+FBxBKlU
 nBrtB1ar5rdo1GbwwuyRHPXXnN6WIIh2YPcpixgYPxjXt0Blt4e9eV3elIf0ibgYyPcwa3dFm
 NJ2F/EsNhjN/cMx/edIDAjLm+FzKVTsSlLEkXVIJxgjkjWHuQQiVYX7a2vSOSRmU7y3t7OQSL
 XQ37GDjykvF1DZM1/ehRn1gJiiggDcf+jH8azLpa18LLApLvwLaCS4Q8OMjH3wvHlp6ssseFc
 1gIbOf78OvexN2Serba/YLkevgF4EAfGu9fhcF77LeitNuS3UYf8MF0E8Swy5tW9yhQ8juT48
 5kSWbSIy8YKR4jt64vBRbCQlRauwBGxDsXM3Nzls12jcL6EyfzLVuJ7sIYsAV3WQ1XhLhVnMg
 4FRNj0ZszRdyIX1EPom8ZcJrYw6tdTJRakpM6npkMcbv4eM6ATWlYh810fJdxlPsJeYapLZMU
 r5lBmCu+NEMQPW/TCAFF1Kqu0uRWIDTUWe6kB4oNGmeOmBgNO6+jL2VYlvIj6n0WxCBprE366
 ywP7PUw6uMwULUGw==

> False positives could be introduced due to allocations using the new
> _obj functions.  Add these to the "safe" rule accordingly.

Can the SmPL disjunction specification be refined another bit?


=E2=80=A6
> name has two possible types.  Incorporate type informationt to avoid
=E2=80=A6
                                                 information?

Regards,
Markus
