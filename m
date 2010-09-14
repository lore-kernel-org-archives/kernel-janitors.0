From: Rabin Vincent <rabin.vincent@stericsson.com>
Date: Tue, 14 Sep 2010 04:01:08 +0000
Subject: Re: [PATCH] gpio: stmpe: fix error path
Message-Id: <20100914034907.GA18875@bnru01.bnr.st.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317840-5131-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1284317840-5131-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Wolfram Sang <w.sang@pengutronix.de>, Luotao Fu <l.fu@pengutronix.de>, Linus WALLEIJ <linus.walleij@stericsson.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, Sep 12, 2010 at 20:57:19 +0200, Vasiliy Kulikov wrote:
> Free allocated memory.  Call stmpe_disable() if it was enabled.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Acked-by: Rabin Vincent <rabin.vincent@stericsson.com>

Thanks,
Rabin
