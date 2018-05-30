From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 30 May 2018 21:07:15 +0000
Subject: Re: [PATCH][next] bpf: devmap: remove redundant assignment of dev = dev
Message-Id: <20180530210713.v4cf4wjniwyobfmm@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180530150916.16808-1-colin.king@canonical.com>
In-Reply-To: <20180530150916.16808-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 30, 2018 at 04:09:16PM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment dev = dev is redundant and should be removed.
> 
> Detected by CoverityScan, CID#1469486 ("Evaluation order violation")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, Thanks.

Please use [PATCH bpf-next] in the subject next time.
See Documentation/bpf/bpf_devel_QA.rst

