From: walter harms <wharms@bfs.de>
Date: Sat, 20 Aug 2011 12:59:35 +0000
Subject: Re: [patch -next] bcma: signedness bug in bcma_get_next_core()
Message-Id: <4E4FAFB7.4050207@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818133809.GG4786@shale.localdomain> <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
In-Reply-To: <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, "open list:BROADCOM SPECIFIC..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org



Am 20.08.2011 14:23, schrieb Rafał Miłecki:
> W dniu 18 sierpnia 2011 15:38 użytkownik Dan Carpenter
> <error27@gmail.com> napisał:
>> The u32 would never be less than zero so the error handling would
>> break.  I changed it to int.
> 
> In declaration we use s32:
> static s32 bcma_erom_get_mst_port(struct bcma_bus *bus, u32 **eromptr);
> 
> Doesn't it sound better to use s32 instead of int?
> 

aktualy int sounds better that s32 for me.

re,
 wh
