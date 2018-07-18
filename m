From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 18 Jul 2018 13:08:20 +0000
Subject: Re: [PATCH] bpf: sockmap: remove redundant pointer sg
Message-Id: <e2a6dd7b-0d15-bfc6-873c-f243ad474f0d@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180717083859.17525-1-colin.king@canonical.com>
In-Reply-To: <20180717083859.17525-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 07/17/2018 10:38 AM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer sg is being assigned but is never used hence it is
> redundant and can be removed.
> 
> Cleans up clang warning:
> warning: variable 'sg' set but not used [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to bpf-next, thanks Colin!
