Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3704A0C;
	Sat, 10 Jan 2026 19:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768074850; cv=none; b=u3FEiTVwKJlz96cIJair2UWfPEz54D9jghbU7Ma8sBxjxBunAiOaQ0KKDCgVi2RjXrPvBlVSHwJSpG+FeuELaIdoUGSB946slIXrbCFyOsGME3rEBjAXg+pvqlRKICP0EsbB5WLBZdqTHvxeaUD8F4wb/a6gp7wheEQixpciGyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768074850; c=relaxed/simple;
	bh=z3MuvTXXGkDuAnC6qGUhfX8D7oQphnbZcljfUDF4mEw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=blm4j/H0/mPeB8SxsadplSxapRqA36Sn9O6Ui1Mj2pUmfCoRPyG1R6nLLmy6Ft66LwLjwBtPlJU5sLXB2DQRwL3t8JbYDP5dGkw3YaQB6j5Ku83OuMIOY3oKAI13mG6wz8fHtdt+PWhKRpkfRuz9gkKOOspl44Lr6hP9F5uDgsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MONkndmU; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MONkndmU"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AJpue71780139;
	Sat, 10 Jan 2026 19:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=6CKc+59bT/Re8Ue8gJ3PU5KeCtl1/
	lOylz6p9PA83ks=; b=MONkndmUTxOj2LfqnhhEa6B/luu0AxgJtmrQroWk9u2BV
	UuwTnJIkfedjQNeWAlyfnEmIIlAt2E9GOYjcolrxMp48LSeQ+xoHkM/DqC5RusDC
	9myZClwZs6LMsQSfmDu3GotgwFW3OS47h6wE4995AfAQrCWmuV/RRXP1oBts4zCu
	wR5Crueo9tuNYxF1+93Dw8AIdt9MHQPRKIbYwez8JBSi5u0LPH1E1geq4gxptQpT
	hUoMJp3u+ccLi2mA8P2WB5LZTfquYRMsAOAyVQzNTFZOldvwk/GesxOTWwY5Ally
	FCzKrqE1toHGQCL77178pwwt0EHQVA//r7WiGIkyw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrr883x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 19:53:41 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60AJUCg4005709;
	Sat, 10 Jan 2026 19:53:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd75xsbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 19:53:40 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60AJrdb2004523;
	Sat, 10 Jan 2026 19:53:39 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4bkd75xsbe-1;
	Sat, 10 Jan 2026 19:53:39 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Pascal Huerst <pascal.huerst@gmail.com>, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] ASoC: cs4271: Fix resource leak in cs4271_soc_resume()
Date: Sat, 10 Jan 2026 11:53:36 -0800
Message-ID: <20260110195337.2522347-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-10_06,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601100176
X-Proofpoint-ORIG-GUID: izZs5aMPujIGgzUbjg7PIpBAtkShH3hy
X-Proofpoint-GUID: izZs5aMPujIGgzUbjg7PIpBAtkShH3hy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3NSBTYWx0ZWRfX124/piEvnyiF
 kvEDKkGYhZall6oIplDszawmZiHZBXmyuv8CsXddevXGYmFUPw2ste2cnK4ieBiVQDLo1dOypSi
 AiYQKeRlf/oITXgKmbYNXIjFKWSB/tXxw4sZQ1uSjnQZMDyR6M3HPkVeTpH5lHlTV5h3ZBnuf2/
 hcs+Rs8RRxR7dxlQb0VcFU8Q2NcpQfzcRAoVSXQbjMjTh1Sc8gxz2N5GMo6mVD2kNZLQq09pKgs
 ifhRD2WNO3gqUyTxL1MqzqYNbdHjybl6PLM4wTjO10ySye8kQD8W1r5Ue/2h/NivufqUwlBLxuq
 uWXFDz50ErsEDLGN17VTK5dC1j8sExVw3Bxra/hVBmg69jo/C++KVC1+N6xDeNHHqbfz8FPCOwg
 wSLgGI1c1VWakOQss7orCLckjfZV97p4CESjyZDrsydJw30WD205h4Ivl7mVM8KlKOPLxnvNwlk
 6W20Ot7/GrRuozQZLJQ==
X-Authority-Analysis: v=2.4 cv=QIllhwLL c=1 sm=1 tr=0 ts=6962ae45 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=gLYq8THK-Kfe0PQHkmoA:9

Smatch detects this resource leak:

sound/soc/codecs/cs4271.c:548 cs4271_soc_resume() warn:
 'cs4271->clk' from clk_prepare_enable() not released on lines: 540,546.

Instead of direct returns, unprepare the clock and disable regulators on
the error paths.

Fixes: cf6bf51b5325 ("ASoC: cs4271: Add support for the external mclk")
Fixes: 9a397f473657 ("ASoC: cs4271: add regulator consumer support")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.
---
 sound/soc/codecs/cs4271.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 77dfc83a3c01..d8cdd37e9112 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -528,7 +528,7 @@ static int cs4271_soc_resume(struct snd_soc_component *component)
 	ret = clk_prepare_enable(cs4271->clk);
 	if (ret) {
 		dev_err(component->dev, "Failed to enable clk: %d\n", ret);
-		return ret;
+		goto err_disable_regulators;
 	}
 
 	/* Do a proper reset after power up */
@@ -537,15 +537,21 @@ static int cs4271_soc_resume(struct snd_soc_component *component)
 	/* Restore codec state */
 	ret = regcache_sync(cs4271->regmap);
 	if (ret < 0)
-		return ret;
+		goto err_disable_clk;
 
 	/* then disable the power-down bit */
 	ret = regmap_update_bits(cs4271->regmap, CS4271_MODE2,
 				 CS4271_MODE2_PDN, 0);
 	if (ret < 0)
-		return ret;
+		goto err_disable_clk;
 
 	return 0;
+
+err_disable_clk:
+	clk_disable_unprepare(cs4271->clk);
+err_disable_regulators:
+	regulator_bulk_disable(ARRAY_SIZE(cs4271->supplies), cs4271->supplies);
+	return ret;
 }
 #else
 #define cs4271_soc_suspend	NULL
-- 
2.47.3

