From: Adrian Bunk <bunk@stusta.de>
Date: Tue, 05 Sep 2006 20:56:24 +0000
Subject: Re: [KJ] New idea for TODO
Message-Id: <20060905205623.GL9173@stusta.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44FDD881.8070002@nachtwindheim.de>
In-Reply-To: <44FDD881.8070002@nachtwindheim.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Sep 05, 2006 at 10:05:21PM +0200, Henne wrote:
> Hi there,
> 
> I know that the TODO list is long, but I may have found a new task.
> 
> In drivers/scsi lies a file called scsi.h which seems to be a relict and is included in many mature scsi-drivers,
> but include/scsi/scsi.h would be the better choice.
> After a little surfing I think all typedef'd Scsi_Cmnd can be replaced with struct scsi_cmnd, to get rid of
> that typedef stuff.
> 
> Correct me if I'm wrong.

include/scsi/scsi.h says:

/*
 * NOTE:  this file only contains compatibility glue for old drivers.  All
 * these wrappers will be removed sooner or later.  For new code please use
 * the interfaces declared in the headers in include/scsi/
 */

The file is already nearly empty, and the goal is getting it completely 
empty, not moving the remaining stuff to a different header.

> Greets,
> Henne

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
