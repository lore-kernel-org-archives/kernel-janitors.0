From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 17:42:46 +0000
Subject: Re: sky2: Use seq_putc() in sky2_debug_show()
Message-Id: <a85959a8-a357-d8e0-d7e9-617e2052aed6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1f36d45e-3ca9-bfb8-0634-901c42390e2c@users.sourceforge.net>
 <8594c152-68a4-c0c7-b4c6-49c753b0c748@gmx.de>
In-Reply-To: <8594c152-68a4-c0c7-b4c6-49c753b0c748@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lino Sanfilippo <LinoSanfilippo@gmx.de>, netdev@vger.kernel.org
Cc: Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Which issue do you mean? I dont see any issue you fix here.

Are the run time characteristics a bit nicer for the function “seq_putc”
in comparison to the function “seq_puts” for printing a single line break here?

Regards,
Markus
