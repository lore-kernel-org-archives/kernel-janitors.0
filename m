From: Greg KH <gregkh@suse.de>
Date: Tue, 28 Jul 2009 14:41:23 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and
Message-Id: <20090728144123.GB13883@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk>
In-Reply-To: <200907281030.45317.npalix@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nicolas Palix <npalix@diku.dk>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Jul 28, 2009 at 10:30:44AM +0200, Nicolas Palix wrote:
> 
> Remove typedef DEVICE_OBJECT and use a struct with the same name
> instead. The new struct name uses lower case (struct device_object).

This should be called "struct hv_device" instead, care to respin the
patch like that to keep us from having to change it again?  :)

thanks,

greg k-h
