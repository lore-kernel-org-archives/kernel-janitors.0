From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 05 Nov 2017 08:29:22 +0000
Subject: Re: [PATCH] USB: core: Improve unlocking of a mutex in two functions
Message-Id: <1923596b-ce14-7b80-6148-f67143b4a367@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0ff5f74e-ae23-5c97-8998-0e598ceae96b@users.sourceforge.net>
 <CAMuHMdUXn4YVPBFCoqmwcdU7eTWO5jy2ZXZQaAxPi1P5bM4q2A@mail.gmail.com>
In-Reply-To: <CAMuHMdUXn4YVPBFCoqmwcdU7eTWO5jy2ZXZQaAxPi1P5bM4q2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Geert Uytterhoeven <geert@linux-m68k.org>, linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, Eugene Korenevsky <ekorenevsky@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, Jaejoong Kim <climbbb.kim@gmail.com>, Johan Hovold <johan@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Mathias Nyman <mathias.nyman@linux.intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, LKML <linux-kernel@vger.kernel.org>

>> @@ -5529,8 +5528,7 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>>                 dev_err(&udev->dev,
>>                         "can't restore configuration #%d (error=%d)\n",
>>                         udev->actconfig->desc.bConfigurationValue, ret);
>> -               mutex_unlock(hcd->bandwidth_mutex);
>> -               goto re_enumerate;
>> +               goto unlock;
>>         }
>>         mutex_unlock(hcd->bandwidth_mutex);
>>         usb_set_device_state(udev, USB_STATE_CONFIGURED);
>> @@ -5583,6 +5581,8 @@ static int usb_reset_and_verify_device(struct usb_device *udev)
>>         udev->bos = bos;
>>         return 0;
>>
>> +unlock:
>> +       mutex_unlock(hcd->bandwidth_mutex);
> 
> This makes it harder for the reader,

I am curious if the view on the preferred code readability can be clarified further.


> as the mutex_unlock() is now far below the block
> of code that's protected by the lock.

I got an other software development opinion for this aspect.
Can the label be clear enough about the shown purpose already?

Regards,
Markus
