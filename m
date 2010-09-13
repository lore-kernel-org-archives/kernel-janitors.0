From: Vasiliy Kulikov <segooon@gmail.com>
Date: Mon, 13 Sep 2010 13:32:08 +0000
Subject: Re: [PATCH] char: hvc: check for error case
Message-Id: <20100913133208.GA11032@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1284317835-5086-1-git-send-email-segooon@gmail.com>
	<4C8E2355.60807@tilera.com>
In-Reply-To: <4C8E2355.60807@tilera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Metcalf <cmetcalf@tilera.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>, Paul Mundt <lethal@linux-sh.org>, linuxppc-dev@lists.ozlabs.org

On Mon, Sep 13, 2010 at 09:12 -0400, Chris Metcalf wrote:
> Thanks, accepted into my tree (for the next merge window).  In practice all
> this means is in debug mode we'll get a warning from do_one_initcall()
> rather than silence, but you're right, it's technically better. :-)

Anyway it's better, if user sees warning in the dmesg, he/she might
response to this situation.


Best,
-- 
Vasiliy
