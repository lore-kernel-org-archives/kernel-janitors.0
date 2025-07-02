Received: from sonic311-51.consmr.mail.gq1.yahoo.com (sonic311-51.consmr.mail.gq1.yahoo.com [98.137.65.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A811EFFB2
	for <kernel-janitors@vger.kernel.org>; Wed,  2 Jul 2025 17:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=98.137.65.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751478369; cv=none; b=Y3lg7Wz/E+lTrEdO0iCKwOU0auxvWUrYe0Dn0h0mluJHMAcNxfblA/aeTyzr4vVUvZBWIFpEHbIRmkrqPJniJAWr+j0NgK5uFBmuT22PwXZ18RPSvUP0ZJfDgK1Hfzt3lUBnD5s76uORSgzEsliYNDe/qvwmIY64Hz+18lhxEH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751478369; c=relaxed/simple;
	bh=pqKWLjkwOcpnsgz3Fd1ouVbv1h6JuyjRHnbm0NrDD40=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:MIME-Version:
	 References; b=BiHFQ0zjn/qSwfjnAEiKhGUSQ9nrgJxKW+a4ak6qw/fDJgm8AA3FhyjPIXo0tACI6DOps9dt5UfEkMlNxsFcvMZu1ESEPAs9zUSV+7raai7aaFLzOgsHSbMJE3YdnSooazMopr1A0v1H9Y5z6Y2utk9D99tJu1/avdpuqEyDKp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com; spf=pass smtp.mailfrom=aol.com; dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b=Tt1lkMTZ; arc=none smtp.client-ip=98.137.65.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=aol.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aol.com header.i=@aol.com header.b="Tt1lkMTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1751478366; bh=pqKWLjkwOcpnsgz3Fd1ouVbv1h6JuyjRHnbm0NrDD40=; h=Subject:From:To:Cc:Date:References:From:Subject:Reply-To; b=Tt1lkMTZRYyQvKh/kwlXZreCPyu+1bcDcabs0nbBNMujHMPyk2cHCfvvCiMhL54GGmt8npmpFJuqXrEoHtfy7qu1tIWqwn6oBoCxYd05qIyzR6BJJmfINdYWIsgRuu/eXmSqOudf+0Ugo+0ZXfKU7GesYYtlr/wJ8moOLBtk2arLToydBP5Xcq0qZ6D9ZU+NaeEsSyorscl7i8lfOXPeqgmzuIXmWj1KJqF9T/Wt5hdNTZZDP4rt3PXZyMLNiuMDKqlWbfrHzpYOj0hC9QpqGdSLOoPDkp6FTCyfJfIRaSaeD+fOTZEkXZQr31SnjuOJ2TWgDLt6MhjXYa0WfB27iA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1751478366; bh=VWtqJ9NNAKWLmVh7sWLiSSjjN/pl47fDDl8RRjmvZow=; h=X-Sonic-MF:Subject:From:To:Date:From:Subject; b=IlIZ/WEncvKieoyDni3GOjBfN98w0ubTcZUwHBQH/TxRjsMTPC+7jVAIRBMZV5l1XsG3uWD1JFkM3JY25L8AbjL6lc3DPV6Y78OOGyCvCSPgf73Cr4+u49xv0dFokqJTqLioQLIXCrj6ufIj3c4Re/FjuRKrBlb/jpgCAaVZfNZ6bYeLtT0zGV+zct8XzPHc55c4ddLEVnt9otIBgjktbduPdwGH39N7x6cY5s2o20LFlMlDHnADhYTtDUAHS6xeELbGCWtYQpNl+mx7KLQCM2qK+DRJsJ2dIRQj2ATUsOhUbjpWCvDE5SNhAizBZarstaTFz1y6tVbasARxeOyE6A==
X-YMail-OSG: Z0.9Cd0VM1mF_YCAKr_bY.RdvUYtatsNTqOvDmIgGitezh_MVhMr2FqVcAoyjIV
 O5jcSeQPKY5KCsEQTaJyaZm1Q9XYH96d16FwNMaXbthO1eBiS9pOTcRePiac0iCCYDGiI.y.XY7u
 vohmaVturd2emjX27Cf4SX7mRSdO_LfRqdW0hOvjUVh4kQm_SJLckCANcP7ewD5_IYXVkjFWPxt2
 CvL20psARhjkZxM1Kx8Y9qqU0HS7prZdQtvCKcjlQQ_39NCS2NnD3kz4Q8H5F0hU5Q2Vd60l3XjY
 e4IJqg6eJ_g57pt.QQ7QQCS5WPGcD4QxxUqT9r.bqxjKjzFO8wnt.R2DXzEZZatsjmXzwGWXig4g
 t8LepCqpsQcL..0j4oKkLNkPmyaa5.4FA.Bv7j58EBE8vzopEmULYfVENm3.pxdI8wxR_1EHQyrs
 xyEVrTSCtm2gpzjrhlART.8IGy53w34Al0fL8OAdnbXLtpHuWHi_K3oZoapCMnao5yK8MUhHAWpq
 wDHkibBB.Lc0ft.5LhjOkTAlhge3QBphX7CKg5VzftpyoGCrs2thRQ2Z1JJozqoCm5KvTUPknkP0
 NMEDGmdfcRrYHDBuOMPwwyI4XZMxWIwwjLbWdSm2.bLb2X2j3HpVl0UlQ01B5LzlcwTqPNd3xv.R
 6vp5xrEmkj1qDdL8eIyXxs7.MfVZSfYnuJGkYBxQPFNDNm6WHSnchysbcLap.p_WWnfze_9RQrPl
 bZTmkbAhycqnDejwe7JqY5eQIYlbPS1HfihGQzCbg1KhGWFsSXfuaykxmFTMwqG41smboGkT03vF
 YxuKuFEPh29XYHdBD8VcQ7bd46SR2WMU0VtEQ2_07V9MQW2MBf5PHApAZaP8bfrgtLkKAbt6Vav8
 RrdqBhRLzHBfFu39JB85nd8mzvWcj.BujSOMbCU6Sp.NMQTAaTFNxr7n8FhJ9Id26SFvsuzqB8Ey
 W518YSJDKyXl.wB2iD4A0YalJBiakaB9EAAsUmAQ.Vh82QarxMUJdtcoaFRXJaUQjazOfEIl8PM2
 EpREAZ6GfOcXxgl0yV3w3B.Vjg37msijylSuhH8PxKaGa7Dsu0badOCqS.TKqD6UVOCQHo92O24b
 OheIXMw0aP4NI23EgBoPVKTYIbTwMP77.e1nse7.AU2yFIFUQi0STjiKm8QHDWnPZRUBdBbD.pR1
 U7j7kqQKKbN8aoR3rqg8.EcH_dq8O3PvWWsUlpGHiyjyEHIYBSPFHc5m1E5Sk2V9n_2G6k2ODqkA
 zn96s7UpKyhizAcP84nnLhJiO8iPbO7D5QB_ON76gabO4C6PN9p1aAWDCNHpk2KR6NbAyvsMXyDz
 Qvxz24emXOepozJUh3SuwHfkEtjum9ZHwQSqKcsgvFHbLObW5CR_zyR9yElg9IP2NL30QnP3SMM7
 q124CK3RMZtjO_lG_2wpxnwBW1AZoOWmMqZho.ewm88QFOuC2ypU8XCtoUTjVaY06R5MYpUL63kW
 gOMzracXFjqwSClelnJJwP.mNf8PXCxUeygnZE.AAOuEz0tBKjHlbK.5_oB.0FbfTJ4PH3vcZG7M
 31gEwLvGcKy2vUU0fMslY0DpsFjGnGCW951gU5OIyZRxwr9CeK2W1apcuW2XB8UGWqMLVd_N5A4.
 oZ.ZiI3g2e6ROwgMwMHjusfHdT5Z_8L5_tP2lE5Gm5D7b8tI5aaqYBRTG.1Tmd_cFInZdSUzKe64
 hgbyRUglKrkhhDzzrSNPei15d4QwEweTx.Jui6zx2LKluSOWtDl22X8hptH54pHnQ2c_iBTbwBlH
 al2WL.J5pHDLElJ49PpuzuU4s3kUvjEb_ODnncD_SrY4NqBi8J4jn4n8desrUHrA_OHyr8_feVG.
 W25_dKI9hTQwJheMBr.NDMyBnyetIFNtYT4q14xz3uYNIryPYUFMd58HnaSAlSjLytKt5n6RpcYz
 1ySq0s2UiRwdK1C_MqGOfqiPdlDGWCglFrvntiO19j6BmbeacaMhJAB_gDGFzdKked2IoFfPd9jq
 8jX3xtmGRhwxTodoEk_6KYNRPECBHY6ExuydfvZHyxvPO8OH65WWZt_HBKRstMGl_uMQRLX1.BZf
 HxoV0jUJChXBDmD6.5.gqdL0SZE8brFzPM_lfX7sCWhdIjSzSN8U39jMV.Z0kg.oaaGBaYpCD22C
 i0Wcy88xmoz4S61sD4pbL7fpHglC81dvemBFvFfTLN0a2q99ZbpGNwqZR9kgsskq8fcEklBpcqTB
 wCRTDgrH6HU0appAi_abqcL_h.pZOmpUy3Ovo2rdcYFtV9gmIsw3ErnsLZpi6oAdPGzTzUUHB150
 dsvX.nfMyFvsu6jWWzrVIuqptWNCz_dG0eWG8vamz1A--
X-Sonic-MF: <rubenru09@aol.com>
X-Sonic-ID: 87a0e0e5-39ef-42e6-addf-e6e564a96775
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.gq1.yahoo.com with HTTP; Wed, 2 Jul 2025 17:46:06 +0000
Received: by hermes--production-ir2-858bd4ff7b-vtq9f (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID ba2a3b16ae70ce75e58ae34e20a96680;
          Wed, 02 Jul 2025 17:13:45 +0000 (UTC)
Message-ID: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel@aol.com>
Subject: Kernel Janitor resources/organisation
From: Ruben Wauters <rubenru09@aol.com>
To: kernel-janitors@vger.kernel.org
Cc: "Robert P.J. Day" <rpjday@crashcourse.ca>
Date: Wed, 02 Jul 2025 18:13:43 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <13d16a8095e0e0b0dd1ff8a0838aa3e9c743a487.camel.ref@aol.com>
X-Mailer: WebService/1.1.24076 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol

Hello

With the introduction of Robert P.J. Day's janitor scripts, the kernel
janitor mailing list seems to be receiving more activity now.

I wanted to ask about resources. I know there is a page for kernel
janitors on the kernel newbies project page located here:
https://kernelnewbies.org/KernelJanitors
However, the above page appears to be quite out of date, and I'm unsure
how relevant the listed todo items still are.

There also seems to be a google code page? Google code of course no
longer exists, so I am unsure what the relevance of it is.

Overall based on activity of the mailing list it doesn't seem like the
kernel janitor project is pretty active. I personally think it is
important however to keep the codebase maintainable, and I do also
think that common resources, techniques etc should be documented
*somewhere*.

As such, I wanted to ask if there is a common point of documentation
that I do not know of, or whether the newbies page is still the best
resource for it.

I do think the recent scripts (as well as any other relevant scripts)
should be linked somewhere "official", as they seem incredibly useful
(I've already sent a patch replacing a removed Kconfig option with the
proper one that was missed when the original one was removed).

I guess in a way I'm wondering as well on the organisation of the
janitor's project. Is there a leader of the project? maintainers? It's
not exactly a subsystem so it may not make sense, but it does also seem
like it'd be good for newbies if there were people to flag what should
be done or what might be worth investing time into.

Sorry if this is a bit incoherent, it's a bunch of thoughts I had, I
think for me the janitor project is probably worth a lot of my time so
I wish to get involved a lot more.

Ruben Wauters
