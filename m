From: qzhang2 <qiang.zhang@windriver.com>
Date: Tue, 26 May 2020 02:05:44 +0000
Subject: Re: [v2] workqueue: Fix double kfree for rescuer
Message-Id: <e002d552-b161-0cc3-88ea-daee541ee6f4@windriver.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200525075901.12699-1-qiang.zhang@windriver.com>
 <7d19381c-2c51-deb4-f82f-d54bc56c6ecf@web.de>
 <bee86d19-6c14-1fd9-eead-24e63af6cf8e@windriver.com>
 <8b67c327-e70c-1e96-6a99-a5fd2667f666@web.de>
In-Reply-To: <8b67c327-e70c-1e96-6a99-a5fd2667f666@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Markus Elfring <Markus.Elfring@web.de>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Thanks for your advice.
The rescuer null pointer is intentionally passed by a data structure?
and also I read the code of workqueue again, when destroy_workqueue is
called, after "wq->rescuer = NULL" was executed, The scenario described 
below does not happen

"if non-null pointers (according to valid rescuer objects) are 
occasionally passed by the corresponding data structure member
for the callback function "rcu_free_wq"."


On 5/25/20 6:40 PM, Markus Elfring wrote:
>> I see, kfree does nothing with null pointers and direct return.
>> but again kfree is not a good suggestion.
> 
> I have got the impression that the implementation detail is important here
> if non-null pointers (according to valid rescuer objects) are occasionally
> passed by the corresponding data structure member for the callback
> function “rcu_free_wq”.
> Can another clarification attempt reduce unwanted confusion for this patch review?
> 
> Regards,
> Markus
> 
