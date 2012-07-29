From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Sun, 29 Jul 2012 13:00:03 +0000
Subject: Re: appletalk/cops_probe BUG: soft lockup - CPU#1 stuck for 23s!
Message-Id: <20120729140003.6fa483d2@ultron>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120729124022.GA16748@localhost>
In-Reply-To: <20120729124022.GA16748@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fengguang Wu <fengguang.wu@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Stephen Hemminger <shemminger@linux-foundation.org>, Joe Perches <joe@perches.com>, "kernel-janitors@vger.kernel..." <kernel-janitors@vger.kernel.org>, netdev <netdev@vger.kernel.org>

On Sun, 29 Jul 2012 20:40:22 +0800
Fengguang Wu <fengguang.wu@intel.com> wrote:

> Hi,
> 
> This is probably a rather old bug, triggered while doing randconfig
> boot tests in kvm:

I'm not sure testing old devices with no safe probe method is useful in
this context ?

Alan
