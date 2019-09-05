From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 05 Sep 2019 14:52:48 +0000
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove redundant assignment to variable n
Message-Id: <20190905143341.GC3115@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905141555.31582-1-colin.king@canonical.com>
In-Reply-To: <20190905141555.31582-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

It would be better to remove "n" altogether.

regards,
dan carpenter
