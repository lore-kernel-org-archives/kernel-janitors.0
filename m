From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Sat, 20 Aug 2011 12:23:56 +0000
Subject: Re: [patch -next] bcma: signedness bug in bcma_get_next_core()
Message-Id: <CACna6rzwxA=OzQQ_VknsSq8BXXoH8U=GpdfkRTBWjFSNSjwsAA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110818133809.GG4786@shale.localdomain>
In-Reply-To: <20110818133809.GG4786@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>
Cc: "open list:BROADCOM SPECIFIC..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

W dniu 18 sierpnia 2011 15:38 użytkownik Dan Carpenter
<error27@gmail.com> napisał:
> The u32 would never be less than zero so the error handling would
> break.  I changed it to int.

In declaration we use s32:
static s32 bcma_erom_get_mst_port(struct bcma_bus *bus, u32 **eromptr);

Doesn't it sound better to use s32 instead of int?

-- 
Rafał
