From: Eliot Blennerhassett <linux@audioscience.com>
Date: Wed, 27 Jul 2011 21:45:22 +0000
Subject: Re: [patch] ALSA: asihpi - off by one in asihpi_hpi_ioctl()
Message-Id: <4E3086F2.80606@audioscience.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110727120226.GP3824@shale.localdomain>
	<1311771302.2125.7.camel@osiris>
In-Reply-To: <1311771302.2125.7.camel@osiris>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Rosenberg <drosenberg@vsecurity.com>
Cc: Takashi Iwai <tiwai@suse.de>, "open list:SOUND" <alsa-devel@alsa-project.org>, kernel-janitors@vger.kernel.org, Dan Carpenter <error27@gmail.com>

On 28/07/11 00:55, Dan Rosenberg wrote:
> On Wed, 2011-07-27 at 15:02 +0300, Dan Carpenter wrote:
>> "adapter" is used as an array index in the adapters[] array so
>> the off by one would make us read past the end.
>>
> 
> Agreed. I also don't like the fact that the "pa" pointer can be set to
> an arbitrary address because the index isn't checked until after its
> assignment. Even though the fix to the check prevents this pointer from
> being dereferenced if it's out-of-bounds, it's still wrong.

:( I have to agree.
I'll submit another patch that avoids doing this.

> I agree.  This code seems to make assumptions in more than one place
> that the adapters array is fully populated with non-NULL elements.  At a
> glance, I can't see where such initialization occurs though.

It does, in void __init asihpi_init(void)
...	memset(adapters, 0, sizeof(adapters));

-- 
Eliot Blennerhassett
AudioScience Inc.
