From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 14 Aug 2019 12:00:23 +0000
Subject: Re: [v2 08/10] scripts: Coccinelle script for namespace dependencies
Message-Id: <d3c852b2-0e41-1a7e-2f98-d8fd23cb8c1a@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190813121733.52480-9-maennich@google.com>
In-Reply-To: <20190813121733.52480-9-maennich@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Martijn Coenen <maco@android.com>, Himanshu Jha <himanshujha199640@gmail.com>, cocci@systeme.lip6.fr, kernel-janitors@vger.kernel.org
Cc: Kate Stewart <kstewart@linuxfoundation.org>, linux-m68k@vger.kernel.org, Oliver Neukum <oneukum@suse.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, usb-storage@lists.one-eyed-alien.net, "H. Peter Anvin" <hpa@zytor.com>, Joel Fernandes <joel@joelfernandes.org>, Sam Ravnborg <sam@ravnborg.org>, linux-arch@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org, Lucas De Marchi <lucas.de.marchi@gmail.com>, Ingo Molnar <mingo@redhat.com>, Alan Stern <stern@rowland.harvard.edu>, Geert Uytterhoeven <geert@linux-m68k.org>, kernel-team@android.com, ",
 linux-kernel"@vger.kernel.org, Sandeep Patil <sspatil@google.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, Philippe Ombredanne <pombredanne@nexb.com>, Nicolas Palix <nicolas.palix@imag.fr>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Thomas Gleixner <tglx@linutronix.de>, Michal Marek <michal.lkml@markovi.net>, linux-usb@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Martijn Coenen <maco@google.com>, Jessica Yu <jeyu@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-modules@vger.kernel.org

+# This script requires at least spatch
+# version 1.0.4.

How do you think about to avoid the duplicate specification of this identification?

Regards,
Markus
