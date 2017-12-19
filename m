From: Daniel Borkmann <daniel@iogearbox.net>
Date: Tue, 19 Dec 2017 00:28:18 +0000
Subject: Re: [PATCH][next] bpf: make function skip_callee static and return NULL rather than 0
Message-Id: <22724a21-5e99-dddb-31f1-ae8e1916d2ff@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171218174707.15430-1-colin.king@canonical.com>
In-Reply-To: <20171218174707.15430-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 12/18/2017 06:47 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Function skip_callee is local to the source and does not need to
> be in global scope, so make it static. Also return NULL rather than 0.
> Cleans up two sparse warnings:
> 
> symbol 'skip_callee' was not declared. Should it be static?
> Using plain integer as NULL pointer
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Makes sense, applied to bpf-next, thanks Colin!
