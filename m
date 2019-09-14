From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 14 Sep 2019 06:24:37 +0000
Subject: Re: omfs: make use of kmemdup
Message-Id: <4fd20946-b991-0c0f-975e-ef79b433912b@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190913171134.GA10301@SD>
In-Reply-To: <20190913171134.GA10301@SD>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saiyam Doshi <saiyamdoshi.in@gmail.com>, Bob Copeland <me@bobcopeland.com>
Cc: linux-karma-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Replace call to kmalloc followed by memcpy with a direct call
> to kmemdup to achieve same functionality.

I suggest to take another look at a similar patch.

fs/omfs: make use of kmemdup
https://lore.kernel.org/r/20190721112326.GA5927@hari-Inspiron-1545/
https://lore.kernel.org/patchwork/patch/1102482/
https://lkml.org/lkml/2019/7/21/40

Regards,
Markus
