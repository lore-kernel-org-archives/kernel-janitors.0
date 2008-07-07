From: Jiri Kosina <jkosina@suse.cz>
Date: Mon, 07 Jul 2008 12:49:34 +0000
Subject: Re: [PATCH] drivers/char/pcmcia/ipwireless/hardware.c fix resource
Message-Id: <alpine.LNX.1.10.0807071447470.3141@jikos.suse.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="336216065-115667014-1215434974=:3141"
List-Id: <kernel-janitors.vger.kernel.org>
References: <1215382690.11092.11.camel@localhost.localdomain>
In-Reply-To: <1215382690.11092.11.camel@localhost.localdomain>
To: "Darren Jenkins\\" <darrenrjenkins@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: kernel Janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, David Sterba <dsterba@suse.cz>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--336216065-115667014-1215434974=:3141
Content-Type: TEXT/PLAIN; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit

On Mon, 7 Jul 2008, Darren Jenkins\ wrote:

> G'day people,
>
> Coverity CID: 2172 RESOURCE_LEAK
>
> When pool_allocate() tries to enlarge a packet, if it can not allocate
> enough memory, it returns NULL without first freeing the old packet.
>
> This patch just frees the packet first.
>
> ﻿﻿﻿Signed-off-by: Darren Jenkins <darrenrjenkins@gmailcom>
>
> diff --git a/drivers/char/pcmcia/ipwireless/hardware.c b/drivers/char/pcmcia/ipwireless/hardware.c
> index ba6340a..929101e 100644
> --- a/drivers/char/pcmcia/ipwireless/hardware.c
> +++ b/drivers/char/pcmcia/ipwireless/hardware.c
> @@ -590,8 +590,10 @@ static struct ipw_rx_packet *pool_allocate(struct ipw_hardware *hw,
> 		packet = kmalloc(sizeof(struct ipw_rx_packet) +
> 				old_packet->length + minimum_free_space,
> 				GFP_ATOMIC);
> -		if (!packet)
> +		if (!packet) {
> +			kfree(old_packet);
> 			return NULL;
> +		}
> 		memcpy(packet, old_packet,
> 				sizeof(struct ipw_rx_packet)
> 					+ old_packet->length);
>
>
>

Thanks a lot for reporting this, Darren.

Andrew, could you please push this through -mm? Thanks.


 	Signed-off-by: Jiri Kosina <jkosina@suse.cz>

-- 
Jiri Kosina
SUSE Labs
--336216065-115667014-1215434974=:3141--
