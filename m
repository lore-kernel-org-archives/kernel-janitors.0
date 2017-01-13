From: Michal Hocko <mhocko@kernel.org>
Date: Fri, 13 Jan 2017 08:26:08 +0000
Subject: Re: [patch linux-next] userfaultfd: hugetlbfs: unmap the correct pointer
Message-Id: <20170113082607.GA25212@dhcp22.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170112192052.GB12157@mwanda>
 <20170112193327.GB8558@dhcp22.suse.cz>
 <20170113081610.GC4188@mwanda>
In-Reply-To: <20170113081610.GC4188@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mike Kravetz <mike.kravetz@oracle.com>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Jan Kara <jack@suse.cz>, Ross Zwisler <ross.zwisler@linux.intel.com>, Lorenzo Stoakes <lstoakes@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>, Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org, kernel-janitors@vger.kernel.org

On Fri 13-01-17 11:16:10, Dan Carpenter wrote:
> On Thu, Jan 12, 2017 at 08:33:27PM +0100, Michal Hocko wrote:
> > On Thu 12-01-17 22:20:52, Dan Carpenter wrote:
> > > kunmap_atomic() and kunmap() take different pointers.  People often get
> > > these mixed up.
> > > 
> > > Fixes: 16374db2e9a0 ("userfaultfd: hugetlbfs: fix __mcopy_atomic_hugetlb retry/error processing")
> > 
> > This looks like a linux-next sha1. This is not stable and will change...
> > 
> 
> Yeah.  But probably Andrew is just going to fold it into the original
> anyway.  Probably most of linux-next trees don't rebase so the hash is
> good and the people who rebase fold it in so it doesn't show up in the
> released code.  It basically never hurts to have the Fixes tag.

Yeah, I have a vague recollection that some of those sha1 leaked to
Linus. Do not have any examples handy though. It is true that Andrew
folds those fixes into the original patch so it might be helpful to
have
Fixes: mmotm-patch-file-name.patch
instead.

-- 
Michal Hocko
SUSE Labs
