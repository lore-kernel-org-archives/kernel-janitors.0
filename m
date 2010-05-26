From: David Miller <davem@davemloft.net>
Date: Wed, 26 May 2010 07:43:47 +0000
Subject: Re: [patch] kobject: free memory if netlink_kernel_create() fails
Message-Id: <20100526.004347.115926528.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100525095110.GG22515@bicker>
	<m1d3wk2s7y.fsf@fess.ebiederm.org>
In-Reply-To: <m1d3wk2s7y.fsf@fess.ebiederm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ebiederm@xmission.com
Cc: error27@gmail.com, gregkh@suse.de, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: ebiederm@xmission.com (Eric W. Biederman)
Date: Tue, 25 May 2010 03:25:37 -0700

> Dan Carpenter <error27@gmail.com> writes:
> 
>> There is a kfree(ue_sk) missing on the error path if 
>> netlink_kernel_create() fails.
>>
>> Signed-off-by: Dan Carpenter <error27@gmail.com>
> Reviewed-by: "Eric W. Biederman" <ebiederm@xmission.com>

Greg, I assume you've got this one?

Thanks!
