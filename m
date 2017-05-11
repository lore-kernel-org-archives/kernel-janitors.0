From: Stephen Hemminger <stephen@networkplumber.org>
Date: Thu, 11 May 2017 16:42:27 +0000
Subject: Re: vmbus: Delete an error message for a failed memory allocation in vmbus_device_create()
Message-Id: <20170511094227.22202648@xeon-e3>
List-Id: <kernel-janitors.vger.kernel.org>
References: <dea9c6a3-0ae6-f3fe-c0d3-7f5b856e2638@users.sourceforge.net>
        <587dbcf5-8b12-fac7-693e-5f471e6d5167@users.sourceforge.net>
        <20170511093015.4cdfdb6c@xeon-e3>
        <2182bf8e-b48a-d3bb-6f26-d4af8c4f1507@users.sourceforge.net>
In-Reply-To: <2182bf8e-b48a-d3bb-6f26-d4af8c4f1507@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: devel@linuxdriverproject.org, Haiyang Zhang <haiyangz@microsoft.com>, "K. Y. Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Wolfram Sang <wsa@the-dreams.de>

On Thu, 11 May 2017 18:36:44 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> > Taking out the message assumes that all callers of this function either log an
> > error or pass appropriate error code back to userspace.  
> 
> Do you like the default error response by Linux memory allocation functions?

The default error message only helps a little.
I doubt this will ever fail anyway since only allocated on boot.
