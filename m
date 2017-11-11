From: David Miller <davem@davemloft.net>
Date: Sat, 11 Nov 2017 10:13:54 +0000
Subject: Re: [PATCH] qlge: remove duplicated assignment to mbcp
Message-Id: <20171111.191354.1268716566266491493.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171109075215.2666-1-colin.king@canonical.com>
In-Reply-To: <20171109075215.2666-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: harish.patil@cavium.com, manish.chopra@cavium.com, Dept-GELinuxNICDev@cavium.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu,  9 Nov 2017 07:52:15 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The assignment to mbcp is identical to the initiatialized value assigned
> to mbcp at declaration time a few lines earlier, hence we can remove the
> second redundant assignment.  Cleans up clang warning:
> 
> drivers/net/ethernet/qlogic/qlge/qlge_mpi.c:209:22: warning:
> Value stored to 'mbcp' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied, thanks.
