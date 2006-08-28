From: Jim Nelson <james4765@cwazy.co.uk>
Date: Mon, 28 Aug 2006 12:52:29 +0000
Subject: Re: [KJ] [PATCH] nsp: remove 2.5-era ifdefs
Message-Id: <44F2E70D.6060805@cwazy.co.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060827190345.14338.8976.sendpatchset@david.homenet>
In-Reply-To: <20060827190345.14338.8976.sendpatchset@david.homenet>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

walter harms wrote:
> that would also kill 2.4 support. is this intended.
> (please note that 2.4 is used a lot in the embedded world)
> 
> re,
>  wh
> 

Yes - since this is driver is merged in the kernel instead of a separate
package, you don't need to maintain backwards compatibility.

The driver included in the 2.4 kernel will be untouched.

Jim

> James Nelson wrote:
>> This pulls a lot of 2.5-era #ifdefs out of the Ninja PCMCIA SCSI adapter driver.
>>
>> Signed-off-by: James Nelson <james4765@gmail.com>
>> ---
>>
>> diff --git a/drivers/scsi/pcmcia/nsp_cs.c b/drivers/scsi/pcmcia/nsp_cs.c
>> index 0d4c04e..96a7ec6 100644
>> --- a/drivers/scsi/pcmcia/nsp_cs.c
>> +++ b/drivers/scsi/pcmcia/nsp_cs.c
>> @@ -85,10 +85,6 @@ static struct scsi_host_template nsp_dri
>>  	.proc_name	         = "nsp_cs",
>>  	.proc_info		 = nsp_proc_info,
>>  	.name			 = "WorkBit NinjaSCSI-3/32Bi(16bit)",
>> -#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
>> -	.detect			 = nsp_detect_old,
>> -	.release		 = nsp_release_old,
>> -#endif
>>  	.info			 = nsp_info,
>>  	.queuecommand		 = nsp_queuecommand,
>>  /*	.eh_abort_handler	 = nsp_eh_abort,*/
>> @@ -99,9 +95,6 @@ #endif
>>  	.sg_tablesize		 = SG_ALL,
>>  	.cmd_per_lun		 = 1,
>>  	.use_clustering		 = DISABLE_CLUSTERING,
>> -#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,2))
>> -	.use_new_eh_code	 = 1,
>> -#endif
>>  };
>>  
>>  static nsp_hw_data nsp_data_base; /* attach <-> detect glue */
>> @@ -1313,11 +1306,7 @@ static struct Scsi_Host *nsp_detect(stru
>>  	nsp_hw_data *data_b = &nsp_data_base, *data;
>>  
>>  	nsp_dbg(NSP_DEBUG_INIT, "this_id=%d", sht->this_id);
>> -#if (LINUX_VERSION_CODE > KERNEL_VERSION(2,5,73))
>>  	host = scsi_host_alloc(&nsp_driver_template, sizeof(nsp_hw_data));
>> -#else
>> -	host = scsi_register(sht, sizeof(nsp_hw_data));
>> -#endif
>>  	if (host = NULL) {
>>  		nsp_dbg(NSP_DEBUG_INIT, "host failed");
>>  		return NULL;
>> @@ -1354,37 +1343,6 @@ #endif
>>  	return host; /* detect done. */
>>  }
>>  
>> -#if (LINUX_VERSION_CODE < KERNEL_VERSION(2,5,0))
>> -static int nsp_detect_old(struct scsi_host_template *sht)
>> -{
>> -	if (nsp_detect(sht) = NULL) {
>> -		return 0;
>> -	} else {
>> -		//MOD_INC_USE_COUNT;
>> -		return 1;
>> -	}
>> -}
>> -
>> -
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> https://lists.osdl.org/mailman/listinfo/kernel-janitors
> 
> !DSPAM:44f2e36a268641253225880!
> 
> 


- --
GPG key available
gpg --keyserver pgp.mit.edu --recv-keys E5AE413B

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFE8ucNcaO27eWuQTsRAga9AJ97xpAxqMpNO7rO3YnN/szzZunVGQCfVoDH
DSzEdqSMBomv0xegJJHOfZgl3u
-----END PGP SIGNATURE-----
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
