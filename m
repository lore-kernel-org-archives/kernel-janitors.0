From: James Bottomley <James.Bottomley@HansenPartnership.com>
Date: Sat, 29 Nov 2014 16:07:55 +0000
Subject: Re: [patch] usb: storage: debug: uninitialized var in usb_stor_show_sense()
Message-Id: <1417277275.2202.35.camel@HansenPartnership.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20141129124801.GA27251@mwanda>
In-Reply-To: <20141129124801.GA27251@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Matthew Dharm <mdharm-usb@one-eyed-alien.net>, Hannes Reinecke <hare@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, =?ISO-8859-1?Q?J=F6rn?= Engel <joern@purestorage.com>

On Sat, 2014-11-29 at 15:48 +0300, Dan Carpenter wrote:
> The "fmt" variable might be used uninitialized, it should be set to NULL
> at the start.
> 
> Fixes: d811b848ebb7 ('scsi: use sdev as argument for sense code printing')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Hm, that' falls into the category of an interface that's hard to get
right if every caller has to remember to set fmt to NULL.

Could you instead set *fmt to NULL in scsi_extd_sense_format()?  That
way the interface is much easier.

Thanks,

James


