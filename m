From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 20 Aug 2019 08:55:47 +0000
Subject: Re: [PATCH -next] bpf: Use PTR_ERR_OR_ZERO in xsk_map_inc()
Message-Id: <20190820085547.GE4451@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190820013652.147041-1-yuehaibing@huawei.com>
 <93fafdab-8fb3-0f2b-8f36-0cf297db3cd9@intel.com>
In-Reply-To: <93fafdab-8fb3-0f2b-8f36-0cf297db3cd9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>
Cc: YueHaibing <yuehaibing@huawei.com>, magnus.karlsson@intel.com, jonathan.lemon@gmail.com, ast@kernel.org, daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com, john.fastabend@gmail.com, netdev@vger.kernel.org, bpf@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Aug 20, 2019 at 09:28:26AM +0200, Bj=F6rn T=F6pel wrote:
> For future patches: Prefix AF_XDP socket work with "xsk:" and use "PATCH
> bpf-next" to let the developers know what tree you're aiming for.

There are over 300 trees in linux-next.  It impossible to try remember
everyone's trees.  No one else has this requirement.

Maybe add it as an option to get_maintainer.pl --tree <hash> then that
would be very easy.

regards,
dan carpenter
