From: Borislav Petkov <bp@alien8.de>
Date: Sat, 26 Jan 2013 10:05:05 +0000
Subject: Re: [patch] edac: test correct variable in ->store function
Message-Id: <20130126100505.GA16044@pd.tnic>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130126074924.GB14365@elgon.mountain>
In-Reply-To: <20130126074924.GB14365@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Thompson <dougthompson@xmission.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jan 26, 2013 at 10:49:24AM +0300, Dan Carpenter wrote:
> We're testing for ->show but calling ->store().
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Good catch, applied.

Thanks.

-- 
Regards/Gruss,
    Boris.

Sent from a fat crate under my desk. Formatting is fine.
--
