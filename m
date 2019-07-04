From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 04 Jul 2019 16:47:50 +0000
Subject: Re: [PATCH][next] btrfs: fix memory leak of path on error return path
Message-Id: <366d87f9-96ea-ecc3-6464-9d20e3050248@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190702141028.11566-1-colin.king@canonical.com>
 <20190704163721.GA20977@twin.jikos.cz>
In-Reply-To: <20190704163721.GA20977@twin.jikos.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dsterba@suse.cz, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04/07/2019 17:37, David Sterba wrote:
> On Tue, Jul 02, 2019 at 03:10:28PM +0100, Colin King wrote:
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> Currently if the allocation of roots or tmp_ulist fails the error handling
>> does not free up the allocation of path causing a memory leak. Fix this by
>> freeing path with a call to btrfs_free_path before taking the error return
>> path.
>>
>> Addresses-Coverity: ("Resource leak")
> 
> Does this have an id, that coverity uses?

Not a public one that I know of. These are based on private scans I run
in Canonical.

> 
>> Fixes: 5911c8fe05c5 ("btrfs: fiemap: preallocate ulists for btrfs_check_shared")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  fs/btrfs/extent_io.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
>> index 1eb671c16ff1..d7f37a33d597 100644
>> --- a/fs/btrfs/extent_io.c
>> +++ b/fs/btrfs/extent_io.c
>> @@ -4600,6 +4600,7 @@ int extent_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
>>  	tmp_ulist = ulist_alloc(GFP_KERNEL);
>>  	if (!roots || !tmp_ulist) {
>>  		ret = -ENOMEM;
>> +		btrfs_free_path(path);
> 
> This fixes only one leak, therere are more that I spotted while
> reviewing this patch. The gotos from the while-loop jump to
> out_free_list but that leave the path behind>
> That's why the exit block is a better place for the cleanups. This
> requires proper nesting of the cleanup calls, that's slightly
> inconvenient in this case. The free_path is before call to
> unlock_extent_cached so when the ordre is switched and free_path moved
> to out_free_ulist, then all the leaks are addressed in one go.

Oh, yes. Even static analysis missed that too!

> 
> Bummer that the leaks escaped sight of original patch author (me), 2
> reviewers and now 1 fix reviewer.
> 
Given that you can see more issues, I'll leave the fix in your capable
hands.

Colin
