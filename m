From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Fri, 23 Nov 2018 14:48:06 +0000
Subject: Re: [PATCH] mm: debug: Fix a width vs precision bug in printk
Message-Id: <ddbf19fb-1d73-40ca-b421-4c171466833b@I-love.SAKURA.ne.jp>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
 <20181123090125.GC8625@dhcp22.suse.cz> <20181123143605.GB2970@unbuntlaptop>
In-Reply-To: <20181123143605.GB2970@unbuntlaptop>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Michal Hocko <mhocko@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Pavel Tatashin <pasha.tatashin@oracle.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On 2018/11/23 23:36, Dan Carpenter wrote:
> On Fri, Nov 23, 2018 at 10:01:25AM +0100, Michal Hocko wrote:
>> On Fri 23-11-18 10:21:35, Dan Carpenter wrote:
>>> We had intended to only print dentry->d_name.len characters but there is
>>> a width vs precision typo so if the name isn't NUL terminated it will
>>> read past the end of the buffer.
>>
>> OK, it took me quite some time to grasp what you mean here. The code
>> works as expected because d_name.len and dname.name are in sync so there
>> no spacing going to happen. Anyway what you propose is formally more
>> correct I guess.
>>  
> 
> Yeah.  If we are sure that the name has a NUL terminator then this
> change has no effect.

There seems to be %pd which is designed for printing "struct dentry".
