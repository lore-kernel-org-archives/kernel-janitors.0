From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 04 Oct 2017 19:55:21 +0000
Subject: Re: cris: nand: Delete an error message for a failed memory allocation in crisv32_nand_flash_probe()
Message-Id: <86983988-9ede-09f8-2914-25c09699be67@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cd84411c-d202-70d6-dec2-c02bedaf3594@users.sourceforge.net>
 <92a95fe3-5b8d-5dd9-a7bf-131a999e74c6@users.sourceforge.net>
 <20171004214432.20833a0ff3b9c8fdced2ebaa@gmail.com>
In-Reply-To: <20171004214432.20833a0ff3b9c8fdced2ebaa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, linux-cris-kernel@axis.com
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>, Gregory Clement <gregory.clement@free-electrons.com>, Jesper Nilsson <jesper.nilsson@axis.com>, Krzysztof Halasa <khalasa@piap.pl>, Mikael Starvik <starvik@axis.com>, Neil Armstrong <narmstrong@baylibre.com>, Shawn Guo <shawnguo@kernel.org>, Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

>> Omit an extra message for a memory allocation failure in this function.
>>
>> This issue was detected by using the Coccinelle software.
> 
> what exactly has the software detected?

Do you prefer the notification “WARNING: Possible unnecessary 'out of memory' message”
by the script “checkpatch.pl” instead?


> I cannot find, how this error is reported otherwise, it seems
> to me that the message is not that superflous.

Would you find the default allocation failure report sufficient?

Regards,
Markus
