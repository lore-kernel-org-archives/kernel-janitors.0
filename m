Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674729;
	b=IOqHhusuS2sH/ro6vqYlR8MTNKTzY6rJ3wA8Mnl5xTfvFSeueOCuwwUkSJ6PRMHpQvm6
	 oxD+4PdFTzDsFy+bcTJBarX7cz6gVvkG91tyPB/IvwSl0hF8i43GEaQhtIKy/Uc3qSXnq
	 y5hWI3Wo/yxYbBKaFdUTg++v0A6oWJcx7Vba7p8GZdKDAUHTr09eiJEZJ4lzAavvPqtrs
	 38K/kN5Uz3c3dX/a5ExUfUkTw4pqjrbibKnKhpuAy/LRVygJdaO7Ga2YbauYXNGQ6+9+m
	 u6QGsQhYRBGcRn1Wq441w27KdReLhwyKrfGRMUD8ZHW3UtHI9GvB7D9F73rD54TzHPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674729;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:
	 UI-OutboundReport;
	bh=ny0Mgc5RtxL5QSvd9R+t1w3N3WqqSNiEACA4Qwmx4fw=;
	b=D59Tl4l8PTOEXe0PAeGTdkyA9vGwcru6gmSuWgmeETiJJeXGE+fGXhseb64t9H24feJs
	 TyoVXI+XbQvgSVaU6b5qKUVUbK10fZYln8FQjJ0xMTtBq/tsJhb36E6F7SHpbmmXhq02h
	 8pHL+hZeV66YOT5ypiclgS47yHT7UiBMNqkmdPzBiyV6ICg+EmYULgw2EI5zJZp9RLWv9
	 FXo3G8aydLn6bsceKv/5B4Ah0KQwCZ+CpMoX3bS38iSq/tMXYBTAJcMzipuoqAwno25/P
	 hGqF6fE4bwI4La0VS4hs7KiteiXzV1GlP/QlNJR4KOB91gJTW+CU4lZJpZpXLoIM/HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=web.de;
	spf=pass smtp.mailfrom=web.de;
	dkim=pass header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=nJn9ZKVD;
	arc=none smtp.remote-ip=212.227.15.3
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB93606A31C
	for <kernel-janitors@vger.kernel.org>; Thu, 26 Nov 2026 06:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB93606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=web.de header.i=markus.elfring@web.de header.a=rsa-sha256 header.s=s29768273 header.b=nJn9ZKVD
DKIM2-Signature:  i=1; m=1; t=1795674725;
 mf=PE1hcmt1cy5FbGZyaW5nQHdlYi5kZT4=;
 rt=PGtlcm5lbC1qYW5pdG9yc0B2Z2VyLmtlcm5lbC5vcmc+;
 d=web.de;
 s=s29768273:rsa-sha256:uWd9KKj6/qRH5UJTp8cbQrkPJGYn
   dtZ3Ue5PTkeEggyW5Xe5PDQvDn3Cg0j4nIm/z5vGrk/S+tLGIquhTPwvW4Lrh0VVz8JpPCJxVTZ
   mCdlDP18koArNm+rpuXT7E28W5KHfgKazhHMXElNqEDl1x1jY0aIj1eux/0+d0WBGbXro0kNGCk
   pxiXWgpXtQy3QT7UFuLJG/6lt0FvY1/WcZCNcPhoKybS0qTFM+lgoM4AeYNuELLYOFPTD9eY2/V
   Jg3WuZdAWqPeXDjddbFzKUk67s9wG/QPzNM4aJfyAWgNY4ADWms0E5ckwywCmbOqBXb6s5RqPP8
   ucsTBpaFdUBKuQ==;
