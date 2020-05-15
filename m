From: Tang Bin <tangbin@cmss.chinamobile.com>
Date: Fri, 15 May 2020 23:23:42 +0000
Subject: Re: [PATCH][next] USB: EHCI: ehci-mv: fix less than zero comparisonof an unsigned int
Message-Id: <fec1e461-16f3-9d5f-bc23-129c71229b9d@cmss.chinamobile.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515165453.104028-1-colin.king@canonical.com>
 <20200515172121.GA5498@rowland.harvard.edu>
In-Reply-To: <20200515172121.GA5498@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alan Stern <stern@rowland.harvard.edu>, Colin King <colin.king@canonical.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Alan & Colin：

On 2020/5/16 1:21, Alan Stern wrote:
> On Fri, May 15, 2020 at 05:54:53PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The comparison of hcd->irq to less than zero for an error check will
>> never be true because hcd->irq is an unsigned int.  Fix this by
>> assigning the int retval to the return of platform_get_irq and checking
>> this for the -ve error condition and assigning hcd->irq to retval.
>>
>> Addresses-Coverity: ("Unsigned compared against 0")
>> Fixes: c856b4b0fdb5 ("USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
> Thanks to Coverity for spotting this.  Any reason why it didn't spot
> exactly the same mistake in the ohci-da8xx.c driver?

I just looked at the code and wondered whether it would be more 
appropriate to modify the header file "hcd.h".  Since 'irq' might be an 
negative, why not just modify the variables in the 'struct usb_hcd',  
'unsigned int  irq'--> 'int irq'? After all, it's a public one.

Thanks,

Tang Bin

>
>
