From: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 26 Nov 2014 06:50:09 +0000
Subject: Re: [PATCH 1/1] MTD: Deletion of unnecessary checks before two function calls
Message-Id: <20141126064910.GJ3212@norris-Latitude-E6410>
List-Id: <kernel-janitors.vger.kernel.org>
References: <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <546DE4BB.3000900@users.sourceforge.net>
In-Reply-To: <546DE4BB.3000900@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

On Thu, Nov 20, 2014 at 01:55:23PM +0100, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 20 Nov 2014 13:50:43 +0100
> 
> The functions kfree() and pci_dev_put() test whether their argument is NULL
> and then return immediately. Thus the test around the call is not needed.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Applied to l2-mtd.git.

Brian
