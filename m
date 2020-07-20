From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 20 Jul 2020 12:47:24 +0000
Subject: Re: [PATCH] ipmi: Remove duplicate code in __ipmi_bmc_register()
Message-Id: <20200720124724.GA4085046@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2084072d-e16c-d47c-6eed-f47e8f149c44@web.de>
In-Reply-To: <2084072d-e16c-d47c-6eed-f47e8f149c44@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Corey Minyard <cminyard@mvista.com>, Jing Xiangfeng <jingxiangfeng@huawei.com>, openipmi-developer@lists.sourceforge.net, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Corey Minyard <minyard@acm.org>

On Mon, Jul 20, 2020 at 02:07:50PM +0200, Markus Elfring wrote:
> > > __ipmi_bmc_register() jumps to the label 'out_free_my_dev_name' in an
> > > error path. So we can remove duplicate code in the if (rv).
> >
> > Looks correct, queued for next release.
> 
> 1. Can an imperative wording be preferred for the change description?
> 
> 2. Will the tag “Fixes” become helpful for the commit message?
> 
> 3. Did you avoid a typo in the patch subject?
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
