Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03CFE3CAA5D;
	Thu, 11 Jun 2026 11:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175977; cv=none; b=Uj5heMaESRWxzLnBHsBmPuuF0dTbmjfFMXFyNCk+QTYs/4dF3P9o/peh2aFul8CrHEO4zvIqw2NRrJj5xFgtWWSr0AiCzdMZuTlManTN5Z5hRv8ZUuSuoZRW8/oyGF05Rl0+6UHH3+0bkXWe7ALWMFt346znkFWbUCAFoByjqcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175977; c=relaxed/simple;
	bh=GHpkckXUoEFdar/SCuYs43YCPZSDC+k7gKcr2KHVi9s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=utUWo6Oe/IGL7SnuAaPWsPYBG8J/TqLybXhF3zjz3sv800R5QFAM1Q4X0cWV0LAsGyBKMg/bgx0lhkbHVwFfza3oCUkyWKB0YScb15nkwGdtkaBp2hS2pTLB4Yh9WiZUd55J3an7+hZQsX/90EUsxHh9Dt+41TVgeI1zVPlv42Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VRKtSCk6; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VRKtSCk6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B8w8ED3839579;
	Thu, 11 Jun 2026 11:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=ce5IvPFnAqcEf6ab8GHoKaB5RLDO7
	4q2dOCP/D1pjwk=; b=VRKtSCk6C12WSiuZbgGWmCNAwX+4IK1267djygrBTz/xa
	3lGHxM27qh5Yw927mPN7M+nYyl7ouzudHgV0nB76hZUTs91IoChXkgvkgCPy6JGp
	rS1A+j0yrblcWTa/HJWKKbvRydpwLa0w8OtsQ/OFAkQ9skJWUwG7yfOm6wejgjNM
	MCdhNo8Zz2MSPfl1VtZebNfZzhZRI3TSF7CRH21AefFeVbHFWCvTLKO5TcM0Ij9r
	HqJ1RlSEdeRx/FORHhp7usn5l3dXGjYRWWM++g8/B0jLMFy5W7BAwOCg2Pf97wj2
	cnjPbtKmLp3N4SXPFQAQLczClHC10R3Mt8rc9ewbg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4eqe6us1ep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 11:05:56 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 65BB37dc014786;
	Thu, 11 Jun 2026 11:05:55 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4eqjtvjm09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jun 2026 11:05:55 +0000 (GMT)
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65BB5sFn025703;
	Thu, 11 Jun 2026 11:05:55 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 4eqjtvjkyr-1;
	Thu, 11 Jun 2026 11:05:54 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Pankaj Gupta <pankaj.gupta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com, sashiko-bot@kernel.org
Subject: [PATCH] firmware: imx: Fix device context UAF in close
Date: Thu, 11 Jun 2026 04:05:22 -0700
Message-ID: <20260611110534.573543-1-harshit.m.mogalapalli@oracle.com>
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
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2606040000 definitions=main-2606110111
X-Proofpoint-GUID: WO9dpoTKbTX7adXHMUuvAeu75OZnJVTW
X-Proofpoint-ORIG-GUID: WO9dpoTKbTX7adXHMUuvAeu75OZnJVTW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX71uLciI0Cpsf
 8fTJbjGGPKIWQDDysOF2RBmxda/erywcpf/Y42KWgwk3I8zNN3dnWBU93CobeDubeil39Slcxvu
 v3KtQD/azA3RiuhxvZhLVjIynq0YO6H2SGhBju0xpmGfTh8NiNWR
X-Authority-Analysis: v=2.4 cv=edINubEH c=1 sm=1 tr=0 ts=6a2a9694 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=3I1J8UUJPc9JN9BFgKH3:22 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8
 a=z1jSPYMi4rPRFrry188A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX+xSexBPtlxnL
 7L7StVmJ7+bf1SkQOvDdy7U0f2vvtIWOmxgrL+Gkp8fDH3/5LNztbEgvlMOt0FnSfpsI6s23L/Y
 xri1HeGPjgFED5IVHkreGvFmmDbPUFipRykxWb2g9QEw6ZhQCWpXwCwRYS3VBRSKe3ja0J5htaJ
 x9W47UtpUt4WhGPrTwxItLUTtPr7uJX0cbQLT/Fv/QK0EJ2Nw6obr8i2l8d6RISwdb5jC3kTIpJ
 UhC+CyKLs3st7oiT6XDJe25RJ3REcLRrU0FPMhjZjYJuDCKKbUt0jiIOJtgvF+netJYd2dRugbm
 JE6tY7RSHnGAP/4VRD6VgY/vwj9JoBsMZFsgWxCUCivL600ipE9D2xa4UFGAfs/2DLddNNxUk6U
 YsFl5Db9cybngJOtWP/myqX7aBRGtx5jV+t/hRS4pMYvXOg7jObX2547NS5tiBU7gIMxH5QlBMi
 vVOB8FZ/+UdXOAhJwqQ==

se_if_fops_close() frees dev_ctx while still inside a
scoped_cond_guard() that holds dev_ctx->fops_lock. During the cleanup
phase it would do a mutex_unlock(dev_ctx->fops_lock) leading to UAF.

Fix it by freeing dev_ctx only after leaving the guarded scope.

Fixes: 2768fdfd5585 ("firmware: drivers: imx: adds miscdev")
Reported-by: sashiko-bot@kernel.org
Closes: https://lore.kernel.org/all/20260528094337.9C1D41F00A3A@smtp.kernel.org/
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.

 drivers/firmware/imx/se_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
index 8fab3b7767b7..fc3bbd1788bd 100644
--- a/drivers/firmware/imx/se_ctrl.c
+++ b/drivers/firmware/imx/se_ctrl.c
@@ -887,9 +887,10 @@ static int se_if_fops_close(struct inode *nd, struct file *fp)
 		list_del(&dev_ctx->link);
 
 		kfree(dev_ctx->devname);
-		kfree(dev_ctx);
 	}
 
+	kfree(dev_ctx);
+
 	return 0;
 }
 
-- 
2.50.1

