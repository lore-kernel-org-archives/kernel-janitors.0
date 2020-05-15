From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 15 May 2020 17:26:04 +0000
Subject: Re: [PATCH][next] USB: EHCI: ehci-mv: fix less than zero comparison of an unsigned int
Message-Id: <342e8fc0-c961-d9f0-f2d1-bd455ce06d86@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515165453.104028-1-colin.king@canonical.com>
 <20200515172121.GA5498@rowland.harvard.edu>
In-Reply-To: <20200515172121.GA5498@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Zhang Shengju <zhangshengju@cmss.chinamobile.com>, Tang Bin <tangbin@cmss.chinamobile.com>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 15/05/2020 18:21, Alan Stern wrote:
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
> 
> Thanks to Coverity for spotting this.  Any reason why it didn't spot 
> exactly the same mistake in the ohci-da8xx.c driver?

No idea, it is curious that it can spot one error but miss another.
Sometimes I see these issues on the next scan, so it maybe the database
diff'ing is awry.

> 
> Also, why wasn't the patch CC'ed for the stable series?

My bad on that. Human error

> 
> Alan Stern
> 
