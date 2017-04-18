From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 18 Apr 2017 20:11:20 +0000
Subject: Re: [PATCH][net-next] esp6: fix incorrect null pointer check on xo
Message-Id: <20170418201119.72la2hstf47dpply@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170418140653.8839-1-colin.king@canonical.com>
In-Reply-To: <20170418140653.8839-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Alexey Kuznetsov <kuznet@ms2.inr.ac.ru>, James Morris <jmorris@namei.org>, Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>, Patrick McHardy <kaber@trash.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It's in Steffen's tree, not the networking tree and he's not CC'd.  You
should really be adding Fixes tags because it helps to ensure you CC the
guilty parties.

regards,
dan carpenter

