From: Markus Elfring <Markus.Elfring@web.de>
Date: Mon, 25 May 2020 09:55:05 +0000
Subject: Re: [PATCH v2] workqueue: Fix double kfree for rescuer
Message-Id: <e7d637d0-06e2-25e3-9af7-8c4668f9172f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525075901.12699-1-qiang.zhang@windriver.com>
 <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
In-Reply-To: <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Zhang Qiang <qiang.zhang@windriver.com>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

> * The function call “destroy_workqueue” can be performed there in an if branch
>   after the statement “wq->rescuer = NULL” was executed.

Another correction:
* The function call “kfree(rescuer)” can be performed there in an if branch
  after the statement “wq->rescuer = NULL” was executed.

Regards,
Markus
