From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Aug 2018 09:29:43 +0000
Subject: Re: [PATCH] rtmutex: Drop pointless static qualifier in rt_mutex_adjust_prio_chain()
Message-Id: <20180807092943.yilmjaq22mvb3ckp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1533632163-93769-1-git-send-email-maowenan@huawei.com>
In-Reply-To: <1533632163-93769-1-git-send-email-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

This is obviously wrong and you need to at least compile your patches...

regards,
dan carpenter

