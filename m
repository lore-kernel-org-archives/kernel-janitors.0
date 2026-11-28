Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795883829;
	b=0dxmJ6y1JMdm3JPwUxNeCm/3pkWDtznCrQ3F5BYBKBqmYpPz7YeC7qym5T9ushyDusGX
	 ThIBNKJsJuOl7CIXqjo9Cdmx7A+tXwwzEcc/XalwiI5rV3UfD49yRY+/dx8GxhtIhgJHr
	 pBqJqspwXnenzIZ+UMH0lbvyXEhxZhx/j79iSjH1XHFMyZgxUM7LxnDG66rh4ar3SftqJ
	 X74RcXVmniwb8RleJbOOel8qn8yu2G3TnYvzJb8Rx7anv2ZMdYfPkxtGobJAK3krYde+D
	 eyvVrmU0yvzdnYSQu2VgBnzKtv1+Tsm2NhUR/pOGT1V3OFluLEeDR1w4c51l1UKVbog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795883829;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Content-Language:From:Subject:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=GknQd2Qx9591fM4fbBWaRbd40/C8SWFXLgVdFHiIxXk=;
	b=hRrQatlnB3zlbGgbO9qEAcqK3Ug9lleN4cB6WkryqQaeepv+WjgykubWPKyYMWtIkF5h
	 9UBFLvqo3AbVc1XIBVZXNvQBKQ2n7Oty+jWLS0QLHd5ivb9TiDX1aF4FmH7FnMtOs9ejj
	 vuOwj+qw2GyDINzL61Ekdgom+Zv2w3x7+nUbEU9Our6LSWi/isEtj9nbamMY+a+bWRzdC
	 S41gnevQIwnh6zdKsfxu/giAXGNPwLQl9DgXjAxrHKa8RBcTY4+uY14RTRbsPp/ICWsNg
	 1xwnu3x94XUNqS9MeXBV7KTI7MHLkhsoXXHwBunYzOlZl7vW8xzPyoRjOXIqu2O9k4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=OujwhAV7;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E017C606A31C
	for <kernel-janitors@vger.kernel.org>; Sat, 28 Nov 2026 16:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E017C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=OujwhAV7
DKIM2-Signature:  i=1; m=1; t=1795883821;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:oSdAlgQQzoU5a0iCWjv5wzPBN2hE
   DUGj97YUkmqO9xdygpTud1UoQQ8dsLMcYkCnV3ELL/xDLlC4hOl13tvyn8YVWvD7uBIgYl2nNYz
   aAh+ey5CfKhq5CKnoiAupn8WIp8rTlztSqFkKBzRML4w4QuPp+nGv0Y9ol5R6mY4G65gg5eTtPj
   7w8NE/eKjhSpb17ueG7YBF2WG3tBI2i/VSh+wNeF3FrYuqH3EmfQKkqNjtvrgYbhHTE7VoFAXQo
   QR1IdePPm6/+jUlYJ7gIFCRnHojddeNaMO0VZBgpEA45EK+dJxDcIMlE/1yM1Jc7O9TK/RLBtWM
   SgbgFMRYR2CE3A==;
Message-Instance:  m=1;
 h=sha256:
   WgB17EkdWDxSZ0onmVZQQjXHvjaLZ0ZyXXeZ9Xr939Q=:
   UJmXqCvCjAA8CCe17/G6pUtwP+X8+Ar11eqfPauZ2j4=,
  sha512:
   vO/kAHeYNCSQuEXIUvl43mmSwF1Yxw6DvtmBqbJq0f9QQutNmnQaKpas2+Ua9LrrJ1WGurtp6yMketyUcWbxXg==:
   Dd3hb0VEOYxlKodmER9KyoMZlW4mlqGGGmnkC0+EmZGU58NJfiTF9F5Bh8hejMNz5OXNTPqb3N9X2+yB8coZwg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795883819; x=1796488619; i=markus.elfring@web.de;
	bh=GknQd2Qx9591fM4fbBWaRbd40/C8SWFXLgVdFHiIxXk=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:From:Subject:
	 Cc:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OujwhAV7Qp7NDxLN1KpKhZ8PwQZ21Kdlmq0879JHwt3WPzehapiiHZEXv0LH8Q0S
	 xAeptoM0xvWAGAWwuusgQ/pc2F3faQI2cgIMd4tLwsHOY5QHNLRM/XxbtLtHuQjoO
	 cwm9o9d0Ig6u4poRESI7KETZKuw1Wt4wv38nT2GbQAYtcKwOVOMQIRx4DB0MC0FTF
	 CtVd/W7L+8V2DfZlmYSBlVr+JvmKvPTho9atBkpXk1dPKh29emj+2Cti2eBSmFo9/
	 16kVK3A1wUaIzGqEAL6hJCCXHbqh9q785H/RdyFSHz7ZEvn/6QBARu8rDVCgvKOy/
	 OZRKf1z+gHuTAkUBIA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Ml46y-1yEQWl2EIe-00i9vJ; Sat, 28
 Nov 2026 17:36:59 +0100
