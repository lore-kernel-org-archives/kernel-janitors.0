From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 09 Dec 2016 19:54:39 +0000
Subject: Re: md: Combine two kmalloc() calls into one in sb_equal()
Message-Id: <a7693826-b1d1-882a-44ce-5dca9d2fe851@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f4df733d-8e06-8ba1-c4c3-800d8c5615ba@users.sourceforge.net>
 <71044708-c5e4-3a14-b162-dfc600311a60@fastmail.fm>
In-Reply-To: <71044708-c5e4-3a14-b162-dfc600311a60@fastmail.fm>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernd Schubert <bernd.schubert@fastmail.fm>
Cc: linux-raid@vger.kernel.org, Shaohua Li <shli@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> So where did you get the idea from that it is not checked immediately?

Is another variable assignment performed so far before the return value
is checked from a previous function call?

Regards,
Markus
