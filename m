From: Matthew Wilcox <matthew@wil.cx>
Date: Sun, 13 Nov 2005 02:47:47 +0000
Subject: Re: [KJ] Question Re: fs/udf/super.c
Message-Id: <20051113024747.GL1658@parisc-linux.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============63669887142549264=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200511122110.52472.ace@staticwave.ca>
In-Reply-To: <200511122110.52472.ace@staticwave.ca>
To: kernel-janitors@vger.kernel.org

--===============63669887142549264==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Nov 12, 2005 at 09:10:52PM -0500, Gabriel A. Devenyi wrote:
> At line 795 we see this
> 
> --clip--
> return 1;
> 		
> 		for (newfileset.partitionReferenceNum=UDF_SB_NUMPARTS(sb)-1;
> 			(newfileset.partitionReferenceNum != 0xFFFF &&
> 				fileset->logicalBlockNum == 0xFFFFFFFF &&
> 				fileset->partitionReferenceNum == 0xFFFF);
> 			newfileset.partitionReferenceNum--)
> 		{
> --40 more lines--
> 
> Anyone see a reason why this code that never runs shouldn't be removed?

Did you try asking the UDF list why this is here?


--===============63669887142549264==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============63669887142549264==--
