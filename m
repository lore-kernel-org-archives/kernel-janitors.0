From: Mauro Carvalho Chehab <m.chehab@samsung.com>
Date: Sat, 26 Jul 2014 13:21:51 +0000
Subject: Re: [PATCH] drivers/media/pci/solo6x10/solo6x10-disp.c: check kzalloc() result
Message-Id: <20140726102151.239386d8.m.chehab@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1406313049-9604-1-git-send-email-andrey.utkin@corp.bluecherry.net>
 <CAM_ZknWPNyUCQkU+g4iJN47=cHMGPRuwoVe2Jh=4sciUM1t-NA@mail.gmail.com>
 <20140726061311.GB25880@mwanda>
In-Reply-To: <20140726061311.GB25880@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>, "hans.verkuil" <hans.verkuil@cisco.com>, khalasa <khalasa@piap.pl>, Ismael Luceno <ismael.luceno@corp.bluecherry.net>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors <kernel-janitors@vger.kernel.org>

Em Sat, 26 Jul 2014 09:13:12 +0300
Dan Carpenter <dan.carpenter@oracle.com> escreveu:

> On Fri, Jul 25, 2014 at 09:32:36PM +0300, Andrey Utkin wrote:
> > Please ignore. I didn't notice that Hans has already posted a patch
> > fixing that and more.
> > 
> 
> Heh.  I was just about to send my fix for this bug as well.
> 
> I don't follow linux-media so I didn't realize this driver was getting
> promoted out of staging.  I wish there was a way to go over drivers and
> fix any basic static checker fixes before promotion.

When I promote a driver out of staging, I run checkpatch again, in
order to check if everything is fine. It would be nice to have a
checkpatch-like script that would also run the static checker
checks for that particular patch. With that, I could, instead,
use such script when promoting patches or handling patches adding
new files to the Kernel.

Regards,
Mauro
