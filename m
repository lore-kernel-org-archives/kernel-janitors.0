Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE3E43EDAB8;
	Fri, 24 Jul 2026 11:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893657; cv=none; b=Nw7j+ywT8dSCRuX3bOFphCEBNkVpf61Sh22kFWksntopv+OPvWoYD+lmAopH0Tvq2CdwwdR+2OlVAu+2Qnir4BGT5/nni0i/YMemQRYzYOsgFe4pjoiX6Nvdg0Dr2ARhakZBP2OebAsKSPan75adr2JXAKiz2mCJilHj0zjGcBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893657; c=relaxed/simple;
	bh=ODF0RsIHpHHKTiDR8AaUYZd2gQ/ROATZ4JCuJI5Rbd0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hRaSFBD9CVGrNAtwolLwlXxLR2OQ1JeOXWQ93mdwo8iZevoOUDvRLqa2uyoBfBqbLkWZhMNvud3wxHCsS04XK+0L7tV9+bLz7NuZiMR/SrzCwEU6Tph3yqks0qvdDFRgsiiTYQFHkyqpv/X5mAH/zpqTgF0UKQ/Lhr93QpCRWQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=Zhfvpa0n; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="Zhfvpa0n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1784893648; x=1785498448; i=markus.elfring@web.de;
	bh=Ntw/EOGVN9PpnZCkOu+Qkg5qSOYZLdIrXsWgR2HU42o=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Zhfvpa0nwhcld01ua90qlNgCAAzXc7t/K0JUg9BzNsedm1cJt+VzU3zcAEKn0Dmv
	 ljxTWTZWwbXEhqjg+JulC+0QpxwQQ4hhvTE+FD+CO04/Po7sLm9ougY3bGCKL3C8N
	 ANoFGcDAfwf4jBicjEgjAA7Yiy0Z6veH5A6nAXUl1zNmKj1neHj+3uvEXwR9axr+P
	 SXdwg+Kdt6NuaMPjtpLaMLb7olN0WSufdoi7Icj/SIwjKsVMIf1rpiYZyMDNKPyHD
	 E5TR+rLNPtzcQ3XJ486aJ3zqm+TToxD76SRHYkaiZZC0Pa0joIUjsYtcsS26O+fed
	 DrqiLSAL2HzgNIv0YA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MqIB5-1xHMSx3GR1-00cZoC; Fri, 24
 Jul 2026 13:47:28 +0200
Message-ID: <152b1147-9743-4fc4-8b4f-7de446adfd7a@web.de>
Date: Fri, 24 Jul 2026 13:47:27 +0200
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [cocci] [PATCH 01/36] coccinelle: misc: add
 cond_return_no_effect.cocci