Message-Instance:  m=1;
 h=sha256:
   xiPIe4XKSoBudjBhK+7cW2KZG1uWcdLFueatTMmVuWk=:
   ny0Mgc5RtxL5QSvd9R+t1w3N3WqqSNiEACA4Qwmx4fw=,
  sha512:
   60SnsDthn99nHOI+0ZM9zY4NvmyzNNf2wH82z7W1FibHyf5/pefZvCMn8D6bCsNJ5g+gewcxx0VcCC9RnbIShw==:
   eT/fOM9Ura5LH5erobhKTcDYRUr8w6Mb0/2gxxZF2ASloj+4BBZ8L5iXHAJo5jWljuws81r95vJ+ED57GkIA8g==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1795674627; x=1796279427; i=markus.elfring@web.de;
	bh=ny0Mgc5RtxL5QSvd9R+t1w3N3WqqSNiEACA4Qwmx4fw=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nJn9ZKVDVIqtEQlPcnvSFLSoPiiwOoZ8Uv5Pz/zLKQBW+C1XxLQ5jYzuyVMgqft/
	 lzhs9K4HGog3L/mapvAqDpkWRmtAGSlgIfuDb+y+a/65vtgTx+TDwIY5vqoVZnhCB
	 TsV1KjwnGMnqWkkfJf8Ubqz1WaWMsAabuob1sWqabK1ZhfMxfyXAxOANdg5SRKFG1
	 VXXE/S0TmYqgIA60L2ELJfKoRm09xMJ+ff/uFfOpvgM5Cji4iihwgRxBVm4X5FHSa
	 ONxdnGsoNfHekRBfq53xItf6VCWP5lauj/tgpXnPOyiIldJkLG6x7j20S7K/7AfmG
	 18UuALaaSdoeE1IqTg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MkVsg-1yEvEq3bLS-00iiAL; Thu, 26
 Nov 2026 07:30:27 +0100
