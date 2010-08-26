From: Kevin Hilman <khilman@deeprootsystems.com>
Date: Thu, 26 Aug 2010 18:25:06 +0000
Subject: Re: [PATCH 1/5] arm: mach-davinci: check irq2ctlr() result
Message-Id: <87wrrd2pvh.fsf@deeprootsystems.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279379947-15152-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279379947-15152-1-git-send-email-segooon@gmail.com> (Kulikov
	Vasiliy's message of "Sat, 17 Jul 2010 19:19:07 +0400")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Kulikov Vasiliy <segooon@gmail.com> writes:

> If irq2ctlr() fails return IRQ_NONE.
> Also as it can fail make 'ctlr' signed.

[...]

> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Sorry for the lag on this one.

Queueing for 2.6.37 in linux-davinci.git

Kevin
