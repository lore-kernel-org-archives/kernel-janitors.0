From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Date: Thu, 15 Jan 2015 11:06:22 +0000
Subject: Re: [patch 5/6] usb: gadget: uvc: make a bunch of stuff static
Message-Id: <54B79F2E.2070608@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150114210352.GE23203@mwanda>
In-Reply-To: <20150114210352.GE23203@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

W dniu 14.01.2015 o 23:45, Felipe Balbi pisze:
> On Thu, Jan 15, 2015 at 12:03:52AM +0300, Dan Carpenter wrote:
>> Sparse rightly complains that these things should be static since they
>> are only used in the one .c file.
>>


There has already been a patch for this:

http://www.spinics.net/lists/linux-usb/msg119646.html


>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> fails to apply on top of my testing/next
>
> checking file drivers/usb/gadget/function/uvc_configfs.c
> Hunk #1 FAILED at 43.
> Hunk #2 FAILED at 135.
> Hunk #3 FAILED at 161.
> Hunk #4 FAILED at 718.
> Hunk #5 FAILED at 795.
> Hunk #6 FAILED at 947.
> Hunk #7 FAILED at 973.
> Hunk #8 FAILED at 1017.
> Hunk #9 FAILED at 1260.
> Hunk #10 FAILED at 1311.
> Hunk #11 FAILED at 1334.
> Hunk #12 FAILED at 1544.
> Hunk #13 FAILED at 1582.
> Hunk #14 FAILED at 1606.
> Hunk #15 FAILED at 1757.
> Hunk #16 FAILED at 1789.
> 16 out of 16 hunks FAILED
>
> please rebase on that branch.
>

