From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 13 Sep 2012 05:51:46 +0000
Subject: Re: [libata:NEXT 14/21] ERROR: "ata_dev_set_feature" [drivers/ata/libahci.ko] undefined!
Message-Id: <20120913055146.GA23462@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120913053915.GA23363@localhost>
 <5051726A.8090708@pobox.com>
In-Reply-To: <5051726A.8090708@pobox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Garzik <jgarzik@pobox.com>
Cc: Shane Huang <shane.huang@amd.com>, kernel-janitors@vger.kernel.org, Jeff Garzik <jgarzik@redhat.com>, linux-ide@vger.kernel.org

> This should already be fixed by
> 
> commit 633de4cc2c049949459dd0b73d78576cd23906b5
> Author: Jeff Garzik <jeff@garzik.org>

Hi Jeff, if you prefer to not rebase this branch (or more), please
tell me so that I avoid sending such fixed errors in future. Otherwise
they'll be reported anyway for improving bisectability.

Thanks,
Fengguang
