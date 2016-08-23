From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 23 Aug 2016 07:26:51 +0000
Subject: Re: checkpatch: See if modified files are marked obsolete in MAINTAINERS
Message-Id: <d5365370-37b5-b367-ba9e-45f4e27f975a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <87shtwvm63.fsf@kamboji.qca.qualcomm.com>
 <7ceaa510dc9d2df05ec4b456baed7bb1415550b3.1471889575.git.joe@perches.com>
In-Reply-To: <7ceaa510dc9d2df05ec4b456baed7bb1415550b3.1471889575.git.joe@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kalle Valo <kvalo@codeaurora.org>, Arend van Spriel <arend.vanspriel@broadcom.com>, Andy Whitcroft <apw@canonical.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, linux-kernel@vger.kernel.org, Fengguang Wu <fengguang.wu@intel.com>

> Use get_maintainer to check the status of individual files.
> If "obsolete", suggest leaving the files alone.

Will another software system like the "kbuild test robot"
need any more fine-tuning for this change?

Regards,
Markus
