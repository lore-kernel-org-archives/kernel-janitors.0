From: Anshuman Khandual <anshuman.khandual@arm.com>
Date: Fri, 23 Nov 2018 07:59:33 +0000
Subject: Re: [PATCH] mm: debug: Fix a width vs precision bug in printk
Message-Id: <6f7469d9-d589-7a6b-b157-fe481e396fff@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
In-Reply-To: <20181123072135.gqvblm2vdujbvfjs@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>
Cc: Pavel Tatashin <pasha.tatashin@oracle.com>, Alexander Duyck <alexander.h.duyck@linux.intel.com>, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org



On 11/23/2018 12:51 PM, Dan Carpenter wrote:
> We had intended to only print dentry->d_name.len characters but there is
> a width vs precision typo so if the name isn't NUL terminated it will
> read past the end of the buffer.
> 
> Fixes: 408ddbc22be3 ("mm: print more information about mapping in __dump_page")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
