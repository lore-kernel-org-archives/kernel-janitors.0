From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 07 Nov 2017 16:45:59 +0000
Subject: Re: [PATCH] USB: remove redundant assignment to temp
Message-Id: <b1eaf826-e4cc-a8f5-432c-aace88a6a554@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.44L0.1711071039210.1395-100000@iolanthe.rowland.org>
In-Reply-To: <Pine.LNX.4.44L0.1711071039210.1395-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/11/17 15:42, Alan Stern wrote:
> On Tue, 7 Nov 2017, Colin King wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The variable temp is being set at the end of each loop iteration
>> but this value is never read, it is either being updated in just
>> the case 1 block or at the end of the loop.  Thus the assignment
>> is redundant and can be removed.  Cleans up clang warning:
>>
>> drivers/usb/host/ehci-dbg.c:840:4: warning: Value stored to 'temp'
>> is never read
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/usb/host/ehci-dbg.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/usb/host/ehci-dbg.c b/drivers/usb/host/ehci-dbg.c
>> index 7fb21d01b3d0..70d4768958be 100644
>> --- a/drivers/usb/host/ehci-dbg.c
>> +++ b/drivers/usb/host/ehci-dbg.c
>> @@ -838,7 +838,6 @@ static ssize_t fill_registers_buffer(struct debug_buffer *buf)
>>  			default:		/* unknown */
>>  				break;
>>  			}
>> -			temp = (cap >> 8) & 0xff;
>>  		}
>>  	}
>>  #endif
> 
> Good catch, but the solution is wrong.  The original code was mistaken;
> it should have said:
> 
> 			offset = (cap >> 8) & 0xff;
> 
> You can see that something like this is necessary if you consider the 
> code path for the case where (cap & 0xff) != 1 -- the loop would just 
> read the same capability value over and over again.

Thanks for pointing that out, makes complete sense.

> 
> Would you like to submit a revised patch?

Resent as: "usb: host: fix incorrect updating of offset"
> 
> Alan Stern
> 
Colin

