From: Marcel Holtmann <marcel@holtmann.org>
Date: Tue, 09 Mar 2010 00:54:50 +0000
Subject: Re: [patch] bluetooth: storing negative values as unsigned char
Message-Id: <1268096091.3712.30.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100308121559.GG6469@bicker>
In-Reply-To: <20100308121559.GG6469@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27@gmail.com>
Cc: Bing Zhao <bzhao@marvell.com>, Rahul Tank <rahult@marvell.com>, Amitkumar Karwar <akarwar@marvell.com>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> This is mostly cleanup.  There is only one caller and it just checks for 
> non-zero return values.  Still "ret" should be int because we want to return 
> -EINVAL on errors.

patch has been applied. Thanks.

Regards

Marcel


