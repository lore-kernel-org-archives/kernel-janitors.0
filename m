From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 Jan 2018 18:19:23 +0000
Subject: Re: hyperv/netvsc: Delete two error messages for a failed memory allocation in netvsc_init_buf()
Message-Id: <31b03449-4ef8-538d-a021-cb3e5bbc2a21@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <bb8fac96-9ba6-e54f-2321-72a8fba90085@users.sourceforge.net>
 <CY4PR2101MB0867CEFAF4FB72AF47FA3AA7CA130@CY4PR2101MB0867.namprd21.prod.outlook.com>
In-Reply-To: <CY4PR2101MB0867CEFAF4FB72AF47FA3AA7CA130@CY4PR2101MB0867.namprd21.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Haiyang Zhang <haiyangz@microsoft.com>, "devel@linuxdriverproject.org" <devel@linuxdriverproject.org>, netdev@vger.kernel.org
Cc: KY Srinivasan <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> These messages are not displayed anywhere else:
> "unable to allocate receive buffer of size %u\n"
> "unable to allocate send buffer of size %u\n",
> 
> After set ret = -ENOMEM; and cleanup, we won't know which buffer allocation failed without the error message.

Do you notice a Linux allocation failure report before them in your system?


> So please do not remove these messages.

How much does the distinction matter for these buffers?

Regards,
Markus
