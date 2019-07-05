From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Fri, 05 Jul 2019 10:51:53 +0000
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
Message-Id: <e97cc68c-c59a-1f5f-6580-40868bf16e90@cogentembedded.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704222803.4328-1-colin.king@canonical.com>
 <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
 <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
In-Reply-To: <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>, Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/05/2019 11:31 AM, Colin Ian King wrote:

>>> From: Colin Ian King <colin.king@canonical.com>
>>>
>>> The pointer fname rc is being assigned with a value that is never
>>
>>    rc?
> 
> Oops, cut'n'paste error. Do you want me to resend to can this be fixed
> when it's applied?

   That's the question to the maintainers...

MBR, Sergei
