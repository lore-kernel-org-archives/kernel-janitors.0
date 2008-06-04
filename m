From: David Miller <davem@davemloft.net>
Date: Wed, 04 Jun 2008 19:06:36 +0000
Subject: Re: [PATCH] Cleanup use of deprecated calls to save_and_cli and
Message-Id: <20080604.120636.167448431.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1212509959-8763-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1212509959-8763-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mark.asselstine@windriver.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue,  3 Jun 2008 12:19:19 -0400

> Make use of local_irq_save and local_irq_restore rather then the
> deprecated save_and_cli and restore_flags calls.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>

Applied, thanks.
