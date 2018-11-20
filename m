From: Bart Van Assche <bvanassche@acm.org>
Date: Tue, 20 Nov 2018 03:43:21 +0000
Subject: Re: [PATCH -next] IB/srpt: Drop pointless static qualifier in srpt_make_tpg()
Message-Id: <f8bc401e-ab18-5bad-9805-abef8b69542e@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542279300-104731-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 11/15/18 2:55 AM, YueHaibing wrote:
> From: Yue Haibing <yuehaibing@huawei.com>
> 
> There is no need to have the 'struct se_portal_group *tpg' variable
> static since new value always be assigned before use it.

Reviewed-by: Bart Van Assche <bvanassche@acm.org>
