Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66080381A3
	for <kernel-janitors@vger.kernel.org>; Wed, 15 Nov 2023 15:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Y7zr0BUW"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31148125;
	Wed, 15 Nov 2023 07:13:28 -0800 (PST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFE4o9M015821;
	Wed, 15 Nov 2023 15:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=3/HVFVhCe8GVOTgZ9DohMQhHSLCTTGPA3q552Ck/iGc=;
 b=Y7zr0BUWpQVsJg3W4MIiTt+yM+/QJ6InewX3w/d9MVed6HfYt2HiqUPxPkqpDi/Hwit6
 Equj4s+isP5vrXn2phxLAHRLuaEn4+RHXD+VWz5FbgS7TV6iBTuLIrZv3xtsb9cw12L5
 WjHIDGfuWUfsHaD1t+LOQfjnO9wnnYUwW1i4VlJy0nMKaUWcQoWf9bACLRxoHR9ZEdkL
 1vMrYPL4L5vb6ewVbNndLIc4BHkn8ndOu4RfcWLHFXBl/rFxqDcmKIlE5V7a4Wb8cTDX
 F8fNS9pgpeQ89yFtRCnouEY4HINPjqurYPrZHtYrIysvg24B+AFS8cTZkvvc5jdOw+uv YA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2n3gnys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:10 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFE7nCL004192;
	Wed, 15 Nov 2023 15:13:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxj4086j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 15:13:08 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AFFD8SN011253;
	Wed, 15 Nov 2023 15:13:08 GMT
Received: from ca-mkp2.ca.oracle.com.com (mpeterse-ol9.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.251.135])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 3uaxj4085x-1;
	Wed, 15 Nov 2023 15:13:08 +0000
From: "Martin K. Petersen" <martin.petersen@oracle.com>
To: Wenchao Hao <haowenchao2@huawei.com>,
        Dan Carpenter <dan.carpenter@linaro.org>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        Douglas Gilbert <dgilbert@interlog.com>, linux-scsi@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scsi: scsi_debug: scsi: scsi_debug: fix some bugs in sdebug_error_write()
Date: Wed, 15 Nov 2023 10:12:59 -0500
Message-Id: <170006111395.506874.3810936215375005901.b4-ty@oracle.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
References: <7733643d-e102-4581-8d29-769472011c97@moroto.mountain>
Precedence: bulk
X-Mailing-List: kernel-janitors@vger.kernel.org
List-Id: <kernel-janitors.vger.kernel.org>
List-Subscribe: <mailto:kernel-janitors+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kernel-janitors+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_13,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0
 mlxlogscore=724 mlxscore=0 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311150115
X-Proofpoint-GUID: NWYFpMpziWV1FPdYyt5UwL3jDm4bIDfy
X-Proofpoint-ORIG-GUID: NWYFpMpziWV1FPdYyt5UwL3jDm4bIDfy

On Mon, 06 Nov 2023 17:04:33 +0300, Dan Carpenter wrote:

> There are two bug in this code:
> 1) If count is zero, then it will lead to a NULL dereference.  The
>    kmalloc() will successfully allocate zero bytes and the test for
>    "if (buf[0] == '-')" will read beyond the end of the zero size buffer
>    and Oops.
> 2) The code does not ensure that the user's string is properly NUL
>    terminated which could lead to a read overflow.
> 
> [...]

Applied to 6.7/scsi-fixes, thanks!

[1/2] scsi: scsi_debug: scsi: scsi_debug: fix some bugs in sdebug_error_write()
      https://git.kernel.org/mkp/scsi/c/860c3d03bbc3
[2/2] scsi: scsi_debug: delete some bogus error checking
      https://git.kernel.org/mkp/scsi/c/037fbd3fcfbd

-- 
Martin K. Petersen	Oracle Linux Engineering
