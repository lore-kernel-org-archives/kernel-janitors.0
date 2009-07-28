From: Nicolas Palix <npalix@diku.dk>
Date: Tue, 28 Jul 2009 15:01:42 +0000
Subject: Re: [PATCH] Staging: hv: Transform PDEVICE_OBJECT and DEVICE_OBJECT typedefs into their correspondin
Message-Id: <200907281701.43509.npalix@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200907281030.45317.npalix@diku.dk> <20090728144123.GB13883@suse.de>
In-Reply-To: <20090728144123.GB13883@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@suse.de>
Cc: hjanssen@microsoft.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tuesday 28 July 2009 16:41:23 Greg KH wrote:
> On Tue, Jul 28, 2009 at 10:30:44AM +0200, Nicolas Palix wrote:
> > 
> > Remove typedef DEVICE_OBJECT and use a struct with the same name
> > instead. The new struct name uses lower case (struct device_object).
> 
> This should be called "struct hv_device" instead, care to respin the
> patch like that to keep us from having to change it again?  :)
> 
> thanks,
> 
> greg k-h
> 
Ok. So, I guess the pattern for the other typedef is to strip the _OBJECT
suffix when present, and always add the prefix hv_, right ?

-- 
Nicolas Palix
