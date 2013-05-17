From: Matthew Wilcox <willy@linux.intel.com>
Date: Fri, 17 May 2013 13:41:28 +0000
Subject: Re: [patch -resend] NVMe: check for integer overflow in nvme_map_user_pages()
Message-Id: <20130517134128.GT6057@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <100D68C7BA14664A8938383216E40DE027F80EAB@fmsmsx111.amr.corp.intel.com>
 <20130513145950.GA21239@elgon.mountain>
In-Reply-To: <20130513145950.GA21239@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 13, 2013 at 05:59:50PM +0300, Dan Carpenter wrote:
> You need to have CAP_SYS_ADMIN to trigger this overflow but it makes the
> static checkers complain so we should fix it.  The worry is that
> "length" comes from copy_from_user() so we need to check that "length +
> offset" can't overflow.
> 
> I also changed the min_t() cast to be unsigned instead of signed.  Now
> that we cap "length" to INT_MAX it doesn't make a difference, but it's a
> little easier for reviewers to know that large values aren't cast to
> negative.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied
