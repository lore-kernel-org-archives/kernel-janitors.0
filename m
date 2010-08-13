From: Jesse Barnes <jbarnes@virtuousgeek.org>
Date: Fri, 13 Aug 2010 23:32:32 +0000
Subject: Re: [PATCH 21/42] drivers/pci: Adjust confusing if indentation
Message-Id: <20100813163232.56f93c28@virtuousgeek.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1008052223010.31692@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1008052223010.31692@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 5 Aug 2010 22:23:16 +0200 (CEST)
Julia Lawall <julia@diku.dk> wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Indent the branch of an if.
> 
> The semantic match that finds this problem is as follows:
> (http://coccinelle.lip6.fr/)

Applied to my linux-next branch, thanks.

-- 
Jesse Barnes, Intel Open Source Technology Center
