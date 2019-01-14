From: "Huang\, Ying" <ying.huang@intel.com>
Date: Mon, 14 Jan 2019 02:12:25 +0000
Subject: Re: [PATCH] mm, swap: Potential NULL dereference in get_swap_page_of_type()
Message-Id: <87r2dgm1h2.fsf@yhuang-dev.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190111095919.GA1757@kadam>
	<20190111174128.oak64htbntvp7j6y@ca-dmjordan1.us.oracle.com>
In-Reply-To: <20190111174128.oak64htbntvp7j6y@ca-dmjordan1.us.oracle.com>
	(Daniel Jordan's message of "Fri, 11 Jan 2019 09:41:28 -0800")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daniel Jordan <daniel.m.jordan@oracle.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Shaohua Li <shli@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Omar Sandoval <osandov@fb.com>, Tejun Heo <tj@kernel.org>, Andi Kleen <ak@linux.intel.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org, andrea.parri@amarulasolutions.com

Hi, Daniel,

Daniel Jordan <daniel.m.jordan@oracle.com> writes:

> On Fri, Jan 11, 2019 at 12:59:19PM +0300, Dan Carpenter wrote:
>> Smatch complains that the NULL checks on "si" aren't consistent.  This
>> seems like a real bug because we have not ensured that the type is
>> valid and so "si" can be NULL.
>> 
>> Fixes: ec8acf20afb8 ("swap: add per-partition lock for swapfile")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>>  mm/swapfile.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>> 
>> diff --git a/mm/swapfile.c b/mm/swapfile.c
>> index f0edf7244256..21e92c757205 100644
>> --- a/mm/swapfile.c
>> +++ b/mm/swapfile.c
>> @@ -1048,9 +1048,12 @@ swp_entry_t get_swap_page_of_type(int type)
>>  	struct swap_info_struct *si;
>>  	pgoff_t offset;
>>  
>> +	if (type >= nr_swapfiles)
>> +		goto fail;
>> +
>
> As long as we're worrying about NULL, I think there should be an smp_rmb here
> to ensure swap_info[type] isn't NULL in case of an (admittedly unlikely) racing
> swapon that increments nr_swapfiles.  See smp_wmb in alloc_swap_info and the
> matching smp_rmb's in the file.  And READ_ONCE's on either side of the barrier
> per LKMM.

I think you are right here.  And smp_rmb() for nr_swapfiles are missing
in many other places in swapfile.c too (e.g. __swap_info_get(),
swapdev_block(), etc.).

In theory, I think we need to fix this.

Best Regards,
Huang, Ying

> I'm adding Andrea (randomly selected from the many LKMM folks to avoid spamming
> all) who can correct me if I'm wrong about any of this.
>
>>  	si = swap_info[type];
>>  	spin_lock(&si->lock);
>> -	if (si && (si->flags & SWP_WRITEOK)) {
>> +	if (si->flags & SWP_WRITEOK) {
>>  		atomic_long_dec(&nr_swap_pages);
>>  		/* This is called for allocating swap entry, not cache */
>>  		offset = scan_swap_map(si, 1);
>> @@ -1061,6 +1064,7 @@ swp_entry_t get_swap_page_of_type(int type)
>>  		atomic_long_inc(&nr_swap_pages);
>>  	}
>>  	spin_unlock(&si->lock);
>> +fail:
>>  	return (swp_entry_t) {0};
>>  }
>>  
>> -- 
>> 2.17.1
>> 
