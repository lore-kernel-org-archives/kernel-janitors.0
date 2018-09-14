From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 14 Sep 2018 18:18:45 +0000
Subject: Re: [PATCH] net: caif: remove redundant null check on frontpkt
Message-Id: <e80cfebd-3130-6b35-b878-219281de7cf3@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180914171916.21298-1-colin.king@canonical.com>
 <47b7f5a0-8b13-ead7-33b7-6e9c6ada8e61@cogentembedded.com>
In-Reply-To: <47b7f5a0-8b13-ead7-33b7-6e9c6ada8e61@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Dmitry Tarnyagin <dmitry.tarnyagin@lockless.no>, "David S . Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org

On 14/09/18 18:54, Sergei Shtylyov wrote:
> Hello!
> 
> On 09/14/2018 08:19 PM, Colin King wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> It is impossible for frontpkt to be null at the point of the null
>> check because it has been assigned from rearpkt and there is no
>> way realpkt can be null at the point of the assignment because
> 
>    rearpkt?

Good spot. Can this be fixed up when the patch is applied?

> 
>> of the sanity checking and exit paths taken previously. Remove
>> the redundant null check.
>>
>> Detected by CoverityScan, CID#114434 ("Logically dead code")
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> [...]
> 
> MBR, Sergei
> 