To: Julia Lawall <julia.lawall@inria.fr>, cocci@inria.fr
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
 Nicolas Palix <nicolas.palix@imag.fr>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <20260723184538.3888637-2-ekffu200098@gmail.com>
 <b0577cf2-d8eb-473f-87af-82ecc653f29c@web.de>
 <614a4d1a-7a18-f7d9-7531-64605bc24080@inria.fr>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <614a4d1a-7a18-f7d9-7531-64605bc24080@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:362C+FWryV554Vs5iC+/EJeKt256r+vNUBdpnHGhaVvyImASqIk
 081NIBKi5bpADm/ZNjygjd74JWzB6+SfQOMUCwEYppwq840xdM+l5PcfXqdzVqzx0ZdTGpg
 e7HbGUaWmuZwQRCS8oAZ4Q/orlmmxsiYIht2TMCwxGH0PGgoW8PyfzVBeIhLPXlkEaCo3b5
 Chp7fqRtFU5QlcROpwIXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:xwaSVCxxkqw=;0Nw7HPStRQ0x48uJEZcb9lSOnRa
 VXqGKUKcVQd+AUiXWBNrSSOli4AHp1JJzweSAr6gJ1CaO56JPwv+H6f+WJ/zveVYfoih87tql
 hJ92f1Hd1kk+D+KP458pdR97orE1tEvqgHeiy31rYhIP58z11sGJeup28ng4UsMGY2PI0ruzn
 w9Jac6QT7XtRfm4wxaIvrH5W7quCbAWOzOgs+cK/LpwlgZ2qshz7Dp74Vsl8/pJyKzmEbDBZp
 hwyHrq9prkGXBQiux/wyW5+4J2CxUirCgeOsb7olyFw9rdWfPL9x99YDugYDIgZ5+LhKhJZtw
 eFXm6vpFvT4Cp8BXrSMBbSFsptOCHEse3Y6j4KBJ2zqM0c8YQ5QAJHWzG5npBavV3bSTc0jkb
 rEwkODHMnJKpRtF61cjnBX98dB+82OO0P5PrhbHLmjLQULBibAhgFI5EvIy7tRGbrq3KaQrcD
 F+1ndA1+m/aldQCJGEBZOKKspi4SORanqOz23yF6m2OTVLuvIl9KhESdW83n5x4qz+pS9jY79
 8kyjRDDwzaKeR4lJEUedK87fAWdgd2F2wDF7aXBLIQydoFtFtlUck/w5W178YeUoG8ASYk8XZ
 RFLYxgIpWS7G6d+FsDR5bJCZKva8iwSCckq2hk9D5vbh5Fer4r30WZtg37/2NwnBRb5rBUVA4
 jhcENfi3bqUfR/1jrm6Fa8nRxNXucmoePk3pPdgio8DaDSBUHfQEtNYaMeKVlPJn1MSbqyfov
 Mlnc3jOEj/tAVaFiPYL2/dsWTWdcOviNj06RthHE+OdKTAJ/kQ8rEPNs1Co0doCBgoxuEax3v
 pPoDYn3ltqFWL34PAV3vc2NSdMii4YCvbEZfn/IyFHR/YTL02ECnaJIWSvA/lpbFeh8+nIH+c
 W+9dxDimg5X3Fg5XDTt0FYLrc2dZWVr+tho8XzM/TMU0cr2QbzGQvCuO++0dcSCVnt0rpY3kk
 x4j6DrsNHqcrf5MX0t0+f+h8teKRt9LrkcrnCeMZFYwQXGrrWNkOgFCTgSvj4QIpVLYsK/6yd
 32Y2Po3qBWyau588higFISAfcYftgfNZOGLaKtwE0/+wWB/U0TyWeC39XV02B94jOOV2oIi6P
 cIVeuN4SJ2ExF99SGIWR/AF6+MEMG03pFQiV5JIxd7CkokloPufNDk4cMlWTD4/GAfu5lhh38
 3l4UqkRKBukfGHXjLDptF7cYjSAGP4EhcY3vGtwXQApWCFujJpZnzZ7/H/3SaXMwykUOOBVh9
 pVdMqaeZ1Eo23czn2c4TM/G0eJvf5un0+we/HpWUuLsXEG1pdmdt2VowYxJhYLkVpvAqpDcgE
 HBWK2lxKumjTKW3vA9BEoBKtfOdn/CxaoOpiWbA0amUfwO69ZnEXZdl2eU/F3luQXcPZ53WNc
 tDK8C0AzUcI3Lo9H8rRC/zIE3t72z24ql7JceCErBBfrkMi4X/PFRtij8jwjnSq/Xz5Wps+Zs
 k6Lg6/jp1GN/rqC+o4XIsiQuaQxbd+zNRaw7fAvIgMbc3J0Hf5XXMZcowRUeHMoMBWvaVWshu
 T3NK0AMl/a+g5Be1GFZKxmV2Yz7Jx0Afz+kOKhIkxfzP5+5mrg4Styk7yHy+AA70xz79P4tmK
 pB/W4k5D1T1NVIyVzCFojzBkA4Hj/JlDeJ8O5H+51TB6b9Ru7zCWqitx+C3j406fR9F3S6Rb5
 TfbamXDYFBO+8Uu5ZHtt6cXGRBOo5DQszwFkrQ9pzblItAIqGVK2kir7L0EwmqbZGlolLzFhC
 IdcJOTwC2Wct/ERJvIAdnDSSw6gZHG+CZ+KamWTiMaKCY9YgY3/LfFoEK6D3exllXJUAbxpw7
 g6nmEcTQPc7uEHv8d7nKTXtBfba/JKMpCUx7+28WAo4debA95f4HuCN3iAe50+KZd7L03QANE
 l6An7gqeFRMxcqWVTpRTqbn2URV1JLT6FjLalAwZ3J6XV4OrekGZd9nbOAyg/6NvuM1w30lkz
 ysdfUCczjx9y0G6lMvflBjV4FRzCkPZZqOzWM1v8I0okRcayteOuqoCZ0f0m7TMfJeogpChg5
 VswlCIX8fHPT/3Os11e7GYkfAQ9Wdu2WTg8/CEz7zUxjpfpi8BctyfOAJxcjTzFgOZ80MnzLw
 B8HqS6GLwXhGPHPzM2hxNT2baJcHkrx2VMu9GDBiGi3IdtuMvg1TdftCJs9IdcZyD3tOkd1ue
 rFBWxeOQsOc/acve6y/Yi8KCpl97mbvea7OBeOgrgxiEOZw+xhUD90Dn+aPDhK9JM4ipmzNwx
 Uc4C1R9kNneBMUC661yITdsykvsyiKAOU5SkMz8h7OTtwdtML+gqYCDP92zslj3zGdwichFs7
 TvUojTCQUCqxFZSAzduFCiN2vljdLRemJuF2s9xBOngmyI7XiAtQf2XvC1td1Xo0Ynnpm/1zl
 K/Zs/pZeepGdz0FQnlu4kFuweXyFW1zSXNOe2Va09xmL6XNtBTramjfLITSLkR7oVGhoAPqZ4
 wb6ivkbqrA1Z8IFbFWxMdBx7dI7ezUVYXaFt8tvE2aI/zYT2HZxpj12aLIes7n2TFoNSgUZRI
 3wGAUwWThLbyi3EGUunX637VxyLz7Gy3N7Z/QbPntMz0ZMtGekKOMAJFRQ1JMzN+ABD+dhg1F
 62x4DAAU3P0F/KW2LXzxYHXbiooetE1PlABYx2/BGPCSJQ0h5L8lYNIPgV0Y/CMmLmtAxXMSK
 RzV6PkwvzrbSCAI5DCOpIWCIX9qcK+4RnGbiViJqXdzt9P3m2Rm0rEYjGLNkMMupWsOtxv32y
 6qvrzK5w0wmd/3YPMZhGge3xpL29JT46s8ciwieSjQD48Rtpo3dOBDq2RvzvJDRPRzoq7Nlj4
 Bdj1V6vvYaPSzdkLhyUDkLIpMo8sCZNHCeTiemUbTr7x9/njiv6QtyjVPioGEBYdNs6/jII9A
 zLleMfo0xFwX6B60FHxHxqBJrH5NOaZQOGvQzCSgBGmbDAtAgGUt/TzS56E7loegmOJpOGCcT
 KTOVpbnjKYnFopAlR4UxiTLzeZBZA1RnsgrR8E8F1otJ+pJtPZUAObP6XLm3XTgytFlCbE0Um
 MBzQFVVkBwaK2z0I9IPitKRe1u9NByGx1b96/c005dg8vjKRiX7VedasyBuKLuV2kvo79zTlJ
 dKMIilGciCv7pBG0DbF0DmWc/1LkV9BSkdZ5i//9Uc+mmUIlGaWVVgyJTKSkjaJN+95ipHzSX
 rbmwesshgzlRGMzXxGpBdYYAGFBxeyXm9Y9L27jYyytq2t4nJvT87i78fgQEKqsW15k1NCIug
 JcNnqQqnbf6FF6624GOrvrTpjmEFVRz5hXdMfhIVprefWRKlNMZSkfMaWNPanwWJgxDD/A/zV
 XsYtVh70zRhj1oEG9nfV6f4uE+EsqbfBPpL1+Jc/kLDPK5Jb4D1Q2+DpcRl82p5Ljcr0R02TY
 rwTKane94XtVlKyIo8LSg5b4dp6wvBZTesB61qWMZAXfhGtjIFdsJ6pti5EFXtmQ4ofP9kr2A
 ugDGHNeM7vOYMQsn+v85iwEdmnS/X7GpHVh5vIrLjnj9bm7a7gbO69vpMwd50F1n6ho1exAid
 IumJDlaPzj0t2pKGfz78hyuFbjCTOB+rhfy1qCvUputLs64fLqtLDhxLuEeN/iJXtZO54/izY
 8rVuKMlF/1GQUIOyHu92O3aU0PH+Ywl7dIdK7y4GISzk2Pnq/qB5/WLsZf59HOvhpGcIOOZY8
 jfk9cUlUNQI2OGR9MoTt1DUa/oP7OAru7ySZczr0+xJySsbi8gQNsQ7PJ2Sx7j9qBOgnn6z2h
 hKfA56G6qkpJIV2ESOle0K6rOmruvNpgTaWZRZygonip4etm0aLVMgoiNQVPkTMPR6oLG+HAx
 DE39XZYbsUl1DBGyBb1/j25ekcFiA8a/cDRsfOAHhJx9ifG/y2KPkz+fJl6n1TT6u6wUfGKbB
 eex6N2/3Uu8j1gWSKOHAggV/iE1e7eieaR6kNtzqrorV1qypbHF86hAXLqR3iBj/5OsR3CNWO
 SFFR2RJJeamPAHUjG9fm9/jtMvb43XzEXu1SEMJRszuvc2ReaTCeDyogNTRAhrOaHN6NLAdnX
 pDaHeim3VD+Ck0fL7R6kNyurENyijo1AdzthCCE+fQ+Pv37FkIaEK7FLloHCoV/522ZzKhEjj
 GbO202BC7KGlO33nbvyuEqVZZBsS4FaEqDFD+R9sLta6W/oC55CVNU6X/NF0lRyw3ceFuIsmg
 UdEv569yQusaJGkVMTN03f7UkAm9qbbfiDZfI3JV7JNfHGTVgWUF9ByAsHvILdn5MKhyPccxY
 DB3iz2vhxRlpzu+1u8B+NHrsXvOPYNecJaRuKGm0kUfE1HZo/GkZKX8vDyQGtNoD5y7CXgYUD
 p1oGYHOtpeAuYnaSUztgSkrpdfEhoJaOIvUzyTBOyfCqd7AnJuVMQLkJL4y5ehowv5riIbHNB
 l12tKdaitfuyGz+BpkDPeDiHb5RQ3ekQyo5nsjMARlWGIhYqj1wpsP6PvhVugTWWhLbOcTbq0
 M63rw9DDKObWzpTOJ/pz1smG+b2B6dxUepOMaRdkkm+jo+UPbBj8+r+gSrpwi0Vbm6ABqyrxY
 Kkw+ebp6YKbL8O90edUcQWdQc+ZAzXE6wSdp5iQciUGfEetN4u0UtFJpa5uqSQRIu2AOKjKpB
 nwT4cRPgLO/hCth83jTJC33VPICkXzdk6ovN2vKQzbHqQUBpm8oe0zK9MHcpCtsRKqW45oehs
 9cEXBB8+8XAyuvDc5N4oREW6S5wJOBVztb6eRA8TVsRTiTg365Xwt37otxj85dLKDmYq94g7p
 3pQ0Wh6FMarREzMenjn4jor2hStHJ5bemTd5bar4/gdtS1tUQYdgCm5xO4ldBHnNXBjhG+gKb
 MtQRYBAzOlyC8K0SFLvqiAJBq8vRZfOWLcgb8UJmTc0rOZKdttjotE5h3o+NperNiHKsRermA
 +E6S+XXNYnIyUbWeHMmTj+0TATmKb6SMZgNBMzUVGnLt+5f81/QgdiLrabyjeNQAnnPgwPt14
 YYU+FwPO1+TTRoTIPvqvW9nKFbxnD6vCNAAwspBpgVDFy3TdboUpNACSN+LULnRea8srOK053
 9W4YInmhYSQvYkWke8L3dOWNIFiIJwn3Nm/U28NMLhNmr0p+wa8oSsAZyvdwWC17tYLTPuMpx
 vCbQAzLk8jWqqOlzvzsnmNmt+CsZyotqu/a7t3Oq23P8yzqQ9kWvFyKQ67x2wk+g+vDJBsnmp
 SlTbWWUDv/VWxzWHqwwQFU8TF8y0XBzrun3/1slB4g0GnahgKORThEnBn6ztOGCtgAdMc2Flp
 NPPmUU83wn3O9uwJx27bXgsB1TOSAY+U0L5bpdFt9cV0hEpTJCjUz0hz/Ag6MUrS61ZQvtX9S
 7yW+4A5oCCHCjHjlJIh3TcMcX1E9YwxHkwhSPU5WwiBgwueGDT0ufqkyeexgtsytEZZBRhTvF
 D6zdHqWp3f7cDdw1I+FRRzQ96jyy2/DY3WwXXssl6VCzknaazjJh62XY1mP6AWtS+r7tKl13C
 ccYI4Gd2EMfulkK1X4tOe4jTD0rpz1XjhEr2/1qpu9jBBsmrmy3qavNLS4Br8vhY5sqXxpZVM
 YxAdh+22rCgRamTuVby6Zu3PxhTwwXQy2xfYCr7JX2ltJMKkk1MeWwqACm+o/9z7tUsEbrJpK
 t3cse1Ink9oM5kchWhWLenwZFu7BLTzWv+zRZDirCMUVnprQJdYC0ELx8KbcWgZU8fBG434e/
 D0OmgBIgg=

