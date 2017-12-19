From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 19 Dec 2017 14:37:12 +0000
Subject: Re: [PATCH 0/2] platform/x86/thinkpad_acpi: Adjustments for four function implementations
Message-Id: <CAHp75Vckgw1Eqao_vsq0n8RuYJRP2JZWJz6-MxZ6Wwb8eAEVgA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
In-Reply-To: <81459d11-693a-eb51-9173-9c189677f422@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: ibm-acpi-devel@lists.sourceforge.net, Platform Driver <platform-driver-x86@vger.kernel.org>, Andy Shevchenko <andy@infradead.org>, Darren Hart <dvhart@infradead.org>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Mon, Dec 18, 2017 at 11:26 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 18 Dec 2017 22:23:45 +0100
>
> Two update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (2):
>   Delete an error message for a failed memory allocation in three functions

This one is questionable since it prints error messages at ->init() stage.
I would rather not touch this.

>   Improve a size determination in tpacpi_new_rfkill()

Doesn't make any sense right now. One style over the other.
Nothing gets better or worth at this point.

Sorry, but NAK for both.

-- 
With Best Regards,
Andy Shevchenko
