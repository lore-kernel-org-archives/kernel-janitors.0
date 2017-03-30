From: DaeSeok Youn <daeseok.youn@gmail.com>
Date: Thu, 30 Mar 2017 15:39:43 +0000
Subject: Re: [PATCH 1/2] staging: atomisp: simplify the if condition in atomisp_freq_scaling()
Message-Id: <CAHb8M2A6oEeY5JXKEw6U5LCt1hBYaOQztLphnen7QjE3zuSjyg@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170330062449.GA25214@SEL-JYOUN-D1> <1490871164.4738.0.camel@linux.intel.com>
In-Reply-To: <1490871164.4738.0.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@linux.intel.com>
Cc: mchehab@kernel.org, Greg KH <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>, SIMRAN SINGHAL <singhalsimran0@gmail.com>, linux-media@vger.kernel.org, devel <devel@driverdev.osuosl.org>, linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>

2017-03-30 19:52 GMT+09:00 Alan Cox <alan@linux.intel.com>:
> On Thu, 2017-03-30 at 15:24 +0900, Daeseok Youn wrote:
>> The condition line in if-statement is needed to be shorthen to
>> improve readability.
>>
>> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
>> ---
>
> How about a define for ATOMISP_IS_CHT(isp) instead - as we will need
hmm.. I think there is another way to get a *device*(unsigned short or
__u32) to mask with "ATOMISP_PCI_DEVICE_SOC_MASK".
In the atomisp_freq_scaling() function, the "device" value is getting
started from "isp" structure.
(isp->pdev->device)

if the function has only "pci_dev" struction as a parameter and it
need to check the CHT. Then we cannot use the definition like
ATOMISP_IS_CHT(isp). it means we have another definition to check the
CHT.

Am I right?

> these tests in other places where there are ISP2400/ISP2401 ifdefs ?
I am not sure whether these tests are needed in other place or not.
(Actually, I didn't find good H/W reference for Atom ISP device - Can
you please share the link to refer document like H/W manual to
develop?) I have tried to clean up the code first. in the meantime, I
will have a look at the document if I have good reference manual.

Thanks.
Regards,
Daeseok.
>
> Alan
>
