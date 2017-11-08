From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 08 Nov 2017 21:20:32 +0000
Subject: Re: [PATCH] xen/pvcalls: fix unsigned less than zero error check
Message-Id: <81dba278-f38e-3043-c1f7-2a0f00ae07d7@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103084202.27790-1-colin.king@canonical.com>
 <2116793f-cd52-a99f-772e-5dcb768ad411@suse.com>
In-Reply-To: <2116793f-cd52-a99f-772e-5dcb768ad411@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>, Colin King <colin.king@canonical.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/03/2017 05:01 AM, Juergen Gross wrote:
> On 03/11/17 09:42, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The check on bedata->ref is never true because ref is an unsigned
>> integer. Fix this by assigning signed int ret to the return of the
>> call to gnttab_claim_grant_reference so the -ve return can be checked.
>>
>> Detected by CoverityScan, CID#1460358 ("Unsigned compared against 0")
>>
>> Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-4.15.

-boris
