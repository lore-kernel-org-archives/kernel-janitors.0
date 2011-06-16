From: Stanislaw Gruszka <sgruszka@redhat.com>
Date: Thu, 16 Jun 2011 08:14:27 +0000
Subject: Re: [patch -next] iwlegacy: fix up brokenness caused by cleanup
Message-Id: <20110616081426.GA2178@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110615131009.GD23739@shale.localdomain>
In-Reply-To: <20110615131009.GD23739@shale.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>, "open list:INTEL WIRELESS 39..." <linux-wireless@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Wed, Jun 15, 2011 at 04:10:10PM +0300, Dan Carpenter wrote:
> Patch 7f1f9742514 "iwlegacy: refactor iwl4965_mac_channel_switch"
> reversed a test and also it changed a spin_lock_irq() to
> spin_lock().  I assume the spin_lock change was a mistake because
> the unlock was left as spin_unlock_irq().

Thank you Dan!

Stanislaw
