From: Alasdair G Kergon <agk@redhat.com>
Date: Tue, 02 Oct 2012 12:58:08 +0000
Subject: Re: [dm-devel] [patch] dm thin: check kmalloc in dm_deferred_set_create()
Message-Id: <20121002125807.GB27325@agk-dp.fab.redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121002114649.GA1413@elgon.mountain>
In-Reply-To: <20121002114649.GA1413@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-raid@vger.kernel.org, dm-devel@redhat.com, kernel-janitors@vger.kernel.org, Mike Snitzer <snitzer@redhat.com>

On Tue, Oct 02, 2012 at 02:46:49PM +0300, Dan Carpenter wrote:
> We can simply return NULL here.  The callers already handle that.
 
Folded into dm-thin-prepare-to-separate-bio_prison-code.patch in
linux-next, thanks.

Alasdair

