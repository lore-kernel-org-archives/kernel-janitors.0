From: Joe Perches <joe@perches.com>
Date: Thu, 28 Jul 2011 17:03:33 +0000
Subject: Re: [PATCH 0/6] adjust array index
Message-Id: <1311872613.10042.12.camel@Joe-Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1311857165-14780-1-git-send-email-julia@diku.dk>
In-Reply-To: <1311857165-14780-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2011-07-28 at 14:46 +0200, Julia Lawall wrote:
> These patches fix cases where the upper bound of a loop is used as an array
> index, while it appears that the loop index should be used as the array
> index.

Good one.

