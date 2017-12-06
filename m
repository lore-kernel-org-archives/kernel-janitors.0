From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 06 Dec 2017 09:10:29 +0000
Subject: Re: [PATCH 1/2] usbip: Delete an error message for a failed memory allocation in two functions
Message-Id: <e1078aa2-b2c6-abd9-bad1-098528c9ff5b@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6a84f1e4-a5c1-84da-bd14-de28e306991b@users.sourceforge.net>
 <ffdb1a7c-2dd6-416e-e13f-e54289e2c194@users.sourceforge.net>
 <cafd3792-f02a-7643-a263-4e1523428ca6@kernel.org>
In-Reply-To: <cafd3792-f02a-7643-a263-4e1523428ca6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: shuah@kernel.org, linux-usb@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <shuahkh@osg.samsung.com>, Valentina Manea <valentina.manea.m@gmail.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

>> Omit an extra message for a memory allocation failure in these functions.
>>
>> This issue was detected by using the Coccinelle software.
> 
> Please include the problem

Do you find the wording “WARNING: Possible unnecessary 'out of memory' message”
from the script “checkpatch.pl” more reasonable?


> and log from Coccinelle software

There is no log file from which I could extract something for this case.


> in any future patches for the issues detected by Coccinelle.

Would you like to help a bit to make the commit message better for your needs?


>> @@ -466,7 +465,6 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>>  	priv->urb->setup_packet = kmemdup(&pdu->u.cmd_submit.setup, 8,
>>  					  GFP_KERNEL);
>>  	if (!priv->urb->setup_packet) {
>> -		dev_err(&udev->dev, "allocate setup_packet\n");
> 
> If Coccinelle found this as an extra message,
> there is something wrong with the Coccinelle script.

The source code analysis approach could be improved somehow.


> This is not an extra message.

There can be different opinions around the handling of such exceptional situations.


> This message is for the second kmemdup() failure and is necessary.

This function is called only once within the implementation of
the function “stub_recv_cmd_submit” (and in this source file).

Do you find a default Linux allocation failure report insufficient?

Regards,
Markus
