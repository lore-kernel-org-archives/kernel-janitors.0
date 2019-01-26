From: YueHaibing <yuehaibing@huawei.com>
Date: Sat, 26 Jan 2019 01:37:52 +0000
Subject: Re: [PATCH -next] btrfs: qgroup: Fix inconsistent IS_ERR and PTR_ERR
Message-Id: <904a130c-1f9b-2d67-1096-258d3c8bd52e@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1548381009-80383-1-git-send-email-yuehaibing@huawei.com>
 <87ac97b6-2b14-9b48-ed28-4d0cbce7322f@gmx.com>
In-Reply-To: <87ac97b6-2b14-9b48-ed28-4d0cbce7322f@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, Qu Wenruo <wqu@suse.com>
Cc: linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org



On 2019/1/25 9:59, Qu Wenruo wrote:
> 
> 
> On 2019/1/25 上午9:50, YueHaibing wrote:
>> Change the call to PTR_ERR to access the value just tested by IS_ERR.
>>
>> Fixes: 2b35a512e9cf ("btrfs: qgroup: Use delayed subtree rescan for balance")
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>> ---
>>  fs/btrfs/qgroup.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
>> index 8559ed9..16d7ec8 100644
>> --- a/fs/btrfs/qgroup.c
>> +++ b/fs/btrfs/qgroup.c
>> @@ -3931,7 +3931,7 @@ int btrfs_qgroup_trace_subtree_after_cow(struct btrfs_trans_handle *trans,
>>  				   block->reloc_generation, block->level,
>>  				   &block->first_key);
>>  	if (IS_ERR(reloc_eb)) {
>> -		ret = PTR_ERR(subv_eb);
>> +		ret = PTR_ERR(reloc_eb);
> 
> Nice catch.
> 
> I'll fold the this fix in my original patch if it's OK for you.

Ok, sure.

> 
> Thanks,
> Qu
> 
>>  		reloc_eb = NULL;
>>  		goto free_out;
>>  	}
>>
>>
>>
> 
