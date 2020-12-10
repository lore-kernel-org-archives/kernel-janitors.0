From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 10 Dec 2020 14:47:52 +0000
Subject: Re: [PATCH] cxl: Reduce scope =?utf-8?Q?fo?= =?utf-8?B?ciB0aGUgdmFyaWFibGUg4oCcbW3igJ0=?= in cxllib_
Message-Id: <X9I1GLYCkw/q/xMu@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
In-Reply-To: <5cee2b25-71e0-15aa-fba6-12211b8308aa@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org

On Thu, Dec 10, 2020 at 03:35:38PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 10 Dec 2020 14:14:07 +0100
> 
> A local variable was used only within an if branch.
> Thus move the definition for the variable “mm” into the corresponding
> code block.

You did nothing here except add a checkpatch warning :(

dropped.

greg k-h
