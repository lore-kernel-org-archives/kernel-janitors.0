From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Sat, 08 Dec 2018 03:20:38 +0000
Subject: Re: [PATCH] scsi: Fix a harmless double shift bug
Message-Id: <yq1pnucln5l.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181129103709.nthxjmmmlb2pdr6g@kili.mountain>
In-Reply-To: <20181129103709.nthxjmmmlb2pdr6g@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Jens,

This went in through your tree. Can you please pick this fix up?

> On Thu, Nov 29, 2018 at 01:37:10PM +0300, Dan Carpenter wrote:
>> Smatch generates a warning:
>> 
>>     drivers/scsi/scsi_lib.c:1656 scsi_mq_done() warn: test_bit() takes a bit number
>> 
>> The problem is that SCMD_STATE_COMPLETE is supposed to be bit number 0
>> and not a mask like "(1 << 0)".  It is used like this:
>> 
>> 	if (test_and_set_bit(SCMD_STATE_COMPLETE, &scmd->state))
>> 
>> The test_and_set_bit() has a shift built in so it's a double left shift
>> and uses bit number 1 instead of number 0.  This bug is harmless because
>> it's done consistently and it doesn't clash with any other flags.
>> 
>> Fixes: f1342709d18a ("scsi: Do not rely on blk-mq for double completions")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Nice catch, thanks for the fix.
>
> Reviewed-by: Keith Busch <keith.busch@intel.com>

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering
