From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 08:20:45 +0000
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_v2=5d_workqueue=3a_Delete_duplicate_kfree?= =?UTF-8?B?KCkgY2FsbCBmb3Ig4oCcc
Message-Id: <efe09ccb-914c-6573-b88f-919bddff20a5@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525075901.12699-1-qiang.zhang@windriver.com>
In-Reply-To: <20200525075901.12699-1-qiang.zhang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> The duplicate memory release should be deleted from the implementation
> of the callback function "rcu_free_wq".

I would find it nicer if you would have extended my simple wording suggestion.

1. Mention conditions:
   The callback function “rcu_free_wq” could be called after memory was released
   for “rescuer” already.

2. Specify the desired action:
   Thus delete a misplaced call of the function “kfree”.

3. Please keep the patch versioning consistent.
   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?id=9cb1fd0efd195590b828b9b865421ad345a4a145#n709

Regards,
Markus
