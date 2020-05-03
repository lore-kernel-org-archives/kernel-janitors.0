From: Markus Elfring <Markus.Elfring@web.de>
Date: Sun, 03 May 2020 12:05:41 +0000
Subject: Re: [PATCH] rtc: mc13xxx: fix a double-unlock issue
Message-Id: <b9c82115-c70a-2381-f920-385846eb2a45@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiushi Wu <wu000273@umn.edu>, linux-rtc@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Kangjie Lu <kjlu@umn.edu>

> … To fix this problem,
> we need to call mc13xxx_lock() again in this error path.

How do you think about a wording variant like the following?

   Change description:
   …
   Thus add a call of the function “mc13xxx_lock” in an if branch
   for the completion of the exception handling.


Would you like to add the tag “Fixes”?

Regards,
Markus
