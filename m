From: Alan Cox <alan@linux.intel.com>
Date: Tue, 17 Aug 2010 11:25:17 +0000
Subject: Re: [patch] rocket: add a mutex_unlock()
Message-Id: <20100817122517.0b80d44d@linux.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100811180009.GA645@bicker>
In-Reply-To: <20100811180009.GA645@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 11 Aug 2010 20:00:09 +0200
Dan Carpenter <error27@gmail.com> wrote:

> This path needs a mutex_unlock().  This is stuff from the bkl to mutex
> transition.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Ack to both - thanks for digging through and checking all this stuff
