From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 28 Jul 2009 13:40:31 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT typedefs into their correspondin
Message-Id: <200907281540.31805.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk>
In-Reply-To: <200907281030.45317.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: gregkh@suse.de, hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 28 July 2009, Nicolas Palix wrote:
> Remove typedef DEVICE_OBJECT and use a struct with the same name
> instead. The new struct name uses lower case (struct device_object).
> 
> Remove typedef PDEVICE_OBJECT which aliases a pointer and use the
> corresponding renamed struct pointer (struct device_object *).
> 
> Here is the semantic patch generated to perform this transformation:
> (http://www.emn.fr/x-info/coccinelle/)
> 

The patch looks technically correct and improves the code, but
I'd suggest renaming the structure to fall into a proper namespace.
The name device_object is extremely generic and should not be
defined as part of a single driver.
Simply putting it into a namespace here would make it hv_device_object,
or even mshv_device_object ('hv' still is very generic), but then the
'object' part is still redundant. Since it is part of the 'vmbus'
layer, how about naming it 'struct vmbus_device'?

	Arnd <><
