From: Marcus Wolf <marcus.wolf@wolf-entwicklungen.de>
Date: Sat, 29 Jul 2017 09:09:23 +0000
Subject: Re: [PATCH 1/1][staging-next] staging: pi433: Make functions rf69_set_dc_cut_off_frequency_intern st
Message-Id: <1370919182.11119.1501319363782@ox.hosteurope.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170718130400.25436-1-colin.king@canonical.com>
 <20170718130400.25436-2-colin.king@canonical.com>
 <294e80854a10c63451cf3e9d7ca02bce-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAhaW34EVVM=-webmailer1@server01.webmailer.webmailer.hosteurope.de>
 <20170729000043.GA28803@kroah.com>
In-Reply-To: <20170729000043.GA28803@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Colin King <colin.king@canonical.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, devel@driverdev.osuosl.org

Hi Greg,
 
also had a very close look to this patch. Even in your reply I can't find any
problems with line wraps or other corruptions :-/

But we have alternative patches, solving these problems as well.
You e.g. could use the patch
[PATCH] Make functions rf69_set_bandwidth_intern and
rf69_set_dc_cut_off_frequency_intern static 
from Colin King 21/07/2017.
It's doing exactly the same, my patch should have done.
But be careful - tonight you added patch
staging: pi433: Make functions rf69_set_bandwidth_intern static"
Clins patch includes that changes as well!

Once again sorry for my crappy patches,

Marcus
