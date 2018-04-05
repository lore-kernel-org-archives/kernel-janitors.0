From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 05 Apr 2018 11:30:35 +0000
Subject: Re: [PATCH] rsi: Free the unaligned pointer
Message-Id: <1522927835.7140.8.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180405112311.GD4218@mwanda>
         (sfid-20180405_132330_784628_CEF256B5)
In-Reply-To: <20180405112311.GD4218@mwanda> (sfid-20180405_132330_784628_CEF256B5)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Kalle Valo <kvalo@codeaurora.org>, Amitkumar Karwar <amit.karwar@redpinesignals.com>
Cc: Prameela Rani Garnepudi <prameela.j04cs@gmail.com>, Karun Eagalapati <karun256@gmail.com>, Siva Rebbagondla <siva.rebbagondla@redpinesignals.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 2018-04-05 at 14:23 +0300, Dan Carpenter wrote:
> The problem here is that we allocate "data".  Then we do
> "data = PTR_ALIGN(data, 8);" and then we free the aligned pointer and
> not the one we allocated.

That seems pretty pointless, since kmalloc guarantees such alignment for
sure. Better to just remove PTR_ALIGN()?

johannes
