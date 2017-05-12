From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 12 May 2017 07:32:39 +0000
Subject: Re: vmbus: Delete an error message for a failed memory allocation in vmbus_device_create()
Message-Id: <8d38547f-a086-438a-5b2a-4d11929530ec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
 <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
 <20170511093015.4cdfdb6c@xeon-e3> <20170512070909.xxa62d2cde3qoj4f@mwanda>
In-Reply-To: <20170512070909.xxa62d2cde3qoj4f@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>, Wolfram Sang <wsa@the-dreams.de>, Haiyang Zhang <haiyangz@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, devel@linuxdriverproject.org

>> Just because an automated tool says that this needs to change does not
>> mean it has to.
> 
> Checkpatch.pl is correct here.  This message is useless.  It's during
> init so it's unlikely to fail ever.  In current kernels small kmallocs
> are quaranteed to succeed so it can't actually fail currently.  The
> stack trace is more useful than this message because it tells you a lot
> about what memory is free and the whole call tree.
> 
> The error message is dead useless code.

Would you like to clarify corresponding software evolution any more?

Is there a need for better documentation of the involved programming interfaces?


> This patch is not going to be merged because Markus doesn't listen to
> feedback and he's blocked but otherwise it's an OK patch.

Does this information contain a contradiction?
Will patches be picked up also from contributors who got a special
development reputation anyhow?

Regards,
Markus
