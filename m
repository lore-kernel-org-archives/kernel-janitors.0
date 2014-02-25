From: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 25 Feb 2014 12:49:22 +0000
Subject: Re: dm thin: inverted down_trylock() test
Message-Id: <20140225124922.GA639@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140225083509.GB5023@elgon.mountain>
In-Reply-To: <20140225083509.GB5023@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alasdair Kergon <agk@redhat.com>, Joe Thornber <ejt@redhat.com>, dm-devel@redhat.com, Neil Brown <neilb@suse.de>, linux-raid@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 25 2014 at  3:35am -0500,
Dan Carpenter <dan.carpenter@oracle.com> wrote:

> down_trylock() is the opposite of mutex_trylock().  It returns zero on
> success and one on failure.
> 
> Fixes: f4ef95631ebf ('dm thin: do not run the worker thread if pool is suspended')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the fix, but that commit has since been dropped.
