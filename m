From: David Teigland <teigland@redhat.com>
Date: Mon, 21 May 2012 15:39:32 +0000
Subject: Re: [patch] dlm: remove stray unlock
Message-Id: <20120521153932.GA14564@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120521143526.GB25114@elgon.mountain>
In-Reply-To: <20120521143526.GB25114@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, May 21, 2012 at 05:35:26PM +0300, Dan Carpenter wrote:
> Smatch complains that we unlock this twice.  It looks like an accidental
> to me.

Thanks, will fix that.

