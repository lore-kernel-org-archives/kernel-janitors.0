From: Gao Xiang <gaoxiang25@huawei.com>
Date: Mon, 17 Jun 2019 13:45:09 +0000
Subject: Re: [PATCH] staging: erofs: clean up initialization of pointer de
Message-Id: <470b93fd-ef5e-0019-b58d-8e38e7944e13@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617125529.28327-1-colin.king@canonical.com>
In-Reply-To: <20190617125529.28327-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 2019/6/17 20:55, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointer de is being initialized with a value that is
> never read and a few statements later de is being re-assigned. Clean
> this up by ininitialzing de and removing the re-assignment.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Loods good for me,

Reviewed-by: Gao Xiang <gaoxiang25@huawei.com>

Thanks,
Gao Xiang
