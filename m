From: Jarod Wilson <jarod@redhat.com>
Date: Fri, 15 Oct 2010 13:17:55 +0000
Subject: Re: [patch] Staging: lirc: fix PTR_ERR() check
Message-Id: <20101015131755.GA9658@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101015034235.GH6614@bicker>
In-Reply-To: <20101015034235.GH6614@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Oct 15, 2010 at 05:42:35AM +0200, Dan Carpenter wrote:
> This is a typo.  It's supposed to be IS_ERR() here instead of PTR_ERR().
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Acked-by: Jarod Wilson <jarod@redhat.com>


-- 
Jarod Wilson
jarod@redhat.com

