From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 May 2017 16:36:44 +0000
Subject: Re: vmbus: Delete an error message for a failed memory allocation in vmbus_device_create()
Message-Id: <2182bf8e-b48a-d3bb-6f26-d4af8c4f1507@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
 <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
 <20170511093015.4cdfdb6c@xeon-e3>
In-Reply-To: <20170511093015.4cdfdb6c@xeon-e3>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

> Taking out the message assumes that all callers of this function either log an
> error or pass appropriate error code back to userspace.

Do you like the default error response by Linux memory allocation functions?

Regards,
Markus
