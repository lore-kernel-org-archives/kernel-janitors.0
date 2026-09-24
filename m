Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0E051C043;
	Thu, 24 Sep 2026 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284483; cv=none; b=gLqYjZhpi+X6IvO0FywA7iGJOOAI5rjeMmOWcBL/QwvPoj48tuoL/njdNSfJ96vQB/L5CG1kpDK4J2Xt9Qpw+P0a8qQCpdk1MN2W5kQUEiwH6zD4qufO1/xfjabiL8SYUVl22+IdFEFmm0MBYqVULCBlDcBtyYVa2aCWdX1nnYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284483; c=relaxed/simple;
	bh=rMC+qmhpzGdUh28FEV93/pasrAufy1jmGmFbZZmuZzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iyyS1lMua2tUH/AVzfv6P4Zm10ajobm23LtaGJcx4RDTRdkCigzx1SYU9YBzKjGA0gKYTOFoHfK3XwTK1W7v2gMMPrYtbjDl/s6+G2ozm7JA5yfzATMaaoFQKHoI/Rd30iDwwbCs6NWwUGmjTKxdnwhoIeRUMQDxdTpW0W5vXZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ANDDhvCU; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ANDDhvCU"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OKN0Vw2048300;
	Thu, 24 Sep 2026 21:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=Od8uxzFRcXn1dKpqU0OqpahPidb7/
	qjJpGL+wca7Ewc=; b=ANDDhvCUKHFCQfrKPhvRVYRMyLmzfBvwW7DDJwyz7iKac
	oZjC8uITxkljlY/I/0Kilnir5B93Jg1pecr3ZeuTpcSw5/35N3y/TwCAMRHpMvYQ
	0o3qRh++LyHw7iruhGeP5CZ7fuhiZAxYW5yzVZleqifNaSxbaoGJFSl0PQwOPdXS
	J7VFFwYmX4XlO77okcKkB2AlJHDXErrsAAqi0TKVhahv30QYtAaDO/fPbV6EQITM
	kkyFeHJ1d+Q5p3HItrBy9yP8cwuOoGtceh6O1gT7OB1fNz1aiIvLCge0UAWJui0K
	DmtjzLuwioiGCakLYuSLR+/+yC4wGQbCm/ZWC7B8g==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4gsk1qggwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 21:14:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.7/8.18.1.7) with ESMTP id 68OL5RfL015582;
	Thu, 24 Sep 2026 21:14:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4guf11wcb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Sep 2026 21:14:15 +0000 (GMT)
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 68OLEF9X038867;
	Thu, 24 Sep 2026 21:14:15 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4guf11wcax-1;
	Thu, 24 Sep 2026 21:14:15 +0000 (GMT)
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, error27@gmail.com,
        harshit.m.mogalapalli@oracle.com,
        Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH] mtd: concat: use container_of_const() in CONCAT()
Date: Thu, 24 Sep 2026 14:14:11 -0700
Message-ID: <20260924211412.896753-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2609040000 definitions=main-2609240086
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfXypevihtfVMZa
 06jAWhQxyf89229zVhBNU/XivNr3VdERq+QR+H5qydBMxeohcpwVr9YlM9cZA5b/mZmecdUkA0e
 sMzzeyIKEZoqgZoYp7VJMBfX6VVItueo/+ysZEZjzT91VXTC84SP
X-Proofpoint-ORIG-GUID: UWOImZUVJdpuO9Z13whXJXXYakAk3_Eu
X-Proofpoint-GUID: UWOImZUVJdpuO9Z13whXJXXYakAk3_Eu
X-Authority-Analysis: v=2.4 cv=LIzz05W9 c=1 sm=1 tr=0 ts=6ab592a9 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22 a=jiCTI4zE5U7BLdzWsZGv:22
 a=x0eKOSpe3m1H3M0S9YoZ:22 a=P-IC7800AAAA:8 a=yPCof4ZbAAAA:8
 a=qdRr1Xr1hLVJPj8QfBgA:9 a=d3PnA9EDa4IxuAV0gXij:22 a=5yU3S35YU4bGjq-dph-N:22
 a=Bho9c0fBagfJEIQBS7DQ:22 cc=ntf awl=host:12106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA4NiBTYWx0ZWRfX/RYitdufrGa/
 Rdhj2soTuBl9uMdo0cYEy55sIFlyhl5i3YMgNN8EIpFux0d7kG9hB2PO4f5jQB8od9A9eZRRIpt
 UjzSFh1ByBKAtzst41Az4k0/82qHmfrAZcV6qssPGF9VmTSUxj0r6syUKiFN7XqOfpWlSWFNzMy
 3j6l4xOKZ6ykQKoBrDjGaT8LypMUZc1PbjjMy4208Pb6Xe+zImkTWK3F0bIQlAA79kfxYWMw+kA
 gCR41A39oco2ZTpkeCcKsi48tIYH528bRmem/eL//QFNCGCElXDIxh0iEECp23c7SAvrkGK2QGb
 xgCZ5nDHUZaZAd25eRzLOTsyU8kP4nJJRpLpTJdUkdELyHDYO5Y6PFn6MWPaIHmpED+n/GTdYW7
 zJYboHQ1/SJlqNLATvVwf/zQBvD8IqlsercrvSVkfQnnFPMzBo7GWz9PapGg98QioPx/Qgdx5Iw
 AzOqOFSARkjSOPd9VcqOqae890zGmQLQRfPJc/Lc=

CONCAT() currently recovers the enclosing struct mtd_concat by casting
its embedded struct mtd_info pointer. This assumes mtd remains the first
member of the structure.

Use container_of_const() with the named member to make the relationship
explicit and preserve any const qualifier.

Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
 drivers/mtd/mtdconcat.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdconcat.c b/drivers/mtd/mtdconcat.c
index d54d309c30a0..354cc71cd722 100644
--- a/drivers/mtd/mtdconcat.c
+++ b/drivers/mtd/mtdconcat.c
@@ -31,7 +31,7 @@
  * Given a pointer to the MTD object in the mtd_concat structure,
  * we can retrieve the pointer to that structure with this macro.
  */
-#define CONCAT(x)  ((struct mtd_concat *)(x))
+#define CONCAT(x)  container_of_const(x, struct mtd_concat, mtd)
 
 /*
  * MTD methods which look up the relevant subdevice, translate the
-- 
2.52.0

