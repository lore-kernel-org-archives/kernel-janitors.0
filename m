From: Kumar Gaurav <kumargauravgupta3@gmail.com>
Date: Fri, 16 Aug 2013 18:16:58 +0000
Subject: Re: Explanation Needed
Message-Id: <520E69CA.9060102@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Friday 16 August 2013 11:28 PM, Sarah Sharp wrote:
> On Fri, Aug 16, 2013 at 11:09:12PM +0530, Kumar Gaurav wrote:
>> Hi Sarah,
>>
>> I was just reading through xhci driver's code and found something
>> which i'm unable to understand use of.
>> Please help me understanding them
>>
>> 1.use of struct xhci_hcd in function xhci_readl
>>      function definition doesn't uses this type of argument
>>      static inline unsigned int xhci_readl(const struct xhci_hcd *xhci,__le32 __iomem *regs)
>>      {
>>          return readl(regs);
>>      }
> The function used to print when registers were read, and thus needed the
> xhci_hcd argument.  It's no longer used, so if you want to submit a
> patch to remove that argument, I would take it.  Please look at
> Documentation/SubmittingPatches if you've never submitted a Linux kernel
> patch before.
>
> Sarah Sharp
Please correct me if i'm wrong, as far as i read "*regs" points to the 
location of register to be read. Then what is use of xhci_hcd?

I'll be sending patch for the same.

Regards
Kumar gaurav
