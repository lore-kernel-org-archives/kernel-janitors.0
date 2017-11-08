From: Johannes Berg <johannes@sipsolutions.net>
Date: Wed, 08 Nov 2017 01:06:11 +0000
Subject: Re: [PATCH] devcoredump: remove redundant assignment to iter
Message-Id: <1510103171.3749.3.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171107104215.10748-1-colin.king@canonical.com>
In-Reply-To: <20171107104215.10748-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, 2017-11-07 at 10:42 +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to pointer iter is redundant as this is also performed
> in the following macro for_each_sg, hence it can be removed. Cleans
> up clang warning:
> 
> ./include/linux/devcoredump.h:45:2: warning: Value stored to 'iter'
> is never read
> 
I think you'll have to Cc Greg KH to get this applied, unless somebody
picks it up from janitors.

johannes
