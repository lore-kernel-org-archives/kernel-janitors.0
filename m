From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 10:40:29 +0000
Subject: Re: [v2] workqueue: Fix double kfree for rescuer
Message-Id: <8b67c327-e70c-1e96-6a99-a5fd2667f666@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525075901.12699-1-qiang.zhang@windriver.com>
 <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
 <bee86d19-6c14-1fd9-eead-24e63af6cf8e@windriver.com>
In-Reply-To: <bee86d19-6c14-1fd9-eead-24e63af6cf8e@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> I see, kfree does nothing with null pointers and direct return.
> but again kfree is not a good suggestion.

I have got the impression that the implementation detail is important here
if non-null pointers (according to valid rescuer objects) are occasionally
passed by the corresponding data structure member for the callback
function “rcu_free_wq”.
Can another clarification attempt reduce unwanted confusion for this patch review?

Regards,
Markus