Message-ID: <d11b4708-02d9-4d53-bc5e-734fdb363d2b@web.de>
Date: Thu, 26 Nov 2026 07:30:20 +0100
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
Subject: Re: bcm63xx_enet: Use devm_clk_get_enabled() in two probe functions
To: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 netdev@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Hemanth Selam <hemanth.selam@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Jonas Gorski <jonas.gorski@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Li <Frank.Li@kernel.org>
References: <d293609b-c8cd-4993-a243-89c6d1ace4a0@web.de>
 <ac10d9ef-b193-487c-b4c1-6126aa770c6f@wanadoo.fr>
 <603d7ea7-5d7d-49c4-a01b-a7805e88c361@web.de>
 <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <9c26b213-aa58-4c27-99c7-926c6b4d5275@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:39xJKwTZ1AH2NmJHbTdNBW4khgCe81xc1Coyo6tQGrNb8cvUC9R
 7+ZcC0EFI51+X3ohBd8ZUjbeibAfN7O8lwSTtsnL2K+e0CbLNYu6FBBAZ31t+gQ69yl+KJl
 /N8Pu9mvTNXNIn09NmBiKaLaafKxAfPzj22S6fPBIiU/BItR9fH5OulrB7y+yB9l7CztJaZ
 kMQgV40rwDahdNSlyrxow==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jBlqL6DO3Z0=;w5MXuOLwCsrYnlVEaoji0Py1WTy
 W8RwtWy/5KoUM19RKwrE3aKUKoGosQUTT9qBcxrqcEjBYILJNcQnKIEZiCg60FZJmW+6YbIMD
 RXubkY6iN9O46d3dRlFnVfH2k7LS7Pymbwjs5msbzXJk+oW2Tb573AKIqMcuh+y2EAreHUBZC
 ousymxFLcZLUNDzhX6bMjO4JA8RsirusCquet5SbcA8A+/NonRytRY2m89mR8dpHVOgGkca/8
 VDUdb2wO24tS7U21tH22Bhtps7m51UI822b0mdZVt/R+Te19DPb4EwAtUMGr9ERqgG6Eru6vG
 HCiY5pK1m8kZlQkG3QCfG8Dinm9fX6SFuWq4xemxl5mAApreOH5lYVTlQ2YIwikkFnHKt/SXh
 qRLjAZLImBFMPWrUrXfEtALRUjlvMzKzRR07Di2T1rcQjNh5BKUKq5NvVS9QL1dHsoAS+8a4K
 KoIT8Q2ZBT3wommGew6t5S7KJUI25844eeUEcn1uAg0hbAjinXHEc3qn+zmvT2GIHriFXzCBu
 JUzuL8tqQF6LMQf12uYzSaQg5GFi4VVpazr/g9ZkMb1HBGyUN6XE6cu2Ewh7ZEPB3NFz/dfti
 06pQbZEp4wHIV5eYlmfD/t1DsvlXbp9pUrh3EbZ246WrJi8g9qILOOjevjMCgNwoWCgAT+Hus
 dHAb/pkP8rHryS3g9oQHcXlFwY6VjJf+l+3ymW6sWyk4zBqw+g2WdG29JPGiw8dSxD8mHljSc
 CqfpuQzWfL7ej7olQFOS8xxwp0/PhgUoopiKvwDMsaAca6mWO0ZLqOqBSgZ/hvH1qoShyQe4D
 BpirNcPl3RePkMtjD3rr39VVbzXIty23KiNuVfzVPm18s7C7B6k//KyUz4Xi+1dNnXWUN9CKB
 1fr+nHyQpd/Zv0Gv4nWLSnBtgvv38uDp+cm26scICppXrA5PcBYjZZEt/vClSP/Oh/b+Oxgso
 MoI/7B1Brz+Nmh+q3NLSMYQVMBJfTmz3TAFO5v5a0fnEaAzQc0XOmxpBCXM9Xb7SgRj16x2AB
 08/oyjjodaNQVKO13B2fjGELSBQ4GC1BaDSFT3ZOkUW39TO5CAH1zBpkGjypBBrTZ4kFB1d4Y
 AqLlQ/SougHSr7j26QcdL/zsNM4Gzpfr0MRRQoQKhoEuulPQV9Mv9/5kBDzE5bCuaLU0QASkf
 jBXeHwVNSYJxYNiM0UPsO8EaX8c1dfkBmKLwB1sv/B+IvvzKZRgDLaTqjc7w1u1JaXVZqrn+k
 KMVMrR1b9bTM4kqPY3UztxXzsK+SS3BclJF+nQySaRbeCUDmrtvMAL4TAEhf9WRtrE7RWSts8
 5+dOesEc57mdOpo0JTp59k6kUDZeNFfjoTpoNThmpVdLAqKOO2DwkebtTIgwuufhdM4c3cWcT
 ztdaCyk109UCGOEfj62tfCdiOmvRBO9Z57oLvHowE3vkWyFbYf4z48t3ELPoRCShXq6agNSCs
 GgAldaWg29RWtVwnmFHBAtklsIxyWZoXNeuYTt8q9Jabn3j8o5gudEPBsOLgpgnTKsanPtaIh
 hMUFtoVShB7awgUsoZFhUCZDQEexftFXRUlcKrdBpbIL45RgNO6VM6IZqXWoXDIM5iBkgiN3f
 aJRlk72nLhTT7KPdS/VTcrykxki1VqiR3JcUWN7Y3wqlBGqpxb5V4pZy7hmmbr8XJP3isMCIa
 +ZmLhewCv6mCpaoCJulUspDQaQmPrI8vFI6RgS3tRy5mgFU4IFnwpLxtEK9Sb6DNnaws7EiwW
 ks18pKC4/BGSzFYQKiWp0nfjP08xv6FXsLfTqSpIRfC3l9zbMHONFPb0C9+8xEPyMLhOS7zvz
 +aM6Be3R4YMUpdKEw0FnttbDzksd3jdOqrflVjHh2o8QIiZInfrsVTzRk/1cniaGp4e+hu0lv
 g5aTFvCL3CCOEsCKIT+lbhQgSgMTv2++fhtOLG/fIsKCIFdIkhpdgqYmZfcQe5tqJjj92YLEx
 OVod4fgLjJm9bHy14d822MhKJcisO/PaR+gbIIC59UgKtUC69CrokUEkr9fipTMXu38XwpL+o
 SEe1LU1fht0hQRJxegXJbx+JQdOgOuTucOZIXSE2/h5ItARXop6SnrjnBNPJVbEiKSWDPXKlv
 6+yKz0ujPrRmJJ/+GqTlpTCvgIV5vDcA84dWdrisYxEOHdd82wB7ELg5+OEjXbaDnaXp5e5T6
 Wgbe9Pi8l50zC3B7rqftOnGdIkvfvmlcGP17uwtVzXlgkdFn5q2vMW+fqobeNqGxBadAlnS18
 a7TmK3H20/axOLhh9SCcGLNEhpNPATFzhD2KEfjGQixSiUwqJ6wEDez9KGdiT4XLQsZz/IRWf
 JqDZKAYfqtdcNtZoC0+PuqZChU0Yj4hjygptJouUnrAczkW1Ce1mBBjukjL4rGFpPugcmjqg+
 jM7es9D4L0hRZGmV6fr29FWIUvKLJi7jU72s8qOjfm+5rtsnGtv3FZqbPzRUYNMIGki0CeT/Q
 +6ibh3HPrRDaVwQYqidqYse27KwF9tSZs4wpuy5FIUvosaKpchSbJ4LE6Ll7gFT1VhFSfDFTG
 WvTfo0Poxr/daMNKUNlb01N6qWu+Cic3KNSgq585yJCKMuhVeJFf/4ZUKHYd46fO9HE6dQVMf
 5ZrCH0+KDrGtBBqJB9w887dKN/bq/WGRyOdNyhtCAJAUZD9kz0jPTvRcAnH8Jowlzx9JTjG/9
 OqvRCxZQaB6orC/glQKOzV5tdidniF7++M6dFqN3X3710/OlAztDOPHGowWls8vlE2OGjCZX+
 RTLCMI0AvB5KwG60gLDdql0sdt7lS014n8U+GvBCFT8yYtNx28ZDKQ3DAp2Jqgy0XkqYH10wx
 B8Mji2glf2Lq+I2kOugeMztX3zrc3Y2svTuH9E0uy1ioG5Z8/JwjOybHPYIx9k2FN2/FItoAm
 dbnTTmHyEfUQF78BSiwBUYjS7dEA2Cv8Dak87JWESvKcC9aS1zjH8R3FvUy9+rplWpZw5mIga
 24F3j/EQZ5aYariYQsL3B0xJjCOYtCslc++MqoGxM02zVhPmNu9GWKaWZA5vzA8GLBSWH0V07
 ASMh74SjB49YGdFOeTss1teMbj2VbCZ20TtXdxx26NS+T5LvNzYoklOxF5y6VKnBTnGiWyIhm
 VaWxonbPXY9BjsZg/liA3hzTZyCeJSdWvrUT/P2C3piGb7fdd+lSI6StDDKBqWePuz/QIlF3C
 Uw5mY7zaOsmKgfMajjO3w5s4WtVzPsC9j2FVUvEIMH1QN8SSgOTkveqqmTFbAwyg4HzGIjG1J
 J+OHI1wOt3yRzr1cHgrTI90LBGRA/+UiCa2TzFIN6HZlXhONL5krq0lSa6eL3HwsQmz0N6i3e
 Fu3gzsUiDOfFF6u/mQ4nSD2I20j0FgBwR/SVInft5jyI9Rczx5ZlvgPk2D0SkuZdk1vtZ25hV
 j/FvETxV8PoGUWpMFMdn/r7UvZZG5iORExPvCBGFPf3s4NsX2GiOP82DiLOql5ZctJooXBRqq
 1nBmglAFzJ1EUY03VY8unoEyOx8548B2wH6g6Mq3OEZJmGJ4308fkIRkiXVEkJvDlz8O7Myqs
 JPJ7WoT5usbul3l68daH3VbGuTzhRf54kMlpDyVXMJTyfUb+8HhCoAPMy2uqWY8sgcohYsBms
 nLIbwPTH5uAomBRIXuHbqkxPgs4FwGxF3iwhtsmnkWGxErV5m5w08e9BLxkadrnKOHO1VMV5N
 LJ8qnv4ERqbfriAeb+wOh346OROguws4ODW/JB7sEYohe8N+lQieisSYWAQGMk79U/Nd5GTFi
 Ta+7ZI8OqCC3166eg3KLzFrtGsfpUguxOsRZ0xPo3JXrb3MK2yalN941/alydBJTmxokztl4Z
 oT/9o5f2GzwwudX2U3S4pG+ByOtweN2Cjqhi9ClYLhswGknaY6CUHSxFOXNop6oStVKfwAjo3
 5sU8Kuof5rtrEunTOWjKA+PjN/ImIIA3dhPlwRkqZ6AAYMsqgUO1L+wqbW6QfzViV1iRz2opc
 u7SMtD/Y4Ro+22R61Auto0TmvvOwGQW6gAeJFbV55xBpwxGzXJzedQl+PMlPEhaX6ZgvtGZIi
 Z3c7ComAjbrNAlw1i49Glqgb3Qh9n0/LPSGOUaUONWqOEaGOlopnoAPUQCZ+BzsToq1nS0X+f
 Srx90G9UNWyjGeNSpTqTzUxMEAUfoPZKyhwhJ53dpfyljKj3LhRSqQA5LQEUBgcG68fphNJv3
 xgheo5x1iHZtxB5IM+HELGkaIPTKbELnlUix8cg74MA9IS0eFphq45Dz3jb0OPvtc0R1sep7r
 Hr9Eh7RwYq+yTBJlifw6OlI+GdV1L7G9IdIsUrbfDUIikRduoCUeYt+rRzuwVdgiqmm/VsobY
 +khvfA6JEeYOoZhSUHLjXyYSJ1bfU6iN4TLhh6Expbwcn+W+4738MmwJT5kRR5ipcdfGdTxhp
 4vRUqvz+aKgdrnU7ZzEEjKh7pbIPLjuJaKJI/FkGvFRcYKvT98Jmj8Z6vrGHukl73W5Es9A+C
 iplgii1lcxrLWyc6JOJE5Er1sZVPW+B34FG81U1Md+w7zlzu/YUazog3NpnrVBGvxidw+uCvu
 3R4UnhQjDDK1dKxCvnAeddm81TnT5/e06sNINapbIuNw1VwDBpJV/J0CcIeQj5LowMifUNeNK
 03zeqbbWU7gWBbmx7rKG/caiy3Ujs91g2rxhKP5/YX0q2JZ059hms7lkziuyTWHMgiPHpOuDg
 E9xcduwrDocHl6sRNaojhOrxj82XlphEGRWfpdSsgraqFsgNpRyqqJmLGejFhUUU0xI00cTdm
 uBrBUv8V04WcGEokdxXUcKDgcajc2H0vEr5W8Ki8d995G9lGc5NTlTVjvJr7ykxxoTtlFwFvR
 KTtZBdF/WIsi5e4e6+aR8PyDiYGcWoJMpeAelAAjMTrb6JVt7GSwlBXSeLOjBIGsv8AC6c8ZX
 UoPI0o/21nUvtv4LTAc5EGuEtP7lqhCR9nO70ZRsu+h2ssJtEX5Gw2gPi5LpsosrQZjhAp3UD
 mt0XGrHGuNcaS5XuQp+nJlIoxqT43izSzkSCgld3mz+CAiA1h+c12CazcLmfSuFwOf1WsX0v6
 XBJW9qx4BuecK7iM7XpEMfKsS4FVmhRm2L6f0UJJ5agrkMIJJ2coq8TpHxFX4hlmh7RpfgS9c
 6ygIdrSFbkwpvJVNYaFF5WbX4l4Nfd2Ei09eP/KtYaqV004Dx9IFtto7wzeMUAlzU/jO5ukwB
 M3DzMMTBVUA2a+uqa9WnABQX9INzhCSx5vRopKWo4R1EKGt6gCRRA17xtSu63uLtxddgdw5Rq
 tu8nIwfDclJxZfaH1Ci+YvrAI1hbJjCbW7BNjAuh2yhgB/iffFmL01paO5f3YxQhBR4JVr3uK
 2YObq3GGlkpc1fCTzk/JyFiRthY3xqTsbXvq3UI3DJLh0flzIZFz/OBQiitFdn4tXsrnVTZdY
 F/JXNb21jFz+snK8A3tI/5Kc3eSQkM8KfXRd2jWWoO5xpm/Mk5OpTqOxYwCoJg4SzEqJiIot7
 mlc784DIgkz1k4mjoJHz0WYRoFff5uXnlEzhFNOZJbN8IHjRG1hSEf77NVLqA8uqoYRDBi15k
 ON1JAUG0WBSMu5BJjBFoVhlQE1PHp12Nrj2sgH+iTDrETehbBD75uORSTnHNuksb+yT0xL1/k
 skf1pBnVzgUx/2BEbTWb2k+7ewNLlTci6tOmlk6AAiiJGeSlaWQKoH3UZP2/l9dNmO1GtvX/x
 5Uo1e5W07YzNWgy8rbP5WYzmwuGLx+SU8Pdit4WacbtfHcxM0O5iUAHh0etKuKS3uQ2JdIQ3K
 vDuB1Dh+3ijasCmpljbYSxwDe2wwo7AS6J/cOj+6N9W2E3MEfSUODcCAzbpOHLKvFySeGujr7
 WceaiSMY5wkaNX5hAcaCWG+RoNsMgzzj/yjEiZmscoMde4qxAHoEGl60XDxqhFHkL8IPVyOV2
 xrfJd2qBo33XvVn868jtvtVssS2F4rSsNmFmZ81Fkx48loo6mhjMJewphGhI+KTS/gM+ttlb7
 t5KLLzZ+YCtkwwhfLWat0g+DY42yTU9doySXh3FLadqWJBmPPakzEbVhqaXzshQ3oXziMCzA/
 uQyMqliksKRHZD4hRKgxOIjKKAw6aZP2d1cfzMqCS/2PLEgM3c/6jPhv5Jfd2UyW5yctzp0J4
 y7mlTtvg27PVh3UHF/02Rv6dTJYgyHnUTMxL3EFny11/nfLR7JG+AQTBGqrVbJ/Zan6kCRIeW
 tvr4Cchb1Aqo+oUiATuE85+hH5jzIYIis9N4Z9u/oUwlZLoPxoPj7NPsKjB8kkiRW1gkO0e9e
 s011uMSmnpAHC0cNFf7dHVH5DTwTYKZ8c/6Vtg2cFjBqFBG4RI7O0Y2T0H6x7wzNglb3bRJFx
 ip5wSeYqqUqhf6J+En8wYVKnERpGZ0N7AgeA0B/OmqHwNS/yLsvH8yuTBv2Wpwi/tLl1a2tuy
 +4qvUvP4EvdsQsrVEBgi/UNrJYg+vCYEGodjRFMQy0Yxxlgopw6w8+0LZlpj9m+sicpc2apIi
 vtgHNmcRz8wQlNs+J8hHUpXHgV5QZzmGgS9gViCFApq+cn4O/d+IO0isXba3ScsujyITJTb7Z
 IMwbHTodPvVBfyhvaL632PTDhh9sLwNce1Bk5ISWcUS2BSkgcNRtLQG5UmStQ5KwUVpzJmuAL
 P0pZS3XkzwHrm9jNHImMHptbR8KjRCiokSsaNqnrs7fmTgS6NIL7OB/KTacuiIVez5f+5nJ3v
 RpE73mNzw7I5kagvrf4u/zOKqdUtEcck+l1amzw3oNYtlkEFw0Akmcur6hUY+3bmG/RzTpPXI
 zBMaxAF2Sd6sgLr9bnr8dp9DmsrRhCUCeT0yEtYHrC08Pcyl5vyAfOPnu3GKU3gFu6iCPQQol
 EKc6XTtqYzCKkT2R1Kk406CRWQ4+iyn8Cea2nUcbVfoS9504kG2XwuWYBijkh7YSu28EZsYZQ
 zkhhLK7E538OD+q3YlePY/GCLxzsoYTrZgZAxASRzKlEjg3wFiRPc+f1V6LioZYUe++tI

>>> Why changing only one devm_clk_get()?
>> The change relevance is varying for the involved clocks of the affected=
 Linux drivers,
>> isn't it?
>=20
> Your patch is related to bcm_enet_probe().
>=20
> See L1754 and L1791. These 2 calls are related to 2 clk_disable_unprepar=
e() calls in the error handling path and in the remove function.
>=20
> Why only update one place, and keep one clk_disable_unprepare()?

The ungating of the item =E2=80=9Cpriv->phy_clk=E2=80=9D depends on specia=
l condition checks.
https://elixir.bootlin.com/linux/v7.4-rc1/source/drivers/net/ethernet/broa=
dcom/bcm63xx_enet.c#L1789-L1800

Regards,
Markus
