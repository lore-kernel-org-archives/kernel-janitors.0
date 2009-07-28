From: Hank Janssen <hjanssen@microsoft.com>
Date: Tue, 28 Jul 2009 14:16:18 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT
Message-Id: <12B00476-1E0D-46B1-8939-DD36A0C3D197@microsoft.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk>
 <200907281540.31805.arnd@arndb.de>
In-Reply-To: <200907281540.31805.arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Palix <npalix@diku.dk>, "gregkh@suse.de" <gregkh@suse.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>


Arnd,

Excellent suggestion. I will submit a patch to call it hv_vmbus_device
which makes it even more clear.

Thanks,

Hank.


On Jul 28, 2009, at 6:41 AM, "Arnd Bergmann" <arnd@arndb.de> wrote:
>>
>>
>
> The patch looks technically correct and improves the code, but
> I'd suggest renaming the structure to fall into a proper namespace.
> The name device_object is extremely generic and should not be
> defined as part of a single driver.
> Simply putting it into a namespace here would make it
> hv_device_object,
> or even mshv_device_object ('hv' still is very generic), but then the
> 'object' part is still redundant. Since it is part of the 'vmbus'
> layer, how about naming it 'struct vmbus_device'?
>
>        Arnd <><
>
