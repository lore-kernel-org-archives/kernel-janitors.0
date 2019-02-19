From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 19 Feb 2019 14:21:03 +0000
Subject: Re: [PATCH] net: ns83820: drop pointless static qualifier in ns83820_probe_phy()
Message-Id: <20190219142103.GH17104@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219080659.89732-1-maowenan@huawei.com>
In-Reply-To: <20190219080659.89732-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, john.fastabend@gmail.com, hawk@kernel.org, jakub.kicinski@netronome.com, daniel@iogearbox.net, ast@kernel.org

Just delete it instead.

regards,
dan carpenter
