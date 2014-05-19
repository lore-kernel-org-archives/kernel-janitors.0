From: David Miller <davem@davemloft.net>
Date: Mon, 19 May 2014 01:14:12 +0000
Subject: Re: [PATCH 3/4] atm: idt77252: Remove redundant error check
Message-Id: <20140518.211412.1525385415713413915.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400350980-30455-3-git-send-email-peter.senna@gmail.com>
In-Reply-To: <1400350980-30455-3-git-send-email-peter.senna@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: peter.senna@gmail.com
Cc: chas@cmf.nrl.navy.mil, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Peter Senna Tschudin <peter.senna@gmail.com>
Date: Sat, 17 May 2014 20:22:59 +0200

> Remove double checks, and move the call to printk to the
> first check. Also adds KERN_WARNING to printk. The simplified version
> of the coccinelle semantic patch that fixes this issue is as follows:

The appropriate thing to use is pr_warning() rather than add
KERN_WARNING.
