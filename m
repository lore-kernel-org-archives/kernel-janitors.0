From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 08 Nov 2017 21:22:55 +0000
Subject: Re: [PATCH] xen/privcmd: remove unused variable pageidx
Message-Id: <58d07187-cd88-b1da-d528-b8b58c2bd874@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171108130030.25394-1-colin.king@canonical.com>
 <5a4f3027-c6c9-d0eb-32a9-4eb6d1061fe5@suse.com>
In-Reply-To: <5a4f3027-c6c9-d0eb-32a9-4eb6d1061fe5@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>, Colin King <colin.king@canonical.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/08/2017 08:30 AM, Juergen Gross wrote:
> On 08/11/17 14:00, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Variable pageidx is assigned a value but it is never read, hence it
>> is redundant and can be removed. Cleans up clang warning:
>>
>> drivers/xen/privcmd.c:199:2: warning: Value stored to 'pageidx'
>> is never read
>>
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-4.15.

-boris
