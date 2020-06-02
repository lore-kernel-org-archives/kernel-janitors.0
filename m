From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jun 2020 16:05:11 +0000
Subject: Re: [PATCH v2] workqueue: ensure all flush_work() completed when being destroyed
Message-Id: <52adbed0-57ae-7af6-a673-2111e4d42252@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Lai Jiangshan <laijs@linux.alibaba.com>, kernel-janitors@vger.kernel.org
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, Tejun Heo <tj@kernel.org>

Please avoid a typo for the patch subject.


> But
e22bee782b3b("…")

Perhaps small adjustments?:
But commit e22bee782b3b ("…")


> and the wokenup wq-user code

… woken-up …


> can be scheduled eariler than …

… earlier …


> Changed from V1:
> 	Change from flush_no_color based mechanism to atomic+completion

Is there a need to reflect the versioning also in the patch subject?


> 	based as TJ suggested.

May the real name be specified?


Would you like to add the tag “Fixes” to the commit message?

Regards,
Markus
