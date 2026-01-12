Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBBB34FF75;
	Mon, 12 Jan 2026 10:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768215349; cv=none; b=QZld0oUuQ7BUDMcP/Rk9+66e+xYc4QxDoQKxJDWM+cdHhTM7YkN6Dec86oc58QwDAo1RamfAiRdp7pO2SH/ncu7wAl7x02L+WEhUpubM9MyE6IlRtfDJq62s8yCMtGn+xdCn1jIMuRZItKkyapIrVkhvzLFjJ2ZH6TYreau02Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768215349; c=relaxed/simple;
	bh=HS6kPpbQy8jWMj3Iz9awbjyGkvi7DLk0bNWGdwp+mEg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=rK/tu7vqE4I47VKSP07ZYaC9kEfap13p89ztmWAb9SYy33whnjcUzLDC5G875WTjUBeLLaFEDnIpNzD8K+f8juUVMsZ34tDsgMEITCundl2MuHfZCwjOeUDsdzUE/6CaFOgv2QWSEJkWglaf7rshutuy/VNxaPNt6uJ52DWzBCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=kV7LtvQy; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="kV7LtvQy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1768215327; x=1768820127; i=markus.elfring@web.de;
	bh=0cSnveP9d7Rr4TEoMUVawnFwghWvBQk1vSv5CutU078=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=kV7LtvQy5ws8pnl9KZ79jkc7nOkQhA1ea9C3XUvkcDXZtAxKKHRMQ2bIdq1ezNQO
	 yJUdVJfftgUM9FdjJa4XVynl8zSbjKuF9Gz7K2kNA7pdTUljygxg2XgRAsyn5Kyr9
	 Gmq8ACPEw7LsHE8p15VZLL5SSgFXvfFQmB0ULJB8YcmzvQ868uWAZOW7IfjYZnlUG
	 UL1+E1Oj/5k5uuJsIQ5MC+A3m+A7DcxxJTm2MRz0DaIesUW14SeyZ4D+7zQyOqs2b
	 qBK7Zp8C+VHqc4CEhaS7PGW8Kf6WM74vwh5qEITO8D/ktorIDbfEsEc3NSAR5yIS6
	 wW3Rk8HgnwlwKuSmfQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.241]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MadzU-1wH4Ef2Lso-00loNi; Mon, 12
 Jan 2026 11:55:27 +0100
Message-ID: <35084885-09dc-4255-8ec9-ba23c3a2a925@web.de>
Date: Mon, 12 Jan 2026 11:55:15 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: soundwire: bus: fix off-by-one when allocating slave IDs
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 linux-sound@vger.kernel.org
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vinod Koul <vkoul@kernel.org>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, lkp@intel.com,
 Dan Carpenter <error27@gmail.com>
References: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
 <732ad24d-d88f-47dc-bb6f-bd1b64ad354e@web.de>
 <aWSwS0PQHumb2TJG@stanley.mountain> <aWS1j7IdRLCJTj1h@stanley.mountain>
