From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 12 Apr 2018 15:12:29 +0000
Subject: Re: [PATCH][next] staging: ks7010: fix null pointer dereference on priv on error exit
Message-Id: <20180412151229.7san3ynhl5lbqgs4@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180412145756.24949-1-colin.king@canonical.com>
In-Reply-To: <20180412145756.24949-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, Quytelda Kahja <quytelda@tamalin.org>

This isn't right.  It introduces a leak.

regards,
dan carpenter

