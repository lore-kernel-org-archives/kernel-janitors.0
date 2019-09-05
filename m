From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 05 Sep 2019 15:02:21 +0000
Subject: Re: [PATCH] staging: rtl8723bs: hal: remove redundant assignment to variable n
Message-Id: <dbf73103-0f78-8f37-5acb-aecf8a8fb0a0@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190905141555.31582-1-colin.king@canonical.com>
 <20190905143341.GC3115@kadam>
In-Reply-To: <20190905143341.GC3115@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: devel@driverdev.osuosl.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 05/09/2019 15:52, Dan Carpenter wrote:
> It would be better to remove "n" altogether.

Good point, will resend a V2 later.
> 
> regards,
> dan carpenter
> 
