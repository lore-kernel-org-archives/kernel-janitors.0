From: Colin Ian King <colin.king@canonical.com>
Date: Fri, 05 Jul 2019 08:31:27 +0000
Subject: Re: [PATCH][next] ubifs: remove redundant assignment to pointer fname
Message-Id: <4741f358-7c21-f721-e9fd-59d73876c62c@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190704222803.4328-1-colin.king@canonical.com>
 <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
In-Reply-To: <b5e7709b-3494-d415-b36c-b19939a15fb5@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Richard Weinberger <richard@nod.at>, Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, linux-mtd@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/07/2019 09:24, Sergei Shtylyov wrote:
> Hello!
> 
> On 05.07.2019 1:28, Colin King wrote:
> 
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The pointer fname rc is being assigned with a value that is never
> 
>    rc?

Oops, cut'n'paste error. Do you want me to resend to can this be fixed
when it's applied?

Colin

> 
>> read because the function returns after the assignment. The assignment
>> is redundant and can be removed.
>>
>> Addresses-Coverity: ("Unused value")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>   fs/ubifs/debug.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/fs/ubifs/debug.c b/fs/ubifs/debug.c
>> index 92fe5c5ed78a..95da71e13fc8 100644
>> --- a/fs/ubifs/debug.c
>> +++ b/fs/ubifs/debug.c
>> @@ -2817,7 +2817,6 @@ void dbg_debugfs_init_fs(struct ubifs_info *c)
>>                c->vi.ubi_num, c->vi.vol_id);
>>       if (n = UBIFS_DFS_DIR_LEN) {
>>           /* The array size is too small */
>> -        fname = UBIFS_DFS_DIR_NAME;
>>           return;
>>       }
>>   
> 
> MBR, Sergei
> 
