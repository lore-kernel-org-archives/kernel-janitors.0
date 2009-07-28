From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2009 14:30:39 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT typedefs into their correspondin
Message-Id: <200907281630.39684.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk> <200907281540.31805.arnd@arndb.de> <12B00476-1E0D-46B1-8939-DD36A0C3D197@microsoft.com>
In-Reply-To: <12B00476-1E0D-46B1-8939-DD36A0C3D197@microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hank Janssen <hjanssen@microsoft.com>
Cc: Nicolas Palix <npalix@diku.dk>, "gregkh@suse.de" <gregkh@suse.de>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tuesday 28 July 2009, Hank Janssen wrote:
> Excellent suggestion. I will submit a patch to call it hv_vmbus_device
> which makes it even more clear.

Ok. IMHO it's also important to keep the name space consistent, so
if you name it hv_vmbus_device instead of vmbus_device, you should
consequently also rename all other vmbus_* names to hv_vmbus_*
in follow-on patches. If you don't plan to do that, I guess
vmbus_device is fine as well.

	Arnd <><
