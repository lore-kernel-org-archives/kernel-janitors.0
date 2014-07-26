From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 26 Jul 2014 06:13:12 +0000
Subject: Re: [PATCH] drivers/media/pci/solo6x10/solo6x10-disp.c: check kzalloc() result
Message-Id: <20140726061311.GB25880@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1406313049-9604-1-git-send-email-andrey.utkin@corp.bluecherry.net>
 <CAM_ZknWPNyUCQkU+g4iJN47=cHMGPRuwoVe2Jh=4sciUM1t-NA@mail.gmail.com>
In-Reply-To: <CAM_ZknWPNyUCQkU+g4iJN47=cHMGPRuwoVe2Jh=4sciUM1t-NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: m.chehab@samsung.com, "hans.verkuil" <hans.verkuil@cisco.com>, khalasa <khalasa@piap.pl>, Ismael Luceno <ismael.luceno@corp.bluecherry.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

On Fri, Jul 25, 2014 at 09:32:36PM +0300, Andrey Utkin wrote:
> Please ignore. I didn't notice that Hans has already posted a patch
> fixing that and more.
> 

Heh.  I was just about to send my fix for this bug as well.

I don't follow linux-media so I didn't realize this driver was getting
promoted out of staging.  I wish there was a way to go over drivers and
fix any basic static checker fixes before promotion.

regards,
dan carpenter

