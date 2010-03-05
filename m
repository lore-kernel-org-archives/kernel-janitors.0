From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 05 Mar 2010 08:36:59 +0000
Subject: Re: [patch] gamecon: fix off by one range check
Message-Id: <20100305083658.GB20245@core.coreip.homeip.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100303070544.GB5086@bicker>
In-Reply-To: <20100303070544.GB5086@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>, Scott Moreau <oreaus@gmail.com>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Mar 03, 2010 at 10:05:44AM +0300, Dan Carpenter wrote:
> It should be >= GC_MAX not > GC_MAX.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>

Applied, thank you Dan.

-- 
Dmitry
