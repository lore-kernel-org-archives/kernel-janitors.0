From: Bart Van Assche <bart.vanassche@sandisk.com>
Date: Tue, 18 Aug 2015 04:45:45 +0000
Subject: Re: [patch] qla4xxx: remove some bogus casts
Message-Id: <55D2B879.7040906@sandisk.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150817143647.GA23820@mwanda>
In-Reply-To: <20150817143647.GA23820@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, QLogic-Storage-Upstream@qlogic.com, Vikas Chaudhary <vikas.chaudhary@qlogic.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On 08/17/2015 07:36 AM, Dan Carpenter wrote:
> These casts are wrong and unnecessary.  They annoy static checkers
> because they imply we are planning to write sizeof(long) bytes to a
> sizeof(u32) buffer which would corrupt memory.

Hello Dan,

Can you verify whether that patch is still needed after having applied 
the patch series I posted in July (and that was acknowledged by QLogic): 
http://thread.gmane.org/gmane.linux.scsi/103135 ?

Thanks,

Bart.
