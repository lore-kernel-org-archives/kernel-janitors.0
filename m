From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 21:58:22 +0000
Subject: Re: md: Combine two kmalloc() calls into one in sb_equal()
Message-Id: <b992386f-bf20-8483-d7dd-ee4c29625ecb@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4df733d-8e06-8ba1-c4c3-800d8c5615ba@users.sourceforge.net>
 <71044708-c5e4-3a14-b162-dfc600311a60@fastmail.fm>
 <a7693826-b1d1-882a-44ce-5dca9d2fe851@users.sourceforge.net>
 <a33e87c6-9b47-96e2-a877-b86bc8949eb6@fastmail.fm>
In-Reply-To: <a33e87c6-9b47-96e2-a877-b86bc8949eb6@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Irrelevant, the variable is not used before checking it.

* Will it be more appropriate to attempt another memory allocation only if
  the previous one succeeded already?

* Can it be a bit more efficient to duplicate only the required data
  in a single function call before?

Regards,
Markus
