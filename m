From: Postmaster@us.ibm.com
Date: Tue, 07 Feb 2017 09:13:24 +0000
Subject: DELIVERY FAILURE: User bryanlog (bryanlog@us.ibm.com) not listed in Domino Directory
Message-Id: <OF4F075C7A.FDAE7B6C-ON052580C0.00327EB6-852580C0.00327F23@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="==IFJRGLKFGIR8675290UHRUHIHD"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--==IFJRGLKFGIR8675290UHRUHIHD
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: base64

WW91ciBtZXNzYWdlDQoNCiAgU3ViamVjdDogUmV0dXJuZWQgbWFpbDogc2VlIHRyYW5zY3JpcHQg
Zm9yIGRldGFpbHMNCg0Kd2FzIG5vdCBkZWxpdmVyZWQgdG86DQoNCiAgYnJ5YW5sb2dAdXMuaWJt
LmNvbQ0KDQpiZWNhdXNlOg0KDQogIFVzZXIgYnJ5YW5sb2cgKGJyeWFubG9nQHVzLmlibS5jb20p
IG5vdCBsaXN0ZWQgaW4gRG9taW5vIERpcmVjdG9yeQ0KDQo=

--==IFJRGLKFGIR8675290UHRUHIHD
Content-Type: message/delivery-status

Reporting-MTA: dns;d01hub02.pok.ibm.com

Final-Recipient: rfc822;bryanlog@us.ibm.com
Action: failed
Status: 5.1.1
Diagnostic-Code: X-Notes; User bryanlog (bryanlog@us.ibm.com) not list
 ed in Domino Directory

--==IFJRGLKFGIR8675290UHRUHIHD
Content-Type: message/rfc822

Received: from b03cxnp08027.gho.boulder.ibm.com ([9.17.130.19])
          by d01hub02.pok.ibm.com (IBM Domino Release 9.0.1FP7HF93)
          with ESMTP id 2017020704113231-1638985 ;
          Tue, 7 Feb 2017 04:11:32 -0500 
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id v179BWto11206954
	for <bryanlog@us.ibm.com>; Tue, 7 Feb 2017 02:11:32 -0700
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327E3BE039
	for <bryanlog@us.ibm.com>; Tue,  7 Feb 2017 02:11:32 -0700 (MST)
Received: from e12.ny.us.ibm.com (unknown [146.89.104.199])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS id 059F1BE044
	for <bryanlog@us.ibm.com>; Tue,  7 Feb 2017 02:11:31 -0700 (MST)
Received: from localhost
	by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <bryanlog@us.ibm.com> from <kernel-janitors@vger.kernel.org>;
	Tue, 7 Feb 2017 04:11:31 -0500
Received: from mx0a-001b2d01.pphosted.com (148.163.158.5)
	by e12.ny.us.ibm.com (158.87.18.12) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256/256)
	Tue, 7 Feb 2017 04:11:28 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v17992B3139313
	for <bryanlog@us.ibm.com>; Tue, 7 Feb 2017 04:11:27 -0500
Received: from vger.kernel.org (85.230.35.121.broad.sz.gd.dynamic.163data.com.cn [121.35.230.85] (may be forged))
	by mx0a-001b2d01.pphosted.com with ESMTP id 28euqwj6dp-1
	for <bryanlog@us.ibm.com>; Tue, 07 Feb 2017 04:11:26 -0500
From: kernel-janitors@vger.kernel.org
To: bryanlog@us.ibm.com
Subject: Returned mail: see transcript for details
Date: Tue, 7 Feb 2017 17:13:24 +0800
MIME-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Microsoft Outlook Express 6.00.2600.0000
Authentication-Results: ppops.net;
	spf=none smtp.mailfrom=kernel-janitors@vger.kernel.org
X-MSMail-Priority: Normal
X-MIMEOLE: Produced By Microsoft MimeOLE V6.00.2600.0000
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:,, definitions=2017-02-07_05:,, signatures=0
X-Proofpoint-Spam-Details: rule=inbound_notspam policy=inbound score=44 spamscore=44 suspectscore=15 malwarescore=0 phishscore=5 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1612050000 definitions=main-1702070093
x-cbid: 17020709-0049-0000-0000-00003EE2F59E
X-IBM-SpamModules-Scores: FLB=0; FLI=0; BY=0.293193; FL=0; FP=0; FZ=0; HX=0; KW=0; PH=0; RB=0; SC=0.405233; ST=0; TS=0.349693; UL=0; ISC=; MB=0.001396
X-IBM-SpamModules-Versions: BY=3.00006572; HX=3.00000240; KW=3.00000007; PH=3.00000004; SC=3.00000202; SDB=6.00818387; UDB=6.00399916; IPR=6.00595847; BA=6.00005121; NDR=6.00000001; ZLA=6.00000005; ZF=6.00000009; ZB=6.00000000; ZP=6.00000000; ZH=6.00000000; ZU=6.00000002; MB=3.00014208; XFM=3.00000011; UTC=2017-02-07 09:11:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
X-TM-AS-GCONF: 00
X-MIMETrack: Itemize by SMTP Server on D01HUB02/01/H/IBM(Release 9.0.1FP7HF93 | October
 12, 2016) at 02/07/2017 04:11:32,
	Serialize by Router on D01HUB02/01/H/IBM(Release 9.0.1FP7HF93 | October 12, 2016) at
 02/07/2017 04:16:06
X-TNEFEvaluated: 1
Message-ID: <OF4F075C7A.FDAE7B6C-ON052580C0.00327EB6-852580C0.00327F23@us.ibm.com>
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0007_EA72607D.C4A4322A"


------=_NextPart_000_0007_EA72607D.C4A4322A
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

The original message was received at Tue, 7 Feb 2017 17:13:24 +0800
from vger.kernel.org [38.143.232.87]

----- The following addresses had permanent fatal errors -----
<bryanlog@us.ibm.com>




------=_NextPart_000_0007_EA72607D.C4A4322A
Content-Type: text/plain; name="message.txt"; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


The WatchGuard Firebox that protects your network has detected a message th=
at may not be safe.

Cause : The file type may not be safe.
Content type : application/octet-stream
File name : document.zip
Status    : No information.
Action    : The Firebox deleted document.zip.

Your network administrator can not restore this attachment.


------=_NextPart_000_0007_EA72607D.C4A4322A--



--==IFJRGLKFGIR8675290UHRUHIHD--

