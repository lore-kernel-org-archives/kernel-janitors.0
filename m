From: David Miller <davem@davemloft.net>
Date: Mon, 20 Jan 2020 13:40:47 +0000
Subject: Re: [PATCH 2/2] ide: serverworks: potential overflow in svwks_set_pio_mode()
Message-Id: <20200120.144047.202754056310659523.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200107130441.y3owvcnxdljailt5@kili.mountain>
        <20200107130607.tv3uosduwkw3yka6@kili.mountain>
In-Reply-To: <20200107130607.tv3uosduwkw3yka6@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linux-ide@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 7 Jan 2020 16:06:07 +0300

> The "drive->dn" variable is a u8 controlled by root.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
