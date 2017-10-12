From: David Miller <davem@davemloft.net>
Date: Thu, 12 Oct 2017 03:23:00 +0000
Subject: Re: [PATCH][bpf-next] bpf: remove redundant variable old_flags
Message-Id: <20171011.202300.1480286300516136187.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171011105623.19998-1-colin.king@canonical.com>
In-Reply-To: <20171011105623.19998-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: ast@kernel.org, daniel@iogearbox.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Oct 2017 11:56:23 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable old_flags is being assigned but is never read; it is redundant
> and can be removed.
> 
> Cleans up clang warning: Value stored to 'old_flags' is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
