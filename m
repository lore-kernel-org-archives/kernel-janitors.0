From: James Smart <james.smart@broadcom.com>
Date: Thu, 14 Feb 2019 21:19:52 +0000
Subject: Re: [PATCH -next] scsi: lpfc: Remove set but not used variable 'phys_id'
Message-Id: <ffe68c8a-dbcf-3598-ee99-1d65fd941b18@broadcom.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1536804299-64730-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org



On 2/14/2019 11:39 AM, James Bottomley wrote:
> On Thu, 2019-02-14 at 10:52 -0800, James Smart wrote:
>> On 2/13/2019 5:51 PM, YueHaibing wrote:
>>> Fixes gcc '-Wunused-but-set-variable' warning:
>>>
>>> drivers/scsi/lpfc/lpfc_init.c: In function
>>> 'lpfc_cpu_affinity_check':
>>> drivers/scsi/lpfc/lpfc_init.c:10599:19: warning:
>>>    variable 'phys_id' set but not used [-Wunused-but-set-variable]
>>>
>>> It never used since introduction in commit 6a828b0f6192 ("scsi:
>>> lpfc: Support
>>> non-uniform allocation of MSIX vectors to hardware queues")
>>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>    drivers/scsi/lpfc/lpfc_init.c | 3 +--
>>>    1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>>
>> Looks fine. Thanks
>>
>> Signed-off-by:   James Smart  <james.smart@broadcom.com>
> Under the DCO this can't be a Signed-off-by tag: signoffs track the
> patch transmission path under the DCO, so unless you send it you can't
> add your signoff.
>
> If you just want Martin to apply it now, and you don't want to gather
> and resend it with your other lpfc patches, I think the tag you want is
> Acked-by.
>
> James

I've been told multiple answers on which way to reply over the years. My=20
initial position followed your statement, but a later rebuke (would have=20
to look hard to find it) told me as maintainer that I should be doing=20
something different.=C2=A0 I'll go back to the DCO definitions and follow t=
hose.

Thanks for cleaning it up Martin.

-- james
