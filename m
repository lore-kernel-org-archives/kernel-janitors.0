From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 20 Aug 2019 15:09:10 +0000
Subject: Re: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <9f7d6eba-7676-9f3e-5bf1-33fa0bb621a2@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013652.147041-1-yuehaibing@huawei.com>
In-Reply-To: <20190820013652.147041-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, bjorn.topel@intel.com, magnus.karlsson@intel.com, jonathan.lemon@gmail.com, ast@kernel.org, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com
Cc: netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On 8/20/19 3:36 AM, YueHaibing wrote:
> Use PTR_ERR_OR_ZERO rather than if(IS_ERR(...)) + PTR_ERR
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Applied, thanks!
