From: David Miller <davem@davemloft.net>
Date: Mon, 20 Jan 2020 13:40:42 +0000
Subject: Re: [PATCH 1/2] cmd64x: potential buffer overflow in cmd64x_program_timings()
Message-Id: <20200120.144042.1810086369376110530.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
In-Reply-To: <20200107130441.y3owvcnxdljailt5@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jan 2020 16:04:41 +0300

> The "drive->dn" value is a u8 and it is controlled by root only, but
> it could be out of bounds here so let's check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
