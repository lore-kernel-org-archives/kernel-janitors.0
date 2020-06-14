From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 14 Jun 2020 15:30:18 +0000
Subject: Re: [PATCH] net: fec: fix ref count leaking when pm_runtime_get_sync fails
Message-Id: <20200614153018.GA2663587@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <38dcaa5d-98ad-e1df-6e83-2e6dd677a483@web.de>
In-Reply-To: <38dcaa5d-98ad-e1df-6e83-2e6dd677a483@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, netdev@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Stephen McCamant <mccamant@cs.umn.edu>, Qiushi Wu <wu000273@umn.edu>, "David S. Miller" <davem@davemloft.net>, Fugang Duan <fugang.duan@nxp.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 14, 2020 at 10:25:38AM +0200, Markus Elfring wrote:
> > in fec_enet_mdio_read, …
> 
> I am curious under which circumstances you would like to improve
> such commit messages.
> 
> * Will the tag “Fixes” become helpful?
> 
> * Which source code analysis tools did trigger to send
>   update suggestions according to 16 similar issues for today?
> 

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
