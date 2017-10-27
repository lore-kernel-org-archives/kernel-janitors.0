From: Jules Maselbas <jules.maselbas@grenoble-inp.org>
Date: Fri, 27 Oct 2017 12:08:38 +0000
Subject: Re: [PATCH] usb: max3421: unlock on error in max3421_hub_control()
Message-Id: <392898063.1593575.1509106118033.JavaMail.zimbra@grenoble-inp.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171027062620.emm5wwdv73kjjpvl@mwanda>
In-Reply-To: <20171027062620.emm5wwdv73kjjpvl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Fri, Oct 27, 2017 at 11:06:36AM +0200, Jules Maselbas wrote:
>> Hi,
>> 
>> > We can't return directly in max3421_hub_control(), we have to unlock
>> > first.
>> Yes you are right.
>> I think testing if pdata is null is not necessary as driver_probe will fail if
>> the device do not have a platform_data.
>> 
> 
> In that case, let's drop my patch.  Could you send a patch for which
> removes the NULL check and add a Reported-by: for me?
It is already in the v2 (and v3) of my initial patch.
https://www.spinics.net/lists/devicetree/msg199901.html

Should I make a brand new patch (not another version)?

> 
> regards,
> dan carpenter
