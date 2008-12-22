From: "Steve French" <smfrench@gmail.com>
Date: Mon, 22 Dec 2008 21:55:38 +0000
Subject: Re: [PATCH 12/13] fs/cifs: Remove redundant test
Message-Id: <524f69650812221355t510f673at37a3e48585c0a5b8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0812211641370.9555@pc-004.diku.dk>
	 <524f69650812221355s2136b391u822d2a08a32c692@mail.gmail.com>
In-Reply-To: <524f69650812221355s2136b391u822d2a08a32c692@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-cifs-client@lists.samba.org, samba-technical@lists.samba.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Dec 22, 2008 at 3:55 PM, Steve French <smfrench@gmail.com> wrote:
>
> Merged into cifs-2.6.git (should make 2.6.29)
>
> Thx
>
> On Sun, Dec 21, 2008 at 9:41 AM, Julia Lawall <julia@diku.dk> wrote:
>>
>> From: Julia Lawall <julia@diku.dk>
>>
>> In fs/cifs/cifssmb.c, pLockData is tested for being NULL at the beginning
>> of the function, and not reassigned subsequently.
>>
>> In fs/xfs/xfs_trans_buf.c, bp is tested for being NULL just a few lines
>> above.
>>
>> A simplified version of the semantic patch that makes this change is as
>> follows: (http://www.emn.fr/x-info/coccinelle/)
>>
>> // <smpl>
>> @r exists@
>> local idexpression x;
>> expression E;
>> position p1,p2;
>> @@
>>
>> if (x@p1 = NULL || ...) { ... when forall
>>   return ...; }
>> ... when != \(x=E\|x--\|x++\|--x\|++x\|x-=E\|x+=E\|x|=E\|x&=E\|&x\)
>> (
>> x@p2 = NULL
>> |
>> x@p2 != NULL
>> )
>>
>> // another path to the test that is not through p1?
>> @s exists@
>> local idexpression r.x;
>> position r.p1,r.p2;
>> @@
>>
>> ... when != x@p1
>> (
>> x@p2 = NULL
>> |
>> x@p2 != NULL
>> )
>>
>> @fix depends on !s@
>> position r.p1,r.p2;
>> expression x,E;
>> statement S1,S2;
>> @@
>>
>> (
>> - if ((x@p2 != NULL) || ...)
>>  S1
>> |
>> - if ((x@p2 = NULL) && ...) S1
>> |
>> - BUG_ON(x@p2 = NULL);
>> )
>> // </smpl>
>>
>> Signed-off-by: Julia Lawall <julia@diku.dk>
>>
>> ---
>>  fs/cifs/cifssmb.c                   |    4 ----
>>  1 files changed, 0 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
>> index 824df14..552642a 100644
>> --- a/fs/cifs/cifssmb.c
>> +++ b/fs/cifs/cifssmb.c
>> @@ -1871,10 +1871,6 @@ CIFSSMBPosixLock(const int xid, struct cifsTconInfo *tcon,
>>                        rc = -EIO;      /* bad smb */
>>                        goto plk_err_exit;
>>                }
>> -               if (pLockData = NULL) {
>> -                       rc = -EINVAL;
>> -                       goto plk_err_exit;
>> -               }
>>                data_offset = le16_to_cpu(pSMBr->t2.DataOffset);
>>                data_count  = le16_to_cpu(pSMBr->t2.DataCount);
>>                if (data_count < sizeof(struct cifs_posix_lock)) {
>
>
>
> --
> Thanks,
>
> Steve



--
Thanks,

Steve
