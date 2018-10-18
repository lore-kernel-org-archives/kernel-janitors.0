From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 18 Oct 2018 14:32:52 +0000
Subject: Re: [PATCH net-next] bnxt_en: Copy and paste bug in extended tx_stats
Message-Id: <CACKFLiknjz+sv4rxWPHO0aHVDn_acpaMJODYMxeBhpftV7UWhA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181018080239.z2egoh4bw4beb3r3@kili.mountain>
In-Reply-To: <20181018080239.z2egoh4bw4beb3r3@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Miller <davem@davemloft.net>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Oct 18, 2018 at 1:02 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> The struct type was copied from the line before but it should be "tx"
> instead of "rx".  I have reviewed the code and I can't immediately see
> that this bug causes a runtime issue.
>
> Fixes: 36e53349b60b ("bnxt_en: Add additional extended port statistics.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.  Luckily, we did not use sizeof(*bp->hw_tx_port_stats_ext) to
allocate the memory, so there is no run-time issue.

Acked-by: Michael Chan <michael.chan@broadcom.com>
