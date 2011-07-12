From: Tejun Heo <tj@kernel.org>
Date: Tue, 12 Jul 2011 14:17:51 +0000
Subject: Re: [PATCH] ata: remove unnecessary code
Message-Id: <20110712141751.GA4347@mtj.dyndns.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
In-Reply-To: <1308242361-28859-1-git-send-email-Gregory.Dietsche@cuw.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Dietsche <Gregory.Dietsche@cuw.edu>
Cc: jgarzik@pobox.com, linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Jun 16, 2011 at 11:39:21AM -0500, Greg Dietsche wrote:
> Compile tested.
> remove unnecessary code that matches this coccinelle pattern
> 	if (...)
> 		return ret;
> 	return ret;
> 
> Signed-off-by: Greg Dietsche <Gregory.Dietsche@cuw.edu>

Acked-by: Tejun Heo <tj@kernel.org>

Jeff?

-- 
tejun
