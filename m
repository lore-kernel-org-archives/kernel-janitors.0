From: Yang Yang <yang.yang@vivo.com>
Date: Tue, 15 Sep 2020 08:34:38 +0000
Subject: Re: [PATCH] blk-mq: fix hang issue in blk_queue_enter()
Message-Id: <63816f52-4850-f586-ce73-3775ecc38da9@vivo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11a3283f-7857-0448-7424-8840fb5f2ea7@web.de>
In-Reply-To: <11a3283f-7857-0448-7424-8840fb5f2ea7@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Jens Axboe <axboe@kernel.dk>, onlyfever@icloud.com, linux-block@vger.kernel.org

On 2020/9/14 21:35, Markus Elfring wrote:
> …
>> The solution is to wake up the mq_freeze_wq after runtime suspend
>> completed, make blk_pm_request_resume() reexamine the q->rpm_status flag.
> 
> * Would an imperative wording become helpful for the change description?
> 
> * How do you think about to add the tag “Fixes” to the commit message?
> 

Thank you for your suggestions.

--
Yang Yang
