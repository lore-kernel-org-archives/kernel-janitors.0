From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 12 Mar 2018 14:40:23 +0000
Subject: Re: dmaengine: edma: Use common error handling code in three functions
Message-Id: <3c00002a-4d95-0caf-ef6f-68a2a094b8c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>
In-Reply-To: <cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dmaengine@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Vinod Koul <vinod.koul@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Date: Sun, 22 Oct 2017 16:46:34 +0200
> 
> Add a jump target so that a bit of exception handling can be better reused
> at the end of these functions.

How are the chances to integrate such a change into another Linux repository?
https://lkml.org/lkml/2017/10/22/78
https://patchwork.kernel.org/patch/10021725/
https://lkml.kernel.org/r/<cb8f32ef-14c1-35cb-39aa-d3efa265dccf@users.sourceforge.net>

Regards,
Markus
