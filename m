Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.205.221.191
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794158663;
	b=NNJwHqT69ieY+f3MxiH6xd67A7WKj2MfDF5HiaUqKP2YLtXd/4RE4EDrmOZKmRl573Ys
	 R3Oc5qLarUZVWYfEGFna7o89ud2xfkbWwC1dhn4HEj2mdPif83ODfCUQzwOVFvNwe7abs
	 VWfXgEaUJKHjFpyJFlFquNaiQQyQLcrHg2E0WK4uQZgS5n+F86/oCLtGEFoqwJPPd7u4g
	 wbgYGwx0swJ8uvhLHUOnWAKVYnXlLAhLM0xLXcJ9X6Rh0TNiAjL5KsMs+PlerwsApV62a
	 4HnD6lHrfnS47EcqmCAvX9A8OnE1EzLrpVBz3phCCIEpDN7j2QsC38Ny3jXrVzWC9fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794158663;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:In-Reply-To:References:
	 Date:X-OQ-MSGID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=DOsovVODjri6rU2aJZje4TQB5iCgttPDFEBf+rUa51s=;
	b=CpUobZXGf48icD9B92YwPvBAUQq6wR9+tJaWWneJKcYfjXrxp5CAFkE9gFtFPUIb37RA
	 QdzyJL2GTkrl7t8xBmP+cSCCOLWGEwEKcJUeaCySrtuFFMbPiclW6stec6LfEqAuYZz4L
	 6lm8+1Ccmokhb1SnmJcbCOd+I5k0X/kLGoVH+Gvu5uoZ0nf5eSKThDuC7S+6HvR0yn9tD
	 YXes9yEMchDkdLfl3sklv8tfa7iV2TfCFsq+VYcYBqN0BgPK3Ob0aTGCB8Jznep2y0ClY
	 UgkhAfppIwHNEm89GSIBztSA5X6Wgn9Q1a59D4nJZy+mGzQBSFz90ItxrdglIetO3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=lL2uS6fw;
	arc=none smtp.remote-ip=203.205.221.191
Received: from out203-205-221-191.mail.qq.com (out203-205-221-191.mail.qq.com [203.205.221.191])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139F606A33A;
	Sun,  8 Nov 2026 17:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2139F606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=lL2uS6fw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794158660; bh=DOsovVODjri6rU2aJZje4TQB5iCgttPDFEBf+rUa51s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=lL2uS6fweuxNDsv1yY/NofmrjnT1QkLyPYYpzLElHuU6cPw+UCQJcBB5fpqoLx7Ah
	 ek1kgFjEQyhKTPQmI1a8jCAPrNiAWAcLFeabJaIeWg9ePECftRtplnJ7DQacNO5FtW
	 Cwx0SdcReszuS6Nq7DY2Zj5Pl3yRmYssgSpYBnf0=
Received: from [127.0.1.1] ([5.195.0.150])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 5F906C5D; Mon, 09 Nov 2026 01:23:57 +0800
X-QQ-mid: xmsmtpt1794158658t8gs85ayz
Message-ID: <tencent_A5DEB1A813724E57C7C90470E077A1B2A805@qq.com>
X-QQ-XMAILINFO: NnIX2CK8LSsJtOojHolcGSAEFwn0caP4SHesPiapGL0XswBVsYwyDa5Pj8XAsH
	 VdmVy723KvG/sehHniUbtj1hcuGR7nFImVghAo50m7WzmOlLlaPc+1CEdoYNyKSZB+X669uPwuoj
	 tcCGRyGA5ofonSv4+Lc7nXpAElWWwJ7ak4dCqTlu3pGYAmpCHsSRSsXG+Z8E4FLXdSHPQxn1xiYK
	 NBfshDHvSnVZnmNTVnjaoAKkFqmHLFbkPnGY67zliqPFcXjUyESuFOG91XZBwTzSMyvOi8BmQdR1
	 l739u9YC3h7V/2scMuq361dvTulaMAcbTAnmxg7R1SReHmJtt/AkBzgbvaihtlVoGojQvnRFvU7a
	 o4xNSvvLg0Kbkj+MBzYqWlgsYqcD+3DJxh+ADaulX+nZbVWaZxcDa7I0cv+EJit2ZCAiuE4DH5CM
	 8lvDqpei+BXEbAQhGXIZUP/eOpMVb+AE+7i2i0apViri0kul+379lmSd8wA7Ln/5PPg04EJLJh5+
	 NFXZyLR0UNM8jmozzyKSxcqfLfNoYLliAnaF/qKxd8itQOFmGQ2GecKuvIR3mwLw5jXyYVh5Xfx+
	 jt0an2s/qgenOD2nisyltPc+arltmpU5ZN7HyUyodwycV8uC5OKOHS42X9XOZkLgi5s2wE45mX1W
	 DutrJdJ9VOwQ9q65FBp9c4IKAysE7i52/GAgJuIq5rT8+KZ3Uyg0QDGPyjPD17FVfFjp6Zvnwkrk
	 EYpMh3fOzVLERHyRsKWodrknFMINMvc2lUM87uDMe5cs6oAXxZfwWiC5JeazQYq3YJZNfq0E2YjA
	 mdwuv9tvHD9pXwemytOAWN4+mreD+OE7n77fR3uXR0RE0kkaBE/ljNwidkLpO2Yzp/EnAxZrwxCE
	 4liR88TLNJqtf6E9bwQro2n0kWnvvsC1eclTMdw+kKH438ZRR7PsvOEHZhZHVAOjUli0Uoz89ykB
	 ZaIOkBSfJkuXOzshXNsBqmuluK7JnGFeZNAY55sHld8IvEnHJw/mj9WbfqEM/wEUc8HooZGyUKU3
	 2jDETGb2d8fp1p8a9vtOvKhYICKbumZjb0O+uponDhpAlij6Ak
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Jiawen Liu <1298662399@qq.com>
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: rtc-pic32: handle clock enable failure
In-Reply-To: <tencent_7FCEEF77654C7D6B110DE49D2E98531A2006@qq.com>
References: <tencent_7FCEEF77654C7D6B110DE49D2E98531A2006@qq.com>
Date: Sun, 08 Nov 2026 21:22:12 +0400
X-OQ-MSGID: <179415853266.5.4159904312334529076@qq.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Post: <mailto:kernel-janitors@vger.kernel.org>
List-Help: <mailto:kernel-janitors+help@vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
List-Owner: <mailto:kernel-janitors+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Markus,

Thanks for the feedback. The description should explain that probe continues
to access the RTC after clk_prepare_enable() without checking whether the
clock was enabled.

I'll recheck the failure path, the relevant history and the recipient list
before preparing an update, including Fixes or stable tags only if they are
appropriate.

Thanks,
Jiawen

