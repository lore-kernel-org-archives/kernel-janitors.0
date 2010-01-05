From: Jiri Kosina <jkosina@suse.cz>
Date: Tue, 05 Jan 2010 10:22:56 +0000
Subject: Re: [PATCH 2/6] isdn/hardware: add __init/__exit macros to
Message-Id: <alpine.LNX.2.00.1001051122250.2277@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1261470431-23642-1-git-send-email-peterhuewe@gmx.de> <1261470431-23642-2-git-send-email-peterhuewe@gmx.de>
In-Reply-To: <1261470431-23642-2-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Huewe <peterhuewe@gmx.de>
Cc: kernel-janitors@vger.kernel.org, Karsten Keil <isdn@linux-pingi.de>, =?ISO-8859-15?Q?Andr=E9_Goddard_Rosa?= <andre.goddard@gmail.com>, linux-kernel@vger.kernel.org

On Tue, 22 Dec 2009, peterhuewe@gmx.de wrote:

> From: Peter Huewe <peterhuewe@gmx.de>
> 
> Trivial patch which adds the __init/__exit macros to the module_init/
> module_exit functions of
> 
> drivers/isdn/hardware/mISDN/mISDNisar.c

The patch doesn't seem to be present in linux-next as of today. I have 
applied it to my queue.

Thanks,

-- 
Jiri Kosina
SUSE Labs, Novell Inc.
