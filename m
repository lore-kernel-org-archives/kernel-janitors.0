From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Sat, 17 Nov 2018 04:49:57 +0000
Subject: Re: [PATCH][bpf-next] bpf: fix null pointer dereference on pointer offload
Message-Id: <20181117044955.c6x6lnajgrlnpoeq@ast-mbp.dhcp.thefacebook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181113092926.27081-1-colin.king@canonical.com>
In-Reply-To: <20181113092926.27081-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 13, 2018 at 09:29:26AM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer offload is being null checked however the following statement
> dereferences the potentially null pointer offload when assigning
> offload->dev_state.  Fix this by only assigning it if offload is not
> null.
> 
> Detected by CoverityScan, CID#1475437 ("Dereference after null check")
> 
> Fixes: 00db12c3d141 ("bpf: call verifier_prep from its callback in struct bpf_offload_dev")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, Thanks
