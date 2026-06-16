Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442639023B;
	Tue, 16 Jun 2026 10:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781604909; cv=none; b=Jdcmh03j/8uDwITZD9rIA2XpfpxkA4rTsyt+yIb67mEMNSvi4XkZ8WbaZSwzoghF5ly8gLg2srca5zcy/Z3ASsGaHEmlZyYaTR7aB9ruYYvjrPB59MhzHzl53EyZRuQA9FZryFxJVGlMkkMohxoz/0VNHRZo7RBqz8ZIYbk+x3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781604909; c=relaxed/simple;
	bh=axGORA2xv9Q4MO1Qg9A3DGnnH0QVhVui4sFHzIxMGMc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HSBmbPVygsFS1H6ODN1zldiEK0UZGbY+gSq/clcTYMMA565uTokXlNfhBD+S5RkT1QSRdLI/cI8fodF+GaVFV8RWjXDdW3XzGrD+x1KwtWtC/EFkuM1y1mCoMwAFnEGVae+gO6am1rl2t6IixIvqflhZ6uk5/I82s2gJNZ1yE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=eroxbPzq; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="eroxbPzq"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FKGMeo1349670;
	Tue, 16 Jun 2026 10:14:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=NDZ/rNAyyiQztJHXv1jXH/dgpJCxA
	0grh9rlj860HiU=; b=eroxbPzqEiFUuwHPbjsRZJ80Hfzrmd8WJptwMYnZERr6t
	sB7dvzVyOjhBEwoFl23cbBwG42G+ufm09yvfqzh3QGQxAOx+VjsrCiRjpJDn3QzP
	van1+ALTzfduWhwC603ayEooqSlEp25AsIyYZoqXOdOoMunhW0tVDWrYYiPBojLh
	Oo5X65wB6AY1J3EZwh9SeA9+VPZPrOuTqhdk6/jcp8WPq8wxjlCmdgsCNtKNrmuO
	JGiTV+ZMqxcoWbueGp1Zg302KCC2f+vrN9k1HGsljEJKGq7FTRanpzI+ijWkrqGd
	RPoIVJVX6LXnpOygGSSFLh5PyhKR+GlSa3XVL9nqA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4es1acc62f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 10:14:45 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65GAD9MI017054;
	Tue, 16 Jun 2026 10:14:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4etq679av2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jun 2026 10:14:44 +0000 (GMT)
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65GAEhUc021963;
	Tue, 16 Jun 2026 10:14:43 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4etq679aup-1;
	Tue, 16 Jun 2026 10:14:43 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Subject: [PATCH] mtd: virt_concat: fix use-after-free in mtd_virt_concat_destroy()
Date: Tue, 16 Jun 2026 03:14:39 -0700
Message-ID: <20260616101439.1489392-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606160103
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwMyBTYWx0ZWRfX3G+bETHaEmfM
 ZmNeyMKvsbk8lLdwyh6X1GQK6nh1Zl8z5fX8sv8QdY3wqqUblLsQ30pX3ErRjo3oSFDAUWNIOsw
 PKlNxS2iuX8dJrwf75gAZEi1LpWZucLiXcT6eZv7XpCitD5yWQjlL0LmIY7azXvhTayVtAuSjeK
 eWtyhdSHMGLlDmVMJBndcjwWSH6XCTJqpozi0MOCMSp1qrWeMlkRbjLBAcElOQspD5yEP9yifdC
 SBF/xSMhuhSk++bPWzjcVi0x1aJ/YFWKnWJUfOXHJBdVeFgf2G+aKPYLkHG4xzknVtamcV0xmV2
 3OtQBNrtDi5sTUlT7FYk0xUG5iXSeL529toZTCfQFA/piXC0Pw20IzZrB4GdrVjrsL8HEyGzkg8
 AymUSH/ubeQmXahQn8U3yDQ5/Y+m57S2KQn7OY8g0pi0OdInVoa1dOjDhTaYCVjytU/tjrOCqw0
 Fy6HijH+dJbPC8DlCFw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwMyBTYWx0ZWRfX5S1cS4IG8QRG
 ZCNYH/johDAAXa25pWiHVL50RYLzp59egxgcKf91CRXGKNivMyT6VF6AXhc5edNiTgcSrr4l+OL
 NjukKWoxLPsPo7VBHiQpKtWjcV4T/AZNzlPRMAMQiGSv2yxIGtPs
X-Proofpoint-ORIG-GUID: lQaW7GYi0jxgZ1WDebdFVYXrAkF9fXwj
X-Proofpoint-GUID: lQaW7GYi0jxgZ1WDebdFVYXrAkF9fXwj
X-Authority-Analysis: v=2.4 cv=IqQutr/g c=1 sm=1 tr=0 ts=6a312215 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=RD47p0oAkeU5bO7t-o6f:22 a=yPCof4ZbAAAA:8 a=gnUwlkPgrbXfXN16ycUA:9

mtd_concat_destroy() frees item->concat so calling
mtd_virt_concat_put_mtd_devices(item->concat) after that leads to a
use-after-free.

Fix it by moving mtd_virt_concat_put_mtd_devices() before
mtd_concat_destroy().

Fixes: 43db6366fc2d ("mtd: Add driver for concatenating devices")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/mtd/mtd_virt_concat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index a3fb96788e9d..c872a8827718 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -126,8 +126,8 @@ int mtd_virt_concat_destroy(struct mtd_info *mtd)
 		if (concat->mtd.name) {
 			del_mtd_device(&concat->mtd);
 			kfree(concat->mtd.name);
-			mtd_concat_destroy(&concat->mtd);
 			mtd_virt_concat_put_mtd_devices(item->concat);
+			mtd_concat_destroy(&concat->mtd);
 		}
 
 		for (idx = 0; idx < item->count; idx++)
-- 
2.50.1