Message-ID: <1dfbd918-ad30-454c-88f5-8d162ab469ae@web.de>
Date: Sat, 28 Nov 2026 17:36:52 +0100
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
To: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hans Ulli Kroll <ulli.kroll@googlemail.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH net-next] net: ethernet: cortina: Use devm_clk_get_enabled()
 in gemini_ethernet_port_probe()
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Fabio Estevam <festevam@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Frank Li <Frank.Li@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cIiCPwDn8AFH5sYq/K4NmTlGPOkoky1NQZDqm4kujsBki0SYErZ
 lf9uZvXBlSFFN2+S7PFsVzGfywU9KxnNu++rY7o7oZvE1RYpwaPMaiGy3sx5rlpnCmL2qgt
 N0TAiN3EaktZGe2Gc/syINPCugdBmIbXFnS+DcTmbGIOc4PLZn6Qi8n5t9MN9Qi9VonYT91
 +/LCbGc14OOF3wou37ZLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:gtJf+WcAUD0=;1Y8QeBgf6dBvaoQj8kY0LepI8bU
 qigGuKZrUf/NTl8FRGLNWKdx24QcYcUbqTGLTK25Pg2Alrsz2teSeIE3PQCpJ5MgX0Idk+Ajz
 CJ6DK/jJIg8iiP19qI4+42MWiSjf9hm+f0WYM7D6ExfgeFGlwzbkSm2ogqv4yduPPSlOhZkow
 XUxdrpfoyviEYHVO4luGbMDhwGR+g3MB8vrQntYTS+Go+cMQUhK2DpMwwABV06mDsVUia1qWe
 XHyavoIU8FEwtMqurgae2cbCo71/tVlHQAE1CgEsKVFaz8Tlbbxn7J/O+IbCxq4Ncr7ry1BOA
 nWFOrN4Gki6/OHqTfqfSJxnYGObVE1UlNgdBJbRcBdkokS/j3C8GXnul0Ulhzs+kqfNAyHeS/
 vgVQlJyxHTeGSrTsN5W4/l6xu0udWCvobE3y2JKsq83jCqNjq7lEeSnFGkrib9sh1UObyh/cj
 oRjJOTyD7SDKIg+sAT8QPdXGlKliXuj4LQhcXsrcPUDu5bRn+GFvLWxaaMz10dSxtSrODfEIg
 UgDm8W366tjtK7ymCdLjlnuPA+mfxiXIkN15mDl0ihPlCZKfeMBngg7YNqixG3jgGGV4aFPG3
 rGEXrw1+XlVEgUAnYHPimea2VGGB3IThLlII/flLr7NAZcv+3XvesvWd/tsCBLus0sEM6Tuym
 7XITW5nFnajIOm0uTf4czTwAAXyQvMn/Z9N+7f3P6CKAwuAXR6IkcnUi31lIr3pIZtjCfxVk0
 Scva+WaHtM+qcSnoUgMzbYPxLexdWP7uoYPxs6uHUni9vkRIWFQsFAlLQbFn2UButHmEmJhFs
 jQUkbiU409URGn7T7h9v4cJ92nFX9wqcONn3aeMKLp2o4H3fo2SHJneMV7NwP6Xf6Rcd1Vlq2
 TwnpClEJQyzvXikUmJE3sU2esqxszvm/eDlxvf0j8yr51FkGKhxBz1g5M0ahcoF3f2q+OJmZA
 pwUZN1cEYusWgbtsl6CWtkpxdxbo9otEjwVmw7SQYAgu50SiwBhfDK1fsjkdH7vjwV21ssN2r
 EBTu1tIGsPkm+UTRfhQsnpaHKDLEz8YClMTnx29FV0n1RWPvFdg6ubX+zHfGO/5/1YJ+NdUib
 vxQjD4Wk1B8hoHu+18c50aeDvQ08BFGMTuGodOH/g4VgjRQZbQvis7sk/yogb1uhzFtnDeBQX
 i8zu4RIjHK8KFaoDEY+3MO/9FoSm0gHEjdzAIXWfgW6X5Alnr8RlDfbniZ1NzHf4mtnrYDRKN
 NR9+sbdzSgA3X4UM9+TXX2lOf5bGOdoLmIDJl3JhVb9+w7XXnyOE3gT0dV7cp2HwLZrDK0jxi
 9CCmjjlbnUC2s+ZWZIOgMNY2l86fcptRItbONZWBTdYY/XwyVKgsowGALoPkVGiYboElxmuMw
 Bg+xnXaB3W72/LhyFfg5VmJFinENlSJhEvqGkyas/6KE9B12Qb1bPTF/+yG5Brs3j89CDmUFs
 cc8oN0Ltwf0c/Z4eByWvWiB3SrQXhDqJ57ujw1X1oNiseqMNa+sIohDnVR7Eo7kMTj5AsODEx
 E0owiSWKfEcd+ryPKIojAG1dIPG2gJz6nL8dYBlBEWEPgEtkY8ligOgiJLsoSCryFlPHkAb+6
 X1Kw7HjYhzPK9JKfx2sb44257hgzgUn0MGh9AGRpdyWUX5YnAI8SFWl6rcLRRW7mk3yEW558L
 1nDnuYQsffq9q8sNCovnGqwJprQ8AmAfkaQWojDn4LtHdgz6joESfttCACAcIPWwPm0Ypz6Nz
 JMChHEtjVFv1rMqsqB4cLp6z0t+nSwyKa3lsUqybld/yuZlJYrH/8KQ2A0rhO+pYxv9ClYMTv
 4fIdKgAgvlC18Xgk7+PBon1VeFZefz0QKhXh91JIhM4XA0ikjkCyzH61oyv4gGT+DGyRpp5ld
 ZXx43k+BvOAMjCRv1ABs6j6xj/fOvxvp7sbzWAoRz/y+95/m6LIZu5MNo+jcrQeQS01jvRu/8
 WJzH9o/pNwNckvGpAvzhRuSTopwXM6ka6ddY9SsUa2P0NCxc4Wjy6SlYleU3ho4CvEqu8P4oP
 Cr7/6rDjfdmcToPIApBELhI1OP7h54/w6YG934pjnARYv6ekGUFAILplG2q3ma/hChZUZFp15
 ShDoGci1TUXwv0ubNp/1j0YU8jOet8syFMzLEp7HRKsqw17D4UwFDSUZ4mKS3bjttYRoERrqP
 0NOtrFXMXyFHg2YiJnm1ZFOZYjQRsaSaOFTa094jAxZVZEi9sdugidBE95kuFnqhwroxg+4yQ
 U5ds88/K6uW4JndI32SyUfHQeHJVevM6Wifi0FsisADuyiQCmz8R0DMQ9ylhgn+OegK+dkY7K
 WYfCIs1MyGWzIG8B7Q6LxWjpGFklo6Jrvi+nDsqxM7f3RZwcH5smaNU3SCcrJ+Qwxvfryl1nD
 6KSBAxaEt7tQGCsjjPa5hlper3PxqfdiVzPYbezJkSrL7LruCWcOd6M66lgRGEuilV74yg3Ya
 bS8aQtMx43U+EPuSCDmSoadMcwDcTPmR+CwFvVjATnyfqxX9zjMpzeUIkMrmON2yjMe1unfcB
 CHPQJ4Wv36b7vSqljqOYdu7n7yHOd77cb0ve93X/jgb/0zKw+yP+2Z0gBF1sfJOL8t9Ec1lvb
 7bHTxpAZyqCGiVWsYSpy4KIr2/mfwFjMeZd5iaa9bq0AlDRgn/WH+VW+Pr8GsPDnnsDNhdyCr
 gq6ZbstkqZGYv6/P5WvfqsKjlO38sjnrLyOl4u1HH+9qqTeFSKnUvgIg/61ytC+6Lh3U0xmaj
 V3xZPd0ocCLwl6P8s/JjFaHrDZmYPm8IZkCH7FuGH1CZxdWL6N+bOmSib/cV/HCgbDh+eUrfN
 vr8n5j32T0ihX5BR11FusQdChBJ5N0p9ttBfGRdaWic7Wsa7UT0lIA4ju+YFqNjp5W47mk608
 xnxPlGZ+KaZT6w/eYEA9bXgBsq+Nmg7bhw34SyIOMT8LLpscwO9E4YkjurGtku1OO/diOTtr0
 W1nQbHAAc7QiLWcCYv7EpNfpEqFVQOxq3f8lC5nDKb/so5Cc8SU4iZguWEyfd9Wme+ZfC+LTS
 P9lUYxIsgGpNTqtQp4syE8yCOh6sbfX0LGK2/lUtLXOXSBnPJn+euopmTtyfcuRh9MedJbx1l
 MprUEifyg8faeczkq7boX03fDFS+ky5NEWY8w56nBjB/cNhg8P+ctXDn3MJSZOQXNeE3WNxwD
 ZPewqOncajb+gtjYJWvNorQUzUpvSMB5hT10IWNmiivOW11oCuaapNLHXQeB53a4Q0v3xHVFj
 Sffe3RDMCKXY7hgXbmTox9o+O8xONtGELgblJKl4XKjSLCVZe34WKfuProUAa5zXBek18a8nt
 bry4xEHsKYMWNYKcVvPtr/BaHw5XzP+/y77bICbs8VRQM3pVMr/g0zWsF9A4GmYPHP6FUogr5
 qCRGp4MPynj7Od6ZZhkRes28gx1nYa8MdVZ1vHr+y3no8gJ/Jc3P5dxDmRh9OLeIv3kFoWG5c
 cCeeFUVdn7I9OVj80ybOIk2q3BSTL6e3Us97uoHp7M0QL7hMyuZgJNxydVgn9WzI3n7gmyZfC
 /ul+TiFy0YEb/PWYDvw7UZFkTZqfZVCwuAcSdajFqHx5hexK3OHI6aVx9FSJ+5AFmw9rmlDdw
 yRpEJaYyWAld1rYFF+ElEh7S1Q+mXFTH/FJjAZy8Z1s0vlFmKiIQadiAPM+oa9TIi7eQMA4Cx
 cW3JbZUYGGMFv50rAXAJnthDFGAw/KJB3WPHkR+S5fabShKYZWWxSrNK81UVikM8RrUdoML/a
 rUmywWSQLDozPzFdhuCjH3ZAt0XKO8BFSsR8NKfEdqFV8ZweLafpe2lfJlaEV2bzFhnV66tZF
 e2sJdH8oGimxYMRrd4FZ2VgeGWG06RYjQNkpC5xO3vYiPM9gpsGL95mzYeJk9DD4irb/72GET
 XCvUJwjSYQBPY835NcwYT6IRnM5lqSR3YNFWFR1tt4Fkr6W1swVSq4fgdCCS4LkSFXLJL05IL
 /zJ9zZdJlUXdaFloBawxSUTsPOmQXBK/e6D+zdkUU6z8BIUUOFjkgXWsIy85kzcaZVCsXnjP/
 q00cHvz6SQITeIp2Fol5UT5N0daoFIqQPK8Jug3hsrwxehORXsfy1tYtXLaNQUL/TlYy7g7XT
 upTpoNLBxw0fkXh5f3hPF4y6CaMwGOKY0nxWfU5qJmh9z74tRzJ+614S/3TUqLELzrkgxYVdl
 nlqAPRko4N8hojQYVUQq9TW2ITEwEl9zv/BXi7iAhJ4Vzh+OmWZseVCFT77Lj/qxymkp5PbQt
 ccZvKbtMEx9ebWi+1/H1AZluI8UESpwzSQc+94cf4JLMKdYD//j2MTTHIGImH+BsRg8oTmb9Q
 PBc3WTAZeKyMq0ikqLDGce4NdZb/P/T+UbY6AmkoCrCdlC/AFFZKzg6SZf/9nEGXaCM3G7FY3
 1e+ZHqmAiGyoJXn9Qu7R9pYBX6vDMscnlpO7LGQ4KlNnGRBIl4O3X9++ZjfXwZ4tEhU5B7/vq
 OeKkBghJD0ZgzC9A5V3kw4mN51rZqZaEX8o46ZvUIZTOET8spc1UkxDUCoq+RI/GkGWdAigGZ
 VUH0OCNtrPzbD9WdkBXOf5ItJL8Lo2lqbqNd2+S3Bj2B3KXWWbb3N3X/hMXm4y5je9xIBBYGd
 v9n+j31h6QPZeNLFM5cbTzABb2tRVHfDTrfl8zunKpswe+UEdBJd+bkplR+nhSJdfteZRtyym
 NtX3v1WmMB/uOHJa2Q3Yn282/KOb237kBisPQRqDKEWbcjJH0kXfkL+YU/UlYMBzWtWjumZCG
 K9u0u7QR6wz1fGZrE+h5SaLT4tmz3i0+MZuemVJFncl/vlru8vqOp3Rdua0h+QehOXHWUo/ed
 vVwfPamazmxU4scBSJzSPDTpmh8raGa9BXylA/hpidOuXs5yGhTa3ua5Tt3Bvc+nM82UQu+Cw
 /BDwtSWfG2t7pAJb9p4PguV+Q/HAQjjcMVAND9clPKU/efkvsrEw0rn0GjelxG8+bAcL71eHJ
 cvsIjwAMzPOcJazlib6lpIom1UiQ0vSv4FBfSKtCveKLmPlM2yXiTgTl6jmVNEqfMbeY3EEF/
 V6WY0R+SruGPtcV1c0usTmsY6tfUtZ/xn+bjhUCynwBtNN6+uGvdWp+KqHTipYrjROgO754ip
 p60mskRh3AEa2X3hwhtAgT8wLFT7FIKlbDfxVDjs4TaeoFd/vcXo/oou+kpLcZQkQHLC6cMUU
 OBJPl/Sxwu0iO42fykFY8oFGbhIvtn550zV/WmWrLg7tSKi5KVuYewzomkUX3DG6n7GOG4p9E
 U7KntV0c3zJ+68b3uEtrDHLLiKKe95bIiQBHkI09FbtWvHjEifG4KNFuaDBKv6h3QGfb68ezd
 KTLKHMPH4EoQGuJoD7zQAYL7zpjMbvHUmMvKbTfYuuZQZ16ozWrdHO/yB0zxo3ccUO5H0stGH
 rfrMgKI4+8r4AuOa2IR4Ess8YLtcdVE8ufG6T3fzn013CUtRS7FCjDSfiInvJNIPsTV78QDfg
 m2lD6SejFbORPRGgzzG1Y8pXg+XZcvC+k/OuXM6TKu0a4WdeZgio7RQTCOwnXSU6rHbWkKfoA
 sIphhbnkOOfUmCHdqX8EGf40QZCPgbysSvvqiY/rkLfXH66pwRWmHkNub+5t110+ryb9pcDm9
 rHxeuz52jyRQVBbJW2Go92mgSsZGa7jLcrELANjSyck7zTb1E7H/c4/Wm8WAU1PnnLlT4FGmr
 TMrKBeYLHS/LZwBJpPu2Tc2DaPK7xRHCzczFwmbBbR3/FefoTbatqZuwWZd+hve4AqW177G7A
 ncjf3S3EoidNxbsHuA0UDzIJmYwjsviv1dPJFTz30nvB4M9Gbq6Y0tgfpXACVid0eqaACgFhW
 WVniwEE27HMnSoU0S5goKujhpQY+CHrahYnQ+crfKdGXZfn87n3AnsAQsADBiOCpM/UFw5rkt
 Hd5fqS8FotGmYz6E4xmqiqkNIPFCy42ms0lzj3hKhRm+aw4I1u6YBjYOmyK5CBPhDIbTl7lxx
 oTjKtJERO8xm8JvYP+Ygpc4Rbavv9UadNm55MSCvSghmkFYOVchN9YhoxTVCVsQWZe81JcooQ
 OQVgf19dJWyHHzNdrZXYe8hy9mSRZ6a9Q6A9oZTWCZtJWGrIjoP5T2fZD5yjbSxmhM9ZYFUez
 YlghwmCTDc2c1OtLVRAgpC5vHz4w8rz54adS+XmAP0tNaASfj1WcbrkdiqoeJaX17B5wen5kG
 9VFGD/BpNUI4gXNCJWVZtaFy/dGuJVwf444Yvf7vk7z9x2BCNEXjQ2fX9vyjBhrEDI4kya7kO
 EDXLg3IUZH2VRjDdHZ3/ru9U3X7KGV9w8oloYNHMGCGu/IEpVMIYRfxcFMrJDsiHIhDAyAu7V
 /HgfqVK92H9VNS1dsrxZgMFJU7dY7eJqxkBpHgj6w5ZeTS01gmhZt/eHVsvNlvGkYOBqG6EEk
 ThoLo1WRW1pmwlG9bN4Cym51GMiw3/0g1MIFRdhBN7EjBGiSXPSHw6gufoD0tHyAz8i4d6yMJ
 D7Z1V9WXisiLDZzBngt1P+JIK+BoSAejkDkRNcjqOuviSRFPO22gPlTtySzULKEjrAjpIxXyM
 nlGXggVwQaEgh3x9zk6cs7zHAwmluue6J7C/ojrZ1uVNBo1lIEXrdcs2L1vO7kdn5cIrjMIvQ
 lNt3LDFO//4Ae3B+STGS+KrwxJd4JNfnb8hlkBdbQiiH/jB2haO3p8fRNFXvZFS1R51G1rv2Q
 JWKrrh1w4xFQNP+rysN/VqUegaW8eyG6WjZXZIgzbzjq2NjMOxfhhWoASUhyxitSNAtxNsmuH
 IC+9PWTXB17QqI3CSiOEczbHoLd8FC5OByHPn7VIQqjwQMtckOq3uByRRZllyGvh8dG5y8xeV
 54XebDr4EsD1NCF4AXazWyLZTOvJAJgtPV+oGl71gqWVOy0SBK7xybF3xuiJMqSvGW9eFF24P
 +LjMywpnR7sGknFtVgbwdFc2bKOtC+nz2VxNaWUcZ2eNnbTT0c6iIDye2ss09UBgwnU9KdkfL
 WM+uQtXP34slgqenWo7EGTQQgFx0UtnOZRaU2UNMBu0Se3Xuz6B4H16ppYTi8321Op0g9bYYx
 MUU1NWtVkp//W6CSd0gr3oKghbHNo8=

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 28 Nov 2026 17:18:49 +0100

