From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Sat, 17 Aug 2013 18:21:23 +0000
Subject: Re: [PATCH 1/6] drivers:usb:host:xhci.h Removing xhci_hcd from argument
Message-Id: <520FBC53.3000508@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1376678922-15217-1-git-send-email-kumargauravgupta3@gmail.com>
In-Reply-To: <1376678922-15217-1-git-send-email-kumargauravgupta3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Saturday 17 August 2013 12:19 PM, Julia Lawall wrote:
> On Sat, 17 Aug 2013, Kumar Gaurav wrote:
>
>> On Saturday 17 August 2013 12:30 AM, Greg KH wrote:
>>> On Sat, Aug 17, 2013 at 12:18:42AM +0530, Kumar Gaurav wrote:
>>>> Removed struct xhci_hcd from xhci_readl fucntion as it's no more in use.
>>>> ---
>>>>    drivers/usb/host/xhci.h |    3 +--
>>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.hthe
>>>> index c338741..7cf0e41 100644
>>>> --- a/drivers/usb/host/xhci.h
>>>> +++ b/drivers/usb/host/xhci.h
>>>> @@ -1598,8 +1598,7 @@ static inline struct usb_hcd *xhci_to_hcd(struct
>>>> xhci_hcd *xhci)
>>>>      /* TODO: copied from ehci.h - can be refactored? */
>>>>    /* xHCI spec says all registers are little endian */
>>>> -static inline unsigned int xhci_readl(const struct xhci_hcd *xhci,
>>>> -		__le32 __iomem *regs)
>>>> +static inline unsigned int xhci_readl(__le32 __iomem *regs)
>>> And you broke the build :(
>>>
>>> Sorry, that's not ok.
>>>
>>> greg k-h
>> I'm writing patch to change function definition along with changes in program
>> files where this function is called.
>> After changing all files i built the module and it compiled as well.
>>
>> There were 6 files which were using xhci_read. I fixed all the calls and
>> compiled.
>> Am i missing anything? Please suggest then i'll send patches again
> I haven't followed along in detail, but I think Greg wants one patch that
> fixes both the definition and all of the calls, and not one patch for each
> file.
>
> julia
yeah i understand that now. I wasn't aware of this before, i thought a 
series of patch would be required for multiple files. My bad. I'm 
resending in single patch


Regards
Kumar gaurav
