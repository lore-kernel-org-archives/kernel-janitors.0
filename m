From: Chao Yu <yuchao0@huawei.com>
Date: Thu, 20 Jun 2019 08:54:06 +0000
Subject: Re: [PATCH] staging: erofs: clean up initialization of pointer de
Message-Id: <63acf133-b0b5-aafa-6880-bb9517ef6be9@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617125529.28327-1-colin.king@canonical.com>
In-Reply-To: <20190617125529.28327-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Gao Xiang <gaoxiang25@huawei.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-erofs@lists.ozlabs.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 2019/6/17 20:55, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointer de is being initialized with a value that is
> never read and a few statements later de is being re-assigned. Clean
> this up by ininitialzing de and removing the re-assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,
