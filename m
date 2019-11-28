From: "Andrew Jeffery" <andrew@aj.id.au>
Date: Thu, 28 Nov 2019 22:44:39 +0000
Subject: =?UTF-8?Q?Re:_[PATCH]_fsi:_fix_bogos_error_returns_from_cfam=5Fread_and_?= =?UTF-8?Q?cfam=5Fwrite?=
Message-Id: <a709068c-9375-4921-a87f-c5f3a1f63cf2@www.fastmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191122233120.110344-1-colin.king@canonical.com>
In-Reply-To: <20191122233120.110344-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Jeremy Kerr <jk@ozlabs.org>, Joel Stanley <joel@jms.id.au>, Alistair Popple <alistair@popple.id.au>, Eddie James <eajames@linux.ibm.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-fsi@lists.ozlabs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Sat, 23 Nov 2019, at 10:01, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> In the case where errors occur in functions cfam_read and cfam_write
> the error return code in rc is not returned and a bogus non-error
> count size is returned instead. Fix this by returning the correct
> error code when an error occurs or the count size if the functions
> worked correctly.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: d1dcd6782576 ("fsi: Add cfam char devices")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
