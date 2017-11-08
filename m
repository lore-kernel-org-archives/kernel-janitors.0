From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 08 Nov 2017 21:20:55 +0000
Subject: Re: [PATCH] xen/pvcalls: remove redundant check for irq >= 0
Message-Id: <0bb91134-e767-fa82-b45d-6c9ebb76e4b4@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171103092047.28421-1-colin.king@canonical.com>
 <f9627c5a-c1b4-71b2-fba4-5cefa24c33ba@suse.com>
In-Reply-To: <f9627c5a-c1b4-71b2-fba4-5cefa24c33ba@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Juergen Gross <jgross@suse.com>, Colin King <colin.king@canonical.com>, xen-devel@lists.xenproject.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/03/2017 06:01 AM, Juergen Gross wrote:
> On 03/11/17 10:20, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> This is a moot point, but irq is always less than zero at the label
>> out_error, so the check for irq >= 0 is redundant and can be removed.
>>
>> Detected by CoverityScan, CID#1460371 ("Logically dead code")
>>
>> Fixes: cb1c7d9bbc87 ("xen/pvcalls: implement connect command")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> Reviewed-by: Juergen Gross <jgross@suse.com>


Applied to for-linus-4.15.

-boris
