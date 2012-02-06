From: walter harms <wharms@bfs.de>
Date: Mon, 06 Feb 2012 08:09:09 +0000
Subject: Re: [patch] usb: dwc3: make dwc3_get_device_id() return the id
Message-Id: <4F2F8AA5.7050100@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120204133714.GA4413@elgon.mountain>
In-Reply-To: <20120204133714.GA4413@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 06.02.2012 07:44, schrieb Felipe Balbi:
> On Sat, Feb 04, 2012 at 04:37:14PM +0300, Dan Carpenter wrote:
>> We always return zero instead of the id we found.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied, thanks
> 
>> ---
>> I don't have this hardware so it's not tested.
> 
> This one is so obvious that I can't even believe we haven't seen that
> before, thanks ;-)
> 

i was wondering why the driver worked at all, do you realy need that ?

re,
 wh
