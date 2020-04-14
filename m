From: Tang Bin <tangbin@cmss.chinamobile.com>
Date: Tue, 14 Apr 2020 09:13:09 +0000
Subject: Re: [PATCH] usb: gadget: fsl: Fix a wrong judgment in fsl_udc_probe()
Message-Id: <f712918c-2f61-0ba5-2ba8-b5ca3cce9a35@cmss.chinamobile.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200410015832.8012-1-tangbin@cmss.chinamobile.com>
 <be8cd229-884a-40e6-3363-7c4680a51b30@web.de>
 <0b718268-d330-dfc1-aca3-3dd3203363d7@cmss.chinamobile.com>
 <20200414083036.GC14722@kadam>
In-Reply-To: <20200414083036.GC14722@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Markus Elfring <Markus.Elfring@web.de>, Li Yang <leoyang.li@nxp.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi

On 2020/4/14 16:30, Dan Carpenter wrote:
> On Fri, Apr 10, 2020 at 04:05:06PM +0800, Tang Bin wrote:
>>>
>>>> Thus it must be fixed.
>>> Wording alternative:
>>>     Thus adjust the error detection and corresponding exception handling.
>> Got it.
> Wow...
>
> No, don't listen to Markus when it comes to writing commit messages.
> You couldn't find worse advice anywhere.  :P

I'm actively waiting for a reply from the maintainer. Thank you very much.

Tang Bin
