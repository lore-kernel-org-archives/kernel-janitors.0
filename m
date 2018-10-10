From: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 10 Oct 2018 01:19:13 +0000
Subject: Re: [PATCH v2] rxrpc: use correct kvec num while send response packet in rxrpc_reject_packets
Message-Id: <0f16d0ff-dfbe-146f-eacc-c831bb0e6576@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
 <1539094525-174123-1-git-send-email-yuehaibing@huawei.com>
 <365d2f43-089a-1246-d354-2b3481d50b9a@cogentembedded.com>
In-Reply-To: <365d2f43-089a-1246-d354-2b3481d50b9a@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, David Howells <dhowells@redhat.com>, davem@davemloft.net
Cc: linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2018/10/9 23:34, Sergei Shtylyov wrote:
> On 10/09/2018 05:15 PM, YueHaibing wrote:
> 
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> net/rxrpc/output.c: In function 'rxrpc_reject_packets':
>> net/rxrpc/output.c:527:11: warning:
>>  variable 'ioc' set but not used [-Wunused-but-set-variable]
>>
>> 'ioc' is the correct kvec num while send response packet.
>>
>> Fixes: commit ece64fec164f ("rxrpc: Emit BUSY packets when supposed to rather than 
> ABORTs")
> 
>    "commit" not needed here.

Thank you for review.

> 
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> [...]
> 
> MBR, Sergei
> 
> 
> 