Content-Language: en-GB, de-DE
In-Reply-To: <aWS1j7IdRLCJTj1h@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7lnvTqHEchMFoZBOpqwe71fd6MfYAbLRvtwisxi36Pf5ZGCW/1D
 kE/btE17CjACGj97HS4nv1SQmp/cTTqU4IVv3j6UY9skw4xyXlwS9CL4cqRRSSdbxxF8Oyc
 XdwKdaM3OnkFkAR/0CakMFQACk1IJEuVeTwT3Zi1wL1t9Sq9kx5ndilHC6zNc+jnJ5xqwY0
 xX5qfIA6n4imXcrwF5T6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:koHjChiGYwI=;aOv4iaSVr2zy07sIG2jUF0BdvuQ
 bvyBxB64FWxEM6pIE4M1EBvX2K2NUt11uM14x3zYXacZw5JACTV3Y/pwQtakdRcZv3iPdjIeW
 LUrgKmWm/I30udZcOMrx7NzVo9emqd427GFX0GfK1HU5bbVRNfotXk5UnhyH6shTPlS6r1E5U
 W0voMrlaaUwlB/VE962iuBwxM00TL/f5sO6KeFJ1i5t1K6asyKVpm3CEsK7RduemSusEgdK7I
 jPoRJySjBKKwiQM84nOj1uslOe5j5MqAFu4mq81gKXbF9h4ypNSxQrxQc1UoWRocwlkOMMi2s
 cSMO4IiZblzzMtYQoLzyLJAK6rYHI09tFZsa3Agxcz/1+8pDmSJXtxbGs5Bsczmu6BuRfEV0K
 TwQ7wFk/ofoDbQbpF14MXEUjCg0v5om1Nah3T/SgvhuCZ/HWhofjnr/4x2ifv0r6/6gCMsuCR
 11c8cKSDcgikh4y8MyFUfhJqxEswno2ZypUzAdDJo4DqctgMTnuernXeKSbzTtngZ25Uf2rUR
 jICwuD3WT0pdCNGXuoWiUsL3U40/W9hGZuAA6hqMSaTyvnW0qoueVorRk70+MhYHbzaTeuUCD
 QlQbGV4kbKMMbnJ3dN73xH4Xbonki2hFoC3AjK44lLr9SqWLYyd9JzjeG8GQvS6Sul/ewzELJ
 PxOEWI03zugZmzkPsOuMudZkQdER6wxp9nhA8IAzAOckhRQTS/ZaLMb+OaBpw1glPnxW6Rz8S
 l7LcWSI/D22Ut6EhND40IOPSanIvMuAwfAHK1mXEruqpdLaud2oth0QLrBPZeRqarY1GXavZM
 BZ+53ZZbZFpLZQdEf2Vt1HWtqM0NdqmMKIu45ot7XmcGZar073Jp+MF3ZA3gsRGs8VppzB/nB
 NxfbJBxTHgx2HwH5j3HBoFaba09/oyJdUyUi283jRcV/y76hPdlF6cOhQqvWW6RgkZ88aR9v5
 OCn8zKn1eOd4jfvDQZa+v1qFlkggOISJ1XoZWoSiwJ1cgaWJl2ywvZ+hGzTcnqmx961kZUraA
 pf3AOT84t3FC1uXnEAnzVo3nn0EpQQGpUgU9g8hO2Qe4lIzGs4TR0wB8OWkKvbkRBrbAjEzf2
 +rqyCxmFzudjg+tUm2wMrgnIEqRhfga0rTNhjSu9o3d5Ns3j54jA/EFf/dbs26gZbW5qVvo6R
 lIuWTjIMAaBbu1zMrsbyUAAs9fZRHn/7GilmodEEj8qkOOzsUkdOEV+sFnJX35Lu+jtzixXg9
 yt9lRORkauocEEYS8bBEbJaW4SFuph61/HXu6T8nEMo+mONOKEIs3Gdyn4+64C4S8/ubPkOzf
 +AKBux6pPzD1V716UOO3Fk3/xEQM/Mdh5p9jBFSsdeMXMl7QtxvUMxwseWubrAVZ/GVa4zPk/
 1rugkNHIElZwqgtABuF7q5WRlIuYE9OVRytGyAw8sNJdbSNHuSGFEzK3178ciMFHOL78vI+rk
 gF/HeusFbOmEPRKyDxSZirM/9xJvbg6rXV+C2QFBetQGacbX4IbDdcTdjjGRzKim9anS7yhKs
 5QB7VQ5f/ZKp4IyRIWZiFFG37lV/6BIx792h7wK8Gg0We7I5q5L6dVb5pngN8KyUI1894kJmb
 ynHMB26F5b2tLdY8BkSwRV7bBp5QRVXhgtVbQwl0Zsgh1Ho8ZbnXmGLLRkBvMgdo/rH/en0jp
 zf61zhBLHyr+iDuicwJkD1ZrPnhWPWtvxvbsC9GI61S3rA6geTkml84QwRqjsmXnpxuqKkioQ
 LplPpzgzwzon56gPEI2MZIpTVRrVBhDOwrfGZf8TWbnCqwdXUiSNzlBT9/o0/1MsvdvrUFAoJ
 QhOtwBas9V8lmK67CFx3xqHk1Nr3n9b6pj0OOmhQoyGmKq4a8AT9ndsROuhiqzCcJHxXVbmtW
 vUm1CX7i70UfV9Na2E60vcBoaHbEGqZ8Ux3R7I/k9hHSvP9IXXWbrIwr2E6uye5Yc4Bvxk9Yb
 uIHjSO3Zb5IWhwye0EqN/y1kr3XfhfS/CJ9ToUqsr8pRTRNILpCZIBveLpsvUFTGagWcz3Yk4
 GcArroA+DYzsupI6YaR/zxx/lAzOS9GftG6QBBlioDzZb4Gl4rLRrtz9KhP952zZ1Nz8GVCTd
 Zpm/qh/Jqb9b+vBA7/5XY/jPlnRReAfnOi0majGi+B7Vv2o7mR9AncUg+ENdt3xhWbBb9vIiK
 8u3ozzpH+XGA+5aoNyWb89aE1cod5xR9ApQ/UyGYToeRTvbSgJGcoO++G8VtwuObRvtkzPpRE
 UppvwgvBv6jLCes1QN0ZD6TBPMjNM4tRfGtfF7Mai9wDb5f3NodsTYg6zRKewZchSrFpbEBdT
 virGFYk0TlA0yo6drxeYE7AjkGE88waRHMoIvOtxMbsbHrZoBPbC2fXSE+65/y8+yimgFjj27
 h+gPao35EYKNB6b1l/lZO+sbM8Dfmawyb9xx42PMMCF+yiMIr3Jwe95I4IrpUhyg7Dhbso0Qd
 1Je8OKucUjJV7ljvNjSIim7ueWN3F8nI/F2wF+UiWWOttw/d0IUnh13lPfVYCyabnyE8JyK22
 8cOQEyYojY9R4NvixeGYsGchzibKR+BHkqgx6IF943/oOsLsfVdV8qfbbUByx3FJK6RP5LXDs
 uFXuGqwKYO6TzINY8GJdQyE+vPkwYan6OPdBHoyQO5PbJyeldnGpXReK6a1ISd7tYdX2rT1Rm
 4x5QbugLnhxhGDb9Arb2P6n56Xb+x+X86JDD2GjAYT3ByIv/zEt1MtKNTCR3ff8nw0otPVTDe
 6Y/goepTpMvd0jJsn5qZmwAKEYZYj+UirOlJ2Ou8us5se0aq9vLPvWXOQkjhLlmmQqLTLbZMS
 cJf+B0YRJeacvufu+0Db4EZyt/m/iKWZgYpWaFRLNUEtFjirvRB0vX2KTfwLjK2+u9HkDJYqE
 KlI5dypJ4dabMdklVADAEL6mdBTlJ+vXRec+f2CWA7eA7L5ajVEZT3qMfaTnOodL8OQ2Lsart
 s8TQ81dNiABARdnaaVGP72+1zGqxtnvjM7bbIZZFEYc11pWeLjJLs+R2D7GndPFzEEZgF1lM7
 tOsmOkVFhwatvbHSuXoTPlfo9nrYUNDp5zEri5GSCpbbWkZf7+E5N5ay1R/Yx2k04DaAf/ZYe
 oYd01kzE8cAZNdu6uyviHb1QjWNuh6uInZBcbzQaiU2O8K32MslUCJgdz92vb/Es7pmQnl7i9
 WaGUfb7B/xjoH7U7ngelYYMyMtjD7SvovFosaC9oTdYcTK2CClkj0iOYrVXK1cOhbAtG6jFB7
 k/rzYVJevqM5M/qDYGAJ32XLox1wiIZOGTfI3Wcat0QXiTug0YUQvjgNh1q/scb9JsAGBZMZ0
 7oa1EClOlgnyE+632Mql1otpaMZRnoyjTN5y0orB55QVJZdWwgUjmNXRmkxxfmnyfdYfS+vCC
 C/KaVpdGfAHwpwthsYNlMoRYS6Np3iiuQL0v1JcOLQg3FI2riizuJrpkx9zH2Sn4dhbSA/gCv
 OXM+cBEr/E8wBLBY0OA/q9Klz0da+7wC+6LbV6K1OkSHcRlaTU3iptLXjB/Gw54ceByF6mV/v
 8+fX3gH3xcQ2+rhIFwXKgECePOp1G7/Ivnt9kdLOux6Zp+i1as/7UgL8Et4HX2jraDJkoSFeY
 q2QMxWgutpkLvP/dy4zv1WbenTTi+pgTRCSmyAH2fETKqU0LYS/wp81tNTlb2CzE1nW2cAgUf
 vh0qXV+d/ol8rOvK8iiKAmy0fQ53ZJystR9ipN29eGjR0UhNQ1ID4EhkLXVp9ZzR46Cyq1nj7
 LVLW4EPcfSNg6hHmKiMvcorI0sKKBa4/j2LKYiRpYopzdI6SkWNDuKP76aGKIZ0EBkk+Ac0vK
 R5011tsPA8dSGM65tR3Rod9FMEd/qjIuZEMPfpsAInVwma/ofTZUKAKeItcj1yULPQwrtU2wB
 NjoBwEEjZb+4/GP5nU+dn4kdmFeRVMxoXHnzaZVA67ZUWhHqOYax6XdF2nB+COB/LYZi/X3p2
 Z5j+PP033Wp72Zk8FyiA3q4J1iovv+lAR9dovq63FA3/qQkdNrCkAXav3NUIMyHP+kukLCT+c
 6nq6qUrFyNkntJrCwmj8nlzyLoq2bj7nzVpL3E1/XxCOFPirKezvkxzfBBlXDAiMUdCOJsKr5
 gx47h9bUfWqmv81WBwDbTidvpp7HPgqfK3YS050S33DLQkEY5u3FDQN4iDsCWTVepdD0lbhXI
 DmyZ4op/w2yC+4EwW/uFT7QgPExGQ4mLvWOr3R6f8EapcJLpQqF1oxrAs2i1fDtM9jX9nVdqP
 0Yx2f/oNO0KhGcgyGIkxpeShsB+iFE/6ed9SIgIorlCu+NRpmUUH/wvgZ6vvFPjf82BBHWTB5
 ZvJPzznXRYyPaJkCDBb2S7YCW/qjESqOAk5Lob4JK/AYwoR2vUHxw48bR1r2xCAmXPmVfCRXp
 ETG8r8HzDlAT4afiiani9BHFxaRfhoNLO1G+5cq4XSPxXURCDCK+jG2B5QQi5WmEvdAorp5/j
 1sFOrSPIT5kbPfZpmxmkipsiUy9JPD6PpmVjiDsgeB62slgBBgN7BUq8qwQIY9wzLwO7qTfUc
 VvBXvGeNVcAE98ZpEPqKZJiknr+PqHjcFx44DqMTxoL0HcUVvPZPmBSWLwMBc9X6cbfwAzaVz
 zHLZKVMY75M6JM2qosfY43BYwVIWWz9VD+6riovAPgqZ6w3froY/rfrI02Mnaln3Xwq26VcdJ
 N/V95+bt+9TEJxNCK6x3mv3qPPd+xmszQArWsZzm+BEXQvbP4MPRBNdfLG1JcvkZLV+ZmcCNU
 d2W04i8qFOXGBzGOcY+dNWSSifaMwKv8zdFOwN72K2BtcBaMsaK9ywTdIjhq1tCty4luOqe75
 A4SjWHJbhS71RpI9A9m1fWDIqX5/aTjU70/MDCtyXY6Cfl1KRp+p2hyteC5JolT1JDh267nmQ
 Xss6eCp9h/fLq1+G0N2BO/G9t5SwkpSHp9xSDaVwFMDEQJYLWDJhNkeQUsqpGZGVP21HppUvY
 gjM8AjEQD1dZAX9xjrNa2MrVAMJ2QdN9H3dVqGGJxR+QAd1D0wtLKl/4uplmGJoybUzlzcLp5
 669n3YZzmHhvAM5QZoVM+K/p14YN5J+fRgtJT7eKIQJvHTz

> Sorry, if that was unclear.  The link is a real link to the documentatio=
n
> which says:
>=20
>   - The body of the explanation, line wrapped at 75 columns, which will
>     be copied to the permanent changelog to describe this patch.
>=20
> The rules that we write down are simplified guidelines which are designe=
d
> to be easy explain.  75 is the upper bound where checkpatch will complai=
n.
=E2=80=A6

Can we benefit a bit more from this system configuration setting
instead of performing word wrapping at around the column 67 here?

Regards,
Markus
