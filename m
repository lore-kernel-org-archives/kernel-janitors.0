Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2452C19F12D;
	Sat, 10 Jan 2026 20:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768076481; cv=none; b=LcvV4n3L2lsiXprm7XRI7TiEAyTbD5tQh0jUIQM2cjx2Of+IZtzQCdbghGDyrDjDHQ9sHiBwsnm4jHNZM2YmQRjGbKF4B+Vq/rzRBwJsKtmTk2Ru7r8Ycz/sZbLM+RZvb+k9o/nQxRmQFiNWydZS7luFSbCTcD7lNnt3od3Qnpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768076481; c=relaxed/simple;
	bh=OAappmz3fo+otCHUJI3tFwLUmRmxNaTQF0gO0IkPVks=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uXN2hrZaPuijk94Y44QrDcNhCW2KJ1pF6jtEwRf3O04gZ7U5ddzDuQhj1ApHffknzUMtVrk6XvKVHcMgSQ1c+cTUrkJLkSEKy7DxQxZNPlPmbxevIW6vq9GtSxhHaKJIdxXVWqgZ1Zj4uoHCk/vsgIrEfWsID1+Ty0lolbPbyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S4XMOIrj; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S4XMOIrj"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60AKK2EK1770559;
	Sat, 10 Jan 2026 20:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=7ijHvOU9/iFa2Ow2HEPLVW5u8wu8O
	sZFyGKIllBwtKk=; b=S4XMOIrj45BD11Bw20D8csIW4H/079D40goQnXF+wCziv
	KrizUPCoAD5IjXQRb8QjXcJJfv/XNtWcASrHm6zCSY0UAedavzrYQweHgKosnQyj
	o4HXml253VIPRPBYYyiHjYLW5dBrH2Iqt+TrU9HrZ2CSPpLunGh8wYy6nQEqV9SR
	7qtpWw7F6RYwM6qeAzFunmBmqmsg2jBiwzWMmpn+kZg7jaNjCQyVksCnZz0wYLsQ
	zlnFB7lPStgAwoWVD3dueYZvX6FZNAQY9b4tfoIj0/o0O7Ld6tjqWFlR8aGUHCI4
	VXqV2/UECS6YbDxCip/n5khCsPeIFBuwzQFBYhl+A==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkntb06ad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 20:20:04 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60AJfOIE029143;
	Sat, 10 Jan 2026 20:20:03 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7fy11b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 10 Jan 2026 20:20:03 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60AKK2qv031226;
	Sat, 10 Jan 2026 20:20:02 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 4bkd7fy10h-1;
	Sat, 10 Jan 2026 20:20:02 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] soundwire: bus: fix off-by-one when allocating slave IDs
Date: Sat, 10 Jan 2026 12:19:58 -0800
Message-ID: <20260110201959.2523024-1-harshit.m.mogalapalli@oracle.com>
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
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601100180
X-Proofpoint-GUID: Zg1fxSGo9IO1SCR2yWYmoA-OqZiqyQuJ
X-Proofpoint-ORIG-GUID: Zg1fxSGo9IO1SCR2yWYmoA-OqZiqyQuJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEwMDE3OSBTYWx0ZWRfX7mLC0QWY3cjd
 IxXmsWgcXlZqKysH1cRuxqtaZuIvU0jmb23YkQ0TgjVuEWn/7VYiNryJXzsmM77hZb8KYq6QOmq
 Ttad24qG6C0cIeLOFY3kovTLC2J//yMOtbEn5Qry5lixu+I9deG+JLCmBGDSqjs+UBaFmF6uKDZ
 pobBKMgvoZD7G+g6WwW7oOk9nZkL4uHbk4Y8w/89uVD3TIonvZZajnX1WbBn6uwcmpyXaw5/gEm
 cAlU2bkHdGMzTYlfTH5CDtiH1r96chlT8XGb//3kmy1athXKlYIfohphV5yzfPql0gmnxLo2OLn
 l7ewnsfZvbN/jyBmImX3SEJFAgJbN1Xk3qTQgmmjUES91e5eADQ87M7DetPUEdHwCC42gR/Iwem
 Tbxkegq6v1M7wkfncjbIhRkuk0scZYU+3VIJkEU+DXJhxLMol5EjCs/nmhJtd1+6bIrJzkoxG4m
 p0BPAkSDImBoeNeCdknHtT5VXOIpTunKjM1zWQZ0=
X-Authority-Analysis: v=2.4 cv=fIc0HJae c=1 sm=1 tr=0 ts=6962b474 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8
 a=KKAkSRfTAAAA:8 a=yPCof4ZbAAAA:8 a=mB-17uOxkHmt-iRIUBEA:9
 a=cvBusfyB2V15izCimMoJ:22 cc=ntf awl=host:12109

ida_alloc_max() interprets its max argument as inclusive.

Using SDW_FW_MAX_DEVICES(16) therefore allows an ID of 16 to be
allocated, but the IRQ domain created for the bus is sized for IDs
0-15.  If 16 is returned, irq_create_mapping() fails and the driver
ends up with an invalid IRQ mapping.

Limit the allocation to 0-15 by passing SDW_FW_MAX_DEVICES - 1.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202512240450.hlDH3nCs-lkp@intel.com/
Fixes: aab12022b076 ("soundwire: bus: Add internal slave ID and use for IRQs")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
Only compile tested.
---
 drivers/soundwire/bus_type.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soundwire/bus_type.c b/drivers/soundwire/bus_type.c
index 80ed3468e860..a05aa36828cb 100644
--- a/drivers/soundwire/bus_type.c
+++ b/drivers/soundwire/bus_type.c
@@ -99,7 +99,7 @@ static int sdw_bus_probe(struct device *dev)
 	if (ret)
 		return ret;
 
-	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES, GFP_KERNEL);
+	ret = ida_alloc_max(&slave->bus->slave_ida, SDW_FW_MAX_DEVICES - 1, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(dev, "Failed to allocated ID: %d\n", ret);
 		return ret;
-- 
2.47.3