>> =E2=80=A6
>>> +++ b/scripts/coccinelle/misc/cond_return_no_effect.cocci
>>> @@ -0,0 +1,121 @@
>> =E2=80=A6
>>> +@depends on patch@
>>> +local idexpression ret;
>>> +expression E;
>>> +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
>>> +constant C;
>>> +@@
>>> +-	ret =3D E;
>>> +-	if (\(ret \| !ret \| ret cmp C\))
>>> +-		return ret;
>>> +-	return ret;
>>> ++	return E;
>>> +
>>> +@depends on patch@
>>> +idexpression ret;
>>> +binary operator cmp =3D {<, <=3D, >, >=3D, =3D=3D, !=3D};
>>> +constant C;
>>> +@@
>>> +-	if (\(ret \| !ret \| ret cmp C\))
>>> +-		return ret;
>>> +	return ret;
>> =E2=80=A6
>>
>> How do you think about to combine such transformation rules
>> by using an SmPL disjunction?
>=20
> I see no benefit to doing that.

Can software run time characteristics be influenced in desirable direction=
s
for such an use case?


>                                  In particular, the patterns search for
> some code in common, but from different places, since one starts with an
> assignment and the other starts with an if (that is common to both).

Would this implementation detail become interesting for corresponding refi=
nements?

Regards,
Markus
