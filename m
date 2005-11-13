From: "Gabriel A. Devenyi" <ace@staticwave.ca>
Date: Sun, 13 Nov 2005 02:10:52 +0000
Subject: [KJ] Question Re: fs/udf/super.c
Message-Id: <200511122110.52472.ace@staticwave.ca>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============090837212917994847=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============090837212917994847==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

At line 795 we see this

--clip--
return 1;
		
		for (newfileset.partitionReferenceNum=UDF_SB_NUMPARTS(sb)-1;
			(newfileset.partitionReferenceNum != 0xFFFF &&
				fileset->logicalBlockNum == 0xFFFFFFFF &&
				fileset->partitionReferenceNum == 0xFFFF);
			newfileset.partitionReferenceNum--)
		{
--40 more lines--

Anyone see a reason why this code that never runs shouldn't be removed?

-- 
Gabriel A. Devenyi
ace@staticwave.ca

--===============090837212917994847==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============090837212917994847==--
