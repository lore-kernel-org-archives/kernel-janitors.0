Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A681C36
	for <kernel-janitors@vger.kernel.org>; Mon, 30 Oct 2023 07:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mfaMaHN/"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADF64BD;
	Mon, 30 Oct 2023 00:09:03 -0700 (PDT)
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39U3ee5e010986;
	Mon, 30 Oct 2023 07:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-03-30; bh=aIxu7yh5wYJuZc53Lt9scwP9Vbcx6BNPRaxSyYFe7Jw=;
 b=mfaMaHN/z/yI+4q9NdIbisvzvXWPd+stfg1t+PKV3kaFfyEj5FShwbjY/twn8c5LFZ7h
 JJtPriCzO/tIa2j9ls7wlK/842S69B+zoo3komTP0gItpumrnxvu7IZpC9ozMQwHPOb1
 TWVB1/64pnDgXZvEEI9ZJ2dtvi0v8P9nzBOTrnhsPYHEbtdZI4K41NU3UqZsqys8LxuG
 nrgJyCnPzFvhKhWUZbpkLyrKgu7qFqHefjO3WVMoCJyr5GMwCYfR4LSbFigYDeSAnLAW
 jt2NGTpiR3eOQRqxZyth4Gz9J4MFnx6R1ExPj5pL7eaAzekRy+Rlwevdq3p4sY86V5gv DQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3u0s7bt2jk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:08:42 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39U6hbXV030752;
	Mon, 30 Oct 2023 07:08:40 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3u0rra4qt0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Oct 2023 07:08:40 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39U78eAF024650;
	Mon, 30 Oct 2023 07:08:40 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3u0rra4qrs-1;
	Mon, 30 Oct 2023 07:08:40 +0000
From: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To: James Schulman <james.schulman@cirrus.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>,
        alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, harshit.m.mogalapalli@oracle.com
Subject: [PATCH next] ALSA: hda: cs35l41: Fix missing error code in cs35l41_smart_amp()
Date: Mon, 30 Oct 2023 00:08:36 -0700
Message-ID: <20231030070836.3234385-1-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-30_05,2023-10-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 suspectscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310300052
X-Proofpoint-GUID: bc-zOkdmnKuRWRdTO1gCctbjFzAf-h0D
X-Proofpoint-ORIG-GUID: bc-zOkdmnKuRWRdTO1gCctbjFzAf-h0D

When firmware status is invalid, assign -EINVAL to ret as ret is '0' at
that point and returning success is incorrect when firmware status is
invalid.

Fixes: a51d8ba03a4f ("ALSA: hda: cs35l41: Check CSPL state after loading firmware")
Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
---
This is found using smatch and only compile tested.
---
 sound/pci/hda/cs35l41_hda.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 496ff6a9d300..09f8d8fa4c71 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1042,6 +1042,7 @@ static int cs35l41_smart_amp(struct cs35l41_hda *cs35l41)
 	default:
 		dev_err(cs35l41->dev, "Firmware status is invalid: %u\n",
 			fw_status);
+		ret = -EINVAL;
 		goto clean_dsp;
 	}
 
-- 
2.39.3

