From: Kalle Valo <kvalo@codeaurora.org>
Date: Fri, 11 Dec 2015 11:17:31 +0000
Subject: Re: mwifiex: remove an unneeded condition
Message-Id: <20151211111731.906FF141A92@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20151204131715.GD12792@mwanda>
References: <20151204131715.GD12792@mwanda>
In-Reply-To: <20151204131715.GD12792@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Amitkumar Karwar <akarwar@marvell.com>, Nishant Sarmukadam <nishants@marvell.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org


> We already know that "wep_key->key_length" is set so there is no need to
> check again.  Also the last curly brace was indented too far.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to wireless-drivers-next.git.

Kalle Valo
