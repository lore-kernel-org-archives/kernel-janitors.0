From: Bernd Petrovitsch <bernd@petrovitsch.priv.at>
Date: Mon, 26 Nov 2012 10:57:25 +0000
Subject: Re: build regressions 2012-10-23
Message-Id: <1353927446.14340.125.camel@thorin>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121023170322.GA31879@localhost>
In-Reply-To: <20121023170322.GA31879@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi!

On Mit, 2012-10-24 at 01:03 +0800, Fengguang Wu wrote:
[...]
> This is the first daily summary from the 0day build test system.
> Ideas on better format/contents are warmly welcome!
> 
> [errors]
> drivers/usb/host/ohci-sm501.c:241:2: error: implicit declaration of function 'ohci_finish_controller_resume' [-Werror=implicit-function-declaration]
> arch/x86/xen/smp.c:329:7: error: 'struct vcpu_guest_context' has no member named 'u'
[...]

Perhaps I miss something but how does one reproduce that?

Which "version" - in terms of "git-URL" - did you use?
Which kernel-.config:
- allymodconfig, allyesconfig or something else)?
- The $ARCH can probably inferred with the filenames ....
Which parameters on which tool/program?

Do you have a page on the web which explains all of this (or at least
the more static parts).

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd@petrovitsch.priv.at
                     LUGA : http://www.luga.at

