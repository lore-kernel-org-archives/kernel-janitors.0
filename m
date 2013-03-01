From: Alasdair G Kergon <agk@redhat.com>
Date: Fri, 01 Mar 2013 21:36:33 +0000
Subject: Re: [dm-devel] [patch] dm-cache-target: check for allocation failure
Message-Id: <20130301213632.GE8373@agk.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130301202641.GA22066@longonot.mountain>
In-Reply-To: <20130301202641.GA22066@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alasdair Kergon <agk@redhat.com>, linux-raid@vger.kernel.org, dm-devel@redhat.com, kbuild@01.org, kernel-janitors@vger.kernel.org

On Fri, Mar 01, 2013 at 11:26:41PM +0300, Dan Carpenter wrote:
> The allocation here isn't checked.  I changed it to using kcalloc()
> as a cleanup.  It adds integer overflow checking as well which makes
> the code easier to audit.
 
Folded it in - thanks.

Alasdair

