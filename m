From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 27 Oct 2020 00:10:20 +0000
Subject: Re: [PATCH] Input: adxl34x - clean up a data type in adxl34x_probe()
Message-Id: <20201027001020.GG444962@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201026072824.GA1620546@mwanda>
In-Reply-To: <20201026072824.GA1620546@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Michael Hennerich <michael.hennerich@analog.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Oct 26, 2020 at 10:28:24AM +0300, Dan Carpenter wrote:
> The "revid" is used to store negative error codes so it should be an int
> type.
> 
> Fixes: e27c729219ad ("Input: add driver for ADXL345/346 Digital Accelerometers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thank you.

-- 
Dmitry
