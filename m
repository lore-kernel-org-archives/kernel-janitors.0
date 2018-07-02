From: =?UTF-8?Q?Sean_Nyekj=c3=a6r?= <sean.nyekjaer@prevas.dk>
Date: Mon, 02 Jul 2018 10:43:20 +0000
Subject: Re: [PATCH] iio: dac: remove redundant variable 'shift'
Message-Id: <62141c55-575a-d068-360a-e0ea53df6f17@prevas.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180702102435.16724-1-colin.king@canonical.com>
In-Reply-To: <20180702102435.16724-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>, Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, linux-iio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 2018-07-02 12:24, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable shift is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up two clang warnings:
> warning: variable ‘shift’ set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
Reviewed-by: Sean Nyekjaer <sean.nyekjaer@prevas.dk>

Good catch :-)

BR
/Sean
