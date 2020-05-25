From: qzhang2 <qiang.zhang@windriver.com>
Date: Mon, 25 May 2020 10:19:59 +0000
Subject: Re: [PATCH v2] workqueue: Fix double kfree for rescuer
Message-Id: <bee86d19-6c14-1fd9-eead-24e63af6cf8e@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525075901.12699-1-qiang.zhang@windriver.com>
 <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
In-Reply-To: <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

I see, kfree does nothing with null pointers and direct return.
but again kfree is not a good suggestion.

On 5/25/20 5:50 PM, Markus Elfring wrote:
>> The duplicate memory release should be deleted from the implementation
>> of the callback function "rcu_free_wq".
> 
> I tried to help with the selection of a better commit message.
> I have taken another look also at the implementation of the function “destroy_workqueue”.
> 
> * The function call “destroy_workqueue” can be performed there in an if branch
>    after the statement “wq->rescuer = NULL” was executed.
> 
> * This data processing is independent from a possible call of the
>    function “call_rcu(&wq->rcu, rcu_free_wq)” in another if branch.
>    Thus it seems that a null pointer is intentionally passed by a data structure
>    member to this callback function on demand.
>    The corresponding call of the function “kfree” can tolerate this special case.
> 
> 
> Now I find that the proposed change can be inappropriate.
> 
> Regards,
> Markus
> 
