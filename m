From: Joe Perches <joe@perches.com>
Date: Sun, 27 Sep 2020 20:08:25 +0000
Subject: Re: [PATCH 00/18] use semicolons rather than commas to separate statements
Message-Id: <9f6ebf51253bf420c8f6f8974a82283ae3e9e446.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1601233948-11629-1-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-iio@vger.kernel.org
Cc: Valdis =?UTF-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, Thomas Gleixner <tglx@linutronix.de>, kernel-janitors@vger.kernel.org, David Lechner <david@lechnology.com>, linux-wireless@vger.kernel.org, linux-ide@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, openipmi-developer@lists.sourceforge.net, linux-crypto@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-acpi@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>, drbd-dev@lists.linbit.com, linux-block@vger.kernel.org

On Sun, 2020-09-27 at 21:12 +0200, Julia Lawall wrote:
> These patches replace commas by semicolons.  This was done using the
> Coccinelle semantic patch (http://coccinelle.lip6.fr/) shown below.
> 
> This semantic patch ensures that commas inside for loop headers will not be
> transformed.  It also doesn't touch macro definitions.

Thanks.

All of these appear to be correct and without effect
except for __LINE__ number changes where braces are added.
