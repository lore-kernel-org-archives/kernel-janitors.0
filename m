From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Sat, 13 Aug 2016 12:31:01 +0000
Subject: Re: [PATCH 2/2 v3] be2iscsi: Fix some error messages
Message-Id: <fdffed8e-d269-6519-437e-6f731dbb9c05@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4cd24bc3-7953-479a-1dbe-2aac9299ce13@wanadoo.fr>
 <1471072824-1491-1-git-send-email-christophe.jaillet@wanadoo.fr>
 <1471088144.3467.11.camel@perches.com>
In-Reply-To: <1471088144.3467.11.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Joe Perches <joe@perches.com>, jayamohan.kallickal@avagotech.com, jejb@linux.vnet.ibm.com, ketan.mukadam@avagotech.com, sony.john@avagotech.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Le 13/08/2016 =E0 13:35, Joe Perches a =E9crit :
>
>> @@ -268,7 +268,7 @@ static int beiscsi_eh_abort(struct scsi_cmnd *sc)
>>   				&nonemb_cmd.dma);
>>   	if (nonemb_cmd.va =3D NULL) {
>>   		beiscsi_log(phba, KERN_ERR, BEISCSI_LOG_EH,
>> -			    "BM_%d : Failed to allocate memory for"
>> +			    "BM_%d : Failed to allocate memory for "
>>   			    "mgmt_invalidate_icds\n");
> doesn't match commit log as no coalescing/concatenation
> is done.
>
> There are many of these.
>
I have *only* fixed the one reported by checkpatch and left the others=20
unchanged.

My initial proposal was to fix incorrect strings, without modifying too=20
much the code. So I decided to do the minimum of changes.

Should I resubmitted with:
    - all strings *in the patch* concatenated?
    - all strings *in the file*" concatenated?

CJ


---
L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9e p=
ar le logiciel antivirus Avast.
https://www.avast.com/antivirus

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
