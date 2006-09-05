From: Henne <henne@nachtwindheim.de>
Date: Tue, 05 Sep 2006 21:59:59 +0000
Subject: Re: [KJ] New idea for TODO
Message-Id: <44FDF35F.6090503@nachtwindheim.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44FDD881.8070002@nachtwindheim.de>
In-Reply-To: <44FDD881.8070002@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

>> I know that the TODO list is long, but I may have found a new task.
>>
>> In drivers/scsi lies a file called scsi.h which seems to be a relict and is included in many mature scsi-drivers,
>> but include/scsi/scsi.h would be the better choice.
>> After a little surfing I think all typedef'd Scsi_Cmnd can be replaced with struct scsi_cmnd, to get rid of
>> that typedef stuff.
>>
>> Correct me if I'm wrong.
> 
> include/scsi/scsi.h says:
> 
> /*
>  * NOTE:  this file only contains compatibility glue for old drivers.  All
>  * these wrappers will be removed sooner or later.  For new code please use
>  * the interfaces declared in the headers in include/scsi/
>  */
> 
> The file is already nearly empty, and the goal is getting it completely 
> empty, not moving the remaining stuff to a different header.

Thats what I meant, but I think I don't wrote it, right?
I wanted to say:
- change Scsi_Cmnd to struct scsi_cmnd in all drivers
- delete the include "scsi_typedefs.h" from drivers/scsi.h and
- remove drivers/scsi_typedefs.h from the tree

Don't ask me why I didn't wrote it in my first mail. :)

Greets,
Henne
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