* Reuse existing functionality from devm_clk_get_enabled() instead of
  keeping duplicate source code.

* Delete a clk_disable_unprepare() call on an error handling path.

* Omit the label =E2=80=9Cunprepare=E2=80=9D.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/net/ethernet/cortina/gemini.c | 30 +++++++++------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/=
cortina/gemini.c
index 3ed8b1ae0bbc..73842a4ddf99 100644
=2D-- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -2517,25 +2517,19 @@ static int gemini_ethernet_port_probe(struct platf=
orm_device *pdev)
 	port->irq =3D irq;
=20
 	/* Clock the port */
-	port->pclk =3D devm_clk_get(dev, "PCLK");
-	if (IS_ERR(port->pclk)) {
-		dev_err(dev, "no PCLK\n");
-		return PTR_ERR(port->pclk);
-	}
-	ret =3D clk_prepare_enable(port->pclk);
-	if (ret)
-		return ret;
+	port->pclk =3D devm_clk_get_enabled(dev, "PCLK");
+	if (IS_ERR(port->pclk))
+		return dev_err_probe(dev, PTR_ERR(port->pclk),
+				     "failed to get and enable a clock\n");
=20
 	/* Maybe there is a nice ethernet address we should use */
 	gemini_port_save_mac_addr(port);
=20
 	/* Reset the port */
 	port->reset =3D devm_reset_control_get_exclusive(dev, NULL);
-	if (IS_ERR(port->reset)) {
-		dev_err(dev, "no reset\n");
-		ret =3D PTR_ERR(port->reset);
-		goto unprepare;
-	}
+	if (IS_ERR(port->reset))
+		return dev_err_probe(dev, PTR_ERR(port->reset), "no reset\n");
+
 	reset_control_reset(port->reset);
 	usleep_range(100, 500);
=20
@@ -2596,24 +2590,20 @@ static int gemini_ethernet_port_probe(struct platf=
orm_device *pdev)
 					port_names[port->id],
 					port);
 	if (ret)
-		goto unprepare;
+		return ret;
=20
 	ret =3D gmac_setup_phy(netdev);
 	if (ret) {
 		netdev_err(netdev,
 			   "PHY init failed\n");
-		goto unprepare;
+		return ret;
 	}
=20
 	ret =3D register_netdev(netdev);
 	if (ret)
-		goto unprepare;
+		return ret;
=20
 	return 0;
-
-unprepare:
-	clk_disable_unprepare(port->pclk);
-	return ret;
 }
=20
 static void gemini_ethernet_port_remove(struct platform_device *pdev)
=2D-=20
2.56.1

