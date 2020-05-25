From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 07:04:46 +0000
Subject: Re: [PATCH] workqueue: Fix double kfree(rescuer) in destroy_workqueue()
Message-Id: <cb2735b1-c54a-8746-d776-951081582366@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <96b49f22-50a7-9c8f-7c9d-f178195de717@web.de>
 <69170178-f149-b44b-6465-a4c6ab893d52@windriver.com>
In-Reply-To: <69170178-f149-b44b-6465-a4c6ab893d52@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qiang Zhang <qiang.zhang@windriver.com>, Lai Jiangshan <jiangshanlai@gmail.com>, Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> Sorry I didn't describe clearly
>
> I describe the meaning as follows:

Can it help to adjust the change description in the way
that a duplicate memory release should be deleted from the implementation
of the callback function “rcu_free_wq”?

Which commit should be referenced for the tag “Fixes”?

Regards,
Markus
