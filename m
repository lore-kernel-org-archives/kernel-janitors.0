From: Dan Carpenter <error27@gmail.com>
Date: Tue, 30 Mar 2010 14:44:33 +0000
Subject: Re: [patch] drm: sysfs files error handling
Message-Id: <20100330144433.GM5069@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100328112438.GK5069@bicker> <4BAFC232.8010404@linux.intel.com>
In-Reply-To: <4BAFC232.8010404@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andi Kleen <ak@linux.intel.com>
Cc: David Airlie <airlied@linux.ie>, Greg Kroah-Hartman <gregkh@suse.de>, Thomas Hellstrom <thellstrom@vmware.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, dri-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Mar 28, 2010 at 10:55:14PM +0200, Andi Kleen wrote:
> , Dan Carpenter wrote:
>>
>> In the original code we used "j" as an iterator but we used "i" as an
>> index.
>>
>> -               for (j = 0; j<  i; j++)
>> -                       device_remove_file(&connector->kdev,
>> -&connector_attrs[i]);
>
> I guess this really should be a attribute group anyways?
>
> Typically when there's such a open coded loop it means the wrong
> interfaces are being used.

My graphics card is crap and doesn't use this code at all.  I'd feel 
uncomfortable those changes without being able to test it.

So while, you are probably right, someone else should probably do that.

regards,
dan carpenter

> -Andi
