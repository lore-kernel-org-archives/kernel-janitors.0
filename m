From: santosh.shilimkar@oracle.com
Date: Wed, 26 Aug 2020 16:52:37 +0000
Subject: Re: [PATCH] memory: emif: Remove bogus debugfs error handling
Message-Id: <10387fe0-579a-de71-44ad-ac585ff604d6@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826113759.GF393664@mwanda>
In-Reply-To: <20200826113759.GF393664@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/26/20 4:37 AM, Dan Carpenter wrote:
> Callers are generally not supposed to check the return values from
> debugfs functions.  Debugfs functions never return NULL so this error
> handling will never trigger.  (Historically debugfs functions used to
> return a mix of NULL and error pointers but it was eventually deemed too
> complicated for something which wasn't intended to be used in normal
> situations).
> 
> Delete all the error handling.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
Looks good to me !!

Acked-by: Santosh Shilimkar <ssantosh@kernel.org>
