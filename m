Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB443382E8;
	Sun,  1 Mar 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772389596; cv=none; b=ip1inrxCXxpecudO6O1U+KNmfHX6qRtSQqNFImd9GCXZGAgGdi+HphuCN8+SIc2Y8kEIiKt/RnRrZILvKYGUAaKU2GSa8WlKcoYhs6yYP53w3clKnE6oVVr+Zgp+ghQVEElIJFB9/6di8nu93d18Q8eTKr4c39aRWoKw7FJpyT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772389596; c=relaxed/simple;
	bh=vBTxyRbuk9qgfPgwDOh9IZ04IQBTtDGMQ0Y6uPZB2QE=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=qaW2CEysFboli6o9F+ZOlb1QZy6kaWpWBOS9UGZKiCj7a4Arhtk4+4L/FP5sA2W+cuLXH2HidImZOW6++BoQEIo2bTgKeqGfV/ZZaLLEPlEO6RVGHtXJkuI1KvnPGU7VaW7ChfoZArv8KP+Wyd67EWL8LKuSqPZYLhCA2YRDi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=bhNm7VX8; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="bhNm7VX8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1772389561; x=1772994361; i=markus.elfring@web.de;
	bh=JPOwL5LtmwAUEhf9msAgnUvkNWjnm5zygJD8uU9vbqE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=bhNm7VX8HMdpiRyCXetWF7gve5io8PFnJHli/H3BrGOaWbXiSjkSnXxzidQEw1UM
	 xyXC1DfYbKi8sRnJ4QnEQ//dvnGEPwy23ls7nHcRvWjEbcq/gn5OzPc9MM6gx2lbL
	 sL+t32DAOd7Wbd8LwsukF5BHTOcsIXvWKhs3+SO4ZWtfG6rwSYcMDM95Q8BkmGzas
	 5RqfCaGMa3Z+v5ZhIVbmJEG3Qx42zm7DG+Y3hbEP+Psj3HXhYcC4yDDwweEJICV4J
	 vfn2rowQi37f5iN9+Xl68/dPCwXi06l9sOq6VaMt64SZrimGgk8Fx6Mli61ZYwJjg
	 q/cLNqCI1DEgVU3EqQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6pUQ-1w2q1f34wQ-00CoBd; Sun, 01
 Mar 2026 19:26:01 +0100
Message-ID: <44203b94-0d4d-4411-9f9e-103ef19172b6@web.de>
Date: Sun, 1 Mar 2026 19:25:51 +0100
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: linux-i3c@lists.infradead.org,
 Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Aniket <aniketmaurya@google.com>, Frank Li <Frank.Li@nxp.com>,
 Fredrik Markstrom <fredrik.markstrom@est.tech>,
 Ivar Holmqvist <ivar.holmqvist@est.tech>,
 Jorge Marques <jorge.marques@analog.com>,
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Zilin Guan <zilin@seu.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 cocci@inria.fr, Jianhao Xu <jianhao.xu@seu.edu.cn>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [PATCH] i3c: dw: Complete exception handling in
 dw_i3c_master_i3c_xfers()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:tSXVZHBbIK5xjwZhaygDWeHXQZPsCZsck/676Wjtcvh4u93PeYr
 0MwtMi79p0bxd9QiIcGKOAgyYWxB+S8AvQ7GfgW0Rm7krpt7bJDAKiKW6eD48rHe0bl9uHe
 7xunibjpnZI4Q55zfBU2GPKafg+EkE3p5y8dq+By6sgAZEX34SaCCGgF0p6oCid2U0caWha
 zZ4PzW4uVqB9qt9r8gg9g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:zqdcEdI4ORA=;buusgYwo/qga8Ub7nO0ll3/K1dD
 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
 Q4FDUr9OZDEcdvidTmam

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 1 Mar 2026 19:11:51 +0100

A dw_i3c_xfer structure is allocated by a dw_i3c_master_alloc_xfer() call.
It is not released after a failed pm_runtime_resume_and_get() call.

Thus use an additional label so that the affected memory is always be free=
d
at the end of this function implementation.

This issue was detected by using the Coccinelle software.

Fixes: 62fe9d06f5709caa1fa68055873ff279e05ade37 ("i3c: dw: Add power manag=
ement support")
Cc: stable@vger.kernel.org
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--
 drivers/i3c/master/dw-i3c-master.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3=
c-master.c
index d87bde3f7700..723f185584d0 100644
=2D-- a/drivers/i3c/master/dw-i3c-master.c
+++ b/drivers/i3c/master/dw-i3c-master.c
@@ -953,7 +953,7 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc=
 *dev,
 		dev_err(master->dev,
 			"<%s> cannot resume i3c bus master, err: %d\n",
 			__func__, ret);
-		return ret;
+		goto free_xfer;
 	}
=20
 	for (i =3D 0; i < i3c_nxfers; i++) {
@@ -994,10 +994,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_de=
sc *dev,
 			i3c_xfers[i].len =3D cmd->rx_len;
 	}
=20
+	pm_runtime_put_autosuspend(master->dev);
 	ret =3D xfer->ret;
+free_xfer:
 	dw_i3c_master_free_xfer(xfer);
-
-	pm_runtime_put_autosuspend(master->dev);
 	return ret;
 }
=20
=2D-=20
2.53.0

