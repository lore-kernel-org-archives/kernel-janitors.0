From: Daniel Borkmann <daniel@iogearbox.net>
Date: Wed, 11 Oct 2017 22:19:58 +0000
Subject: Re: [PATCH][bpf-next] bpf: remove redundant variable old_flags
Message-Id: <59DE990E.1030601@iogearbox.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011105623.19998-1-colin.king@canonical.com>
In-Reply-To: <20171011105623.19998-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Alexei Starovoitov <ast@kernel.org>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/11/2017 12:56 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Variable old_flags is being assigned but is never read; it is redundant
> and can be removed.
>
> Cleans up clang warning: Value stored to 'old_flags' is never read
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Acked-by: Daniel Borkmann <daniel@iogearbox.net>
