From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Fri, 15 Mar 2013 16:03:30 +0000
Subject: RE: [PATCH] staging: comedi: drivers: ni_atmio.c: Add a missing semicolon
Message-Id: <ADE657CA350FB648AAC2C43247A983F0020980106B39@AUSP01VMBX24.collaborationhost.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1363335269-14903-1-git-send-email-gmate.amit@gmail.com>
 <5142ECB1.306@mev.co.uk>
In-Reply-To: <5142ECB1.306@mev.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Abbott <abbotti@mev.co.uk>, Kumar Amit Mehta <gmate.amit@gmail.com>
Cc: Ian Abbott <ian.abbott@mev.co.uk>, "fmhess@users.sourceforge.net" <fmhess@users.sourceforge.net>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Friday, March 15, 2013 2:41 AM, Ian Abbott wrote:
> On 2013-03-15 08:14, Kumar Amit Mehta wrote:
>> fix a missing end-of-statement by adding a semicolon.
>>
>> Signed-off-by: Kumar Amit Mehta <gmate.amit@gmail.com>
>> ---
>>   drivers/staging/comedi/drivers/ni_atmio.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/comedi/drivers/ni_atmio.c b/drivers/staging/comedi/drivers/ni_atmio.c
>> index 279f2cd..37372a1 100644
>> --- a/drivers/staging/comedi/drivers/ni_atmio.c
>> +++ b/drivers/staging/comedi/drivers/ni_atmio.c
>> @@ -467,7 +467,7 @@ static int ni_atmio_attach(struct comedi_device *dev,
>>   		return -EIO;
>>
>>   	dev->board_ptr = ni_boards + board;
>> -	boardtype = comedi_board(dev)
>> +	boardtype = comedi_board(dev);
>>
>>   	printk(" %s", boardtype->name);
>>   	dev->board_name = boardtype->name;
>
> Ironically, that was introduced by a patch titled "staging: comedi: 
> ni_atmio: fix build errors". :-)

My only excuse is that the coffee machine was broken...

Actually, I just realized that this driver as well as the others that depend
on ISAPNP were not being compiled on my Debian 6.0 64bit system . I
hacked my config to build the ones that depend on ISA but missed the
ISAPNP ones.

Sorry about the trouble.

Hartley

