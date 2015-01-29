From: David Miller <davem@davemloft.net>
Date: Thu, 29 Jan 2015 07:07:05 +0000
Subject: Re: [patch net-next] hisilicon: add some missing curly braces
Message-Id: <20150128.230705.155343650325772037.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150128185833.GA10259@mwanda>
	<54C99FFB.2080207@huawei.com>
In-Reply-To: <54C99FFB.2080207@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dingtianhong@huawei.com
Cc: dan.carpenter@oracle.com, zhangfei.gao@linaro.org, arnd@arndb.de, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Ding Tianhong <dingtianhong@huawei.com>
Date: Thu, 29 Jan 2015 10:50:35 +0800

> On 2015/1/29 2:58, Dan Carpenter wrote:
>> The if block was supposed to have curly braces.  In the current code we
>> complain about dropped rx packets when we shouldn't.
>> 
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> 
> Acked-by: Ding Tianhong <dingtianhong@huawei.com>

Applied, thanks everyone.
