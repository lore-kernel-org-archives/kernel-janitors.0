From: Wei Yang <richardw.yang@linux.intel.com>
Date: Thu, 10 Oct 2019 01:23:22 +0000
Subject: Re: [PATCH -next] userfaultfd: remove set but not used variable 'h'
Message-Id: <20191010012322.GB2167@richard>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191009122740.70517-1-yuehaibing@huawei.com>
 <a28da32b-5c26-21e9-4a08-722abf9fbeba@oracle.com>
In-Reply-To: <a28da32b-5c26-21e9-4a08-722abf9fbeba@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Kravetz <mike.kravetz@oracle.com>
Cc: YueHaibing <yuehaibing@huawei.com>, Andrea Arcangeli <aarcange@redhat.com>, "Joel Fernandes (Google)" <joel@joelfernandes.org>, Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Wei Yang <richardw.yang@linux.intel.com>, Hugh Dickins <hughd@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Oct 09, 2019 at 05:45:57PM -0700, Mike Kravetz wrote:
>On 10/9/19 5:27 AM, YueHaibing wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>> 
>> mm/userfaultfd.c: In function '__mcopy_atomic_hugetlb':
>> mm/userfaultfd.c:217:17: warning:
>>  variable 'h' set but not used [-Wunused-but-set-variable]
>> 
>> It is not used since commit 78911d0e18ac ("userfaultfd: use vma_pagesize
>> for all huge page size calculation")
>> 
>
>Thanks!  That should have been removed with the recent cleanups.
>
>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>
>Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>

If I am correct, this is removed in a recent patch.

>-- 
>Mike Kravetz

-- 
Wei Yang
Help you, Help me
